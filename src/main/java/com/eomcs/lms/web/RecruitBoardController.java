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
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TeamRecruit;
import com.eomcs.lms.service.MemberService;
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

    int b = teamRecruit.getTeamId();
    List<TeamMember> teamMember = recruitBoardService.get3(b);

    model.addAttribute("teamRecruit", teamRecruit);
    model.addAttribute("teamMember", teamMember);

    return "recruit_board/detail";
  }

  @GetMapping("update/{no}")
  public String detailUpdate(@PathVariable int no, Model model) {
    TeamRecruit teamRecruit = recruitBoardService.getUpdate(no);
    model.addAttribute("teamRecruit", teamRecruit);
    
    return "recruit_board/update";
  }


  @PostMapping("add")
  public String add(TeamRecruit teamRecruit, HttpSession session, TeamMember tm) {
    Member member = (Member) session.getAttribute("loginUser");
    teamRecruit.setTeamId(teamRecruit.getTeam().getTeamId());
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
  public String list(Model model) {
    List<TeamRecruit> teamRecruits = recruitBoardService.list();
    List<Member> member = recruitBoardService.list3();
    
    logger.info(member);
    
    model.addAttribute("list", teamRecruits);
    model.addAttribute("member", member);

    for(TeamRecruit t : teamRecruits) {
       System.out.println(t.getTeamAges().getAges());
    }
    
    return "recruit_board/list";
  }
  


  @PostMapping("update")
  public String update(TeamRecruit teamRecruit) {
    if (recruitBoardService.update(teamRecruit) == 0) {
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");
    }
    return "redirect:../recruit_board/" + String.valueOf(teamRecruit.getTeamNo());
  }

}

