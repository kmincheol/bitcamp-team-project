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
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import com.eomcs.lms.conf.GlobalPropertySource;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.TermsAgree;
import com.eomcs.lms.service.KakaoService;
import com.eomcs.lms.service.MemberService;


@Service
public class KakaoServiceImpl implements KakaoService {
  
  final static Logger logger = LogManager.getLogger(KakaoServiceImpl.class);
  
  MemberService memberService;
  GlobalPropertySource globalPropertySource;
  
  public KakaoServiceImpl(
      MemberService memberService,
      GlobalPropertySource globalPropertySource) {
    this.memberService = memberService;
    this.globalPropertySource = globalPropertySource;
  }
  
  @SuppressWarnings("unchecked")
  public String requestKakaoAccessTokenAndUserDataCheck(HttpSession session, String code) throws Exception {
    logger.info("token");
    
    RestTemplate template = new RestTemplate();
    String kakaoUrl = "https://kauth.kakao.com/oauth/token";
    MultiValueMap<String,String> paramMap = new LinkedMultiValueMap<String,String>();
    paramMap.add("grant_type", "authorization_code");
    paramMap.add("client_id", globalPropertySource.getKakaoClientId());
    paramMap.add("redirect_uri", "https://battlematching.online/app/auth/snsAccessToken?loginType=kakao");
    paramMap.add("code", code);
    paramMap.add("client_secret", globalPropertySource.getKakaoClientSecret());
    
    HttpHeaders headers = new HttpHeaders();
    HttpEntity<MultiValueMap<String,String>> request = new HttpEntity<>(paramMap, headers);
    
    String rawJsonString = 
        template.postForObject(kakaoUrl, request, String.class);
    
    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
    
    String kakaoAccessToken = (String) jsonObject.get("access_token");
    
    logger.debug("kakaoAccessToken / accessToken : "+ kakaoAccessToken);
    
    session.setAttribute("kakaoAccessToken", kakaoAccessToken);
    
    // 토큰으로 정보를 받아와서 가입된 회원인지 확인
    kakaoUrl = "https://kapi.kakao.com/v2/user/me";
    
    template = new RestTemplate();
    
    paramMap = new LinkedMultiValueMap<String,String>();
    paramMap.add("property_keys", "[\"kakao_account.email\", \"properties.nickname\"]");
    
    headers = new HttpHeaders();
    headers.add("Authorization", "Bearer " + kakaoAccessToken);
    HttpEntity<Object> request1 = new HttpEntity<>(paramMap, headers);
    rawJsonString = template.postForObject(kakaoUrl, request1, String.class);
    
    logger.debug("kakaoAccessToken:check / rawJson! : " + rawJsonString);

    jsonParser = new JSONParser();
    jsonObject = (JSONObject) jsonParser.parse(rawJsonString);

    logger.debug("kakaoUserDataLoadAndCheck / raw json : " + jsonObject);
    
    HashMap<String,Object> response = (HashMap<String,Object>) jsonObject.get("kakao_account");

    String email = (String) response.get("email");
    logger.info("email >> " + email);
    
    if (email == null || email.length() == 0) {
      session.setAttribute("error_type", "noEmail");
      session.setAttribute("login_type", "kakao");
      return "redirect:snsLoginFail";
    }
    
    Member member = memberService.get(email);
    
    // 해당 이메일로 가입된 유저가 없으면 신규가입으로 보낸다.
    if (member == null) {
      session.setAttribute("login_type", "kakao");
      return "redirect:snsJoin";
    }
    
    // 해당 이메일로 가입되어있지만, 로그인 타입이 네이버가 아니라면, alert창을 띄우게 한다.
    if (!member.getLoginType().equalsIgnoreCase("kakao")) {
      session.setAttribute("login_type", member.getLoginType());
      session.setAttribute("error_type", "otherType");
      return "redirect:snsLoginFail";
    }
    
    // 해당 이메일로 가입되어있고, 로그인 타입이 네이버라면 자동로그인 처리한 후 메인으로 보낸다.
    session.setAttribute("loginUser", member);

    return "redirect:snsLoginSuccess";

  }

  @SuppressWarnings("unchecked")
  public String kakaoUserDataLoadAndSave(
      String accessToken, 
      HttpSession session, 
      TermsAgree termsAgree) throws Exception {
    String kakaoUrl = 
        "https://kapi.kakao.com/v2/user/me";
    RestTemplate template = new RestTemplate();
    MultiValueMap<String,String> paramMap = new LinkedMultiValueMap<String,String>();
    paramMap.add("property_keys", "[\"kakao_account.email\", \"properties.nickname\"]");
    HttpHeaders headers = new HttpHeaders();
    headers.add("Authorization", "Bearer " + accessToken);
    HttpEntity<Object> request = new HttpEntity<>(paramMap, headers);
    String rawJsonString = template.postForObject(kakaoUrl, request, String.class);
    
    logger.debug("kakaoAccessToken:check / rawJson! : " + rawJsonString);

    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);

    logger.debug("kakaoUserDataLoadAndCheck / raw json : " + jsonObject);
    
    HashMap<String,Object> response = (HashMap<String,Object>) jsonObject.get("kakao_account");
    HashMap<String,Object> properties = (HashMap<String,Object>) jsonObject.get("properties");
    String nickname = (String) properties.get("nickname");
    String email = (String) response.get("email");

    Member member = new Member();
    member.setId("kakao-" + UUID.randomUUID().toString());
    member.setName(nickname);
    member.setEmail(email);
    member.setPassword(UUID.randomUUID().toString());
    member.setLoginType("kakao");
    
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







