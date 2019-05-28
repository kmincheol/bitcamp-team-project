package com.eomcs.lms.web;

import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamAges;
import com.eomcs.lms.domain.TeamLevel;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TeamType;
import com.eomcs.lms.domain.TeamTypeSports;
import com.eomcs.lms.service.MemberService;
import com.eomcs.lms.service.TeamService;

@Controller
@RequestMapping("/team")
public class TeamController {
  
  private static final Logger logger = LogManager.getLogger(TeamController.class);

  @Autowired TeamService teamService;
  @Autowired MemberService memberService;
  @Autowired ServletContext servletContext;

  @GetMapping
  public String list(Model model) {
    //List<TeamMember> teamMembers = teamService.getTeamMember();
    /* team.setTeamMember((TeamMember)teamMembers); */
    /* teams.add(team); */

    List<Team> teams = teamService.teamList1();
    List<TeamMember> teamMembers = teamService.teamMemberList();
    
    model.addAttribute("teams", teams);
     model.addAttribute("teamMembers", teamMembers); 
     
    return "team/list1";
  }

  @GetMapping("form")
  public void form(Map<String,Object> map) {
    List<TeamType> teamTypes = teamService.teamTypeList();
    List<TeamAges> teamAges = teamService.teamAgeList();
    List<TeamTypeSports> teamTypeSports = teamService.sportsTypeList();
    List<TeamLevel> teamLevels = teamService.teamLevelList();
    List<TeamMember> teamMembers = teamService.teamMemberList();
    map.put("teamTypes", teamTypes);
    map.put("teamAges", teamAges);
    map.put("teamTypeSports", teamTypeSports);
    map.put("teamLevels", teamLevels);
    map.put("teamMembers", teamMembers);
  }

  @PostMapping("add")
  public String add(Team team, HttpSession session, TeamMember teamMember) {

      Member member = (Member) session.getAttribute("loginUser");
      
      teamMember.setMemberNo(member.getNo());
      teamMember.setMember(member);
      // add 할 시 팀장 지정
      teamMember.setTeamLeader(true);
      team.setTeamMember(teamMember);

      teamService.addTeam(team);
      teamMember.setTeamMemberNo(team.getTeamId());
      teamService.addTeamLeader(teamMember);
     
      return "redirect:.";
  }
  
  @GetMapping("{no}")
  public String detail(@PathVariable int no, Model model) {
    //TeamMember teamMember = new TeamMember();
    Team team = teamService.getTeam(no);
    List<TeamMember> teamMembers = teamService.getTeamMember(no);
    System.out.println(teamMembers);
    model.addAttribute("teamMembers", teamMembers);
    model.addAttribute("team", team); 
   
    return "team/detail";
  }
  
  
//
//  @GetMapping("update/{no}")
//  public String detailUpdate(@PathVariable int no, Model model) {
//    Free free = freeService.getUpdate(no);
//    model.addAttribute("free", free);
//    return "free/update";
//  }
//  
//  @GetMapping("search")
//  public void search(String keyword, Model model) {
//    List<Free> free = freeService.search(keyword);
//    model.addAttribute("search", free);
//  }
//  

//
//
//  @PostMapping("update")
//  public String update(Free free) {
//
//    freeService.update(free); 
//    
//    return "redirect:.";
//  }
//
//  @GetMapping("delete/{no}")
//  public String delete(@PathVariable int no) {
//
//    if (freeService.delete(no) == 0) 
//      throw new RuntimeException("해당 번호의 게시물이 없습니다.");
//
//    return "redirect:../";
//  }
}










