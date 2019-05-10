package com.eomcs.lms.domain;

import java.io.Serializable;

public class AnnounceFile implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int no;
  private String filePath;
  private int announceNo;
  
  
  @Override
  public String toString() {
    return "AnnounceFile [no=" + no + ", filePath=" + filePath + ", announceNo=" + announceNo + "]";
  }
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public String getFilePath() {
    return filePath;
  }
  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }

  public int getAnnounceNo() {
    return announceNo;
  }

  public void setAnnounceNo(int announceNo) {
    this.announceNo = announceNo;
  }

  
  
}
