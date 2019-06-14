package com.eomcs.lms.service.impl;

import java.sql.Date;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.MatchApplyDao;
import com.eomcs.lms.domain.MatchApply;
import com.eomcs.lms.service.MatchApplyService;
import com.eomcs.lms.web.AnnounceController;

@Service
public class MatchApplyServiceImpl implements MatchApplyService {

  MatchApplyDao matchApplyDao;

  public MatchApplyServiceImpl(MatchApplyDao matchApplyDao) {
    this.matchApplyDao= matchApplyDao;
  }
  private static final Logger logger = LogManager.getLogger(AnnounceController.class);
  
  @Override
  public int add(MatchApply matchApply) {
    logger.debug(matchApply);
    
    long time = System.currentTimeMillis();

    Date date = new Date(time);
    
    matchApply.setApplyDate(date);
    matchApply.setApplyStatus("대기중");
    return matchApplyDao.add(matchApply);
  }
  
  @Override
  public List<MatchApply> list(int no) {
    return matchApplyDao.findAll(no);
  }

  @Override
  public List<MatchApply> check(int no) {
    return matchApplyDao.check(no);
  }
  
  @Override
  public int delete(int no) {
    return matchApplyDao.delete(no);
  }
  
  @Override
  public int deleteAll(int no) {  // 매치보드 게시물이 지워질때 모든 신청 데이터를 지우려고
    return matchApplyDao.deleteAll(no);
  }


}


