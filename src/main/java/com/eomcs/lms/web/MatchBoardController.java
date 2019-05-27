package com.eomcs.lms.web;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.domain.MatchApply;
import com.eomcs.lms.domain.Member;
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
  @Autowired LocationService locationService; // 사실상 사용하지 않음.
  @Autowired ServletContext servletContext;

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
        @RequestParam(defaultValue="7") int pageSize,
        HttpSession session,
        Model model) {

      if (pageSize < 7 || pageSize > 8)
        pageSize = 7;

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
        model.addAttribute("myteam",teames);
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

  
  @GetMapping("{no}")
  public String detail(@PathVariable int no, Model model) {
    Match match = matchBoardService.get(no);
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
  // 경기신청 데이터 지우고,
  // 후기게시판 데이터 지우고,
  // 태그 데이터 지우고
  // 그리고 나서 매치보드 번호 삭제. 
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
  
  @GetMapping("{no}/submit")
  public String submit(@PathVariable int no) {
    Match match = matchBoardService.get(no);
    int writeTeamNo = match.getTeamNo();

    MatchApply matchApply = new MatchApply();
    
    matchApply.setMatchNo(match.getNo());
    matchApply.setTeamNo(writeTeamNo);

    matchApplyService.add(matchApply);
    return "redirect:../";
  }
  
//  @GetMapping("sideBar")
//  public String sideBar() {
//    return "matchboard/sideBar";
//  }


  
  
}




