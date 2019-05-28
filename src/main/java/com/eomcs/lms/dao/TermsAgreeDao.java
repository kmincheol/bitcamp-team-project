package com.eomcs.lms.dao;

import com.eomcs.lms.domain.TermsAgree;

public interface TermsAgreeDao {

  int insert(TermsAgree termsAgree);
  int delete(int memberNo);
}
