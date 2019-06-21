package com.eomcs.lms.web;
import java.util.HashMap;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.eomcs.lms.conf.GlobalPropertySource;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.TermsAgree;
import com.eomcs.lms.service.FacebookService;
import com.eomcs.lms.service.GoogleService;
import com.eomcs.lms.service.KakaoService;
import com.eomcs.lms.service.MemberService;
import com.eomcs.lms.service.NaverService;
import com.eomcs.lms.service.TeamService;

@Controller
@RequestMapping("/auth")
public class AuthController {

  final static Logger logger = LogManager.getLogger(AuthController.class);
  
  static final String REFERER_URL = "refererUrl";

  @Autowired MemberService memberService;
  @Autowired TeamService teamService;
  @Autowired ServletContext servletContext;
  @Autowired FacebookService facebookService;
  @Autowired GoogleService googleService;
  @Autowired KakaoService kakaoService;
  @Autowired NaverService naverService;
  @Autowired GlobalPropertySource globalPropertySource;
  
  @GetMapping("snsLogin")
  public void snsLogin() {
  }
  
  @GetMapping("snsLoginFail")
  public void snsLoginFail() {
  }
  
  @GetMapping("snsLoginSuccess")
  public void snsLoginSuccess() {
  }
  
  @GetMapping("snsJoin")
  public void snsJoin() {
  }
  
  @RequestMapping("snsSignin")
  public String getSnsSigninCode(
      HttpSession session, String loginType) throws Exception {
    logger.debug("snsSignin");

    String state = UUID.randomUUID().toString().replace("-", "").substring(0, 10);
    logger.info(state);
    
    String redirectUri = 
        "https://battlematching.online/app/auth/snsAccessToken?loginType=";
    String returnUrl = "auth/snsLoginFail";
    
    if (loginType.equalsIgnoreCase("facebook")) {
      logger.debug("facebookSignin");
      String facebookUrl = "https://www.facebook.com/v3.3/dialog/oauth?"+
              "client_id="+ globalPropertySource.getFacebookClientId() +
              "&redirect_uri=" + redirectUri + "facebook"+
              "&state=" + state +
              "&scope=public_profile,email";

      returnUrl = "redirect:" + facebookUrl;
      
    } else if (loginType.equalsIgnoreCase("naver")) {
      
      logger.debug("naverSignin");
      String naverUrl = "https://nid.naver.com/oauth2.0/authorize?"
          + "response_type=code"
          + "&client_id=" + globalPropertySource.getNaverClientId()
          + "&redirect_uri=" + redirectUri + "naver"
          + "&state="
          + state;
      
      returnUrl = "redirect:" + naverUrl;
      
    } else if (loginType.equalsIgnoreCase("kakao")) {
      logger.debug("kakaoSignin");
      String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?"
          + "client_id=" + globalPropertySource.getKakaoClientId()
          + "&redirect_uri=" + redirectUri + "kakao"
          + "&response_type=code"
          + "&state="
          + state;
      
      returnUrl ="redirect:" + kakaoUrl;
      
    } else if (loginType.equalsIgnoreCase("google")) {
      
      logger.debug("googleSignin");
      // idToken을 발급받기 위해 scope를 지정해준다.
      String googleUrl = "https://accounts.google.com/o/oauth2/v2/auth?" + 
          "scope=email%20profile" + 
          "&response_type=code" + 
          "&state=" + state + 
          "&redirect_uri=" + redirectUri + "google" + 
          "&client_id=" + globalPropertySource.getGoogleClientId();
        
      returnUrl = "redirect:" + googleUrl;
      
    } else {
      session.setAttribute("error_type", "error");
    }
    
    return returnUrl;
  }
  
