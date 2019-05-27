package com.eomcs.lms.dao;

import java.util.List;
import java.util.Map;
import com.eomcs.lms.domain.QuestionBoard;

public interface QuestionDao {

  
  int insert(QuestionBoard questionBoard);
  List<QuestionBoard> findAll(Map<String, Object> params);
  QuestionBoard findByNo(int no);
  List<QuestionBoard> myfindByNo(int no);
  int delete(int no);
  QuestionBoard detailUpdate(int no);
  int update(QuestionBoard questionBoard);
  int update22(QuestionBoard questionBoard);
  int countAll();
}


