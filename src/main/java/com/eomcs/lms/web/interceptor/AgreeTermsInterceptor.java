package com.eomcs.lms.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.eomcs.lms.domain.TermsAgree;

@Component
public class AgreeTermsInterceptor extends HandlerInterceptorAdapter {
  
  private static final Logger logger = LogManager.getLogger(AgreeTermsInterceptor.class);
  
  @Override
  public boolean preHandle(
      HttpServletRequest request, HttpServletResponse response, Object handler)
          throws Exception {
    
    //session검사
    HttpSession session = request.getSession(false);

    if (session == null) {
      // 처리를 끝냄 - 컨트롤로 요청이 가지 않음.
      response.sendRedirect("invalid");
      return false;
    }

    TermsAgree termsAgree = (TermsAgree) session.getAttribute("termsAgree");
    if (termsAgree == null) { 
      response.sendRedirect("invalid");  
      return false;
    }
    return true;
  }
}
