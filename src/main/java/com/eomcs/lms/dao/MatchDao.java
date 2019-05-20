package com.eomcs.lms.dao;

import java.util.List;
import java.util.Map;
import com.eomcs.lms.domain.Match;

public interface MatchDao {
  int insert(Match match);
  List<Match> findAll(Map<String, Object> params);
  List<Match> findByKeyword(String keyword);
  Match findByNo(int no);
  List<Match> teamInfoGet(int no);
  void increaseCount(int no);
  int update(Match match);
  int delete(int no);
  int countAll();
}


