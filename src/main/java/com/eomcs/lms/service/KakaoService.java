package com.eomcs.lms.service;

import javax.servlet.http.HttpSession;
import com.eomcs.lms.domain.TermsAgree;

public interface KakaoService {
  String requestKakaoAccessToken(HttpSession session, String code) throws Exception;
  String kakaoUserDataLoadAndCheck(String accessToken, HttpSession session) throws Exception;
  String kakaoUserDataLoadAndSave(String accessToken, HttpSession session, TermsAgree termsAgree) throws Exception;
}
