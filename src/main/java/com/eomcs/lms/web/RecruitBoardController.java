package com.eomcs.lms.web;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.eomcs.lms.domain.TeamRecruit;
import com.eomcs.lms.service.TeamRecruitBoardService;

@Controller
@RequestMapping("/recruit_board")
public class RecruitBoardController {
  
  @Autowired TeamRecruitBoardService recruitBoardService;
  
//  @GetMapping("form")
//  public void form() {
//  }
//  
  @PostMapping("add")
  public String add(TeamRecruit teamRecruit) {
    System.out.println("aaa" +teamRecruit.toString());
    recruitBoardService.add(teamRecruit);
    return "redirect:.";
  }
//  
<<<<<<< HEAD

  @GetMapping("delete/{no}")
  public String delete(@PathVariable int no) {
  
    if (recruitBoardService.delete(no) == 0) 
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");
    
    return "redirect:../";
=======
//  @GetMapping("delete/{no}")
//  public String delete(@PathVariable int no) {
//  
//    if (recruitBoardService.delete(no) == 0) 
//      throw new RuntimeException("해당 번호의 게시물이 없습니다.");
//    
//    return "redirect:../";
//  }
//  
  @RequestMapping("/form")
  public String recruitView(Model model) {
    List<TeamRecruit> teamRecruit = recruitBoardService.list2();
    model.addAttribute("list2", teamRecruit);
    return "recruit_board/form";
>>>>>>> branch 'master' of https://github.com/kmincheol/bitcamp-team-project.git
  }
  
  @GetMapping("{no}")
  public String detail(@PathVariable int no, Model model) {
    TeamRecruit teamRecruit = recruitBoardService.get(no);
    model.addAttribute("teamRecruit", teamRecruit);
    return "recruit_board/detail";
  }             
  
  
  @GetMapping
  public String list(
      @RequestParam(defaultValue="1") int pageNo,
      @RequestParam(defaultValue="3") int pageSize,
      Model model) {
    
    if (pageSize < 3 || pageSize > 8) 
      pageSize = 3;
    
//    int rowCount = recruitBoardService.size();
    int rowCount = 1;
    int totalPage = rowCount / pageSize;
    if (rowCount % pageSize > 0)
      totalPage++;
    
    if (pageNo > totalPage)
      pageNo = totalPage;
    if (pageNo < 1) 
      pageNo = 1;
    
    List<TeamRecruit> teamRecruits = recruitBoardService.list(pageNo, pageSize);
    model.addAttribute("list", teamRecruits);
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    
    return "recruit_board/list";
  }
  
  @PostMapping("update")
  public String update(TeamRecruit teamRecruit) {
    if (recruitBoardService.update(teamRecruit) == 0) 
      throw new RuntimeException("해당 번호의 게시물이 없습니다.");
    return "redirect:.";
  }
}

