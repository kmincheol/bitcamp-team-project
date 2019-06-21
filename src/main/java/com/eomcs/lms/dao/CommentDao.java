package com.eomcs.lms.dao;

import java.util.List;
import com.eomcs.lms.domain.Comment;

public interface CommentDao {
  int insert(Comment comment);
  List<Comment> findAll(int no);
  int update(Comment comment);
  int delete(int no);
  int deleteAll(int no);
}







