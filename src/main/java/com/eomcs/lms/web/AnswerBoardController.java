package com.eomcs.lms.web;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eomcs.lms.domain.AnswerBoard;
import com.eomcs.lms.service.AnswerBoardService;

@Controller
@RequestMapping("/answer")
public class AnswerBoardController {


  @Autowired
  AnswerBoardService answerBoardService;
  @Autowired
  ServletContext servletContext;

  
  @GetMapping
  private  String list(Model model) throws Exception{
	  List<AnswerBoard> answer = answerBoardService.list();
	  model.addAttribute("answer", answer);
	  
	  System.out.println(answer.toString());
      return "question/answer";
  }
  
  
	/*
	 * @GetMapping public String list(@RequestParam(defaultValue = "1") int pageNo,
	 * 
	 * @RequestParam(defaultValue = "3") int pageSize, Model model) {
	 * 
	 * if (pageSize < 3 || pageSize > 8) pageSize = 3;
	 * 
	 * // int rowCount = recruitBoardService.size(); int rowCount = 1; int totalPage
	 * = rowCount / pageSize; if (rowCount % pageSize > 0) totalPage++;
	 * 
	 * if (pageNo > totalPage) pageNo = totalPage; if (pageNo < 1) pageNo = 1;
	 * 
	 * List<AnswerBoard> answer = answerBoardService.list(pageNo, pageSize);
	 * System.out.println(answer.toString()); model.addAttribute("answer", answer);
	 * model.addAttribute("pageNo", pageNo); model.addAttribute("pageSize",
	 * pageSize); model.addAttribute("totalPage", totalPage);
	 * 
	 * return "answer/list"; }
	 */
  
//  @GetMapping("{no}") 
//  public String detail(@PathVariable int no, Model model) { 
//    QuestionBoard  question = questionBoardService.get(no); 
//    model.addAttribute("question", question);
//    logger.info(question); 
//    return "question/detail"; 
//  }
//
//  @GetMapping("delete/{no}") 
//  public String delete(@PathVariable int no) {
//    if (questionBoardService.delete(no) == 0) throw new RuntimeException("해당 번호의 게시물이 없습니다.");
//    return "redirect:../";
//  }
//
//  @GetMapping("form")
//  public void form() {
//  }
//
//
//  @PostMapping("add")
//  public String add(QuestionBoard questionBoard, HttpSession session) {
//
//      Member member = (Member) session.getAttribute("loginUser");
//      questionBoard.setMemberNo(member.getNo());
//      questionBoard.setMember(member);
//      
//      questionBoardService.add(questionBoard);
//     
//      return "redirect:.";
//  }
//
//  @GetMapping("update/{no}")
//  public String detailUpdate(@PathVariable int no, Model model) {
//    QuestionBoard questionBoard = questionBoardService.getUpdate(no);
//    model.addAttribute("questionBoard", questionBoard);
//    return "question/update";
//  }
// 
//  @PostMapping("update")
//  public String update(QuestionBoard questionBoard) {
//    System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
//    if (questionBoardService.update(questionBoard) == 0) {
//      throw new RuntimeException("해당 번호의 게시물이 없습니다.");
//    }
//    return "redirect:.";
//  }

}

