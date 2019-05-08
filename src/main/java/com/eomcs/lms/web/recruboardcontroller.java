package com.eomcs.lms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class recruboardcontroller {
  
  
  @RequestMapping("/recruit_board")
  public String teamrecruit() {
   return "recruit_board/recruit_list";
  }
}










