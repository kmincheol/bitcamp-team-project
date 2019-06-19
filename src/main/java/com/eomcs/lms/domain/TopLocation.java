package com.eomcs.lms.domain;

import java.io.Serializable;
import java.util.List;

public class TopLocation implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int topLocationId;
  private String topLocationNo;
  private String topLocationName;
  
  private List<MiddleLocation> middleLocation;
  private List<BottomLocation> bottomLocation;
  
  
  @Override
  public String toString() {
    return "TopLocation [topLocationId=" + topLocationId + ", topLocationNo=" + topLocationNo
        + ", topLocationName=" + topLocationName + ", middleLocation=" + middleLocation
        + ", bottomLocation=" + bottomLocation + "]";
  }
  
  public int getTopLocationId() {
    return topLocationId;
  }
  public void setTopLocationId(int topLocationId) {
    this.topLocationId = topLocationId;
  }
  public String getTopLocationNo() {
    return topLocationNo;
  }
  public void setTopLocationNo(String topLocationNo) {
    this.topLocationNo = topLocationNo;
  }
  public String getTopLocationName() {
    return topLocationName;
  }
  public void setTopLocationName(String topLocationName) {
    this.topLocationName = topLocationName;
  }
  public List<MiddleLocation> getMiddleLocation() {
    return middleLocation;
  }
  public void setMiddleLocation(List<MiddleLocation> middleLocation) {
    this.middleLocation = middleLocation;
  }
  public List<BottomLocation> getBottomLocation() {
    return bottomLocation;
  }
  public void setBottomLocation(List<BottomLocation> bottomLocation) {
    this.bottomLocation = bottomLocation;
  }
  
  
  
  
}

