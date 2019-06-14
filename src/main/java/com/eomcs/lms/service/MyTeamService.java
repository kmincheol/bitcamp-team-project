package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.domain.MatchApply;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TeamRecruit;

public interface MyTeamService {
  List<Member> list();
 List<Team> teamList(int no); // 관리자 팀조회
 List<TeamMember> teamMemberList(int no); 
 List<TeamMember> teamMemberList2();
 int delete(int tno,int mno);
 List<MatchApply>findMatchNo(int no);
 List<Match>findMatchNo2(int no);
 List<Team> MatchTeam(int no); 
  List<TeamRecruit> findByJoinTeam(int no); 
}
