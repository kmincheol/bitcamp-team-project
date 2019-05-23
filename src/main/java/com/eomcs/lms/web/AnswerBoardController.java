package com.eomcs.lms.web;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.eomcs.lms.domain.AnswerBoard;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.QuestionBoard;
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
//  
//  @GetMapping("answer/{no}")
//  public String detailUpdate(@PathVariable int no, Model model) {
//    AnswerBoard answer = answerBoardService.getUpdate(no);
//    model.addAttribute("answer", answer);
//    return "answer/update";
//  }
//  
  
  
  @GetMapping("form")
  public void form() {
  }

  
  @PostMapping("add")
  public String add(AnswerBoard answerBoard, HttpSession session) {
    
    Member member = (Member) session.getAttribute("loginUser");
    
    answerBoardService.add(answerBoard);
    
    return "redirect:.";
  }
  

  
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

