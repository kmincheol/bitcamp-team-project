package com.eomcs.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.MatchApplyDao;
import com.eomcs.lms.dao.MatchDao;
import com.eomcs.lms.dao.TagDao;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.service.MatchBoardService;

@Service
public class MatchServiceImpl implements MatchBoardService {

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





}


