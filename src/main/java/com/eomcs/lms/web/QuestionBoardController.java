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
import com.eomcs.lms.domain.AnswerBoard;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.QuestionBoard;
import com.eomcs.lms.domain.TeamRecruit;
import com.eomcs.lms.service.AnswerBoardService;
import com.eomcs.lms.service.QuestionBoardService;

@Controller
@RequestMapping("/question")
public class QuestionBoardController {

  private static final Logger logger = LogManager.getLogger(QuestionBoardController.class);

  @Autowired
  AnswerBoardService answerBoardService;
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
    List<AnswerBoard> answer = answerBoardService.list();
    
    model.addAttribute("question", question);
    model.addAttribute("answer", answer);
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);

    return "question/list";
  }
  
  
  @GetMapping("form2/{no}")
  public String form2(@PathVariable int no, Model model ) {
    QuestionBoard  question = questionBoardService.get(no); 
    AnswerBoard  answer = answerBoardService.get(no); 
    model.addAttribute("question", question);
    model.addAttribute("answer", answer);
    
    return "question/form2";
  }

  
  @PostMapping("add2")
  public String add(AnswerBoard answerBoard, HttpSession session ,QuestionBoard question) {
    
    System.out.println(question.toString());
    Member member = (Member) session.getAttribute("loginUser");
    
    answerBoardService.add(answerBoard);
    
    return "question/list";
  }
  
  
  @GetMapping("{no}") 
  public String detail(@PathVariable int no, Model model ) { 
    QuestionBoard  question = questionBoardService.get(no); 
    AnswerBoard  answer = answerBoardService.get(no); 
    model.addAttribute("question", question);
    model.addAttribute("answer", answer);
    
    return "question/detail"; 
  }
  
  @GetMapping("delete/{no}") 
  public String delete(@PathVariable int no) {
    if (questionBoardService.delete(no) == 0) throw new RuntimeException("해당 번호의 게시물이 없습니다.");
    return "redirect:../";
  }

  @GetMapping("update/{no}")
  public String detailUpdate(@PathVariable int no, Model model) {
    QuestionBoard question = questionBoardService.getUpdate(no);
    model.addAttribute("question", question);
    return "question/update";
  }

  @PostMapping("update")
  public String update(QuestionBoard question) {
    if (questionBoardService.update(question) == 0) {
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");
    }
    return "redirect:.";
  }

}

