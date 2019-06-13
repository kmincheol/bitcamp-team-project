package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.Match;

public interface MatchBoardService {
  List<Match> list(int pageNo, int pageSize);
  List<Match> search();
  int add(Match match);
  Match get(int no); // 번호로 게시물을 가져옴
  List<Match> teamInfoGet(int no); // 회원번호로 팀명,팀리더 정보 가져옴
  List<Match> leaderJudge(int no); // 회원번호로 리더인 팀만 가져옴
  int update(Match match);
  int delete(int no);
  int size();
}
