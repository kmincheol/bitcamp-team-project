package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.domain.Team;

public interface MatchBoardService {
  List<Match> list(int pageNo, int pageSize);
  int add(Match match);
  Match get(int no); // 번호로 게시물을 가져옴
  List<Match> teamInfoGet(int no); // 번호로 팀명,팀리더 정보 가져옴
  List<Match> search(String keyword);
  int update(Match match);
  int delete(int no);
  int size();
}
