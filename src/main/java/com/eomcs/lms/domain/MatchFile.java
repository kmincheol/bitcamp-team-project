package com.eomcs.lms.domain;

import java.io.Serializable;

public class MatchFile implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int no;
  private int matchNo;
  private String filePath;
  
  @Override
  public String toString() {
    return "MatchFile [no=" + no + ", matchNo=" + matchNo + ", filePath=" + filePath + "]";
  }
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getMatchNo() {
    return matchNo;
  }
  public void setMatchNo(int matchNo) {
    this.matchNo = matchNo;
  }
  public String getFilePath() {
    return filePath;
  }
  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }

}
