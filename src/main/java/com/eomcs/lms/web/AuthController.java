package com.eomcs.lms.web;
import java.util.HashMap;
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
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.TermsAgree;
import com.eomcs.lms.service.FacebookService;
import com.eomcs.lms.service.MemberService;
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
    
  @GetMapping("test")
  public void test() {
    
  }
  
  @GetMapping("facebookEnter")
  public void facebookEnter() {
  }
  
  @GetMapping("facebookLoginSuccess")
  public void facebookLoginSuccess() {
  }
  
  @GetMapping("facebookLoginFail")
  public void facebookLoginFail() {
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
  
  @GetMapping("form2")
  public void form2(
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
  
  @RequestMapping("facebookSignin")
  public String getfacebookSigninCode(HttpSession session) {
    logger.debug("facebookSignin");

    String facebookUrl = "https://www.facebook.com/v3.3/dialog/oauth?"+
            "client_id="+ "564771240719772" +
            "&redirect_uri=http://localhost:8080/bitcamp-team-project/app/auth/facebookAccessToken"+
            "&scope=public_profile,email";

    return "redirect:"+facebookUrl;
  }
  
  @RequestMapping("facebookAccessToken")
  public String getFacebookSignIn(String code, HttpSession session, String state) throws Exception {
    logger.debug("facebookAccessToken / code : "+ code);
    
    // accessToken을 받아오고 세션에 토큰을 저장함.
    String accessToken = facebookService.requesFaceBooktAccesToken(session, code);
    
    // 토큰을 이용하여 개인정보를 가져오고 가입된 유저인지 체크함.
    String url = facebookService.facebookUserDataLoadAndCheck(accessToken, session);
    
    return url;
  }
  
  @RequestMapping("facebookEnter")
  @ResponseBody
  public Object getFacebookEnter(TermsAgree termsAgree, HttpSession session) throws Exception {
    String accessToken = (String) session.getAttribute("faceBookAccessToken");
    
    // 토큰을 이용하여 개인정보를 가져오고 신규회원을 가입시킴.
    String status = facebookService.facebookUserDataLoadAndSave(accessToken, session, termsAgree);
    
    HashMap<String,Object> content = new HashMap<>();
    content.put("status", status);
    
    return content;
  }
}










