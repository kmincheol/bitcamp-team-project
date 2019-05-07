package com.eomcs.lms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/matchboard")
public class MatchBoardController {
  
  @GetMapping("list")
  public String list() {
	  return "matchboard/list";
  }

  @GetMapping("sideBar")
  public String sideBar() {
	  return "matchboard/sideBar";
  }
  
  @GetMapping("create")
  public String create() {
	  return "matchboard/create";
  }
  
  @GetMapping("test")
  public String test() {
      return "matchboard/test";
  }
  
}










