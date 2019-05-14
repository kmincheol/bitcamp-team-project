package com.eomcs.lms.web;

import java.util.List;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.eomcs.lms.domain.Free;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.TeamRecruit;
import com.eomcs.lms.service.FreeService;
import com.eomcs.lms.service.MemberService;

@Controller
@RequestMapping("/free")
public class FreeController {
  
  private static final Logger logger = LogManager.getLogger(FreeController.class);

  @Autowired FreeService freeService;
  @Autowired MemberService memberService;
  @Autowired ServletContext servletContext;

  @GetMapping
  public String list(
      @RequestParam(defaultValue="1") int pageNo,
      @RequestParam(defaultValue="3") int pageSize,
      Model model) {

    if (pageSize < 3 || pageSize > 8) 
      pageSize = 3;

    int rowCount = freeService.size();
    int totalPage = rowCount / pageSize;
    if (rowCount % pageSize > 0)
      totalPage++;

    if (pageNo < 1) 
      pageNo = 1;
    else if (pageNo > totalPage)
      pageNo = totalPage;

    List<Free> frees = freeService.list(pageNo, pageSize);
    model.addAttribute("list", frees);
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("rowCount", rowCount);
    
    return "free/list";
  }
  
  @GetMapping("{no}")
  public String detail(@PathVariable int no, Model model) {
    Free free = freeService.get(no);
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
  public void search(String keyword, Model model) {
    List<Free> free = freeService.search(keyword);
    model.addAttribute("search", free);
  }


  @GetMapping("form")
  public void form() {
  }

  @PostMapping("add")
  public String add(Free free, Part[] photo,HttpSession session) throws Exception {

//    ArrayList<FreeFile> files = new ArrayList<>();
//
//    String uploadDir = servletContext.getRealPath(
//        "/upload/free");
//
//    for (Part part : photo) {
//      if (part.getSize() == 0) 
//        continue;
//
//      String filename = UUID.randomUUID().toString();
//      part.write(uploadDir + "/" + filename);
//
//      FreeFile file = new FreeFile();
//      file.setFilePath(filename);
//      files.add(file);
//    }
//    free.setFiles(files);

    if (free.getTitle().length() == 0) {
      throw new RuntimeException("게시물 제목을 입력하세요.");

    } else {
      Member member = (Member) session.getAttribute("loginUser");
      free.setMemberNo(member.getNo());
      free.setMember(member);
      
      freeService.add(free);
      System.out.println(session.getAttribute("loginUser"));
      System.out.println(free.getMember());
      return "redirect:.";
    }
  }


  @PostMapping("update")
  public String update(Free free) {
    if (freeService.update(free) == 0) 
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");
    return "redirect:.";
  }

  @GetMapping("delete/{no}")
  public String delete(@PathVariable int no) {

    if (freeService.delete(no) == 0) 
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");

    return "redirect:../";
  }
}










