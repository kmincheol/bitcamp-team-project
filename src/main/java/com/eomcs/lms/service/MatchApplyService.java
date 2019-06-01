package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.MatchApply;

public interface MatchApplyService {
  int add(MatchApply matchApply); //매치신청을 다른팀에게 신청함.
  List<MatchApply> list(int no); //매치글을 작성한 팀이 모든 신청정보를 가져오기 위함. (매치번호를 받음)
  List<MatchApply> check(int no); // 팀번호를 주면 매치글번호를 가져옴. (팀번호를 받음)
  int delete(int no); // 팀에서 다른팀의 신청정보 번호를 받고 매치신청 데이터를 지우기 위함.
  int deleteAll(int no); // 매치글을 삭제할 때 해당 매치글의 신청정보를 모두 삭제하기 위함.
}
