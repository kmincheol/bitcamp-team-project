package com.eomcs.lms.web;
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
import org.springframework.web.bind.annotation.ResponseBody;
import com.eomcs.lms.domain.AuthKey;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.service.AuthKeyService;
import com.eomcs.lms.service.EmailService;
import com.eomcs.lms.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

  private static final Logger logger = LogManager.getLogger(MemberController.class);

  @Autowired MemberService memberService;
  @Autowired AuthKeyService authKeyService;
  @Autowired EmailService emailService;
  @Autowired ServletContext servletContext;

  @RequestMapping(value="checkEmail", produces="text/plain;charset=UTF-8")
  @ResponseBody
  private String checkEMail(@RequestBody Map<String,Object> content) throws Exception {
    logger.info(content.get("type"));
    logger.info(content.get("email"));

    // 저장된지 10분이 넘은 인증키값 삭제
    authKeyService.deleteTemp();

    String email = (String) content.get("email");
    String type = (String) content.get("type");

    AuthKey authKey = new AuthKey();

    authKey.setEmail(email);

    int authType = 0;
    switch(type) {
      case "join" : authType = 1; break;
      case "email" : authType = 2; break;
      case "password" : authType = 3; break;
      default: break;
    }
    if (authType == 0) {
      return "email" + 2; 
    } else {

      authKey.setType(authType);

      if (memberService.get(email) == null) {
        if (authKeyService.getByEmail(authKey) != null) {
          authKeyService.delete(authKey);
        }
        return "email" + 1;
      } else {
        return "email" + 0;
      }
    }
  }

  @PostMapping(value="sendEmail", produces="text/plain;charset=UTF-8")
  @ResponseBody
  private String sendEMail(@RequestBody Map<String,Object> content) {
    int randomCode = new Random().nextInt(998999) + 1000;
    String joinCode = String.valueOf(randomCode);
    String email = (String) content.get("email");
    String type = (String) content.get("type");
    String subject = "이메일 본인인증 번호입니다.";
    
    AuthKey authKey = new AuthKey();
    authKey.setEmail(email);
    int authType = 0;
    switch(type) {
      case "join" : authType = 1; break;
      case "email" : authType = 2; break;
      case "password" : authType = 3; break;
      default: break;
    }
    authKey.setType(authType);
    authKey.setKeyContent(joinCode);
    
    StringBuilder sb = new StringBuilder();
    sb.append("이메일 본인인증 승인 번호는 ").append(joinCode).append(" 입니다.");
    if (emailService.send(subject, sb.toString(), "gwanghosongT@gmail.com", email)) {
      if (authKeyService.add(authKey) != 0) {
        return "send" + 1;      
      }
        return "send" + 0;
    } else {
      return "send" + 2;
    }
  }

  @PostMapping(value="checkAuthNo", produces="text/plain;charset=UTF-8")
  @ResponseBody
  private String checkAuthNo(@RequestBody Map<String,Object> content) {
    logger.info(content.get("authKey"));
    logger.info(content.get("email"));
    logger.info(content.get("type"));
    String email = (String) content.get("email");
    String keyContent = (String) content.get("authKey");
    String type = (String) content.get("type");
    AuthKey authKey = new AuthKey();
    authKey.setEmail(email);
    authKey.setKeyContent(keyContent);
    int authType = 0;
    switch(type) {
      case "join" : authType = 1; break;
      case "email" : authType = 2; break;
      case "password" : authType = 3; break;
      default: break;
    }
    authKey.setType(authType);

    if (authKeyService.getByAuthKey(authKey) != null) {
      return "auth" + 0;
    } else {
      return "auth" + 1;
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
