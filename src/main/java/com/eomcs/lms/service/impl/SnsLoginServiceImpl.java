package com.eomcs.lms.service.impl;

import com.eomcs.lms.dao.SnsLoginDao;
import com.eomcs.lms.domain.SnsLogin;
import com.eomcs.lms.service.SnsLoginService;

public class SnsLoginServiceImpl implements SnsLoginService {
  
  SnsLoginDao snsLoginDao;
  
  public SnsLoginServiceImpl(SnsLoginDao snsLoginDao) {
    this.snsLoginDao = snsLoginDao;
  }

  @Override
  public SnsLogin get(SnsLogin snsLogin) {
    return snsLoginDao.findBySnsLogin(snsLogin);
  }

  @Override
  public int add(SnsLogin snsLogin) {
    return snsLoginDao.insert(snsLogin);
  }
}
