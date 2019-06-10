package com.eomcs.lms.dao;

import java.util.List;
import java.util.Map;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamMember;

public interface MyTeamDao {
 
   List<Team> findByMyTeam(int no);
  List<TeamMember> findByMyTeamMember(int no);
  List<Member> findAll();
  List<TeamMember> findByMyTeamMember2();
  int delete(Map<String, Integer> map);
}






