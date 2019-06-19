package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.JoinTeam;
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

  List<TeamMember> findByMyTeamMember3(int no);
  
  int delete(int tno, int mno);

  List<MatchApply> findMatchNo(int no);

  List<Match> findMatchNo2(int no);

  List<Team> MatchTeam(int no);

  List<TeamRecruit> findByJoinTeam();

  List<Member> findByMember(int no);

  int insertTeamMember(int tno, int mno);

  List<TeamRecruit> findByTeamRecruitTeamNo(int no);

  List<JoinTeam> findByJoinTeamMemberNo(int no);

  int mtchupdate(int otNo, int matchNo);

  int deleteJoinTeam(int tno, int rcrmno);

  int deleteMatchAply(int mtno,int tno);


  List<Match> list4(int no);

  List<Match>sucessMatching(int no);
  
  List<Team> matchOtherTeam(int no);
  
  List<Team> matchMyTeam(int no);
  
  int mtchApllyDelete(int no);
  
  int mtchDelete(int no);
}
