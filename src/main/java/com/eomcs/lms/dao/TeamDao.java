package com.eomcs.lms.dao;

import java.util.List;
import java.util.Map;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;

public interface TeamDao {
  int insert(Team team);
  Team findByNo(int no);
  List<Team> findAllTeam(Map<String,Object> params);
  List<Member> findAllMember(Map<String,Object> params);
  int update(Team teamO);
  int delete(int no);
  int countAll();

// 더 추가해야 할거 추가하기

}






