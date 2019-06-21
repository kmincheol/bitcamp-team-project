package com.eomcs.lms.web;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.MiddleLocation;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamAges;
import com.eomcs.lms.domain.TeamLevel;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TeamType;
import com.eomcs.lms.domain.TeamTypeSports;
import com.eomcs.lms.domain.TopLocation;
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
    List<Team> teams = teamService.teamList1();
    List<TeamMember> teamMembers = teamService.teamMemberList();
    List<TeamTypeSports> teamTypeSports = teamService.sportsTypeList();
    List<TeamType> teamTypes = teamService.teamTypeList();
    List<TeamAges> teamAges = teamService.teamAgeList();

    model.addAttribute("teamTypeSports", teamTypeSports);
    model.addAttribute("teams", teams);
    model.addAttribute("teamTypes", teamTypes);
    model.addAttribute("teamAges", teamAges);
    model.addAttribute("teamMembers", teamMembers); 

    return "team/list";
  }

  @GetMapping("list2")
  public String list2(Model model) {
    List<Team> teams = teamService.teamList1();
    List<TeamMember> teamMembers = teamService.teamMemberList();
    List<TeamTypeSports> teamTypeSports = teamService.sportsTypeList();
    List<TeamType> teamTypes = teamService.teamTypeList();
    List<TeamAges> teamAges = teamService.teamAgeList();

    model.addAttribute("teamTypeSports", teamTypeSports);
    model.addAttribute("teams", teams);
    model.addAttribute("teamTypes", teamTypes);
    model.addAttribute("teamAges", teamAges);
    model.addAttribute("teamMembers", teamMembers); 

    return "team/list2";
  }

  @GetMapping("form")
  public String form(Map<String,Object> map, HttpSession session) {
    Member member = (Member) session.getAttribute("loginUser");

    if (member != null) {

      List<TeamType> teamTypes = teamService.teamTypeList();
      List<TeamAges> teamAges = teamService.teamAgeList();
      List<TeamTypeSports> teamTypeSports = teamService.sportsTypeList();
      List<TeamLevel> teamLevels = teamService.teamLevelList();
      List<TeamMember> teamMembers = teamService.teamMemberList();
      List<TopLocation> topLocations = teamService.topLocationList();

      map.put("teamTypes", teamTypes);
      map.put("teamAges", teamAges);
      map.put("teamTypeSports", teamTypeSports);
      map.put("teamLevels", teamLevels);
      map.put("teamMembers", teamMembers);
      map.put("topLocations", topLocations);
      map.put("member", member);
    } else {
      return "redirect:../auth/form";
    }
    return "team/form";
  }

  @ResponseBody
  @GetMapping("AddressCheck")
  public Object AddressCheck(int no) {
    System.out.println("===>" + no);
    HashMap<String,Object> map = new HashMap<>();

    if (teamService.middleLocationList(no) != null) {
      List<MiddleLocation> middleLocations = teamService.middleLocationList(no);
      map.put("status", "success");  
      map.put("middleLocations", middleLocations);
    } else {
      map.put("status", "fail");
    }  
    return map;
  }


  @GetMapping(value="checkId", produces="text/plain;charset=UTF-8")
  @ResponseBody
  private String checkId(String teamName) {
    logger.info("checkId >>> " + teamName);
    if (teamService.checkName(teamName) != null) {
      return "checkId" + 0;
    } else {
      return "checkId" + 1;
    }
  }

//  @ResponseBody
//  @PostMapping("add")
//  public Object add(Team team, HttpSession session, TeamMember teamMember) {
//
//    Member member = (Member) session.getAttribute("loginUser");
//
//    member.setMyteam(team);
//    teamMember.setMemberNo(member.getNo());
//    teamMember.setMember(member);
//    // add 할 시 팀장 지정
//    teamMember.setTeamLeader(true);
//    team.setTeamMember(teamMember);
//
//    teamService.addTeam(team);
//    teamMember.setTeamMemberNo(team.getTeamId());
//    teamService.addTeamLeader(teamMember);
//
//    member.setMainTeam(team.getTeamId());
//    System.out.println(member);
//    memberService.addMainTeam(member);  
//    System.out.println(member.getMainTeam());
//    
//    HashMap<String,Object> map = new HashMap<>();
//    map.put("status", "success");
//    return map;
//  }
  
  
  @PostMapping("add")
  public String add(Team team, HttpSession session, TeamMember teamMember) {

    Member member = (Member) session.getAttribute("loginUser");

    member.setMyteam(team);
    teamMember.setMemberNo(member.getNo());
    teamMember.setMember(member);
    // add 할 시 팀장 지정
    teamMember.setTeamLeader(true);
    team.setTeamMember(teamMember);

    teamService.addTeam(team);
    teamMember.setTeamMemberNo(team.getTeamId());
    teamService.addTeamLeader(teamMember);

    member.setMainTeam(team.getTeamId());
    System.out.println(member);
    memberService.addMainTeam(member);  
    System.out.println(member.getMainTeam());
    
    return "redirect:../team";
  }

  @GetMapping("{no}")
  public String detail(@PathVariable int no, Model model) {
    //TeamMember teamMember = new TeamMember();
    Team team = teamService.getTeam(no);
    List<TeamMember> teamMembers = teamService.getTeamMember(no);
    System.out.println(teamMembers);
    model.addAttribute("teamMembers", teamMembers);
    model.addAttribute("team", team); 

    return "team/detail2";
  }

  @ResponseBody
  @GetMapping("reLogin")
  public Object reLogin(String id, HttpSession session) {
    Member member = memberService.getId(id);
    HashMap<String,Object> map = new HashMap<>();

    session.setAttribute("loginUser", member);
    map.put("status", "success");
    return map;
  }
  
  @ResponseBody
  @GetMapping("reLogout")
  public Object logout(HttpSession session) throws Exception {

    session.invalidate();

    HashMap<String,Object> content = new HashMap<>();
    content.put("status", "success");

    return content;
  }


  @GetMapping("search")
  public void search(String keyword, Model model) {
    List<TeamMember> teamMembers = teamService.teamMemberList();
    List<Team> team = teamService.search(keyword);
    List<TeamTypeSports> teamTypeSports = teamService.sportsTypeList();
    model.addAttribute("teamTypeSports", teamTypeSports);
    model.addAttribute("teamMembers", teamMembers); 
    model.addAttribute("search", team);
  }


}



