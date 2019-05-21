package com.eomcs.lms.web;

import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.eomcs.lms.domain.Comment;
import com.eomcs.lms.domain.Free;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.service.CommentService;
import com.eomcs.lms.service.FreeService;

@Controller
@RequestMapping("/comment")
public class CommentController {

  @Autowired
  CommentService commentService;
  @Autowired
  FreeService freeService;
  @Autowired
  ServletContext servletContext;


  @PostMapping("add")
  public String add(Comment comment, HttpSession session) throws Exception {

    Member member = (Member) session.getAttribute("loginUser");
    Free free = (Free) session.getAttribute("free");
    session.setAttribute("commentNo", comment.getNo());
    comment.setMemberNo(member.getNo());
    comment.setFreeNo(free.getNo());
    commentService.add(comment);
    return "redirect:../free/" + free.getNo();

  }
  
  /*
   * @PostMapping(value="add", produces="text/plain;charset=UTF-8") public Object add(@RequestBody
   * Comment comment, HttpSession session) throws Exception {
   * 
   * Member member = (Member) session.getAttribute("loginUser"); Free free = (Free)
   * session.getAttribute("free"); session.setAttribute("commentNo", comment.getNo());
   * comment.setMemberNo(member.getNo()); comment.setFreeNo(free.getNo());
   * commentService.add(comment);
   * 
   * List<Comment> comment1 = commentService.list(free.getNo()); //model.addAttribute("list",
   * comment); HashMap<String,Object> commentMap = new HashMap<>(); commentMap.put("list",
   * comment1);
   * 
   * return "redirect:../free/" + free.getNo();
   * 
   * }
   */


  @GetMapping
  public Object list(HttpSession session) {
    
    int no = (int) session.getAttribute("freeNo");
    
    List<Comment> comment1 = commentService.list(no);
    //model.addAttribute("list", comment);
 HashMap<String,Object> commentMap = new HashMap<>();
 commentMap.put("list", comment1);
 
    return commentMap;
  }

  @PostMapping("update")
  public String update(Comment comment, HttpSession session) {
    
    Free free = (Free) session.getAttribute("free");
    comment.setFreeNo(free.getNo());

    if (commentService.update(comment) == 0) 
       throw new RuntimeException("해당 댓글이 없습니다.");
     
     return "redirect:../free/" + free.getNo();
  }

  @GetMapping("delete/{no}")
  public String delete(@PathVariable int no, HttpSession session) {
    Free free = (Free) session.getAttribute("free");
    if (commentService.delete(no) == 0)
      throw new RuntimeException("해당 댓글이 없습니다.");
    return "redirect:../../free/" + free.getNo();
  }
}


