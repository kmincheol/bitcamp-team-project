package com.eomcs.lms.service.impl;

import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import com.eomcs.lms.conf.GlobalPropertySource;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.TermsAgree;
import com.eomcs.lms.service.GoogleService;
import com.eomcs.lms.service.MemberService;

@Service
public class GoogleServiceImpl implements GoogleService {
  
  final static Logger logger = LogManager.getLogger(GoogleServiceImpl.class);
  
  MemberService memberService;
  GlobalPropertySource globalPropertySource;
  
  public GoogleServiceImpl(
      MemberService memberService,
      GlobalPropertySource globalPropertySource) {
    this.memberService = memberService;
    this.globalPropertySource = globalPropertySource;
  }
  
  public String requestGoogleAccessTokenAndUserDataCheck(HttpSession session, String code) throws Exception {

    RestTemplate template = new RestTemplate();
    logger.info("token");
    String googleUrl = "https://www.googleapis.com/oauth2/v4/token";
    MultiValueMap<String,String> paramMap = new LinkedMultiValueMap<String,String>();
    paramMap.add("code", code);
    paramMap.add("client_id", globalPropertySource.getGoogleClientId());
    paramMap.add("client_secret", globalPropertySource.getGoogleClientSecret());
    paramMap.add("redirect_uri", "https://battlematching.online/app/auth/snsAccessToken?loginType=google");
    paramMap.add("grant_type", "authorization_code");
    
    HttpHeaders headers = new HttpHeaders();
    HttpEntity<MultiValueMap<String,String>> request = new HttpEntity<>(paramMap, headers);
    
    String rawJsonString = 
        template.postForObject(googleUrl, request, String.class);
    
    logger.debug("googleAccessToken / raw json : "+ rawJsonString);
    
    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
    
    // 구글은 accessToken은 App 접근할시 사용하고, 
    String googleAccessToken = (String) jsonObject.get("access_token");
    logger.debug("googleAccessToken / accessToken : "+ googleAccessToken);
    
    // 간단한 기본정보는 scope를 지정하고 idToken으로 접근해서 받을 수 있다.
    String googleIdToken = (String) jsonObject.get("id_token");
    logger.debug("googleIdToken / idToken : "+ googleIdToken);
    
    session.setAttribute("googleIdToken", googleIdToken);
    
    // 토큰으로 정보를 받아와서 가입된 회원인지 확인
    googleUrl = 
        "https://oauth2.googleapis.com/tokeninfo?"
        + "id_token="
        + googleIdToken;
    template = new RestTemplate();

    rawJsonString = template.getForObject(googleUrl, String.class);
    
    logger.debug("googleIdToken:check / rawJson! : " + rawJsonString);

    jsonParser = new JSONParser();
    jsonObject = (JSONObject) jsonParser.parse(rawJsonString);

    logger.debug("googleUserDataLoadAndCheck / raw json : " + jsonObject);
    
    String email = (String) jsonObject.get("email");
    logger.info("email >> " + email);
    
    if (email == null || email.length() == 0) {
      session.setAttribute("error_type", "noEmail");
      session.setAttribute("login_type", "google");
      return "redirect:snsLoginFail";
    }
    
    Member member = memberService.get(email);
    
    // 해당 이메일로 가입된 유저가 없으면 신규가입으로 보낸다.
    if (member == null) {
      session.setAttribute("login_type", "google");
      return "redirect:snsJoin";
    }
    
    // 해당 이메일로 가입되어있지만, 로그인 타입이 구글이 아니라면, alert창을 띄우게 한다.
    if (!member.getLoginType().equalsIgnoreCase("google")) {
      session.setAttribute("login_type", member.getLoginType());
      session.setAttribute("error_type", "otherType");
      return "redirect:snsLoginFail";
    }
    
    // 해당 이메일로 가입되어있고, 로그인 타입이 구글이라면 자동로그인 처리한 후 메인으로 보낸다.
    session.setAttribute("loginUser", member);

    return "redirect:snsLoginSuccess";
    
  }
  
  public String googleUserDataLoadAndSave(
      String idToken, 
      HttpSession session, 
      TermsAgree termsAgree) throws Exception {
    
    String googleUrl = 
        "https://oauth2.googleapis.com/tokeninfo?"
        + "id_token="
        + idToken;
    RestTemplate template = new RestTemplate();

    String rawJsonString = template.getForObject(googleUrl, String.class);
    
    logger.debug("googleIdToken:check / rawJson! : " + rawJsonString);

    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);

    logger.debug("googleUserDataLoadAndSave / raw json : " + jsonObject);
    
    String name = (String) jsonObject.get("name");
    String email = (String) jsonObject.get("email");

    Member member = new Member();
    member.setId("google-" + UUID.randomUUID().toString());
    member.setName(name);
    member.setEmail(email);
    member.setPassword(UUID.randomUUID().toString());
    member.setLoginType("google");
    
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







