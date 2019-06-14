package com.eomcs.lms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.MatchApplyDao;
import com.eomcs.lms.dao.MatchDao;
import com.eomcs.lms.dao.TagDao;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.domain.Team;
import com.eomcs.lms.service.MatchBoardService;

@Service
public class MatchServiceImpl implements MatchBoardService {

  private static final Logger logger = LogManager.getLogger(MatchServiceImpl.class);

  MatchDao matchDao;
  MatchApplyDao matchApplyDao;
  TagDao tagDao;

  public MatchServiceImpl(MatchDao matchDao, TagDao tagDao) {
    this.matchDao = matchDao;
    this.tagDao = tagDao;
  }

  @Override
  public List<Match> list(int pageNo, int pageSize) {
    HashMap<String,Object> params = new HashMap<>();
    params.put("size", pageSize);
    params.put("rowNo", (pageNo - 1) * pageSize);

    return matchDao.findAll(params);
  }

  @Override
  public Match get(int no) {
    Match match = matchDao.findByNo(no);

    if (match != null) {
      matchDao.increaseCount(no);
    }
    return match;
  }


  @Override
  public List<Match> teamInfoGet(int no) {
    return matchDao.teamInfoGet(no);
  }

  @Override
  public List<Match> leaderJudge(int no) {
    return matchDao.leaderJudge(no);
  }


  @Override
  public int add(Match match) {
    System.out.println("AAAAAAAA" + match);

    //    List<Tag> tags = match.getTags(); 
    //    for (Tag t : tags) {
    //      t.setMatchNo(match.getNo());
    //      }
    //    tagDao.insert(match.getTags());

    return matchDao.insert(match);
  }


  @Override
  public int update(Match match) {
    return matchDao.update(match);
  }

  @Override
  public int delete(int no) {
    // 경기신청 데이터 지우고, (다른팀에서 신청한것들.)
    // 후기게시판 데이터 지우고, (경기가 시작되고나서 생성되는 게시판이고, 경기가 진행되었다면 매치보드 글을 삭제하지 못하게 설계)
    // 태그 데이터 지우고
    // 그리고 나서 매치보드 번호 삭제. 

    matchApplyDao.deleteAll(no);
    tagDao.deleteByTagNo(no);
    return matchDao.delete(no);
  }


  @Override
  public List<Match> search() {
    return matchDao.search();
  }


  @Override
  public int size() {
    return matchDao.countAll();
  }

  @Override
  public List<Match> searchBySportsType(int sportsTypeNo) {
    return matchDao.searchBySportsType(sportsTypeNo);
  }

