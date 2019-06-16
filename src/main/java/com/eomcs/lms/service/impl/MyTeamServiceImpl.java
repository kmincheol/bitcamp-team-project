package com.eomcs.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.MyTeamDao;
import com.eomcs.lms.domain.JoinTeam;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.domain.MatchApply;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TeamRecruit;
import com.eomcs.lms.service.MyTeamService;

// 5월 14일 생성만 함


@Service
public class MyTeamServiceImpl implements MyTeamService {

  MyTeamDao myteamDao;

  public MyTeamServiceImpl(MyTeamDao myteamDao) {
    this.myteamDao = myteamDao;
  } 

  @Override
  public List<Team> teamList(int no) {
    return myteamDao.findByMyTeam(no);
  }

  @Override
  public List<TeamMember> teamMemberList(int no) {
    return myteamDao.findByMyTeamMember(no);
  }

  @Override
  public List<Member> list() {
    // TODO Auto-generated method stub
    return myteamDao.findAll();
  }

  @Override
  public List<TeamMember> teamMemberList2() {
    // TODO Auto-generated method stub
    return myteamDao.findByMyTeamMember2();
  }

@Override
public int delete(int tno, int mno) {
  
  HashMap<String, Integer> map = new HashMap<String, Integer>(); // MAP을 이용해 담기
  map.put("tno", tno);
  map.put("mno", mno);

	return myteamDao.delete(map);
}

@Override
public int insertTeamMember(int tno, int mno) {
  
  HashMap<String, Integer> map = new HashMap<String, Integer>(); // MAP을 이용해 담기
  map.put("tno", tno);
  map.put("mno", mno);

	return myteamDao.insertTeamMember(map);
}



@Override
public List<MatchApply> findMatchNo(int no) {
  return myteamDao.findByMatchNo(no);
}

@Override
public List<Match> findMatchNo2(int no) {
  // TODO Auto-generated method stub
  return myteamDao.findByMatchNo2(no);
}

@Override
public List<Team> MatchTeam(int no) {
  return myteamDao.findByMatchTeam(no);
}

  @Override public List<TeamRecruit> findByJoinTeam() { 
	  return myteamDao.findJoinTeam(); 
	  }

@Override
public List<Member> findByMember(int no) {
	return myteamDao.findByMember(no);
}

@Override
public List<TeamRecruit> findByTeamRecruitTeamNo(int no) {
	return myteamDao.teamRecruit2(no);
}

@Override
public List<JoinTeam> findByJoinTeamMemberNo(int no) {
	return myteamDao.joinTeam(no);
}

@Override
public int deleteJoinTeam(int mno, int rcrmno) {
	 HashMap<String, Integer> map = new HashMap<String, Integer>(); // MAP을 이용해 담기
	  map.put("mno", mno);
	  map.put("rcrmno", rcrmno);

	return myteamDao.deleteJoinTeam(map);
}

@Override
public int deleteMatchAply(int no) {
	return myteamDao.mtchAplyDelete(no);
}

@Override
public int mtchupdate(int otNo, int matchNo) {
	 HashMap<String, Integer> map = new HashMap<String, Integer>(); // MAP을 이용해 담기
	  map.put("otherTeamNo", otNo);
	  map.put("mtchNo", matchNo);

	return myteamDao.mtchupdate(map);
}


 
}


