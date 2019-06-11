package com.eomcs.lms.service;

import com.eomcs.lms.domain.AuthKey;

public interface AuthKeyService {
  AuthKey getByEmail(AuthKey authKey);
  AuthKey getByAuthKey(AuthKey authKey);
  int add(AuthKey authKey);
  int delete(AuthKey authKey);
  int deleteTemp();
}
