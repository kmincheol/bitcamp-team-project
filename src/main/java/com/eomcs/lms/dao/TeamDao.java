package com.eomcs.lms.dao;

import java.util.List;
import java.util.Map;
import com.eomcs.lms.domain.Free;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamAges;
import com.eomcs.lms.domain.TeamLevel;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TeamType;
import com.eomcs.lms.domain.TeamTypeSports;

public interface TeamDao {
  int insert(Team team);
  int insertTeamLeader(TeamMember teamMember);
  Team findByNo(int no);
  Team findSportsTypeByNo(int no);
  List<Team> findAllTeam1();
  List<Team> findAllTeam2();
  List<Team> findBykeyword(String keyword);
  List<TeamType> findTeamType();
  List<TeamAges> findTeamAge();
  List<TeamTypeSports> findSportsType();
  List<TeamLevel> findTeamLevel();
  List<TeamMember> findTeamMember();
  List<TeamMember> findByNoWithTeamMember(int no);
  List<TeamMember> findTeamMemberByMemberNo(int no);
  List<Member> findAllMember(Map<String,Object> params);
  int update(Team teamO);
  int delete(int no);
  int countAll();
  Team findByTeamName(String teamName);

// 더 추가해야 할거 추가하기

}






