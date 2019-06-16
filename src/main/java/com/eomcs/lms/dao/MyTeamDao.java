package com.eomcs.lms.dao;

import java.util.List;
import java.util.Map;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.domain.MatchApply;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TeamRecruit;

public interface MyTeamDao {
 
   List<Team> findByMyTeam(int no);
  List<TeamMember> findByMyTeamMember(int no);
  List<Member> findAll();
  List<TeamMember> findByMyTeamMember2();
  int delete(Map<String, Integer> map);
  List<MatchApply>findByMatchNo(int no);
  List<Match>findByMatchNo2(int no);
  List<Team>findByMatchTeam(int no);
  List<TeamRecruit>findJoinTeam();
  
  List<Match> findAll4();
}






