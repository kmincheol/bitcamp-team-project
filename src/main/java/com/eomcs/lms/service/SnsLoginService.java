package com.eomcs.lms.service;

import com.eomcs.lms.domain.SnsLogin;

public interface SnsLoginService {
  SnsLogin get(SnsLogin snsLogin);
  int add(SnsLogin snsLogin);
}