  @RequestMapping("snsAccessToken")
  public String getSnsSignIn(
      String code, 
      String loginType, 
      String error, 
      String state, 
      HttpSession session) throws Exception {
    logger.debug("snsAccessToken / code : " + code);
    logger.info("state >>" + state); // csrf
    logger.info("loginType >>" + loginType);
    
    String url = "auth/snsLoginFail";
    
    // code가 안넘어오면 error : access_denied가 넘어옴.
    if (code == null || code.length() == 0) {
      logger.info("error >>" + error);
      session.setAttribute("error_type", "cancel");
      return url;
    }
    
    // accessToken을 받아오고 세션에 토큰을 저장함.
    // 토큰을 이용하여 개인정보를 가져오고 가입된 유저인지 체크함.
    if (loginType.equalsIgnoreCase("facebook")) {
      logger.debug("facebookAccessToken / code : "+ code);
      logger.info("state >>" + state);
      url = facebookService.requestFaceBookAccessTokenAndUserDataCheck(session, code, state);
      
    } else if (loginType.equalsIgnoreCase("naver")) {
      logger.debug("naverAccessToken / code : "+ code);
      logger.info("state >>" + state);
      url = naverService.requestNaverAccessTokenAndUserDataCheck(session, code, state);
      
    } else if (loginType.equalsIgnoreCase("kakao")) {
      logger.debug("kakaoAccessToken / code : "+ code);
      url = kakaoService.requestKakaoAccessTokenAndUserDataCheck(session, code);
      
    } else if (loginType.equalsIgnoreCase("google")) {
      logger.debug("googleAccessToken / code : "+ code);
      url = googleService.requestGoogleAccessTokenAndUserDataCheck(session, code);
      
    } else {
      session.setAttribute("error_type", "error");
    }
    
    return url;
  }
  
  @RequestMapping("snsEnter")
  @ResponseBody
  public Object getSnsEnter(
      String loginType,
      TermsAgree termsAgree, 
      HttpSession session) throws Exception {
    HashMap<String,Object> content = new HashMap<>();
    String status = "fail";
    
    // 토큰을 이용하여 개인정보를 가져오고 신규회원을 가입시킴.
    if (loginType.equalsIgnoreCase("facebook")) {
      String accessToken = (String) session.getAttribute("faceBookAccessToken");
      status = facebookService.facebookUserDataLoadAndSave(accessToken, session, termsAgree);
      
    } else if (loginType.equalsIgnoreCase("naver")) {
      String accessToken = (String) session.getAttribute("naverAccessToken");
      status = naverService.naverUserDataLoadAndSave(accessToken, session, termsAgree);
      
    } else if (loginType.equalsIgnoreCase("kakao")) {
      String accessToken = (String) session.getAttribute("kakaoAccessToken");
      status = kakaoService.kakaoUserDataLoadAndSave(accessToken, session, termsAgree);
      
    } else if (loginType.equalsIgnoreCase("google")) {
      String idToken = (String) session.getAttribute("googleIdToken");
      status = googleService.googleUserDataLoadAndSave(idToken, session, termsAgree);
    } 
    
    content.put("status", status);
    return content;
  }
  
  @GetMapping("form")
  public void form(
      @RequestHeader(value="Referer",required=false) String refererUrl,
      HttpSession session) {
    
    logger.debug("refererUrl: " + refererUrl);
    
    if (refererUrl != null && !refererUrl.endsWith("/auth/login")) {
      session.setAttribute(REFERER_URL, refererUrl);
    } else {
      session.removeAttribute(REFERER_URL);
    }
  }
  
  @PostMapping("login")
  public String login(
      String id,
      String password,
      String saveId,
      HttpSession session,
      HttpServletResponse response
     ) {

    Cookie cookie;
    if (saveId != null) {
      cookie = new Cookie("id", id);
      cookie.setMaxAge(60 * 60 * 24 * 15); // 15일간 쿠키를 보관한다.
      
    } else {
      cookie = new Cookie("id", "");
      cookie.setMaxAge(0); // 기존의 쿠키를 제거한다.
    }
    response.addCookie(cookie); 

    Member member = memberService.get(id, password);
      
    if (member == null) {
      return "auth/fail";
    }

    session.setAttribute("loginUser", member);

    String refererUrl = (String) session.getAttribute(REFERER_URL);
    
    logger.debug("refererUrl: " + refererUrl);
    
    if (refererUrl == null) {      
      return "redirect:/"; // 웹 애플리케이션 루트(컨텍스트 루트)를 의미한다.
      
    } else {
      return "redirect:" + "/app/main";
    }
  }
  
  @GetMapping("logout")
  public String logout(HttpSession session) throws Exception {
    
    logger.debug("세션 무효화시킴!");
    logger.debug("loginUser: " + session.getAttribute("loginUser"));
    session.invalidate();
    
    return "redirect:/app/main";
  }
}