  @Override
  public List<Match> searchBySportsTypeAll(int mainTeamSportsTypeNo, int insufficientNo) {
    HashMap<String, Object> params = new HashMap<>();
    params.put("mainTeamSportsTypeNo", mainTeamSportsTypeNo);
    params.put("insufficientNo", insufficientNo);
    return matchDao.searchBySportsTypeAll(params);
  }
  @Override
  public List<Match> checkAllConditions(List<Match> list,  Team team) {
    List<Match> matches = new ArrayList<Match>(); // 선별된 애들을 넣을 매치들.
    // DB에서 날짜 최신순으로 받아올 것이기 때문에 5개 채워지면 바로 리턴함.
    logger.info("메인팀 >>" + team);
    for (Match m : list) {
      logger.info("선별할 Match >> " + m);
      logger.info(m.getLocation());
      logger.info(team.getTeamArea());


      if (m.getLocation().equalsIgnoreCase(team.getTeamArea()) &&
          m.getTeamAges().getTeamAgeId() == team.getTeamAges().getTeamAgeId() &&
          m.getTeam().getTeamLevelId() == team.getTeamLevelId()) {
        matches.add(m);
        logger.info("1번조건");
      }

      if (matches.size() == 5) {
        return matches;
      }
    }

    for (Match m : list) {
      if (m.getLocation().substring(0, 2).equalsIgnoreCase(team.getTeamArea().substring(0, 2)) &&
          m.getTeamAges().getTeamAgeId() == team.getTeamAges().getTeamAgeId() &&
          m.getTeam().getTeamLevelId() == team.getTeamLevelId()) {
        if (matches.contains(m)) {
          continue;
        }
        matches.add(m);
        logger.info("2번조건");

        if (matches.size() == 5) {
          return matches;
        }
      }
    }

    for (Match m : list) {  
      if (m.getLocation().equalsIgnoreCase(team.getTeamArea()) &&
          m.getTeamAges().getTeamAgeId() == team.getTeamAges().getTeamAgeId()) {
        if (matches.contains(m)) {
          continue;
        }
        matches.add(m);
        logger.info("3번조건");

        if (matches.size() == 5) {
          return matches;
        }
      }
    }

    for (Match m : list) {
      if (m.getLocation().substring(0, 2).equalsIgnoreCase(team.getTeamArea().substring(0, 2)) &&
          m.getTeamAges().getTeamAgeId() == team.getTeamAges().getTeamAgeId()) {
        if (matches.contains(m)) {
          continue;
        }
        matches.add(m);
        logger.info("4번조건");

        if (matches.size() == 5) {
          return matches;
        }
      }
    }

    for (Match m : list) {
      if (m.getLocation().equalsIgnoreCase(team.getTeamArea()) &&
          m.getTeam().getTeamLevelId() == team.getTeamLevelId()) {
        if (matches.contains(m)) {
          continue;
        }
        matches.add(m);
        logger.info("5번조건");

        if (matches.size() == 5) {
          return matches;
        }
      }
    }

    for (Match m : list) {
      if (m.getLocation().substring(0, 2).equalsIgnoreCase(team.getTeamArea().substring(0, 2)) &&
          m.getTeam().getTeamLevelId() == team.getTeamLevelId()) {
        if (matches.contains(m)) {
          continue;
        }
        matches.add(m);
        logger.info("6번조건");

        if (matches.size() == 5) {
          return matches;
        }
      }
    }

    for (Match m : list) {
      if (m.getLocation().equalsIgnoreCase(team.getTeamArea())) {
        if (matches.contains(m)) {
          continue;
        }
        matches.add(m);
        logger.info("7번조건");

        if (matches.size() == 5) {
          return matches;
        }
      }
    }

    for (Match m : list) {
      if (m.getLocation().substring(0, 2).equalsIgnoreCase(team.getTeamArea().substring(0, 2))) {
        if (matches.contains(m)) {
          continue;
        }
        matches.add(m);
        logger.info("8번조건");

        if (matches.size() == 5) {
          return matches;
        }
      }
    }

    for (Match m : list) {
      if (m.getTeamAges().getTeamAgeId() == team.getTeamAges().getTeamAgeId() &&
          m.getTeam().getTeamLevelId() == team.getTeamLevelId()) {
        if (matches.contains(m)) {
          continue;
        }
        matches.add(m);
        logger.info("9번조건");

        if (matches.size() == 5) {
          return matches;
        }
      }
    }

    for (Match m : list) {
      if (m.getTeamAges().getTeamAgeId() == team.getTeamAges().getTeamAgeId()) {
        if (matches.contains(m)) {
          continue;
        }
        matches.add(m);
        logger.info("10번조건");

        if (matches.size() == 5) {
          return matches;
        }
      }
    }

    for (Match m : list) {
      if (m.getTeam().getTeamLevelId() == team.getTeamLevelId()) {
        if (matches.contains(m)) {
          continue;
        }
        matches.add(m);
        logger.info("11번조건");

        if (matches.size() == 5) {
          return matches;
        }
      }
    } // for문 마지막

    // 조건 건 애들도 부족하면, 일단 다 넣는다.
    if (matches.size() < 5) {
      for (Match m : list) {
        if (matches.contains(m)) {
          continue;
        }
        matches.add(m);
        logger.info("예외조건");
        if (matches.size() == 5) {
          return matches;
        }
      }
    } 

    logger.info("리턴 >> " + matches);
    // 5개 미만이면 일단 리턴한다.
    return matches;
  }
}





