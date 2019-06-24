package com.eomcs.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.MatchApplyDao;
import com.eomcs.lms.dao.MatchDao;
import com.eomcs.lms.dao.MyTeamDao;
import com.eomcs.lms.dao.TagDao;
import com.eomcs.lms.domain.JoinTeam;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.domain.MatchApply;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Position;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TeamRecruit;
import com.eomcs.lms.service.MatchBoardService;
import com.eomcs.lms.service.MyTeamService;


@Service
public class MyTeamServiceImpl implements MyTeamService {

  MatchBoardService matchBoardService;
  MyTeamDao myteamDao;

  
  public MyTeamServiceImpl(MyTeamDao myteamDao, MatchBoardService matchBoardService) {
    this.myteamDao = myteamDao;
    this.matchBoardService = matchBoardService;
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
public List<Position> positionList(int no) {
  return myteamDao.findByPostion(no);
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



//---- 

@Override
public int deleteMatchAply(int mtno,int tno) {
	
  HashMap<String, Integer> map = new HashMap<String, Integer>(); // MAP을 이용해 담기
  map.put("mtno", mtno);
  map.put("tno", tno);
  
		/* matchBoardService.delete(mtno); */
  
  return myteamDao.mtchAplyDelete(map);
}





@Override
public int mtchupdate(int otNo, int matchNo) {
	 HashMap<String, Integer> map = new HashMap<String, Integer>(); // MAP을 이용해 담기
	  map.put("otherTeamNo", otNo);
	  map.put("mtchNo", matchNo);

	return myteamDao.mtchupdate(map);
}

  @Override
  public List<Match> list4(int no) {
    // TODO Auto-generated method stub
    return myteamDao.findAll4(no);
  }
  

  @Override
  public List<Match> sucessMatching(int no) {
    return myteamDao.sucessMatching(no);
  }

  @Override
  public List<Team> matchOtherTeam(int no) {
    return myteamDao.matchOtherTeam(no);
  }

  @Override
  public List<Team> matchMyTeam(int no) {
    return myteamDao.matchMyTeam(no);
  }

  @Override
  public List<TeamMember> findByMyTeamMember3(int no) {
    return myteamDao.findByMyTeamMember3(no);
  }

  @Override
  public int mtchApllyDelete(int no) {
    return myteamDao.mtchApllyDelete(no);
  }

  @Override
  public int mtchDelete(int no) {
    return myteamDao.mtchDelete(no);
  }

  @Override
  public Team findByNo(int no) {
    return myteamDao.findByNo(no);
  }

  @Override
  public int update(Team team) {
    // TODO Auto-generated method stub
    return myteamDao.update(team);
  }

@Override
public int updateMainTeam(int mno, int tno) {
	HashMap<String, Integer> map = new HashMap<String, Integer>(); // MAP을 이용해 담기
	  map.put("mno", mno);
	  map.put("tno", tno);
	return myteamDao.updateMainTeam(map);
}

@Override
public int updatePosition(int tno, int mno,String position) {
  HashMap<String, Object> map = new HashMap<String, Object>(); // MAP을 이용해 담기
  map.put("mno", mno);
  map.put("tno", tno);
  map.put("position", position);
  
  return myteamDao.updatePosition(map);
}
}


