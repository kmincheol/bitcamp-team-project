package com.eomcs.lms.domain;

import java.io.Serializable;

public class MiddleLocation implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int middleLocationId;
  private String middleLocationNo;
  private String middleLocationName;
  private TopLocation topLocation;
  private int topLocationId;
  
  @Override
  public String toString() {
    return "MiddleLocation [middleLocationId=" + middleLocationId + ", middleLocationNo="
        + middleLocationNo + ", middleLocationName=" + middleLocationName + ", topLocation="
        + topLocation + ", topLocationId=" + topLocationId + "]";
  }
  
  public int getMiddleLocationId() {
    return middleLocationId;
  }
  public void setMiddleLocationId(int middleLocationId) {
    this.middleLocationId = middleLocationId;
  }
  public String getMiddleLocationNo() {
    return middleLocationNo;
  }
  public void setMiddleLocationNo(String middleLocationNo) {
    this.middleLocationNo = middleLocationNo;
  }
  public String getMiddleLocationName() {
    return middleLocationName;
  }
  public void setMiddleLocationName(String middleLocationName) {
    this.middleLocationName = middleLocationName;
  }
  public TopLocation getTopLocation() {
    return topLocation;
  }
  public void setTopLocation(TopLocation topLocation) {
    this.topLocation = topLocation;
  }
  public int getTopLocationId() {
    return topLocationId;
  }
  public void setTopLocationId(int topLocationId) {
    this.topLocationId = topLocationId;
  }
  
  
}
