package com.eomcs.lms.dao;

import java.util.List;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TeamRecruit;

public interface TeamRecruitDao {
  int insert(TeamRecruit teamRecruit);
  
  int insert2(Team team);

  List<TeamRecruit> findAll();

  List<TeamRecruit> findAll2();
  
  List<Member> findAll3();

  List<TeamRecruit> findByKeyword(String keyword);

  TeamRecruit findByNo(int no);

  List<Team> findByNo2(int no);
  
  List<TeamMember> findByNo3(int no);

  int increaseCount(int no);

  TeamRecruit detailUpdate(int no);

  int update(TeamRecruit teamRecruit);

  int delete(int no);

  int countAll();
}


