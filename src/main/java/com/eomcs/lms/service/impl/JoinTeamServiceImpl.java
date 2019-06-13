package com.eomcs.lms.service.impl;

import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.JoinTeamDao;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.service.JoinService;

// 스프링 IoC 컨테이너가 관리하는 객체 중에서
// 비즈니스 로직을 담당하는 객체는
// 특별히 그 역할을 표시하기 위해 @Component 대신에 @Service 애노테이션을 붙인다.
// 이렇게 애노테이션으로 구분해두면 나중에 애노테이션으로 객체를 찾을 수 있다.
@Service
public class JoinTeamServiceImpl implements JoinService {

  JoinTeamDao joinTeamDao;

  public JoinTeamServiceImpl(JoinTeamDao joinTeamDao) {
    this.joinTeamDao = joinTeamDao;
  }

  public int add(Member member) {
    // TODO Auto-generated method stub
    return 0;
  }
}


