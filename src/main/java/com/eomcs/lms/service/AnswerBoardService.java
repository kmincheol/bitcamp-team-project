package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.AnswerBoard;

public interface AnswerBoardService {
 
  List<AnswerBoard> list();

  int add(AnswerBoard answerBoard);

  AnswerBoard get(int no);
  
 // AnswerBoard getUpdate(int no);

 int delete(int no);
  
  
 int update(AnswerBoard answerBoard);


  
//  List<QuestionBoard> boardSearch(String keyword);
  
  // int size();
}
