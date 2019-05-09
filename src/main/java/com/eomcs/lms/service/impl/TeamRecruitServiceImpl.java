package com.eomcs.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.BoardDao;
import com.eomcs.lms.dao.MemberDao;
import com.eomcs.lms.dao.TeamRecruitDao;
import com.eomcs.lms.domain.TeamRecruit;
import com.eomcs.lms.service.TeamRecruitService;

// 스프링 IoC 컨테이너가 관리하는 객체 중에서 
// 비즈니스 로직을 담당하는 객체는 
// 특별히 그 역할을 표시하기 위해 @Component 대신에 @Service 애노테이션을 붙인다.
// 이렇게 애노테이션으로 구분해두면 나중에 애노테이션으로 객체를 찾을 수 있다.
@Service
public class TeamRecruitServiceImpl implements TeamRecruitService {
  TeamRecruitDao teamRecruitDao;
  BoardDao boardDao;
  MemberDao memberDao;

  public TeamRecruitServiceImpl(BoardDao boardDao, MemberDao memberDao,TeamRecruitDao teamRecruitDao) {
    this.teamRecruitDao = teamRecruitDao;
    this.boardDao = boardDao;
    this.memberDao = memberDao;
  }

  // 비지니스 객체에서 메서드 이름은 가능한 업무 용어를 사용한다.
  @Override
  public List<TeamRecruit> list(int pageNo, int pageSize, int memberNo) {

    if (memberNo <= 0) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("size", pageSize);
      params.put("rowNo", (pageNo - 1) * pageSize);
      return teamRecruitDao.findAll(params);

    } else {
      HashMap<String,Object> params = new HashMap<>();

      if (memberNo > 0) {
        params.put("memberNo", memberNo);
      } else {
        params.put("memberNo", null);
      }
      params.put("size", pageSize);
      params.put("rowNo", (pageNo - 1) * pageSize);
      return teamRecruitDao.findAll(params);
    }
  }

  @Override
  public int add(TeamRecruit teamRecruit) {
    // 이 메서드도 하는 일이 없다.
    // 그래도 일관된 프로그래밍을 위해 Command 객체는 항상 Service 객체를 경유하여 DAO를 사용해야 한다.
    return teamRecruitDao.insert(teamRecruit);
  }

  @Override
  public TeamRecruit get(int no) {
    // 이제 조금 서비스 객체가 뭔가를 하는 구만.
    // Command 객체는 데이터를 조회한 후 조회수를 높이는 것에 대해 신경 쓸 필요가 없어졌다.
    TeamRecruit teamRecruit = teamRecruitDao.findByNo(no);
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
  public int delete(int no) {
    // 이 메서드도 그냥 DAO에 명령을 전달하는 일을 한다.
    // 그래도 항상 Command 객체는 이 Service 객체를 통해서 데이터를 처리해야 한다.
    return teamRecruitDao.delete(no);
  }

  @Override
  public int size() {
    // 전체 게시물의 개수
    return teamRecruitDao.countAll();
  }
}






