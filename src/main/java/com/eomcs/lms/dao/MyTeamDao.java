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

public interface MyTeamDao {
 
   List<Team> findByMyTeam(int no);
  List<TeamMember> findByMyTeamMember(int no);
  List<Member> findAll();
  List<TeamMember> findByMyTeamMember2();
    
  
}






