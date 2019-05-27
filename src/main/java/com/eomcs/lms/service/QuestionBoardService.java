package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.QuestionBoard;

public interface QuestionBoardService {
 
  List<QuestionBoard> list(int pageNo, int pageSize);
  QuestionBoard get(int no);
  List<QuestionBoard> get2(int no);
  int delete(int no);
  QuestionBoard getUpdate(int no);
  int update(QuestionBoard questionBoard);
  int update22(QuestionBoard questionBoard);
  int add(QuestionBoard questionBoard);
  int size();


}
