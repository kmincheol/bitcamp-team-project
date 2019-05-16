package com.eomcs.lms.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.CommentDao;
import com.eomcs.lms.dao.FreeDao;
import com.eomcs.lms.dao.MemberDao;
import com.eomcs.lms.domain.Comment;
import com.eomcs.lms.service.CommentService;

// 스프링 IoC 컨테이너가 관리하는 객체 중에서 
// 비즈니스 로직을 담당하는 객체는 
// 특별히 그 역할을 표시하기 위해 @Component 대신에 @Service 애노테이션을 붙인다.
// 이렇게 애노테이션으로 구분해두면 나중에 애노테이션으로 객체를 찾을 수 있다.
@Service
public class CommentServiceImpl implements CommentService {

  FreeDao freeDao;
  MemberDao memberDao;
  CommentDao commentDao;
  
  public CommentServiceImpl(
      FreeDao freeDao, 
      MemberDao memberDao,
      CommentDao commentDao) {
    this.freeDao = freeDao;
    this.memberDao = memberDao;
    this.commentDao = commentDao;
  }

  @Override
  public List<Comment> list(int no) {
      return commentDao.findAll(no);
    }

  
  @Override
  public int add(Comment comment) {
    return commentDao.insert(comment);
  }

  @Override
  public int update(Comment comment) {
    return commentDao.update(comment);
  }
  
  @Override
  public int delete(int no) {
   
    return commentDao.delete(no);
  }
}







