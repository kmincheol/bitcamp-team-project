package com.eomcs.lms.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.domain.MatchApply;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TopLocation;
import com.eomcs.lms.service.LocationService;
import com.eomcs.lms.service.MatchApplyService;
import com.eomcs.lms.service.MatchBoardService;
import com.eomcs.lms.service.TeamService;

@Controller
@RequestMapping("/matchboard")
public class MatchBoardController {
  
  private static final Logger logger = LogManager.getLogger(MatchBoardController.class);
  
  @Autowired MatchBoardService matchBoardService;
  @Autowired TeamService teamService;
  @Autowired MatchApplyService matchApplyService;
  @Autowired LocationService locationService;
  @Autowired ServletContext servletContext;

  // filter.js test
  @GetMapping("listAll")
  @ResponseBody
  public Object listAll(HttpSession session) {
    ArrayList<Match> matches = new ArrayList<>();
    
    List<Match> all = matchBoardService.search();
    for (Match m : all) {
      matches.add(m);
    }
    return matches;
  }
  
  
  @GetMapping("map")
  public void map() {
  }
  
  @GetMapping("map2")
  public void map2() {
  }
  
  
  @GetMapping("list3")
  public void list3(Model model, HttpSession session) {
    List<Match> all = matchBoardService.search();
    
    // 로그인 유저를 위한.
    if (session.getAttribute("loginUser") != null) {
      Member member = (Member) session.getAttribute("loginUser"); // member에 로그인 유저 정보 담고.
      List<Match> teames = matchBoardService.teamInfoGet(member.getNo()); // 로그인 유저의 팀 목록 받아서 리더정보 뽑아오기
      model.addAttribute("myteam", teames);
      } else {
      }
    model.addAttribute("all", all);
  }
  
  
  @GetMapping("list4")
  public void list4(Model model, HttpSession session) {
    List<Match> all = matchBoardService.search();
    
    // 로그인 유저를 위한.
    if (session.getAttribute("loginUser") != null) {
      Member member = (Member) session.getAttribute("loginUser"); // member에 로그인 유저 정보 담고.
      List<Match> teames = matchBoardService.teamInfoGet(member.getNo()); // 로그인 유저의 팀 목록 받아서 리더정보 뽑아오기
      model.addAttribute("myteam", teames);
      logger.info(teames);
      } else {
      }
    model.addAttribute("all", all);
  }
  
  @GetMapping("list5")
  public void list5() {
  }
  
  @GetMapping("list6")
  public void list6(Model model) {
    List<Match> all = matchBoardService.search();
    model.addAttribute("all", all);
  }
  @GetMapping("list7")
  public void list7(Model model) {
    List<Match> all = matchBoardService.search();
    for (Match m : all) {
      logger.info(m.getPlayDate());
      logger.info(m.getPlayDate().getTime());
    }
    model.addAttribute("all", all);
  }
  
  @GetMapping("test")
  public String test(Match match) throws Exception {
    return "matchboard/test";
  }
  
  @GetMapping("form")
  public String form(Model model, HttpSession session, @RequestParam(defaultValue="01") int topLocationNo) {
    Member member = (Member) session.getAttribute("loginUser");
    
    try {
      if (member == null) {
      throw new RuntimeException("로그인 해야 글을 등록할 수 있습니다.");
    }
    }catch (Exception e) {
      return "matchboard/auth";
    }
    
    List<TopLocation> location = locationService.findToplocation(topLocationNo);
    model.addAttribute("location", location);
    
    List<Match> match = matchBoardService.leaderJudge(member.getNo());
   
//    @SuppressWarnings("unchecked")
//    List<Team> teams = (List<Team>) teamService.getTeam(member.getNo()); 
    
    model.addAttribute("member", member); 
    model.addAttribute("match",match); 
    
    return "matchboard/form";
  }
  
  
  @GetMapping
  public String list(HttpSession session,Model model) {
    ArrayList<Match> recommendMatches = new ArrayList<>(); // 추천매칭 담을 배열
    List<Match> all = matchBoardService.search();
    
    if (session.getAttribute("loginUser") != null) {
      Member member = (Member) session.getAttribute("loginUser"); // member에 로그인 유저 정보 담고.
      List<Match> logUserteames = matchBoardService.leaderJudge(member.getNo()); // 로그인 유저의 팀 목록 받아서 리더정보 뽑아오기
      List<TeamMember> teams = teamService.getTeamMemberListByMemberNo(member.getNo());
      recommendMatches = matchBoardService.recommendMatch(member); // 추천매칭 정보가져오기
      model.addAttribute("myteam", logUserteames);
      if (teams.size() == 0 || teams == null) {
        session.setAttribute("teamsCheck", "not");
      } else {
        session.setAttribute("teamsCheck", "exist");
      }
    } else {
    }


    model.addAttribute("all", all);
    session.setAttribute("recommendMatches", recommendMatches); // 세션에 추천매칭 추가
    return "/matchboard/list";
  }


  
  @RequestMapping("{no}")
  public String detail(@PathVariable int no, HttpSession session, Model model) {
    Match match = matchBoardService.get(no);
    String matchuserId = match.getMember().getId();
    System.out.println("TTTTTT"+ matchuserId);
    
    
    // 다른 사용자가 해당하는 매치글에 신청하기 위한 목적.
    if (session.getAttribute("loginUser") != null) {
    Member member = (Member) session.getAttribute("loginUser"); 
    List<Match> teams = matchBoardService.leaderJudge(member.getNo()); // 로그인 유저의 팀 목록 받아서 리더정보 뽑아오기

    model.addAttribute("myteam",teams);
    } else {
    }
    model.addAttribute("match", match);
    model.addAttribute("matchuserId", matchuserId); 
    return "matchboard/detail";
  }
  
  
  
  
  @GetMapping("update_form/{no}")
  public String detailUpdate(@PathVariable int no, Model model) {
    Match match = matchBoardService.get(no);
    model.addAttribute("match", match);
   return "matchboard/update";
  }
  
  
  
