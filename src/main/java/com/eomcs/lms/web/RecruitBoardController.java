package com.eomcs.lms.web;

import java.util.List;
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
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamRecruit;
import com.eomcs.lms.service.TeamRecruitBoardService;

@Controller
@RequestMapping("/recruit_board")
public class RecruitBoardController {

  private static final Logger logger = LogManager.getLogger(RecruitBoardController.class);

  @Autowired
  TeamRecruitBoardService recruitBoardService;

  @RequestMapping("/form")
  public String recruitView(Model model, HttpSession session) {
    Member member = (Member) session.getAttribute("loginUser");
    List<Team> team = recruitBoardService.get2(member.getNo());
    model.addAttribute("team", team);
    return "recruit_board/form";
  }

  @GetMapping("{no}")
  public String detail(@PathVariable int no, Model model) {
    TeamRecruit teamRecruit = recruitBoardService.get(no);
    model.addAttribute("teamRecruit", teamRecruit);
    logger.info(teamRecruit);
    return "recruit_board/detail";
  }

  @GetMapping("update/{no}")
  public String detailUpdate(@PathVariable int no, Model model) {
    TeamRecruit teamRecruit = recruitBoardService.getUpdate(no);
    model.addAttribute("teamRecruit", teamRecruit);
    logger.info(teamRecruit);
    return "recruit_board/update";
  }


  @PostMapping("add")
  public String add(TeamRecruit teamRecruit, HttpSession session) {

    Member member = (Member) session.getAttribute("loginUser");
    teamRecruit.setTeamId(member.getNo());

    System.out.println(teamRecruit.toString());

    recruitBoardService.add(teamRecruit);

    return "redirect:.";
  }

  @GetMapping("delete/{no}")
  public String delete(@PathVariable int no) {

    if (recruitBoardService.delete(no) == 0)
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");

    return "redirect:../";
  }

  @GetMapping("search")
  public void search(String keyword, Model model) {
    List<TeamRecruit> teamRecruit = recruitBoardService.boardSearch(keyword);
    model.addAttribute("search", teamRecruit);
  }



  @GetMapping
  public String list(@RequestParam(defaultValue = "1") int pageNo,
      @RequestParam(defaultValue = "10") int pageSize, Model model) {

    if (pageSize < 10 || pageSize > 8)
      pageSize = 10;

    int rowCount = recruitBoardService.size();
    int totalPage = rowCount / pageSize;
    if (rowCount % pageSize > 0)
      totalPage++;

    if (pageNo < 1)
      pageNo = 1;
    else if (pageNo > totalPage)
      pageNo = totalPage;

    List<TeamRecruit> teamRecruits = recruitBoardService.list(pageNo, pageSize);
    model.addAttribute("list", teamRecruits);
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("rowCount", rowCount);

    return "recruit_board/list";
  }

  @PostMapping("update")
  public String update(TeamRecruit teamRecruit) {
    if (recruitBoardService.update(teamRecruit) == 0) {
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");
    }
    return "redirect:.";
  }
  
  @RequestMapping("/header")
  public String header() {
    return "recruit_board/header";
  }
}

