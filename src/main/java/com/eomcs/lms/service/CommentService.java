package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.Comment;

public interface CommentService {
  List<Comment> list(int no);
  int add(Comment comment);
  int update(Comment comment);
  int delete(int no);
  int deleteAll(int no);
}