  @RequestMapping("add")
  public String add(Match match) throws Exception {
    System.out.println("BBBBBBB");
    logger.debug(match);
    
    matchBoardService.add(match);
      return "redirect:.";
  }
  
  
  
  @PostMapping("update")
  public String update(Match match) {
    System.out.println("UPDATEUPDATE"+ match.toString());
    if (matchBoardService.update(match) == 0) 
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");
    return "redirect:.";
  }
  
  
  
  // 키 참조때문에 삭제 안되면 matchtb_revise.sql 파일 참조. --임시
  // 경기신청 데이터 지우고, 후기게시판 데이터 지우고,
  // 태그 데이터 지우고 그리고 나서 매치보드 번호 삭제. 
  @GetMapping("delete/{no}")
  public String delete(@PathVariable int no) {
    System.out.println("DELETEDLETE"+ no);

    matchApplyService.delete(no);
    
    if (matchBoardService.delete(no) == 0) 
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");

    return "redirect:../";
  }
  
  
  
  @GetMapping("sideBar")
  public String list2(
      @RequestParam(defaultValue="1") int pageNo,
      @RequestParam(defaultValue="3") int pageSize,
      Model model) {

    if (pageSize < 2 || pageSize > 4)
      pageSize = 3;

    int rowCount = matchBoardService.size();
    int totalPage = rowCount / pageSize;
      if (rowCount % pageSize > 0)
      totalPage++;

      if (pageNo < 1) 
        pageNo = 1;
      else if (pageNo > totalPage)
        pageNo = totalPage;
      
    List<Match> matches = matchBoardService.list(pageNo, pageSize);
    model.addAttribute("matches", matches);
    return "matchboard/sideBar";
  }
  
  
  @RequestMapping("data") //JSON. 매치정보 모달을 위한.
  @ResponseBody
  public Object detailData(int no, HttpSession session) {
    Match match = matchBoardService.get(no);
    HashMap<String,Object> matchMap = new HashMap<>();
    
    // 다른 사용자가 해당하는 매치글에 신청하기 위한 목적.
    if (session.getAttribute("loginUser") != null) {
      Member member = (Member) session.getAttribute("loginUser"); 
      List<Match> teams = matchBoardService.teamInfoGet(member.getNo()); // 로그인 유저의 팀 목록 받아서 리더정보 뽑아오기
      
      matchMap.put("myteam",teams);
    } else {
    }
    
    matchMap.put("match", match);
    
    return matchMap;
  }
  
  @RequestMapping("data2") //JSON. 팀정보 모달을 위한.
  @ResponseBody
  public Object detailteamData(int no) {
    Team team = teamService.getTeam(no); 
    List<TeamMember> teamMembers = teamService.getTeamMember(no); 
    
    HashMap<String,Object> teamMap = new HashMap<>();
    
    teamMap.put("teamMembers", teamMembers);
    teamMap.put("team", team);
    
    return teamMap;
  }
  
  
  @RequestMapping(value="submit/{no}" , method= {RequestMethod.GET, RequestMethod.POST}) 
  @ResponseBody
  public String submit(@PathVariable int no, @RequestBody String teamId) throws ParseException { // 매치번호를 받음. 신청팀번호를 받음.
    logger.debug("AAAA"+no);
    logger.debug("BBBB"+teamId); // teamId는 지금 JSON문자열임.
    //teamId => {"teamId":"7"}

    // JSON 파싱하기
    
      JSONParser jsonParser = new JSONParser();
      JSONObject jsonObj = (JSONObject) jsonParser.parse(teamId);
      String obj = (String) jsonObj.get("teamId");
      int teamIdNo = Integer.parseInt(obj);
    
    Match match = matchBoardService.get(no);
    MatchApply matchApply = new MatchApply();
    
//    List<MatchApply> applyMatchNumbers = matchApplyService.check(teamIdNo); // 여기서 팀번호로 신청한 모든 매치신청 결과를 가져옴
//    
//    for (int i = 0; i < applyMatchNumbers.size(); i++) {
//        matchApply = applyMatchNumbers.get(i);
//        int matchApplyNum = matchApply.getMatchNo();
//         if (matchApplyNum == no) {
//           return "matchboard/overlap";
//         }
//    }
    
    matchApply.setMatchNo(match.getNo());
    matchApply.setTeamNo(teamIdNo);

    matchApplyService.add(matchApply);
    
    return "12345";
  }
  
  
  
//  @GetMapping("sideBar")
//  public String sideBar() {
//    return "matchboard/sideBar";
//  }


  
  
}




