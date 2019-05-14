package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.Match;

public interface MatchBoardService {
  List<Match> list(int pageNo, int pageSize);
  int add(Match match);
  Match get(int no);
  List<Match> search(String keyword);
  int update(Match match);
  int delete(int no);
//  int size();
}
