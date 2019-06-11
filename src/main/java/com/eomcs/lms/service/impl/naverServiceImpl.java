package com.eomcs.lms.service.impl;

import java.util.HashMap;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.TermsAgree;
import com.eomcs.lms.service.MemberService;
import com.eomcs.lms.service.NaverService;

@RequestMapping
public class naverServiceImpl implements NaverService {
  
  final static Logger logger = LogManager.getLogger(naverServiceImpl.class);
  
  MemberService memberService;
  
  public naverServiceImpl(MemberService memberService) {
    this.memberService = memberService;
  }
  
  @SuppressWarnings("unchecked")
  public String requestNaverAccessTokenAndUserDataCheck(HttpSession session, String code, String state) throws Exception {
    logger.info("token");
    String naverUrl = 
        "https://nid.naver.com/oauth2.0/token?"
        + "grant_type=authorization_code"
        + "&client_id=I7CsLJrBpKo8Qc1BsyOn"
        + "&client_secret=9A5NZKZsrB"
        + "&code=" + code
        + "&state=" + state;
    
    RestTemplate template = new RestTemplate();
    String rawJsonString = template.getForObject(naverUrl, String.class);
    logger.debug("naverAccessToken / raw json : "+ rawJsonString);
    
    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
    String naverAccessToken = (String) jsonObject.get("access_token");
    logger.debug("naverAccessToken / accessToken : "+ naverAccessToken);
    
    session.setAttribute("naverAccessToken", naverAccessToken);
    
    // 토큰으로 정보를 받아와서 가입된 회원인지 확인
    naverUrl = "https://openapi.naver.com/v1/nid/me";
    String naverHeader = "Bearer " + naverAccessToken;
    
    template = new RestTemplate();
    
    HttpHeaders headers = new HttpHeaders();
    headers.set("Authorization", naverHeader);
    HttpEntity<MultiValueMap<String,String>> request = new HttpEntity<>(headers);
    
    ResponseEntity<String> responseEntity = template.exchange(naverUrl, HttpMethod.GET, request, String.class);

    rawJsonString = responseEntity.getBody();
    logger.debug("naverAccessToken:check / rawJson! : " + rawJsonString);

    jsonParser = new JSONParser();
    jsonObject = (JSONObject) jsonParser.parse(rawJsonString);

    logger.debug("naverUserDataLoadAndCheck / raw json : " + jsonObject);
    
    HashMap<String,Object> response = (HashMap<String,Object>) jsonObject.get("response");
    
    String email = (String) response.get("email");
    logger.info("email >> " + email);
    
    if (email == null || email.length() == 0) {
      session.setAttribute("error_type", "noEmail");
      session.setAttribute("login_type", "naver");
      return "redirect:snsLoginFail";
    }
    
    Member member = memberService.get(email);
    
    // 해당 이메일로 가입된 유저가 없으면 신규가입으로 보낸다.
    if (member == null) {
      session.setAttribute("login_type", "naver");
      return "redirect:snsJoin";
    }
    
    // 해당 이메일로 가입되어있지만, 로그인 타입이 네이버가 아니라면, alert창을 띄우게 한다.
    if (!member.getLoginType().equalsIgnoreCase("naver")) {
      session.setAttribute("login_type", member.getLoginType());
      session.setAttribute("error_type", "otherType");
      return "redirect:snsLoginFail";
    }
    
    // 해당 이메일로 가입되어있고, 로그인 타입이 네이버라면 자동로그인 처리한 후 메인으로 보낸다.
    session.setAttribute("loginUser", member);

    return "redirect:snsLoginSuccess";
  }
  
  @SuppressWarnings("unchecked")
  public String naverUserDataLoadAndSave(
      String accessToken, 
      HttpSession session, 
      TermsAgree termsAgree) throws Exception {
    String naverUrl = "https://openapi.naver.com/v1/nid/me";

    RestTemplate template = new RestTemplate();
    HttpHeaders headers = new HttpHeaders();
    headers.add("Authorization", "Bearer " + accessToken);
    HttpEntity<String> request = new HttpEntity<>(headers);
    ResponseEntity<String> responseEntity = template.exchange(naverUrl, HttpMethod.GET, request, String.class);

    logger.debug("naverAccessToken:check / responseEntity! : " + responseEntity);
    
    String rawJsonString = responseEntity.getBody();
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







