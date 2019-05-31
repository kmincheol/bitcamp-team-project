// 프록시 패턴 적용 - MemberDao에서 인터페이스를 추출한다.
package com.eomcs.lms.dao;

import java.util.List;
import java.util.Map;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;

public interface MemberDao {
  int insert(Member member);
  List<Member> findAll();
  List<Member> findByKeyword(String keyword);
  Member findByNo(int no);
  Member findByEmail(String email);
  Member findById(String userId);
  Member findByIdPassword(Map<String,Object> paramMap);
  Member findByNameWithEmail(Member member);
  int update(Member member);
  int updatePassword(Member member);
  int delete(int no);
  List<Team> findByteam(int no);
}







