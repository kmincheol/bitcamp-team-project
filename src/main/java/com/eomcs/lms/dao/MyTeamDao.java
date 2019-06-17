package com.eomcs.lms.dao;

import java.util.List;
import java.util.Map;
import com.eomcs.lms.domain.JoinTeam;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.domain.MatchApply;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TeamRecruit;

public interface MyTeamDao {

  List<Team> findByMyTeam(int no);

  List<TeamMember> findByMyTeamMember(int no);

  List<TeamMember> findByMyTeamMember2();

  int delete(Map<String, Integer> map);

  List<MatchApply> findByMatchNo(int no);

  List<Team> findByMatchTeam(int no);

  List<TeamRecruit> findJoinTeam();

  List<Member> findByMember(int no);

  List<Member> findAll();

  int insertTeamMember(Map<String, Integer> map);

  List<Match> findByMatchNo2(int no);

  List<JoinTeam> joinTeam(int no);

  List<TeamRecruit> teamRecruit2(int no);

  int deleteJoinTeam(Map<String, Integer> map);

  int mtchupdate(Map<String, Integer> map);

  int mtchAplyDelete(int no);

  List<Match> findAll4(int no);
}


