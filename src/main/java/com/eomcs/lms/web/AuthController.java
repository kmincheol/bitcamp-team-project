package com.eomcs.lms.web;
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
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {

  final static Logger logger = LogManager.getLogger(AuthController.class);
  
  static final String REFERER_URL = "refererUrl";

  @Autowired MemberService memberService;
  @Autowired ServletContext servletContext;
  
  
  @GetMapping("signUp1")
  public void signUp1() {
    
  }
  
  @GetMapping("signUp2")
  public void signUp2() {
    
  }
  
  @GetMapping("findPwd16")
  public void findPwd16() {
    
  }
  
  @GetMapping("findPwd17")
  public void findPwd17() {
    
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
      HttpServletResponse response) {

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
    System.out.println(member);
    if (member == null) {
      return "auth/fail";
    }

    session.setAttribute("loginUser", member);

    String refererUrl = (String) session.getAttribute(REFERER_URL);
    
    logger.debug("refererUrl: " + refererUrl);
    
    if (refererUrl == null) {      
      return "redirect:/"; // 웹 애플리케이션 루트(컨텍스트 루트)를 의미한다.
      
    } else {
      return "redirect:" + refererUrl;
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










