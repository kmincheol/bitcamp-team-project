package com.eomcs.lms.dao;

import com.eomcs.lms.domain.SnsLogin;

public interface SnsLoginDao {
  SnsLogin findBySnsLogin(SnsLogin snsLogin);
  int insert(SnsLogin snsLogin);
}
