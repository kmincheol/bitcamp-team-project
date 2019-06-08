package com.eomcs.lms.service.impl;

import java.util.HashMap;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.TermsAgree;
import com.eomcs.lms.service.MemberService;
import com.eomcs.lms.service.NaverService;


@Service
public class naverServiceImpl implements NaverService {
  
  final static Logger logger = LogManager.getLogger(naverServiceImpl.class);
  
  MemberService memberService;
  
  public naverServiceImpl(MemberService memberService) {
    this.memberService = memberService;
  }
  
  public String requestNaverAccessToken(HttpSession session, String code, String state) throws Exception {
    logger.info("token");
    String naverUrl = 
        "https://nid.naver.com/oauth2.0/token?"
        + "grant_type=authorization_code"
        + "&client_id=I7CsLJrBpKo8Qc1BsyOn"
        + "&client_secret=9A5NZKZsrB"
        + "&code=" + code
        + "&state=" + state;

    HttpClient client = HttpClientBuilder.create().build();
    HttpGet getRequest = new HttpGet(naverUrl);

    String rawJsonString = client.execute(getRequest, new BasicResponseHandler());
    logger.debug("naverAccessToken / raw json : "+ rawJsonString);
    
    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
    String naverAccessToken = (String) jsonObject.get("access_token");
    logger.debug("naverAccessToken / accessToken : "+ naverAccessToken);
    
    session.setAttribute("naverAccessToken", naverAccessToken);
    
    return naverAccessToken;
    
  }
  
  @SuppressWarnings("unchecked")
  public String naverUserDataLoadAndCheck(String accessToken, HttpSession session) throws Exception {
    String naverUrl = "https://openapi.naver.com/v1/nid/me";
    String naverHeader = "Bearer " + accessToken;

    HttpClient client = HttpClientBuilder.create().build();
    HttpGet getRequest = new HttpGet(naverUrl);
    getRequest.setHeader("Authorization", naverHeader);
    String rawJsonString = client.execute(getRequest, new BasicResponseHandler());
    logger.debug("naverAccessToken:check / rawJson! : " + rawJsonString);

    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);

    logger.debug("naverUserDataLoadAndCheck / raw json : " + jsonObject);
    
    HashMap<String,Object> response = (HashMap<String,Object>) jsonObject.get("response");
    
    String email = (String) response.get("email");
    logger.info("email >> " + email);
    
    if (email == null || email.length() == 0) {
      session.setAttribute("login_type", "noEmail");
      return "redirect:naverLoginFail";
    }
    
    Member member = memberService.get(email);
    
    // 해당 이메일로 가입된 유저가 없으면 신규가입으로 보낸다.
    if (member == null) {
      return "redirect:naverJoin";
    }
    
    // 해당 이메일로 가입되어있지만, 로그인 타입이 네이버가 아니라면, alert창을 띄우게 한다.
    if (!member.getLoginType().equalsIgnoreCase("naver")) {
      session.setAttribute("login_type", member.getLoginType());
      return "redirect:naverLoginFail";
    }
    
    // 해당 이메일로 가입되어있고, 로그인 타입이 페이스북이라면 자동로그인 처리한 후 메인으로 보낸다.
    session.setAttribute("loginUser", member);

    return "redirect:loginSuccess";
}
  
  @SuppressWarnings("unchecked")
  public String naverUserDataLoadAndSave(
      String accessToken, 
      HttpSession session, 
      TermsAgree termsAgree) throws Exception {
    String naverUrl = "https://openapi.naver.com/v1/nid/me";
    String naverHeader = "Bearer " + accessToken;

    HttpClient client = HttpClientBuilder.create().build();
    HttpGet getRequest = new HttpGet(naverUrl);
    getRequest.setHeader("Authorization", naverHeader);
    String rawJsonString = client.execute(getRequest, new BasicResponseHandler());
    logger.debug("naverAccessToken:check / rawJson! : " + rawJsonString);

    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);

    logger.debug("naverUserDataLoadAndSave / raw json : " + jsonObject);
    
    HashMap<String,Object> response = (HashMap<String,Object>) jsonObject.get("response");
    
    String name = (String) response.get("name");
    String email = (String) response.get("email");

    Member member = new Member();
    member.setId("naver-" + UUID.randomUUID().toString());
    member.setName(name);
    member.setEmail(email);
    member.setPassword(UUID.randomUUID().toString());
    member.setLoginType("naver");
    
    memberService.add(member, termsAgree);
    
    // 회원가입 후 자동로그인처리
    Member newMember = memberService.get(member.getNo());
    
    logger.debug(newMember);
      
    if (newMember == null) {
      return "fail";
    }
    
    session.setAttribute("loginUser", newMember);
    return "success";
}
}







