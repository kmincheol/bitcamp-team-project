package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.Member;

public interface MemberService {
  List<Member> list(String keyword);
  int add(Member member);
  Member get(int no);
  Member get(String id, String password);
  Member get(String email);
  Member findId(Member member);
  Member checkId(String userId);
  int update(Member member);
  int updatePassword(Member member);
  int delete(int no);
}
