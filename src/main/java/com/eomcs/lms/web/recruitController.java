package com.eomcs.lms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/recruit")
public class recruitController {
  
  
  @GetMapping
  public String team() {
   return "recruit/recruit_form";
  }
  
  
}










