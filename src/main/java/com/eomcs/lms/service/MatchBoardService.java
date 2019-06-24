package com.eomcs.lms.service;

import java.util.ArrayList;
import java.util.List;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.domain.Member;
import com.eomcs.lms.domain.Team;

public interface MatchBoardService {
  List<Match> list(int pageNo, int pageSize);
  List<Match> search();
  List<Match> topthree();
  int add(Match match);
  Match get(int no); // 번호로 게시물을 가져옴
  List<Match> teamInfoGet(int no); // 회원번호로 팀명,팀리더 정보 가져옴
  List<Match> leaderJudge(int no); // 회원번호로 리더인 팀만 가져옴
  List<Match> searchBySportsType(int sportsTypeNo);
  List<Match> searchBySportsTypeAll(int mainTeamSportsTypeNo);
  List<Match> checkAllConditions(List<Match> list,  Team team); // 메인팀과 매치를넘겨서 체크
  ArrayList<Match> recommendMatch(Member member); // 메인팀과 매치를넘겨서 체크
  int update(Match match);
  int delete(int no);
  int size();
}
