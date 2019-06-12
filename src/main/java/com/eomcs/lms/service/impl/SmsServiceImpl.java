package com.eomcs.lms.service.impl;

import java.util.HashMap;
import java.util.Random;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;
import com.eomcs.lms.conf.GlobalPropertySource;
import com.eomcs.lms.dao.SmsDao;
import com.eomcs.lms.domain.Sms;
import com.eomcs.lms.service.SmsService;
import com.eomcs.lms.util.coolsms.api.Message;
import com.eomcs.lms.util.coolsms.exceptions.CoolsmsException;

@Service
public class SmsServiceImpl implements SmsService {
  
  private static final Logger logger = LogManager.getLogger(SmsServiceImpl.class);

  SmsDao smsDao;
  GlobalPropertySource globalPropertySource;

  public SmsServiceImpl(
      SmsDao smsDao,
      GlobalPropertySource globalPropertySource) {
    this.smsDao = smsDao;
    this.globalPropertySource = globalPropertySource;
  }

  @Override
  public Sms getBySms(Sms Sms) {
    HashMap<String,Object> params = new HashMap<>();
    params.put("tel", Sms.getTel());
    params.put("smsContent", Sms.getSmsContent());
    params.put("type", Sms.getType());
    return smsDao.checkSms(params);
  }

  @Override
  public int add(Sms Sms) {
    return smsDao.insert(Sms);
  }

  @Override
  public int deleteTemp() {
    return smsDao.deleteByFiveMinute();
  }

  @Override
  public Boolean sendAuthSms(String tel) {
    String api_key = globalPropertySource.getSmsApiKey();// api_key 값
    String api_secret = globalPropertySource.getSmsApiSecret();// secret_key 값
    Message coolsms = new Message(api_key, api_secret);
    
    int randomCode = new Random().nextInt(899999) + 100000;

    String joinCode = String.valueOf(randomCode);
    String text = "BATTLE MATCHING 인증번호는 [" + joinCode + "] 입니다.";

    Sms sms = new Sms();
    sms.setTel(tel);
    sms.setType(1); // SMS 등록 인증은 타입 1로 처리
    sms.setSmsContent(joinCode);
    
    // sms인증테이블에 저장
    if (smsDao.insert(sms) == 0) {
      return false;
    }
    
    // 4 params(to, from, type, text) are mandatory. must be filled
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", tel); // 인증 받을 사람
    params.put("from", globalPropertySource.getSmsFromTel());// 보내는 사람으로서 api에 등록된 사람의 전화번호
    params.put("type", "SMS");
    params.put("text", text);
    params.put("app_version", "test app 1.2"); // application name and version

    try {
      JSONObject obj = (JSONObject) coolsms.send(params);
      logger.info(obj.toString());
      return true;
    } catch (CoolsmsException e) {
      logger.info(e.getMessage());
      logger.info(e.getCode());
      return false;
    }
  }
}







