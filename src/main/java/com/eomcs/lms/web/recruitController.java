package com.eomcs.lms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class recruitController {
  
// 팀원구함 글쓰기 페이지
@RequestMapping("/recruit_list")
public String teamRecruitList() {
  return "recruit/recruit_list";
}

  // 팀원구함 글쓰기 페이지
  @RequestMapping("/recruit")
  public String teamRecruit() {
   return "recruit/recruit_form";
  }
  
  // 팀 가입 글쓰기 페이지
  @RequestMapping("/team_recruit") 
  public String wantTeam() {
   return "recruit/team_recruit_form";
  }
  
  // 팀원구함 페이지(글쓴거) - 모집완료 통합.
  @RequestMapping("/recruit_view")
  public String recruitView() {
	  return "recruit/recruit_form_view";
  }
  
//  // 팀원구함 페이지_모집완료
//  @RequestMapping("/recruit_view_done")
//  public String recruit_view_done() {
//	  return "recruit/recruit_form_view_done";
//  }
  
  // 팀 구함 페이지(글쓴거)
  @RequestMapping("/recruit_view_invite")
  public String recruitViewInvite() {
	  return "recruit/recruit_form_view_invite";
  }
}










