package com.eomcs.lms.web;

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
import org.springframework.web.bind.annotation.RequestMapping;
import com.eomcs.lms.domain.MatchApply;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.service.MyTeamService;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/myteam")
public class MyTeamController {

  private static final Logger logger = LogManager.getLogger(MyTeamController.class);

  @Autowired
  MyTeamService myTeamService;
  @Autowired
  ServletContext servletContext;

  List<Team> maa;

  @GetMapping
  public String list(Model model, HttpSession session) throws JsonProcessingException {

    Member member = (Member) session.getAttribute("loginUser");

    int a = member.getNo(); // 회원번호

    List<Team> team = myTeamService.teamList(a); // 팀목록
    List<TeamMember> tm = myTeamService.teamMemberList2();

    session.setAttribute("member", member);
    model.addAttribute("team", team);
    model.addAttribute("tm", tm);
    System.out.println(tm.toString());

    return "myteam/list";
  }

  /* 팀원 상세보기 */

  @GetMapping("{tno}/{mno}")
  public String detail(@PathVariable int tno, @PathVariable int mno, Model model, HttpSession session) {

    Member member = (Member) session.getAttribute("loginUser");

    int a = member.getNo(); // 회원번호

    List<TeamMember> tm = myTeamService.teamMemberList(mno);

    for(TeamMember tmm : tm) {
      if(tmm.getTeamMemberNo() == tno) {
        System.out.println(tmm.toString());
        model.addAttribute("teamMember",tmm);
      }
    }
    return "myteam/detail";
  }

  @GetMapping("delete/{tno}/{mno}") public String delete(@PathVariable int tno,@PathVariable int mno) {
    if (myTeamService.delete(tno,mno) == 0)
      throw new RuntimeException("해당 번호의 게시물이 없습니다."); 
    return "redirect:../../"; 
  }

  @RequestMapping("send/{no}")
  // no는 팀번호
  public String sendTeam(@PathVariable int no,  Model model, HttpSession session,String aa) {

    // no를 통해서 내가 신청 보낸 경기번호 리스트를 알아낸다
    List<MatchApply> matchNos = myTeamService.findMatchNo(no);

    model.addAttribute("matchNos",matchNos);
    model.addAttribute("aa",aa);
    System.out.println(aa);
    // 경기번호를 통해서 매치보드를 등록한 팀의 정보를 알아낸다

    return "myteam/list2";
  }



  @RequestMapping("/list3")
  public String teamRecruitList() {
    return "myteam/list3";
  }


}
