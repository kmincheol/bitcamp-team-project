package com.eomcs.lms.service;

import com.eomcs.lms.domain.Sms;

public interface SmsService {
  Sms getBySms(Sms sms);
  int add(Sms sms);
  int deleteTemp();
  Boolean sendAuthSms(String tel);
}
