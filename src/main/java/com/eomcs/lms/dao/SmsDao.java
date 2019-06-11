package com.eomcs.lms.dao;

import java.util.Map;
import com.eomcs.lms.domain.AuthKey;
import com.eomcs.lms.domain.Sms;

public interface SmsDao {
  Sms checkSms(Map<String,Object> param);
  int insert(Sms sms);
  int deleteByFiveMinute();
}
