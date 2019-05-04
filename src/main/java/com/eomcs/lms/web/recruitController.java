package com.eomcs.lms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class recruitController {
  
  
  @GetMapping("/recruit")
  public String team() {
   return "recruit/recruit_form";
  }
  
  @GetMapping("/team_recruit")
  public String want_team() {
   return "recruit/team_recruit_form";
  }
  
}










