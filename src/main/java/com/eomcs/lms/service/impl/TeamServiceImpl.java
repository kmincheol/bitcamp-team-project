package com.eomcs.lms.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.TeamDao;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.service.TeamService;

// 5월 14일 생성만 함


@Service
public class TeamServiceImpl implements TeamService {

  TeamDao teamDao;

  public TeamServiceImpl(TeamDao teamDao) {
    this.teamDao = teamDao;
  }

  @Override
  public List<Team> teamList() {
    return null;
  }

  @Override
  public List<Member> memberList(int pageNo, int pageSize) {
    return null;
  }

  @Override
  public int addTeam(Team team) {
    return 0;
  }

  @Override
  public int addMember(Member member) {
    return 0;
  }

  @Override
  public Team getTeam(int no) {
    return null;
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

 
}


