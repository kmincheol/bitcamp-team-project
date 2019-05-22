package com.eomcs.lms.service.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.javassist.compiler.ast.Keyword;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.MatchDao;
import com.eomcs.lms.dao.TagDao;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.domain.TeamAges;
import com.eomcs.lms.domain.TeamLevel;
import com.eomcs.lms.domain.TeamType;
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
  public List<Match> search(Map<String,Object> choices) {
    
    Date playDate = (Date) choices.get("playDate");
    
    int topLocationNo = (int) choices.get("topLocation");
    
    TeamType teamType = (TeamType) choices.get("teamType");
    
    TeamAges teamAges =  (TeamAges) choices.get("teamAges");
    
    TeamLevel teamLevel = (TeamLevel) choices.get("teamLevel");
    
    Keyword keyword = (Keyword) choices.get("keyword");
    
    
    HashMap<String,Object> params = new HashMap<>();
    params.put("playDate", playDate);
    params.put("topLocation", topLocationNo);
    params.put("teamType", teamType);
    params.put("teamAges", teamAges);
    params.put("teamLevel",teamLevel);
    params.put("keyword", keyword);
    
    return matchDao.search(params);
  }


  @Override
  public int size() {
    return matchDao.countAll();
  }




}


