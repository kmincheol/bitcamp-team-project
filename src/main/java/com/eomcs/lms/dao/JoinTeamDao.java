// 프록시 패턴 적용 - MemberDao에서 인터페이스를 추출한다.
package com.eomcs.lms.dao;

import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.TeamRecruit;

public interface JoinTeamDao {
  int insert(Member member, TeamRecruit teamRedcruit);
}


