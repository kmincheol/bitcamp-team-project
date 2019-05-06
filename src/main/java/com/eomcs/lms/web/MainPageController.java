package com.eomcs.lms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class MainPageController {
  
  
  @RequestMapping("/main_page")
  public String teamrecruit() {
   return "main/main_page";
  }
  
}










