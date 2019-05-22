package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamAges;
import com.eomcs.lms.domain.TeamLevel;
import com.eomcs.lms.domain.TeamType;
import com.eomcs.lms.domain.TeamTypeSports;

public interface TeamService {
  List<Team> teamList();
  List<Member> memberList(int pageNo, int pageSize); 
  
  List<TeamLevel> teamLevelList();
  List<TeamType> teamTypeList();
  List<TeamAges> teamAgeList();
  List<TeamTypeSports> sportsTypeList();
  
  int addTeam(Team team);
  int addMember(Member member);
  Team getTeam(int no);
  Member getMember(int no);
  int update(Team team);
  int deleteTeam(int no);
  int deleteMember(int no);
  int teamSize();
  int memberSize();
  int size();
}
