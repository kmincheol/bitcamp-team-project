package com.eomcs.lms.domain;

import java.io.Serializable;

public class FreeFile implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int no;
  private String filePath;
  private int freeNo;
  
  @Override
  public String toString() {
    return "FreeFile [no=" + no + ", filePath=" + filePath + ", freeNo=" + freeNo + "]";
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
  public int getFreeNo() {
    return freeNo;
  }
  public void setFreeNo(int freeNo) {
    this.freeNo = freeNo;
  }
  
}
