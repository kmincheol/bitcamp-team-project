package com.eomcs.lms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class recruitController {
  
  
  @RequestMapping("/recruit")
  public String teamrecruit() {
   return "recruit/recruit_form";
  }
  
  @RequestMapping("/team_recruit")
  public String want_team() {
   return "recruit/team_recruit_form";
  }
  
  @RequestMapping("/recruit_view")
  public String recruit_view() {
	  return "recruit/recruit_form_view";
  }
  
}










