package com.eomcs.lms.web;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.eomcs.lms.domain.Announce;
import com.eomcs.lms.domain.AnnounceFile;
import com.eomcs.lms.service.AnnounceService;
import com.eomcs.lms.service.MemberService;

@Controller
@RequestMapping("/announce")
public class AnnounceController {

  @Autowired AnnounceService announceService;
  @Autowired MemberService memberService;
  @Autowired ServletContext servletContext;

  @GetMapping
  public String list(
      @RequestParam(defaultValue="1") int pageNo,
      @RequestParam(defaultValue="3") int pageSize,
      Model model) {

    if (pageSize < 3 || pageSize > 8) 
      pageSize = 3;

    int rowCount = announceService.size();
    int totalPage = rowCount / pageSize;
    if (rowCount % pageSize > 0)
      totalPage++;

    if (pageNo < 1) 
      pageNo = 1;
    else if (pageNo > totalPage)
      pageNo = totalPage;

    List<Announce> announces = announceService.list(pageNo, pageSize, 0);
    model.addAttribute("list", announces);
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);

    return "announce/list";
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

  @GetMapping("form")
  public void form() {
  }

  @PostMapping("add")
  public String add(Announce announce, Part[] photo) throws Exception {

    ArrayList<AnnounceFile> files = new ArrayList<>();

    String uploadDir = servletContext.getRealPath(
        "/upload/announce");
    
     if (photo != null) {
    for (Part part : photo) {
      if (part.getSize() == 0) 
        continue;

      String filename = UUID.randomUUID().toString();
      part.write(uploadDir + "/" + filename);

      AnnounceFile file = new AnnounceFile();
      file.setFilePath(filename);
      files.add(file);
    }
    announce.setFiles(files);
     }
    
    if (announce.getTitle().length() == 0) {
      return "announce/form";
    } else {
      announceService.add(announce);
      return "redirect:.";
    }
  }

  @PostMapping("update")
  public String update(Announce announce) {
    if (announceService.update(announce) == 0) 
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");
    return "redirect:.";
  }

  @GetMapping("delete/{no}")
  public String delete(@PathVariable int no) {

    if (announceService.delete(no) == 0) 
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");

    return "redirect:../";
  }
}










