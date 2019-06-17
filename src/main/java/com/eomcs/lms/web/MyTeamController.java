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
import org.springframework.web.bind.annotation.RequestMapping;
import com.eomcs.lms.domain.JoinTeam;
//github.com/kmincheol/bitcamp-team-project.git
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.domain.MatchApply;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TeamRecruit;
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
      List<TeamRecruit> tr = myTeamService.findByJoinTeam();     
      session.setAttribute("member", member);
	
      model.addAttribute("team", team);
		model.addAttribute("tm", tm);
		model.addAttribute("tr", tr);
		return "myteam/list";

	}
	
  
  @GetMapping("/list4")
  public String list4(Model model) {
    List<Match> matchs = myTeamService.list4();

    model.addAttribute("matchs", matchs);
    logger.debug(matchs);

    return "myteam/list4";
  }
   
   


	
	/* 팀원 상세보기 */

	@GetMapping("{tno}/{mno}")
	public String detail(@PathVariable int tno, @PathVariable int mno, Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("loginUser");

		int a = member.getNo(); // 회원번호

		List<TeamMember> tm = myTeamService.teamMemberList(mno);

		for(TeamMember tmm : tm) {
			if(tmm.getTeamMemberNo() == tno) {
				model.addAttribute("teamMember",tmm);
			}
		}
		return "myteam/detail";
	}
	
// 신청 한 사람 상세보기
	@GetMapping("apply/{mno}/{tno}/{trno}")
	public String detail2(@PathVariable int tno, @PathVariable int mno,@PathVariable int trno,  Model model, HttpSession session) {

		List<Member> member = myTeamService.findByMember(mno);
		List<JoinTeam> jt = myTeamService.findByJoinTeamMemberNo(mno);
        List<TeamRecruit> tr = myTeamService.findByTeamRecruitTeamNo(tno);
        
        
        
         for(JoinTeam j : jt) {
        	    for(TeamRecruit r : tr) {
        	    	    if(j.getRcrmId() == r.getTeamId()) {   
        	    	    	System.out.println(r.getTeamId());
        	    	    	model.addAttribute("rermId",j.getRcrmId());
        	    	    }else {
        	    	    	model.addAttribute("rermId",j.getRcrmId());
        	    	    	}
        	    }
         }
		
		for(Member m : member) {
			if(m.getNo() == mno) {
				model.addAttribute("memberInfo",m);
			}
		}
		model.addAttribute("tno",tno);
		return "myteam/detail";
	}
	
	// 신청 온 사람 팀원으로 추가하기
	@GetMapping("applyadd/{tno}/{mno}/{rcrmno}") 
	public String addTeamMember(@PathVariable int tno,@PathVariable int mno,@PathVariable int rcrmno) {
     
		 
		myTeamService.deleteJoinTeam(mno, rcrmno);
		myTeamService.insertTeamMember(tno, mno);
		return "redirect:../../../"; 
	}
	
	// 신청 온 사람 거절하기
		@GetMapping("applydelete/{tno}/{mno}/{rcrmno}") 
		public String deleteTeamMember(@PathVariable int tno,@PathVariable int mno,@PathVariable int rcrmno) {
	     
			 
			myTeamService.deleteJoinTeam(mno, rcrmno);
			return "redirect:../../../"; 
		}
		
	
	@GetMapping("delete/{tno}/{mno}") 
	public String delete(@PathVariable int tno,@PathVariable int mno) {
		if (myTeamService.delete(tno,mno) == 0)
			throw new RuntimeException("해당 번호의 게시물이 없습니다."); 
		return "redirect:../../"; 
	}
	
	@GetMapping("/list2/{tno}")
	public String sendTeam(@PathVariable int tno,  Model model, HttpSession session) {
    List<Match> matchNos = myTeamService.findMatchNo2(10);  //번호 수정해야함
   
    model.addAttribute("matchNos",matchNos);
	   
	  
	  return "myteam/list2";
	}
	@RequestMapping("/list2/update/{matchNo}/{otNo}")
	public String matchSuccess(@PathVariable int matchNo,@PathVariable int otNo,Model model) {
			 myTeamService.mtchupdate(otNo, matchNo);
			
		return "redirect:../../";
	}
	

	
	
	
	@RequestMapping("/list3/{tno}")
	public String teamRecruitList(@PathVariable int tno,Model model) {
		List<MatchApply> matchNos = myTeamService.findMatchNo(8); //번호 수정해야함
		model.addAttribute("matchNos",matchNos);
		model.addAttribute("tno",tno);
		return "myteam/list3";
	}
	

	@RequestMapping("/list3/delete/{no}")
	public String deleteMatchAply(@PathVariable int no,Model model) {
		myTeamService.deleteMatchAply(no);
		return "redirect:../../";
	}

	


}
