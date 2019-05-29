package com.eomcs.lms.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.TeamRecruitDao;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamMember;
import com.eomcs.lms.domain.TeamRecruit;
import com.eomcs.lms.service.TeamRecruitBoardService;

// 스프링 IoC 컨테이너가 관리하는 객체 중에서
// 비즈니스 로직을 담당하는 객체는
// 특별히 그 역할을 표시하기 위해 @Component 대신에 @Service 애노테이션을 붙인다.
// 이렇게 애노테이션으로 구분해두면 나중에 애노테이션으로 객체를 찾을 수 있다.
@Service
public class TeamRecruitServiceImpl implements TeamRecruitBoardService {

  TeamRecruitDao teamRecruitDao;

  public TeamRecruitServiceImpl(TeamRecruitDao teamRecruitDao) {
    this.teamRecruitDao = teamRecruitDao;
  }

  // 비지니스 객체에서 메서드 이름은 가능한 업무 용어를 사용한다.
  @Override
  public List<TeamRecruit> list() {
    // 게시물 목록을 가져오는 경우 서비스 객체에서 특별하게 할 일이 없다.
    // 그럼에도 불구하고 Command 객체와 DAO 사이에 Service 객체를 두기로 했으면
    // 일관성을 위해 Command 객체는 항상 Service 객체를 통해 데이터를 다뤄야 한다.
    return teamRecruitDao.findAll();
  }

  @Override
  public List<TeamRecruit> list2() {
    // 게시물 목록을 가져오는 경우 서비스 객체에서 특별하게 할 일이 없다.
    // 그럼에도 불구하고 Command 객체와 DAO 사이에 Service 객체를 두기로 했으면
    // 일관성을 위해 Command 객체는 항상 Service 객체를 통해 데이터를 다뤄야 한다.

    return teamRecruitDao.findAll2();
  }
  
  @Override
  public List<Member> list3() {
    // TODO Auto-generated method stub
    return teamRecruitDao.findAll3();
  }

  @Override
  public List<TeamRecruit> boardSearch(String keyword) {
    if (keyword == null)
      return teamRecruitDao.findAll();
    else
      return teamRecruitDao.findByKeyword(keyword);
  }



  @Override
  public int add(TeamRecruit teamRecruit) {
    // 이 메서드도 하는 일이 없다.
    // 그래도 일관된 프로그래밍을 위해 Command 객체는 항상 Service 객체를 경유하여 DAO를 사용해야 한다.
    return teamRecruitDao.insert(teamRecruit);
  }

  @Override
  public int add2(Team team) {
    // 이 메서드도 하는 일이 없다.
    // 그래도 일관된 프로그래밍을 위해 Command 객체는 항상 Service 객체를 경유하여 DAO를 사용해야 한다.
    return teamRecruitDao.insert2(team);
  }

  @Override
  public TeamRecruit get(int no) {
    TeamRecruit teamRecruit = teamRecruitDao.findByNo(no);
    if (teamRecruit != null) {
      teamRecruitDao.increaseCount(no);
    }
    return teamRecruit;
  }

  @Override
  public List<Team> get2(int no) {
    List<Team> teamRecruit = teamRecruitDao.findByNo2(no);

    if (teamRecruit != null) {
      teamRecruitDao.increaseCount(no);
    }
    return teamRecruit;
  }
  
  @Override
  public List<TeamMember> get3(int no) {
    List<TeamMember> teamRecruit = teamRecruitDao.findByNo3(no);

    if (teamRecruit != null) {
      teamRecruitDao.increaseCount(no);
    }
    return teamRecruit;
  }
  
  @Override
  public int update(TeamRecruit teamRecruit) {
    // 이 메서드도 별로 할 일이 없다.
    // 그냥 DAO를 실행시키고 리턴 값을 그대로 전달한다.
    return teamRecruitDao.update(teamRecruit);
  }

  @Override
  public int size() {
    // 전체 게시물의 개수
    return teamRecruitDao.countAll();
  }

  @Override
  public int delete(int no) {
    // 이 메서드도 그냥 DAO에 명령을 전달하는 일을 한다.
    // 그래도 항상 Command 객체는 이 Service 객체를 통해서 데이터를 처리해야 한다.
    return teamRecruitDao.delete(no);
  }

  @Override
  public TeamRecruit getUpdate(int no) {
    TeamRecruit teamRecruit = teamRecruitDao.detailUpdate(no);
    return teamRecruit;
  }


}


