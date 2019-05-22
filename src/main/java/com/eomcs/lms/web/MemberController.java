package com.eomcs.lms.web;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.service.EmailService;
import com.eomcs.lms.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
  
  private static final Logger logger = LogManager.getLogger(MemberController.class);
  
  @Autowired MemberService memberService;
  @Autowired EmailService emailService;
  @Autowired ServletContext servletContext;
  
  @RequestMapping(value="checkEmail", produces="text/plain;charset=UTF-8")
  @ResponseBody
  private String checkEMail(Member member) throws Exception {
    
    if (memberService.get(member.getEmail()) == null) {
      return "해당 이메일로 가입된 아이디가 없습니다." + 1;
    } else {
      return "해당 이메일로 가입된 아이디가 존재합니다." + 0;
    }
  }
  
  @PostMapping(value="sendEmail", produces="text/plain;charset=UTF-8")
  @ResponseBody
  private String sendEMail(HttpSession session, Member member) {
    int randomCode = new Random().nextInt(998999) + 1000;
    String joinCode = String.valueOf(randomCode);
    session.setAttribute("joinCode", joinCode);
    
    String email = member.getEmail();
    String subject = "이메일 본인인증 번호입니다.";
    StringBuilder sb = new StringBuilder();
    sb.append("이메일 본인인증 승인 번호는 ").append(joinCode).append(" 입니다.");
    if (emailService.send(subject, sb.toString(), "gwanghosongT@gmail.com", email)) {
      return "정상적으로 본인인증 메일이 발송되었습니다!";
    } else {
      return "올바른 이메일 형식이 아닙니다!";
    }
    
  }
  
  @GetMapping("join")
  public void join() {
  }
  
  @PostMapping("enter")
  public String add(Member member) throws Exception {
    
    memberService.add(member);
    
    return "redirect:../../";
  }
  
  @GetMapping("delete/{no}")
  public String delete(@PathVariable int no) {

    if (memberService.delete(no) == 0) 
      throw new RuntimeException("해당 번호의 회원이 없습니다.");
    return "redirect:../";
  }
  
  @GetMapping("{no}")
  public String detail(@PathVariable int no, Model model, HttpSession session) {
    Member member = (Member) session.getAttribute("loginUser");
    member = memberService.get(no);
    model.addAttribute("member", member);
    return "member/detail";
  }
  
  @GetMapping
  public String list(Model model) {
    List<Member> members = memberService.list(null);
    model.addAttribute("list", members);
    return "member/list";
  }
  
  @GetMapping("search")
  public void search(String keyword, Model model) {
    List<Member> members = memberService.list(keyword);
    model.addAttribute("list", members);
  }

  @PostMapping("update")
  public String update(Member member, Part photoFile) throws Exception {

    /*
     * if (photoFile.getSize() > 0) { String filename = UUID.randomUUID().toString(); String
     * uploadDir = servletContext.getRealPath("/upload/member"); photoFile.write(uploadDir + "/" +
     * filename); member.setPhoto(filename); }
     */

    if (memberService.update(member) == 0)
      throw new RuntimeException("해당 번호의 회원이 없습니다.");
      
    return "redirect:./" + member.getNo();
  }
  
  @PostMapping("updatePassword")
  public String updatePassword(Member member) throws Exception {
    
    if (memberService.updatePassword(member) == 0)
      throw new RuntimeException("해당 번호의 회원이 없습니다.");
      
    return "redirect:.";
  }
}
