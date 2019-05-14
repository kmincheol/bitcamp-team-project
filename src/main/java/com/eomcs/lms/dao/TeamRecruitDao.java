package com.eomcs.lms.dao;

import java.util.List;
import java.util.Map;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.TeamRecruit;

public interface TeamRecruitDao {
  int insert(TeamRecruit teamRecruit);
 
  List<TeamRecruit> findAll(Map<String, Object> params);
  
  List<TeamRecruit> findAll2();
  
  List<TeamRecruit> findByKeyword(String keyword);
  
  TeamRecruit findByNo(int no);
  
  int increaseCount(int no);
  
  int update(TeamRecruit teamRecruit);
  
  int delete(int no);

//  int countAll();
}


