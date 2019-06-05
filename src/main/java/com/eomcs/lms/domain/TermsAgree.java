package com.eomcs.lms.domain;

import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class TermsAgree implements Cloneable, Serializable {

  private static final long serialVersionUID = 1L;
  
  int no;
  int memberNo;
  boolean termsRequired;
  boolean termsMarketing;
  
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  Date agreeDate;

  @Override
  public String toString() {
    return "TermsAgree [no=" + no + ", memberNo=" + memberNo + ", termsRequired=" + termsRequired
        + ", termsMarketing=" + termsMarketing + ", agreeDate=" + agreeDate + "]";
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public boolean isTermsRequired() {
    return termsRequired;
  }

  public void setTermsRequired(boolean termsRequired) {
    this.termsRequired = termsRequired;
  }

  public boolean isTermsMarketing() {
    return termsMarketing;
  }

  public void setTermsMarketing(boolean termsMarketing) {
    this.termsMarketing = termsMarketing;
  }

  public Date getAgreeDate() {
    return agreeDate;
  }

  public void setAgreeDate(Date agreeDate) {
    this.agreeDate = agreeDate;
  }

}
