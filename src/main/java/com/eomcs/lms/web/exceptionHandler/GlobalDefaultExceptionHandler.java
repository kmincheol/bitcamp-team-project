package com.eomcs.lms.web.exceptionHandler;


import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;


@ControllerAdvice
public class GlobalDefaultExceptionHandler {

  public static final Logger logger = LogManager.getLogger(GlobalDefaultExceptionHandler.class);
  
  @ExceptionHandler(Exception.class)
  public ModelAndView defaultErrorHandler(
      HttpServletRequest request,Exception e) throws Exception {
    
    logger.info(e.toString());
    
    // @ResponseStatus가 붙은 예외라면 다시 던짐.
    if (AnnotationUtils.findAnnotation(e.getClass() , ResponseStatus.class) != null) {
      throw e;
    }
    
    // 기본 예외 처리
    ModelAndView mav = new ModelAndView();
    mav.addObject("url", request.getRequestURL());
    mav.addObject("exception", e);
    mav.addObject("path", request.getRequestURL().toString().split("app")[1]);
    mav.setViewName("/error/error_common");
    
    return mav;
  }
}
