package com.eomcs.lms.service;

import javax.servlet.http.HttpSession;
import com.eomcs.lms.domain.TermsAgree;

public interface GoogleService {
  String requestGoogleAccessTokenAndUserDataCheck(HttpSession session, String code) throws Exception;
  String googleUserDataLoadAndSave(String idToken, HttpSession session, TermsAgree termsAgree) throws Exception;
}
