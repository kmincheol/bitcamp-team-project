package com.eomcs.lms.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.TeamDao;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamAges;
import com.eomcs.lms.domain.TeamLevel;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TeamType;
import com.eomcs.lms.domain.TeamTypeSports;
import com.eomcs.lms.service.TeamService;

// 5월 14일 생성만 함


@Service
public class TeamServiceImpl implements TeamService {

  TeamDao teamDao;

  public TeamServiceImpl(TeamDao teamDao) {
    this.teamDao = teamDao;
  } 

  @Override
  public List<Team> teamList1() {
    return teamDao.findAllTeam1();
  }
  
  @Override
  public List<Team> teamList2() {
    return teamDao.findAllTeam2();
  }

  @Override
  public List<Member> memberList(int pageNo, int pageSize) {
    return null;
  }
  
  
  @Override
  public List<Team> search(String keyword) {
    
    return teamDao.findBykeyword(keyword);
  }
  
  @Override
  public int addTeam(Team team) {
    return teamDao.insert(team);
  }
  
  @Override
  public int addTeamLeader(TeamMember teamMember) {
    return teamDao.insertTeamLeader(teamMember);
  }

  @Override
  public List<TeamType> teamTypeList() {
    return teamDao.findTeamType();
  }
  
  @Override
  public List<TeamAges> teamAgeList() {
    return teamDao.findTeamAge();
  }
  
  @Override
  public List<TeamTypeSports> sportsTypeList() {
    return teamDao.findSportsType();
  }
  
  @Override
  public List<TeamLevel> teamLevelList() {
    return teamDao.findTeamLevel();
  }
  
  @Override
  public List<TeamMember> teamMemberList() {
    
    return teamDao.findTeamMember();
  }
  
  @Override
  public Team checkName(String teamName) {
    // TODO Auto-generated method stub
    return teamDao.findByTeamName(teamName);
  }
  
  @Override
  public int addMember(Member member) {
    return 0;
  }

  @Override
  public Team getTeam(int no) {
    return teamDao.findByNo(no);
  }
  
@Override
public List<TeamMember> getTeamMember(int no) {
  return (List<TeamMember>) teamDao.findByNoWithTeamMember(no);
}

  @Override
  public Member getMember(int no) {
    return null;
  }

  @Override
  public int update(Team team) {
    return 0;
  }

  @Override
  public int deleteTeam(int no) {
    return 0;
  }

  @Override
  public int deleteMember(int no) {
    return 0;
  }

  @Override
  public int teamSize() {
    return 0;
  }

  @Override
  public int memberSize() {
    return 0;
  }

  @Override
public int size() {
  // TODO Auto-generated method stub
  return 0;
}

  @Override
  public Team getTeamSportsType(int no) {
    return teamDao.findSportsTypeByNo(no);
  }

  @Override
  public List<TeamMember> getTeamMemberListByMemberNo(int no) {
    return teamDao.findTeamMemberByMemberNo(no);
  }
 
}


