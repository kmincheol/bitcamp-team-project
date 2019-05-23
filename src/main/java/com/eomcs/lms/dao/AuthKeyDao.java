package com.eomcs.lms.dao;

import java.util.Map;
import com.eomcs.lms.domain.AuthKey;

public interface AuthKeyDao {
  AuthKey findByEmail(Map<String,Object> param);
  AuthKey checkAuthKey(Map<String,Object> param);
  int insert(AuthKey authKey);
  int delete(AuthKey authKey);
  int deleteByTenMinute();
}
