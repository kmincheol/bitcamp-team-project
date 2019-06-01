package com.eomcs.lms.web;

import java.util.ArrayList;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.domain.MatchApply;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TopLocation;
import com.eomcs.lms.service.LocationService;
import com.eomcs.lms.service.MatchApplyService;
import com.eomcs.lms.service.MatchBoardService;
import com.eomcs.lms.service.TeamService;

@Controller
@RequestMapping("/matchboard")
public class MatchBoardController {
  
  private static final Logger logger = LogManager.getLogger(AnnounceController.class);
  
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
  
  
  
  @GetMapping("list3")
  public void list3() {
  }
  
  @GetMapping("list4")
  public void list4() {
  }
  
  @GetMapping("list5")
  public void list5() {
  }
  
  
  
  @GetMapping("form")
  public void form(Model model, HttpSession session, @RequestParam(defaultValue="01") int topLocationNo) {
    Member member = (Member) session.getAttribute("loginUser");
    if (member == null) {
      throw new RuntimeException("로그인 해야 글을 등록할 수 있습니다.");
    }
    
    List<TopLocation> location = locationService.findlocation(topLocationNo);
    model.addAttribute("location", location);
    
  List<Match> match = matchBoardService.teamInfoGet(member.getNo());
   
//    @SuppressWarnings("unchecked")
//    List<Team> teams = (List<Team>) teamService.getTeam(member.getNo()); 
    
    model.addAttribute("member", member); 
    model.addAttribute("match",match); 
  }
  
  
  
  @GetMapping
  public String list(
        @RequestParam(defaultValue="1") int pageNo,
        @RequestParam(defaultValue="8") int pageSize,
        HttpSession session,
        Model model) {

      if (pageSize < 8 || pageSize > 9)
        pageSize = 8;

      int rowCount = matchBoardService.size();
      int totalPage = rowCount / pageSize;
        if (rowCount % pageSize > 0)
        totalPage++;

        if (pageNo < 1) 
          pageNo = 1;
        else if (pageNo > totalPage)
          pageNo = totalPage;
        
        if (session.getAttribute("loginUser") != null) {
        Member member = (Member) session.getAttribute("loginUser"); // member에 로그인 유저 정보 담고.
        List<Match> teames = matchBoardService.teamInfoGet(member.getNo()); // 로그인 유저의 팀 목록 받아서 리더정보 뽑아오기
        model.addAttribute("myteam", teames);
        } else {
          
        }

        List<Match> all = matchBoardService.search();
        List<Match> matches = matchBoardService.list(pageNo, pageSize);
        model.addAttribute("matches", matches);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("all", all);
        
        return "matchboard/list";
  }
  
  
  
  @RequestMapping("{no}")
  public String detail(@PathVariable int no, HttpSession session, Model model) {
    Match match = matchBoardService.get(no);
    
    // 다른 사용자가 해당하는 매치글에 신청하기 위한 목적.
    if (session.getAttribute("loginUser") != null) {
    Member member = (Member) session.getAttribute("loginUser"); 
    List<Match> teams = matchBoardService.teamInfoGet(member.getNo()); // 로그인 유저의 팀 목록 받아서 리더정보 뽑아오기

  
    //로그인한 유저의 팀 목록을 가져오고, 매치글에 신청한 팀의 목록을 가져온다음.
    //로그인한 유저의 팀 번호와 매치글에 신청한 팀의 번호가 같다면 출력을 막기위해 해봤지만 실패...
    
    int[] teamNumArray = new int[teams.size()]; //(자기가 리더인)팀의 수만큼 배열을 만들고,

    for (int i = 0; i < teamNumArray.length; i++) {
      Match mat = teams.get(i); 
      teamNumArray[i] = mat.getTeamNo(); // 배열에 (자기가 리더인)팀의 번호를 담아준다.
   }
 
  List<MatchApply> matchApplies = matchApplyService.list(no); // 해당 매치의 신청 목록을 List 객체에 담았다.
  int[] matchTeamNumArray = new int[matchApplies.size()]; 
 
   for(int i = 0; i < matchApplies.size(); i++) {
     MatchApply matchApply = matchApplies.get(i);
    matchTeamNumArray[i] = matchApply.getTeamNo(); // int 배열에 현 매치글에 신청한 팀의 모든 번호를 담았다.
   }
 
   for (int i = 0; i < teamNumArray.length; i++) {
     for (int j = 0; j < matchTeamNumArray.length; j++) {
         if(teamNumArray[i] == matchTeamNumArray[j]) { // 현 매치글에 신청된 팀의 번호와 유저의 팀 번호가 같다면 
            teamNumArray[i] = teamNumArray[i+1];  // 현 유저의 팀번호를 없앤다.
         }
     }
   }

   List<Team> teams2 = new ArrayList<>();

   for (int i = 0; i < teamNumArray.length; i++) {
     Team t = teamService.getTeam(teamNumArray[i]);
     teams2.add(t);
   }
   ///////////
    
    model.addAttribute("myteam",teams);
    } else {
    }
    
    model.addAttribute("match", match);
    return "matchboard/detail";
  }
  
  
  
  @GetMapping("update/{no}")
  public String detailUpdate(@PathVariable int no, Model model) {
    Match match = matchBoardService.get(no);
    model.addAttribute("match", match);
   return "matchboard/update";
  }
  
  
  
  @PostMapping("add")
  public String add(Match match) throws Exception {
    System.out.println("BBBBBBB");
    logger.debug(match);
    
    matchBoardService.add(match);
      return "redirect:.";
  }
  
  
  
  @PostMapping("update")
  public String update(Match match) {
    
    if (matchBoardService.update(match) == 0) 
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");
    return "redirect:.";
  }
  
  
  
  // 키 참조때문에 삭제 안되면 matchtb_revise.sql 파일 참조. --임시
  // 경기신청 데이터 지우고, 후기게시판 데이터 지우고,
  // 태그 데이터 지우고 그리고 나서 매치보드 번호 삭제. 
  @GetMapping("delete/{no}")
  public String delete(@PathVariable int no) {
    
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
    return "matchboard/sidebar";
  }
  
  
  
  @PostMapping("{no}/submit")
  public String submit(@PathVariable int no, Team team) {
    Match match = matchBoardService.get(no);

    MatchApply matchApply = new MatchApply();
    
    matchApply.setMatchNo(match.getNo());
    matchApply.setTeamNo(team.getTeamId());

    matchApplyService.add(matchApply);
    return "redirect:../";
  }
  
  
  
  @GetMapping("test")
  public String test(Match match) throws Exception {
      return "matchboard/test";
  }
  
  
//  @GetMapping("sideBar")
//  public String sideBar() {
//    return "matchboard/sideBar";
//  }


  
  
}




