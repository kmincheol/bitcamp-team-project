package com.eomcs.lms.web;

import java.io.IOException;
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
import com.eomcs.lms.domain.Announce;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.service.AnnounceService;
import com.eomcs.lms.service.MemberService;

@Controller
@RequestMapping("/announce")
public class AnnounceController {

  private static final Logger logger = LogManager.getLogger(AnnounceController.class);

  @Autowired AnnounceService announceService;
  @Autowired MemberService memberService;
  @Autowired ServletContext servletContext;

  @GetMapping
  public String list(
      @RequestParam(defaultValue="1") int pageNo,
      @RequestParam(defaultValue="5") int pageSize,
      Model model) {

    if (pageSize < 5 || pageSize > 8) 
      pageSize = 5;

    int rowCount = announceService.size();
    int totalPage = rowCount / pageSize;
    if (rowCount % pageSize > 0)
      totalPage++;

    if (pageNo < 1) 
      pageNo = 1;
    else if (pageNo > totalPage)
      pageNo = totalPage;

    List<Announce> announces = announceService.list(pageNo, pageSize);
    model.addAttribute("list", announces);
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);

    return "announce/list";
  }

  @GetMapping("form")
  public void form() {
  }

  @GetMapping("{no}")
  public String detail(@PathVariable int no, Model model) {
    Announce announce = announceService.get(no);
    model.addAttribute("announce", announce);
    return "announce/detail";
  }

  @GetMapping("update/{no}")
  public String detailUpdate(@PathVariable int no, Model model) {
    Announce announce = announceService.get(no);
    model.addAttribute("announce", announce);//JSP에서 활용하기 위함
    return "announce/update";
  }

  @PostMapping("add")
  public String add(Announce announce, HttpSession session) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    announce.setMemberNo(member.getNo());
    announce.setMember(member);

    announceService.add(announce);
    return "redirect:.";
  }

  @PostMapping("update")
  public String update(Announce announce, HttpSession session) throws IOException {
    
    Member member = (Member) session.getAttribute("loginUser");
    announce.setMemberNo(member.getNo());
    announce.setMember(member);
    
    announceService.update(announce);
    return "redirect:../";
  }

  @GetMapping("delete/{no}")
  public String delete(@PathVariable int no) {

    if (announceService.delete(no) == 0) 
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");

    return "redirect:../";
  }
}










