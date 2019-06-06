package com.eomcs.lms.web;
import java.util.HashMap;
import java.util.Map;
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
  
  @GetMapping("signUp2")
  public void signUp2() {
    
  }
  
  @GetMapping("signUp3")
  public void signUp3() {
    
  }
  
  @GetMapping("findId1")
  public void findId1() {
    
  }
  
  @GetMapping("findPwd1")
  public void findPwd1() {
    
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
  
  @SuppressWarnings("rawtypes")
  @GetMapping("fblogin")
  @ResponseBody
  public Object fblogin(
      String accessToken,
      HttpSession session) throws Exception {

    // accessToken을 가지고 페이스북 서버에 로그인 사용자의 정보를 요청한다.

    Map fbLoginUser = facebookService.getLoginUser(accessToken);
    logger.info("fbLoginUser >>" + fbLoginUser);
    // 페이스북에서 받은 사용자 정보 중에서 이메일을 가지고 회원 정보를 찾는다.
    Member member = memberService.get((String)fbLoginUser.get("email"));
    logger.info("member >>" + member);
    HashMap<String,Object> content = new HashMap<>();
    
    // 만약 소셜 사용자가 현재 사이트에 가입된 상태가 아니라면 가입시킨다.
    if (member == null) {
      // 토큰과 함께 필수 동의정보 확인하는 페이지로 보내기 위해 content 세팅함.
      content.put("status", "success");
      content.put("type", "join");
      
      return content;
    }

    session.setAttribute("loginUser", member);
    
    content.put("status", "success");

    return content;
  }
}










