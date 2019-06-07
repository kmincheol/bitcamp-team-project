package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.Free;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamAges;
import com.eomcs.lms.domain.TeamLevel;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TeamType;
import com.eomcs.lms.domain.TeamTypeSports;

public interface MyTeamService {
  List<Member> list();
 List<Team> teamList(int no); // 관리자 팀조회
 List<TeamMember> teamMemberList(int no); 
 List<TeamMember> teamMemberList2();
 int delete(int tno,int mno);
}
