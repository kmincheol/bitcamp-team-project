package com.eomcs.lms.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.eomcs.lms.domain.QuestionBoard;
import com.eomcs.lms.service.QuestionBoardService;

@Controller
@RequestMapping("/question")
public class QuestionBoardController {

  private static final Logger logger = LogManager.getLogger(QuestionBoardController.class);

  @Autowired
  QuestionBoardService questionBoardService;
  @Autowired
  ServletContext servletContext;

  @GetMapping
  public String list(@RequestParam(defaultValue = "1") int pageNo,
      @RequestParam(defaultValue = "3") int pageSize, Model model) {

    if (pageSize < 3 || pageSize > 8)
      pageSize = 3;

    // int rowCount = recruitBoardService.size();
    int rowCount = 1;
    int totalPage = rowCount / pageSize;
    if (rowCount % pageSize > 0)
      totalPage++;

    if (pageNo > totalPage)
      pageNo = totalPage;
    if (pageNo < 1)
      pageNo = 1;

    List<QuestionBoard> question = questionBoardService.list(pageNo, pageSize);

    model.addAttribute("question", question);
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);

    return "question/list";
  }
  @GetMapping("{no}") 
  public String detail(@PathVariable int no, Model model) { 
    QuestionBoard  question = questionBoardService.get(no); 
    model.addAttribute("question", question);
    logger.info(question); 
    return "question/detail"; 
  }
  
  @GetMapping("delete/{no}") 
  public String delete(@PathVariable int no) {
    if (questionBoardService.delete(no) == 0) throw new RuntimeException("해당 번호의 게시물이 없습니다.");
    return "redirect:../";
  }


  /*
   * @RequestMapping("/form") public String recruitView(Model model,HttpSession session) { Member
   * member = (Member) session.getAttribute("loginUser"); List <Team> team =
   * recruitBoardService.get2(member.getNo()); model.addAttribute("team", team);
   * 
   * return "recruit_board/form"; }
   * 
   * 
   * @GetMapping("update/{no}") public String detailUpdate(@PathVariable int no, Model model) {
   * TeamRecruit teamRecruit = recruitBoardService.getUpdate(no); model.addAttribute("teamRecruit",
   * teamRecruit); logger.info(teamRecruit); return "recruit_board/update"; }
   * 
   * 
   * @PostMapping("add") public String add(TeamRecruit teamRecruit,HttpSession session, TeamMember
   * tm) {
   * 
   * Member member = (Member) session.getAttribute("loginUser");
   * 
   * // System.out.println( "민처리바보" + teamRecruit.getTeam().getTeamId()); // //
   * System.out.println("ababab" + teamRecruit.toString());
   * 
   * teamRecruit.setTeamId(teamRecruit.getTeam().getTeamId());
   * 
   * System.out.println("dddd" + member);
   * 
   * recruitBoardService.add(teamRecruit);
   * 
   * 
   * return "redirect:."; }
   * 
   * @GetMapping("search") public void search(String keyword, Model model) { List<TeamRecruit>
   * teamRecruit = recruitBoardService.boardSearch(keyword); model.addAttribute("search",
   * teamRecruit); }
   * 
   * 
   */

  /*
   * @PostMapping("update") public String update(TeamRecruit teamRecruit) { if
   * (recruitBoardService.update(teamRecruit) == 0) { throw new
   * RuntimeException("해당 번호의 게시물이 없습니다."); } return "redirect:."; }
   */
}

