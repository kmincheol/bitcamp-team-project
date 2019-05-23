package com.eomcs.lms.domain;

import java.io.Serializable;

public class MiddleLocation implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int middleLocationId;
  private int middleLocationNo;
  private String middleLocationName;
  private int topLocationId;
  
  @Override
  public String toString() {
    return "MiddleLocation [middleLocationId=" + middleLocationId + ", middleLocationNo="
        + middleLocationNo + ", middleLocationName=" + middleLocationName + ", topLocationId="
        + topLocationId + "]";
  }
  
  public int getMiddleLocationId() {
    return middleLocationId;
  }
  public void setMiddleLocationId(int middleLocationId) {
    this.middleLocationId = middleLocationId;
  }
  public int getMiddleLocationNo() {
    return middleLocationNo;
  }
  public void setMiddleLocationNo(int middleLocationNo) {
    this.middleLocationNo = middleLocationNo;
  }
  public String getMiddleLocationName() {
    return middleLocationName;
  }
  public void setMiddleLocationName(String middleLocationName) {
    this.middleLocationName = middleLocationName;
  }
  public int getTopLocationId() {
    return topLocationId;
  }
  public void setTopLocationId(int topLocationId) {
    this.topLocationId = topLocationId;
  }
  

}
