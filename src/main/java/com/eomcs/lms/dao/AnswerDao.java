package com.eomcs.lms.dao;

import java.util.List;
import java.util.Map;
import com.eomcs.lms.domain.AnswerBoard;
public interface AnswerDao {
 
 // int insert(QuestionBoard questionBoard);
 
  List<AnswerBoard> findAll(Map<String, Object> params);
  
  //QuestionBoard findByNo(int no);

  //int delete(int no);
  
 // int update(QuestionBoard questionBoard);

  //QuestionBoard detailUpdate(int no);
  
}


