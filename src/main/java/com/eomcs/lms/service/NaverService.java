package com.eomcs.lms.service;

import javax.servlet.http.HttpSession;
import com.eomcs.lms.domain.TermsAgree;

public interface NaverService {
  String requestNaverAccessToken(HttpSession session, String code, String state) throws Exception;
  String naverUserDataLoadAndCheck(String accessToken, HttpSession session) throws Exception;
  String naverUserDataLoadAndSave(String accessToken, HttpSession session, TermsAgree termsAgree) throws Exception;
}
