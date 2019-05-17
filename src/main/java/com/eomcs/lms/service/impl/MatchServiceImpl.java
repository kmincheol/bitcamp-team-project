package com.eomcs.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.MatchDao;
import com.eomcs.lms.dao.MatchFileDao;
import com.eomcs.lms.domain.Match;
import com.eomcs.lms.domain.MatchFile;
import com.eomcs.lms.service.MatchBoardService;

@Service
public class MatchServiceImpl implements MatchBoardService {

  MatchDao matchDao;
  MatchFileDao fileDao;

  public MatchServiceImpl(MatchDao matchDao, MatchFileDao fileDao) {
    this.matchDao = matchDao;
    this.fileDao = fileDao;
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
  public int add(Match match) {
    int count = matchDao.insert(match);

    if(match.getFiles().size() > 0) { // 사진파일이 있을때 추가하고 사진이 없다면 그냥 insert
    List<MatchFile> files = match.getFiles();
    
    for (MatchFile f : files) {
      f.setMatchNo(match.getNo());
    }
    fileDao.insert(match.getFiles());
    }
    
    return count;
  }
  

  @Override
  public int update(Match match) {
    if(match.getFiles() != null) {  
    List<MatchFile> files = match.getFiles();
    
    for (MatchFile f : files) {
      f.setMatchNo(match.getNo());
    }
    fileDao.insert(match.getFiles()); 
    }
    
    return matchDao.update(match);
  }

  @Override
  public int delete(int no) {
    fileDao.deleteByMatchNo(no);
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


