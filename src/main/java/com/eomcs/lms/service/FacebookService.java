package com.eomcs.lms.service;

import javax.servlet.http.HttpSession;
import com.eomcs.lms.domain.TermsAgree;

public interface FacebookService {
  String requestFaceBookAccessTokenAndUserDataCheck(HttpSession session, String code) throws Exception;
  String facebookUserDataLoadAndSave(String accessToken, HttpSession session, TermsAgree termsAgree) throws Exception;
}
