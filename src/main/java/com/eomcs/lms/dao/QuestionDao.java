package com.eomcs.lms.dao;

import java.util.List;
import java.util.Map;
import com.eomcs.lms.domain.QuestionBoard;

public interface QuestionDao {

  
  int insert(QuestionBoard questionBoard);
//
//  int insert2(Team team);
 
  List<QuestionBoard> findAll(Map<String, Object> params);
  
  QuestionBoard findByNo(int no);

  int delete(int no);
  
  QuestionBoard detailUpdate(int no);
  
  //  List<TeamRecruit> findAll2();
//  
//  List<TeamRecruit> findByKeyword(String keyword);
//  
//  
//  List<Team> findByNo2(int no);
//  
//  int increaseCount(int no);
//  
  int update(QuestionBoard questionBoard);
//  

//  int countAll();
}


