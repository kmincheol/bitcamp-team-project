package com.eomcs.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.QuestionDao;
import com.eomcs.lms.domain.QuestionBoard;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.domain.TeamRecruit;
import com.eomcs.lms.service.QuestionBoardService;

// 스프링 IoC 컨테이너가 관리하는 객체 중에서
// 비즈니스 로직을 담당하는 객체는
// 특별히 그 역할을 표시하기 위해 @Component 대신에 @Service 애노테이션을 붙인다.
// 이렇게 애노테이션으로 구분해두면 나중에 애노테이션으로 객체를 찾을 수 있다.
@Service
public class QuestionServiceImpl implements QuestionBoardService {

 QuestionDao questionDao;

  public QuestionServiceImpl(QuestionDao questionDao) {
    this.questionDao = questionDao;
  }

  @Override
  public List<QuestionBoard> list(int pageNo, int pageSize) {
    HashMap<String, Object> params = new HashMap<>();
    params.put("size", pageSize);
    params.put("rowNo", (pageNo - 1) * pageSize);
    return questionDao.findAll(params);
  }
  
  @Override
  public QuestionBoard get(int no) {
    QuestionBoard question = questionDao.findByNo(no);
    if (question != null) {
//      questionDao.increaseCount(no);
    }
    return question;
  }
  
  @Override
  public int delete(int no) {
    return questionDao.delete(no);
  }

  
  //  @Override
//  public List<TeamRecruit> list2() {
//    // 게시물 목록을 가져오는 경우 서비스 객체에서 특별하게 할 일이 없다.
//    // 그럼에도 불구하고 Command 객체와 DAO 사이에 Service 객체를 두기로 했으면
//    // 일관성을 위해 Command 객체는 항상 Service 객체를 통해 데이터를 다뤄야 한다.
//  
//    return teamRecruitDao.findAll2();
//  }
//  
//  @Override
//  public List<TeamRecruit> boardSearch(String keyword) {
//    if (keyword == null)
//      return teamRecruitDao.findAll(null);
//    else 
//      return teamRecruitDao.findByKeyword(keyword);
//  }
//
//  
//  
//  
//  @Override
//  public int add(TeamRecruit teamRecruit) {
//    // 이 메서드도 하는 일이 없다.
//    // 그래도 일관된 프로그래밍을 위해 Command 객체는 항상 Service 객체를 경유하여 DAO를 사용해야 한다.
//    return teamRecruitDao.insert(teamRecruit);
//  }
//  @Override
//  public int add2(Team team) {
//    // 이 메서드도 하는 일이 없다.
//    // 그래도 일관된 프로그래밍을 위해 Command 객체는 항상 Service 객체를 경유하여 DAO를 사용해야 한다.
//    return teamRecruitDao.insert2(team);
//  }
// 
//  
//  
//  
//  @Override
//  public List<Team> get2(int no) {
//    List<Team> teamRecruit = teamRecruitDao.findByNo2(no);
//       
//    if (teamRecruit != null) {
//      teamRecruitDao.increaseCount(no);
//    }
//    return teamRecruit;
//  }
//  
//  
//
//  @Override
//  public int update(TeamRecruit teamRecruit) {
//    // 이 메서드도 별로 할 일이 없다.
//    // 그냥 DAO를 실행시키고 리턴 값을 그대로 전달한다.
//    return teamRecruitDao.update(teamRecruit);
//  }
//
//
//  @Override
//  public TeamRecruit getUpdate(int no) {
//    TeamRecruit teamRecruit = teamRecruitDao.detailUpdate(no);
//    return teamRecruit;
//  }

//  @Override
//  public int size() {
//    // 전체 게시물의 개수
//    return teamRecruitDao.countAll();
//  }
}


