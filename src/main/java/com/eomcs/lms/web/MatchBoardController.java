package com.eomcs.lms.web;

import java.sql.Date;
import java.util.HashMap;
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
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.TeamAges;
import com.eomcs.lms.domain.TeamLevel;
import com.eomcs.lms.domain.TeamType;
import com.eomcs.lms.domain.TopLocation;
import com.eomcs.lms.service.LocationService;
import com.eomcs.lms.service.MatchBoardService;
import com.eomcs.lms.service.TeamService;

@Controller
@RequestMapping("/matchboard")
public class MatchBoardController {
  
  private static final Logger logger = LogManager.getLogger(AnnounceController.class);
  
  @Autowired MatchBoardService matchBoardService;
  @Autowired TeamService teamService;
  @Autowired LocationService locationService;
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
        @RequestParam(defaultValue="5") int pageSize,
        Model model) {

      if (pageSize < 5 || pageSize > 6)
        pageSize = 5;

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
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("totalPage", totalPage);
    
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
  
  // 키 참조때문에 삭제 안되면 matchtb_revise.sql 파일 참조.
  @GetMapping("delete/{no}")
  public String delete(@PathVariable int no) {
    
    if (matchBoardService.delete(no) == 0) 
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");

    return "redirect:../";
  }
  
  
  @GetMapping("search") // 인클루드로 처리
  public String search(
      Model model, //location 정보 뿌려줘야 함
      Date playDate,
      int topLocationNo,
      TeamType teamType,
      TeamAges teamAges,
      TeamLevel teamLevel,
      String keyword) {
    
    
    HashMap<String,Object> choices = new HashMap<>();
    choices.put("playDate", playDate);
    choices.put("topLocation", topLocationNo);
    choices.put("teamType", teamType);
    choices.put("teamAges", teamAges);
    choices.put("teamLevel",teamLevel);
    choices.put("keyword", keyword);
    
    // 값 받은걸 내부로 map으로 저장 후 넘겨서
    List<Match> matches = matchBoardService.search(choices);
    // 리턴으로 값 검색 값 얻어옴
    
    // model에 담아줘서 jsp로 출력
    model.addAttribute("matches", matches);
    
    return "redirect:."; //검색 결과는 다시 폼에 뿌려주기?
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
  

//  @GetMapping("sideBar")
//  public String sideBar() {
//    return "matchboard/sideBar";
//  }


  
  
}




