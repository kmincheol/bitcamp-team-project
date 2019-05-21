package com.eomcs.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.MatchDao;
import com.eomcs.lms.dao.TagDao;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.service.MatchBoardService;

@Service
public class MatchServiceImpl implements MatchBoardService {

  MatchDao matchDao;
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
    tagDao.deleteByTagNo(no);
    return matchDao.delete(no);
  }


  @Override
  public List<Match> search(String keyword) {
    return null;
  }


  @Override
  public int size() {
    return matchDao.countAll();
  }




}


