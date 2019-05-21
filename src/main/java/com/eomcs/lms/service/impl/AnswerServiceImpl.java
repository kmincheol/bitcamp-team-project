package com.eomcs.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.AnswerDao;
import com.eomcs.lms.domain.AnswerBoard;
import com.eomcs.lms.service.AnswerBoardService;

// 스프링 IoC 컨테이너가 관리하는 객체 중에서
// 비즈니스 로직을 담당하는 객체는
// 특별히 그 역할을 표시하기 위해 @Component 대신에 @Service 애노테이션을 붙인다.
// 이렇게 애노테이션으로 구분해두면 나중에 애노테이션으로 객체를 찾을 수 있다.
@Service
public class AnswerServiceImpl implements AnswerBoardService {

  AnswerDao answerDao;

  public AnswerServiceImpl(AnswerDao answerDao) {
    this.answerDao = answerDao;
  }

  @Override
  public List<AnswerBoard> list(int pageNo, int pageSize) {
    HashMap<String, Object> params = new HashMap<>();
    params.put("size", pageSize);
    params.put("rowNo", (pageNo - 1) * pageSize);
    return answerDao.findAll(params);
  }
//  
//  @Override
//  public QuestionBoard get(int no) {
//    QuestionBoard question = questionDao.findByNo(no);
//    if (question != null) {
////      questionDao.increaseCount(no);
//    }
//    return question;
//  }
//  
//  @Override
//  public int delete(int no) {
//    return questionDao.delete(no);
//  }
//
//  @Override
//  public int add(QuestionBoard questionBoard) {
//    // 이 메서드도 하는 일이 없다.
//    // 그래도 일관된 프로그래밍을 위해 Command 객체는 항상 Service 객체를 경유하여 DAO를 사용해야 한다.
//    return questionDao.insert(questionBoard);
//  }
//  
//  
//  @Override
//  public QuestionBoard getUpdate(int no) {
//    QuestionBoard questionBoard = questionDao.detailUpdate(no);
//    return questionBoard;
//  }
//
//  @Override
//  public int update(QuestionBoard questionBoard) {
//    return questionDao.update(questionBoard);
//  }

}


