package com.eomcs.lms.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.service.MatchBoardService;
import com.eomcs.lms.service.TeamService;

@Controller
@RequestMapping("/matchboard")
public class MatchBoardController {
  
  private static final Logger logger = LogManager.getLogger(AnnounceController.class);
  
  @Autowired MatchBoardService matchBoardService;
  @Autowired TeamService teamService;
  @Autowired ServletContext servletContext;
  
  
  @GetMapping
  public String list(
        @RequestParam(defaultValue="1") int pageNo,
        @RequestParam(defaultValue="5") int pageSize,
        Model model) {

      if (pageSize < 5 || pageSize > 6)
        pageSize = 5;

//      int rowCount = matchBoardService.size();
      int rowCount = 1;
      int totalPage = rowCount / pageSize;
        if (rowCount % pageSize > 0)
        totalPage++;

        if (pageNo < 1) 
          pageNo = 1;
        else if (pageNo > totalPage)
          pageNo = totalPage;

        List<Match> matches = matchBoardService.list(pageNo, pageSize);
        model.addAttribute("list", matches);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("totalPage", totalPage);
    
        return "matchboard/list";
  }

  
  @GetMapping("{no}")
  public String detail(@PathVariable int no, Model model) {
    Match match = matchBoardService.get(no);
    logger.debug(match);
    model.addAttribute("match", match);
    return "matchboard/detail";
  }
  
  
  /*
  @GetMapping("update/{no}")
  public String detailUpdate(@PathVariable int no, Model model) {
    Match match = matchBoardService.get(no);
    model.addAttribute("match", match);
    return "matchboard/update";
  }
  
  @PostMapping("add")
  public String add(Match match, Part[] photo) throws Exception {

    ArrayList<MatchFile> files = new ArrayList<>();

    String uploadDir = servletContext.getRealPath(
        "/upload/match");
    
     if (photo != null) {
    for (Part part : photo) {
      if (part.getSize() == 0) 
        continue;

      String filename = UUID.randomUUID().toString();
      part.write(uploadDir + "/" + filename);

      MatchFile file = new MatchFile();
      file.setFilePath(filename);
      files.add(file);
    }
    match.setFiles(files);
     }
    
    if (match.getTitle().length() == 0) {
      return "match/form";
    } else {
      matchBoardService.add(match);
      return "redirect:.";
    }
  }
  
  @PostMapping("update")
  public String update(Match match) {
    if (matchBoardService.update(match) == 0) 
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");
    return "redirect:.";
  }
  
  
  @GetMapping("delete/{no}")
  public String delete(@PathVariable int no) {
    if (matchBoardService.delete(no) == 0) 
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");

    return "redirect:../";
  }
  
  */

//  @GetMapping("sideBar")
//  public String sideBar() {
//    return "matchboard/sideBar";
//  }


}




