package com.eomcs.lms.web;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.eomcs.lms.domain.MiddleLocation;
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
  public void map() {}

  @GetMapping("map2")
  public void map2() {}

  @GetMapping("test")
  public String test(Match match) throws Exception {
    return "matchboard/test";
  }

  @GetMapping("form")
  public String form(Model model, HttpSession session) {
    Member member = (Member) session.getAttribute("loginUser");

    try {
      if (member == null) {
        throw new RuntimeException("로그인 해야 글을 등록할 수 있습니다.");
      }
    } catch (Exception e) {
      return "matchboard/auth";
    }
    List<TopLocation> locations = locationService.topLocationList();
    model.addAttribute("locations", locations);

    List<Match> match = matchBoardService.leaderJudge(member.getNo());

    List<TeamMember> teams = teamService.getTeamMemberListByMemberNo(member.getNo());
    if (teams.size() == 0 || teams == null) {
      session.setAttribute("teamsCheck", "notTeams");
    } else {
    }

    model.addAttribute("member", member);
    model.addAttribute("match", match);

    return "matchboard/form";
  }


  @GetMapping
  public String list(HttpSession session, Model model) {
    
    ArrayList<Match> recommendMatches = new ArrayList<>(); // 추천매칭 담을 배열
    List<Match> all = matchBoardService.search();
    
    List<Match> top3 = matchBoardService.topthree(); // 어쩔수 없다... 날짜순으로 3개 뽑아온 데이터
      session.setAttribute("top3", top3);
    
    if (session.getAttribute("loginUser") != null) {
      Member member = (Member) session.getAttribute("loginUser"); // member에 로그인 유저 정보 담고.
      List<Match> logUserteames = matchBoardService.leaderJudge(member.getNo()); // 로그인 유저의 팀 목록 받아서// 리더정보 뽑아오기
      logger.info("로그인유저" + member);
      logger.info("로그인유저팀" + logUserteames);
      List<TeamMember> teams = teamService.getTeamMemberListByMemberNo(member.getNo());
      logger.info("팀팀" + teams);
      recommendMatches = matchBoardService.recommendMatch(member); // 추천매칭 정보가져오기
      
      model.addAttribute("myteam", logUserteames);
      if (teams.size() == 0 || teams == null) {
        session.setAttribute("teamsCheck", "not");
      } else {
        session.setAttribute("teamsCheck", "exist");
      }
    } else {
    }
    logger.info("모두" + all);
    logger.info("추천" + recommendMatches);
    model.addAttribute("all", all);
    
    if(recommendMatches.size() >= 1) {
      session.setAttribute("recommendMatches", recommendMatches); // 세션에 추천매칭 추가
    } else {
      session.setAttribute("noSetTeam", "noSetTeam");
    }
    return "/matchboard/list";
  }

  @RequestMapping("{no}")
  public String detail(@PathVariable int no, HttpSession session, Model model) {
    Match match = matchBoardService.get(no);
    String matchuserId = match.getMember().getId();
    System.out.println("TTTTTT" + matchuserId);

    String address = match.getLocation(); // 4글자이거나 5글자임 ex) 0101, 13217 이런식.

    System.out.println("주소"+address);
    
    String address1 = address.substring(0,2);
    System.out.println("상위주소번호"+address1);
    int addressFirst = Integer.parseInt(address1);
    
    String address2 = address.substring(2);
    System.out.println("하위주소번호"+address2);
    int addressSecond = Integer.parseInt(address2);

    System.out.println("////"+address1);
    System.out.println("////"+address2);
    
    TopLocation topLocation = locationService.TopLocationName(addressFirst);
    MiddleLocation middleLocation = locationService.MiddleLocationName(addressSecond);
    
    System.out.println(topLocation);
    System.out.println(middleLocation);
    
    // 다른 사용자가 해당하는 매치글에 신청하기 위한 목적.
    if (session.getAttribute("loginUser") != null) {
      Member member = (Member) session.getAttribute("loginUser");
      List<Match> teams = matchBoardService.leaderJudge(member.getNo()); // 로그인 유저의 팀 목록 받아서 리더정보 뽑아오기
                                                                         
      model.addAttribute("myteam", teams);
    } else {
    }
    model.addAttribute("match", match);
    model.addAttribute("matchuserId", matchuserId);
    model.addAttribute("topLocation", topLocation);
    model.addAttribute("middleLocation", middleLocation);
    return "matchboard/detail";
  }



  @GetMapping("update_form/{no}") // 업데이트 form 용
  public String detailUpdate(@PathVariable int no, HttpSession session, Model model) {
    Match match = matchBoardService.get(no);
    Member member = (Member) session.getAttribute("loginUser");
    
    String address = match.getLocation(); // 4글자이거나 5글자임 ex) 0101, 13217 이런식.

    System.out.println("주소"+address);
    
    String address1 = address.substring(0,2);
    System.out.println("상위주소번호"+address1);
    int addressFirst = Integer.parseInt(address1);
    
    String address2 = address.substring(2);
    System.out.println("하위주소번호"+address2);
    int addressSecond = Integer.parseInt(address2);

    System.out.println("////"+address1);
    System.out.println("////"+address2);
    
    TopLocation topLocation = locationService.TopLocationName(addressFirst);
    MiddleLocation middleLocation = locationService.MiddleLocationName(addressSecond);
    
    System.out.println(topLocation);
    System.out.println(middleLocation);
    
    if (member == null) {
      return "redirect:../../auth/form";
    }
    int matchTeamNo = match.getTeam().getTeamId(); // teamNo : 현 매치글을 작성한 팀 번호
    List<TeamMember> teams = teamService.getTeamMemberListByMemberNo(member.getNo()); // 회원 번호로 TeamMember 객체를 모두 가져오고
    
    for (TeamMember t : teams) { // TeamMember 객체에서 team의 정보를 뽑아내기
      int loginUserTeamNumber = t.getTeam().getTeamId();
      if (matchTeamNo == loginUserTeamNumber) {
        session.setAttribute("confirm", "confirm");
      }
    }
    List<TopLocation> locations = locationService.topLocationList(); // TOP 지역선택용
    model.addAttribute("locations", locations);
    model.addAttribute("match", match);
    model.addAttribute("top", topLocation);
    model.addAttribute("middle", middleLocation);
    return "matchboard/update";
  }



  @RequestMapping("add")
  public String add(Match match) throws Exception {

    System.out.println("BBB222222" + match);
    matchBoardService.add(match);
    return "redirect:../matchboard";
  }

  @ResponseBody
  @GetMapping("AddressCheck")
  public Object AddressCheck(int no) {
    HashMap<String, Object> map = new HashMap<>();

    if (locationService.findToplocation(no) != null) {
      List<MiddleLocation> middleLocations = locationService.findMiddleLocation(no);
      System.out.println("MiddleLocations" + middleLocations);

      map.put("status", "success");
      map.put("middleLocations", middleLocations);
    } else {
      map.put("status", "fail");
    }
    return map;
  }

  @PostMapping("update") // 업데이트
  public String update(Match match) {

    System.out.println("UPDATEUPDATE" + match.toString());

    if (matchBoardService.update(match) == 0)
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");
    return "redirect:../matchboard";
  }

  
  
  // 키 참조때문에 삭제 안되면 matchtb_revise.sql 파일 참조. --임시
  // 경기신청 데이터 지우고, 후기게시판 데이터 지우고,
  // 태그 데이터 지우고 그리고 나서 매치보드 번호 삭제.
  @GetMapping("delete/{no}")
  public String delete(@PathVariable int no) {
    System.out.println("DELETEDLETE" + no);

//    matchApplyService.delete(no);

    if (matchBoardService.delete(no) == 0)
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");

    return "redirect:../matchboard";
  }

  
  
  
  @GetMapping("sideBar")
  public String list2(@RequestParam(defaultValue = "1") int pageNo,
      @RequestParam(defaultValue = "3") int pageSize, Model model) {

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

  @RequestMapping("data") // JSON. 매치정보 모달을 위한.
  @ResponseBody
  public Object detailData(int no, HttpSession session) {
    Match match = matchBoardService.get(no);

    String address = match.getLocation(); // 4글자이거나 5글자임 ex) 0101, 13217 이런식.

    System.out.println("주소"+address);
    
    String address1 = address.substring(0,2);
    System.out.println("상위주소번호"+address1);
    int addressFirst = Integer.parseInt(address1);
    
    String address2 = address.substring(2);
    System.out.println("하위주소번호"+address2);
    int addressSecond = Integer.parseInt(address2);

    System.out.println("////"+address1);
    System.out.println("////"+address2);
    
    TopLocation topLocation = locationService.TopLocationName(addressFirst);
    MiddleLocation middleLocation = locationService.MiddleLocationName(addressSecond);

    
    System.out.println(topLocation);
    System.out.println(middleLocation);
    
    HashMap<String, Object> matchMap = new HashMap<>();

    // 다른 사용자가 해당하는 매치글에 신청하기 위한 목적.
    if (session.getAttribute("loginUser") != null) {
      Member member = (Member) session.getAttribute("loginUser");
      List<Match> teams = matchBoardService.teamInfoGet(member.getNo()); // 로그인 유저의 팀 목록 받아서 리더정보뽑아오기

      matchMap.put("myteam", teams);
    } else {
    }
    matchMap.put("match", match);
    
    matchMap.put("topLocation", topLocation);
    matchMap.put("middleLocation", middleLocation);

    return matchMap;
  }

  @RequestMapping("data2") // JSON. 팀정보 모달을 위한.
  @ResponseBody
  public Object detailteamData(int no) {
    Team team = teamService.getTeam(no);
    List<TeamMember> teamMembers = teamService.getTeamMember(no);

    HashMap<String, Object> teamMap = new HashMap<>();

    teamMap.put("teamMembers", teamMembers);
    teamMap.put("team", team);

    return teamMap;
  }


  @RequestMapping(value = "submit/{no}", method = {RequestMethod.GET, RequestMethod.POST})
  @ResponseBody
  public String submit(@PathVariable int no, @RequestBody String teamId) throws ParseException { //매치번호를 받음. 신청팀번호를 받음.

    logger.debug("AAAA" + no);
    logger.debug("BBBB" + teamId); // teamId는 지금 JSON문자열임.
    // teamId => {"teamId":"7"}

    // JSON 파싱하기

    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObj = (JSONObject) jsonParser.parse(teamId);
    String obj = (String) jsonObj.get("teamId");
    int teamIdNo = Integer.parseInt(obj);

    Match match = matchBoardService.get(no);
    MatchApply matchApply = new MatchApply();

    // List<MatchApply> applyMatchNumbers = matchApplyService.check(teamIdNo); // 여기서 팀번호로 신청한 모든
    // 매치신청 결과를 가져옴
    //
    // for (int i = 0; i < applyMatchNumbers.size(); i++) {
    // matchApply = applyMatchNumbers.get(i);
    // int matchApplyNum = matchApply.getMatchNo();
    // if (matchApplyNum == no) {
    // return "matchboard/overlap";
    // }
    // }

    matchApply.setMatchNo(match.getNo());
    matchApply.setTeamNo(teamIdNo);

    matchApplyService.add(matchApply);

    return "12345";
  }



  // @GetMapping("sideBar")
  // public String sideBar() {
  // return "matchboard/sideBar";
  // }



}


