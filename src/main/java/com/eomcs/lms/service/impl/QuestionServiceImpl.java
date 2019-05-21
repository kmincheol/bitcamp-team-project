package com.eomcs.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.QuestionDao;
import com.eomcs.lms.domain.QuestionBoard;
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

  
  @Override
  public int update(QuestionBoard questionBoard) {
    // 이 메서드도 별로 할 일이 없다.
    // 그냥 DAO를 실행시키고 리턴 값을 그대로 전달한다.
    return questionDao.update(questionBoard);
  }

  @Override
  public QuestionBoard getUpdate(int no) {
    QuestionBoard questionBoard = questionDao.detailUpdate(no);
    return questionBoard;
  }
 
}


