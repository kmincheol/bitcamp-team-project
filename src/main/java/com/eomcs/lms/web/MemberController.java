package com.eomcs.lms.web;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.eomcs.lms.domain.AuthKey;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.TermsAgree;
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
  
  @GetMapping("agreeTerms")
  public void agreeTerms() {
  }
  
  @GetMapping("invalid")
  public void invalid() {
  }
  
  @PostMapping("checkTerms")
  public String checkTerms(
      Boolean termsService,
      Boolean termsPrivacy,
      Boolean termsThirdParty,
      Boolean termsEmail,
      Boolean termsSms,
      HttpSession session,
      HttpServletRequest request,
      HttpServletResponse response,
      Model model) throws Exception {
    
    TermsAgree termsAgree = new TermsAgree();

    if (termsService == null ||
        termsPrivacy == null ||
        termsThirdParty == null) {
      
      throw new RuntimeException("회원가입약관의 필수사항에 동의하지 않으시면 가입하실 수 없습니다.");
    } else {
      termsAgree.setTermsRequired(true);
    }
      
    if (termsEmail == null) {
      termsAgree.setTermsEmail(false);
    } else {
      termsAgree.setTermsEmail(true);
    }
    
    if (termsSms == null) {
      termsAgree.setTermsSms(false);
    } else {
      termsAgree.setTermsSms(true);
    }
    
    // 약관정보 다시 설정시 재발급
    if (session.getAttribute("termsAgree") != null) {
      session.removeAttribute("termsAgree");
    }
    
    // 톰캣 기본 유지시간 30분 이용
    session.setAttribute("termsAgree", termsAgree);
    
    return "redirect:form";
  }
  
  @GetMapping("form")
  public void form() {
  }
  
  @GetMapping("signUpCompletion")
  public void signUpCompletion() {
  }
  
  @GetMapping("findUserId")
  public void findUserId() {
  }
  
  @GetMapping("findPassword")
  public void findPassword() {
  }

  @RequestMapping(value="checkEmail", produces="text/plain;charset=UTF-8")
  @ResponseBody
  private String checkEMail(@RequestBody Map<String,Object> content) throws Exception {

    authKeyService.deleteTemp();

    String email = (String) content.get("email");
    String type = (String) content.get("type");

    AuthKey authKey = new AuthKey();

    authKey.setEmail(email);

    int authType = 0;
    switch(type) {
      case "join" : authType = 1; break;
      case "password" : authType = 2; break;
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

    int randomCode = new Random().nextInt(899999) + 100000;

    String joinCode = String.valueOf(randomCode);
    String email = (String) content.get("email");
    String type = (String) content.get("type");
    String subject = null;

    AuthKey authKey = new AuthKey();
    authKey.setEmail(email);
    int authType = 0;
    switch(type) {
      case "join" : 
        authType = 1; 
        subject = "BATTLE MATCHING 회원가입에 사용하실 이메일 인증 번호입니다."; 
        break;
      case "password" : 
        authType = 2; 
        subject = "BATTLE MATCHING 비밀번호 찾기에 사용하실 이메일 인증 번호입니다."; 
        break;
      default: break;
    }
    authKey.setType(authType);
    authKey.setKeyContent(joinCode);

    StringBuilder sb = new StringBuilder();
    sb.append("이메일 인증 승인 번호는 ").append(joinCode).append(" 입니다. 인증번호 6자리를 모두 입력해주세요.");
    if (authKeyService.add(authKey) != 0) {
      if (emailService.send(subject, sb.toString(), "gwanghosongT@gmail.com", email)) {
        return "send" + 1;      
      }
      return "send" + 2;
    } else {
      return "send" + 0;
    }
  }
  
  @GetMapping(value="sendPwdEmail", produces="text/plain;charset=UTF-8")
  @ResponseBody
  private String sendPwdEmail(String email) throws UnsupportedEncodingException {

    String tempPwd = UUID.randomUUID().toString().replaceAll("-", ""); 
    tempPwd = tempPwd.substring(0, 10); 
    String subject = "BATTLE MATCHING에서 발급한 임시비밀번호입니다.";
    StringBuilder sb = new StringBuilder();
    Member member = memberService.get(email);
    member.setPassword(tempPwd);
    
    sb.append("임시비밀번호는 ")
       .append(tempPwd)
       .append(" 입니다. 로그인하시고 마이페이지에서 비밀번호를 변경해주시길 바랍니다.");
    
    if (memberService.updatePassword(member) != 0) {
      if (emailService.send(subject, sb.toString(), "gwanghosongT@gmail.com", email)) {
        return "pwdSend" + 1;
      } else {
        return "pwdSend" + 2;
      }
    } else {
      return "PwdSend" + 0;
    }
  }

  @PostMapping(value="checkAuthNo", produces="text/plain;charset=UTF-8")
  @ResponseBody
  private String checkAuthNo(@RequestBody Map<String,Object> content) {
    
    authKeyService.deleteTemp();

    String email = (String) content.get("email");
    String keyContent = (String) content.get("authKey");
    String type = (String) content.get("type");
    AuthKey authKey = new AuthKey();
    authKey.setEmail(email);
    authKey.setKeyContent(keyContent);
    int authType = 0;
    switch(type) {
      case "join" : authType = 1; break;
      case "password" : authType = 2; break;
      default: break;
    }
    authKey.setType(authType);

    if (authKeyService.getByAuthKey(authKey) != null) {
      return "auth" + 0;
    } else {
      return "auth" + 1;
    }
  }

  @GetMapping(value="checkId", produces="text/plain;charset=UTF-8")
  @ResponseBody
  private String checkId(String userId) {
    logger.info("checkId >>> " + userId);
    if (memberService.checkId(userId) != null) {
      return "checkId" + 0;
    } else {
      return "checkId" + 1;
    }
  }
  
  @GetMapping(value="findId", produces="text/plain;charset=UTF-8")
  @ResponseBody
  private String findId(String email, String name) {
    
    Member member = new Member();
    member.setName(name);
    member.setEmail(email);
    
    member = memberService.findId(member);
    
    if (member != null) {
      String userId = member.getId();
      return "findId" + 0 + userId;
    } else {
      return "findId" + 1;
    }
  }

  @GetMapping("join")
  public void join() {
  }

  @PostMapping("enter")
  public String add(Member member, HttpSession session) throws Exception {
    
    TermsAgree termsAgree = (TermsAgree) session.getAttribute("termsAgree");
    memberService.add(member, termsAgree);
    
    session.invalidate();

    return "redirect:signUpCompletion";
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
