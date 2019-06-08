package com.eomcs.lms.service.impl;

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
import com.eomcs.lms.service.FacebookService;
import com.eomcs.lms.service.MemberService;


@Service
public class FacebookServiceImpl implements FacebookService {
  
  final static Logger logger = LogManager.getLogger(FacebookServiceImpl.class);
  
  MemberService memberService;
  
  public FacebookServiceImpl(MemberService memberService) {
    this.memberService = memberService;
  }
  
  public String requestFaceBookAccessToken(HttpSession session, String code) throws Exception {

    String facebookUrl = 
        "https://graph.facebook.com/v3.3/oauth/access_token?"+
        "client_id=" + "564771240719772" +
        "&redirect_uri=" + "http://localhost:8080/bitcamp-team-project/app/auth/facebookAccessToken" +
        "&client_secret="+ "da197861cbfcc7cb90a738e785aadcad" +
        "&code=" + code;

    HttpClient client = HttpClientBuilder.create().build();
    HttpGet getRequest = new HttpGet(facebookUrl);
      
    String rawJsonString = client.execute(getRequest, new BasicResponseHandler());
    logger.debug("facebookAccessToken / raw json : "+rawJsonString);
    
    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
    String faceBookAccessToken = (String) jsonObject.get("access_token");
    logger.debug("facebookAccessToken / accessToken : "+faceBookAccessToken);
    
    session.setAttribute("faceBookAccessToken", faceBookAccessToken);
    
    return faceBookAccessToken;
    
  }
  
  public String facebookUserDataLoadAndCheck(String accessToken, HttpSession session) throws Exception {
    String facebookUrl = "https://graph.facebook.com/me?"+
            "access_token="+accessToken+
            "&fields=id,name,email";

    HttpClient client = HttpClientBuilder.create().build();
    HttpGet getRequest = new HttpGet(facebookUrl);
    String rawJsonString = client.execute(getRequest, new BasicResponseHandler());
    logger.debug("facebookAccessToken:check / rawJson! : "+rawJsonString);

    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
    // jsonObject example => {"name":"이름","id":"페이스북고유id","email":"이메일주소"}
    logger.debug("facebookUserDataLoadAndCheck / raw json : "+jsonObject);
    
    String email = (String) jsonObject.get("email");
    
    
    if (email == null || email.length() == 0) {
      session.setAttribute("login_type", "noEmail");
      return "redirect:facebookLoginFail";
    }
    
    Member member = memberService.get(email);
    
    // 해당 이메일로 가입된 유저가 없으면 신규가입으로 보낸다.
    if (member == null) {
      return "redirect:facebookJoin";
    }
    
    // 해당 이메일로 가입되어있지만, 로그인 타입이 페이스북이 아니라면, alert창을 띄우게 한다.
    if (!member.getLoginType().equalsIgnoreCase("facebook")) {
      session.setAttribute("login_type", member.getLoginType());
      return "redirect:facebookLoginFail";
    }
    
    // 해당 이메일로 가입되어있고, 로그인 타입이 페이스북이라면 자동로그인 처리한 후 메인으로 보낸다.
    session.setAttribute("loginUser", member);

    return "redirect:loginSuccess";
}
  
  public String facebookUserDataLoadAndSave(
      String accessToken, 
      HttpSession session, 
      TermsAgree termsAgree) throws Exception {
    String facebookUrl = "https://graph.facebook.com/me?"+
            "access_token="+ accessToken +
            "&fields=id,name,email";

    HttpClient client = HttpClientBuilder.create().build();
    HttpGet getRequest = new HttpGet(facebookUrl);
    String rawJsonString = client.execute(getRequest, new BasicResponseHandler());
    logger.debug("facebookAccessToken:save / rawJson! : "+rawJsonString);

    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
    logger.debug("facebookUserDataLoadAndSave / raw json : "+jsonObject);

    Member member = new Member();
    member.setId("facebook-" + UUID.randomUUID().toString());
    member.setName((String)jsonObject.get("name"));
    member.setEmail((String)jsonObject.get("email"));
    member.setPassword(UUID.randomUUID().toString());
    member.setLoginType("facebook");
    
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







