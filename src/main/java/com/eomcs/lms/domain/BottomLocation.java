package com.eomcs.lms.domain;

import java.io.Serializable;

public class BottomLocation implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int bottomLocationId;
  private int bottomLocationNo;
  private String bottomLocationName;
  private int middleLocationId;
  
  @Override
  public String toString() {
    return "BottomLocation [bottomLocationId=" + bottomLocationId + ", bottomLocationNo="
        + bottomLocationNo + ", bottomLocationName=" + bottomLocationName + ", middleLocationId="
        + middleLocationId + "]";
  }
  
  public int getBottomLocationId() {
    return bottomLocationId;
  }
  public void setBottomLocationId(int bottomLocationId) {
    this.bottomLocationId = bottomLocationId;
  }
  public int getBottomLocationNo() {
    return bottomLocationNo;
  }
  public void setBottomLocationNo(int bottomLocationNo) {
    this.bottomLocationNo = bottomLocationNo;
  }
  public String getBottomLocationName() {
    return bottomLocationName;
  }
  public void setBottomLocationName(String bottomLocationName) {
    this.bottomLocationName = bottomLocationName;
  }
  public int getMiddleLocationId() {
    return middleLocationId;
  }
  public void setMiddleLocationId(int middleLocationId) {
    this.middleLocationId = middleLocationId;
  }
  
}
