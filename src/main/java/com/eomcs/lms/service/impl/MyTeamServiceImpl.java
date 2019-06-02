package com.eomcs.lms.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.eomcs.lms.dao.MyTeamDao;
import com.eomcs.lms.domain.Team;
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
 
}


