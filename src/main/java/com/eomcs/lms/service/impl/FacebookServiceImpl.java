package com.eomcs.lms.service.impl;

import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
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
  
  public String requestFaceBookAccessTokenAndUserDataCheck
  (HttpSession session, String code) throws Exception {
    String facebookUrl = 
        "https://graph.facebook.com/v3.3/oauth/access_token?"+
        "client_id=" + "564771240719772" +
        "&redirect_uri=" + "http://localhost:8080/bitcamp-team-project/app/auth/snsAccessToken?loginType=facebook" +
        "&client_secret="+ "da197861cbfcc7cb90a738e785aadcad" +
        "&code=" + code;
    
    RestTemplate template = new RestTemplate();
    String rawJsonString = template.getForObject(facebookUrl, String.class);
    logger.debug("facebookAccessToken / raw json : "+rawJsonString);
    
    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
    String faceBookAccessToken = (String) jsonObject.get("access_token");
    logger.debug("facebookAccessToken / accessToken : "+faceBookAccessToken);
    
    session.setAttribute("faceBookAccessToken", faceBookAccessToken);
    
    // 토큰으로 정보를 받아와서 가입된 회원인지 확인
    facebookUrl = "https://graph.facebook.com/me?"+
        "access_token="+ faceBookAccessToken +
        "&fields=id,name,email";
    
    template = new RestTemplate();
    rawJsonString = template.getForObject(facebookUrl, String.class);
    logger.debug("facebookAccessToken:check / rawJson! : "+rawJsonString);

    jsonParser = new JSONParser();
    jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
    logger.debug("facebookUserDataLoadAndCheck / raw json : "+jsonObject);

    String email = (String) jsonObject.get("email");


    if (email == null || email.length() == 0) {
      session.setAttribute("error_type", "noEmail");
      session.setAttribute("login_type", "facebook");
      return "redirect:snsLoginFail";
    }

    Member member = memberService.get(email);

    // 해당 이메일로 가입된 유저가 없으면 신규가입으로 보낸다.
    if (member == null) {
      session.setAttribute("login_type", "facebook");
      return "redirect:snsJoin";
    }

    // 해당 이메일로 가입되어있지만, 로그인 타입이 페이스북이 아니라면, alert창을 띄우게 한다.
    if (!member.getLoginType().equalsIgnoreCase("facebook")) {
      session.setAttribute("login_type", member.getLoginType());
      session.setAttribute("error_type", "otherType");
      return "redirect:snsLoginFail";
    }
    
    // 해당 이메일로 가입되어있고, 로그인 타입이 페이스북이라면 자동로그인 처리한 후 메인으로 보낸다.
    session.setAttribute("loginUser", member);
    
    return "redirect:snsLoginSuccess";
        
  }
  
  public String facebookUserDataLoadAndSave(
      String accessToken, 
      HttpSession session, 
      TermsAgree termsAgree) throws Exception {
    String facebookUrl = "https://graph.facebook.com/me?"+
            "access_token="+ accessToken +
            "&fields=id,name,email";
    
    RestTemplate template = new RestTemplate();
    String rawJsonString = template.getForObject(facebookUrl, String.class);
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
