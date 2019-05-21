package com.eomcs.lms.dao;

import java.util.List;
import java.util.Map;
import com.eomcs.lms.domain.AnswerBoard;
public interface AnswerDao {
 
 
  List<AnswerBoard> findAll();
  
  int insert(AnswerBoard answerBoard);
  
  int update(AnswerBoard answerBoard);

  int delete(int no);


  
}


