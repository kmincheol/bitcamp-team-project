package com.eomcs.lms.service.impl;

import java.util.HashMap;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.AuthKeyDao;
import com.eomcs.lms.domain.AuthKey;
import com.eomcs.lms.service.AuthKeyService;

@Service
public class AuthKeyServiceImpl implements AuthKeyService {

  AuthKeyDao authKeyDao;

  public AuthKeyServiceImpl(
      AuthKeyDao authKeyDao) {
    this.authKeyDao = authKeyDao;
  }

  @Override
  public AuthKey getByEmail(AuthKey authKey) {
    HashMap<String,Object> params = new HashMap<>();
    params.put("email", authKey.getEmail());
    params.put("type", authKey.getType());
    return authKeyDao.findByEmail(params);
  }

  @Override
  public AuthKey getByAuthKey(AuthKey authKey) {
    HashMap<String,Object> params = new HashMap<>();
    params.put("email", authKey.getEmail());
    params.put("keyContent", authKey.getKeyContent());
    params.put("type", authKey.getType());
    return authKeyDao.checkAuthKey(params);
  }

  @Override
  public int add(AuthKey authKey) {
    return authKeyDao.insert(authKey);
  }

  @Override
  public int delete(AuthKey authKey) {
    return authKeyDao.delete(authKey);
  }

  @Override
  public int deleteTemp() {
    return authKeyDao.deleteByTenMinute();
  }
}







