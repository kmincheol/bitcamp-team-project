package com.eomcs.lms.web;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.eomcs.lms.domain.Board;
import com.eomcs.lms.domain.Free;
import com.eomcs.lms.service.FreeService;
import com.eomcs.lms.service.MemberService;

@Controller
@RequestMapping("/free")
public class FreeController {

  @Autowired
  FreeService freeService;
  @Autowired
  MemberService memberService;

  @GetMapping
  public String list(@RequestParam(defaultValue = "1") int pageNo,
      @RequestParam(defaultValue = "3") int pageSize, Model model) {

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

    List<Free> frees = freeService.list(pageNo, pageSize, 0);
    model.addAttribute("list", frees);
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);

    return "free/list";
  }

  @GetMapping("{no}")
  public String detail(@PathVariable int no, Model model) {
    Free free = freeService.get(no);
    model.addAttribute("free", free);
    return "free/detail";
  }

}


