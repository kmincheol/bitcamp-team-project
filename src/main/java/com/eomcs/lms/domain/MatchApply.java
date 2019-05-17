package com.eomcs.lms.domain;

import java.io.Serializable;
import java.sql.Date;

public class MatchApply implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int matchNo;
  private int teamNo;
  private String applyStatus;
  private Date applyDate;
  
  
  @Override
  public String toString() {
    return "MatchApply [matchNo=" + matchNo + ", teamNo=" + teamNo + ", applyStatus=" + applyStatus
        + ", applyDate=" + applyDate + "]";
  }
  
  
  public int getMatchNo() {
    return matchNo;
  }
  public void setMatchNo(int matchNo) {
    this.matchNo = matchNo;
  }
  public int getTeamNo() {
    return teamNo;
  }
  public void setTeamNo(int teamNo) {
    this.teamNo = teamNo;
  }
  public String getApplyStatus() {
    return applyStatus;
  }
  public void setApplyStatus(String applyStatus) {
    this.applyStatus = applyStatus;
  }
  public Date getApplyDate() {
    return applyDate;
  }
  public void setApplyDate(Date applyDate) {
    this.applyDate = applyDate;
  }
  
}
