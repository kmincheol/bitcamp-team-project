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
import com.eomcs.lms.domain.Comment;
import com.eomcs.lms.domain.Free;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.service.CommentService;
import com.eomcs.lms.service.FreeService;
import com.eomcs.lms.service.MemberService;

@Controller
@RequestMapping("/free")
public class FreeController {
  
  private static final Logger logger = LogManager.getLogger(FreeController.class);

  @Autowired FreeService freeService;
  @Autowired MemberService memberService;
  @Autowired CommentService commentService;
  @Autowired ServletContext servletContext;

  @GetMapping
  public String list(Model model) {

    List<Free> frees = freeService.list();
    model.addAttribute("list", frees);
    
    return "free/list";
  }
  
  @GetMapping("{no}")
  public String detail(@PathVariable int no, Model model, HttpSession session) {
    Free free = freeService.get(no);
    session.setAttribute("freeNo", no);
    session.setAttribute("free", free);
    
    List<Comment> comment = commentService.list(no);
    model.addAttribute("list", comment);
    
    model.addAttribute("free", free);
    logger.info(free);
    return "free/detail";
  }

  @GetMapping("update/{no}")
  public String detailUpdate(@PathVariable int no, Model model) {
    Free free = freeService.getUpdate(no);
    model.addAttribute("free", free);
    return "free/update";
  }
  
  @GetMapping("search")
  public void search(
      @RequestParam(defaultValue="1") int pageNo,
      @RequestParam(defaultValue="10") int pageSize,
      String keyword, Model model) {
    
    if (pageSize < 10 || pageSize > 8) 
      pageSize = 10;

    int rowCount = freeService.size();
    int totalPage = rowCount / pageSize;
    if (rowCount % pageSize > 0)
      totalPage++;

    if (pageNo < 1) 
      pageNo = 1;
    else if (pageNo > totalPage)
      pageNo = totalPage;

    List<Free> free = freeService.search(keyword,pageNo, pageSize);
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("rowCount", rowCount);
    model.addAttribute("search", free);
  }
  
  @GetMapping("form")
  public void form() {
  }

  @PostMapping("add")
  public String add(Free free, HttpSession session) {

      Member member = (Member) session.getAttribute("loginUser");
      free.setMemberNo(member.getNo());
      free.setMember(member);
      
      freeService.add(free);
     
      return "redirect:.";
  }


  @PostMapping("update")
  public String update(Free free) {

    freeService.update(free); 
    
    return "redirect:.";
  }

  @GetMapping("delete/{no}")
  public String delete(@PathVariable int no) {

    if (freeService.delete(no) == 0) 
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");

    return "redirect:../";
  }
}










