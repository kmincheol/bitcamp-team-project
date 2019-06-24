package com.eomcs.lms.domain;
import java.io.Serializable;

public class Position implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;  
  
  private int positionId;
  private int positionNo;
  private String positionName;
  private int teamTypeSportsId;
  @Override
  public String toString() {
    return "Position [positionId=" + positionId + ", positionNo=" + positionNo + ", positionName="
        + positionName + ", teamTypeSportsId=" + teamTypeSportsId + "]";
  }
  public int getPositionId() {
    return positionId;
  }
  public void setPositionId(int positionId) {
    this.positionId = positionId;
  }
  public int getPositionNo() {
    return positionNo;
  }
  public void setPositionNo(int positionNo) {
    this.positionNo = positionNo;
  }
  public String getPositionName() {
    return positionName;
  }
  public void setPositionName(String positionName) {
    this.positionName = positionName;
  }
  public int getTeamTypeSportsId() {
    return teamTypeSportsId;
  }
  public void setTeamTypeSportsId(int teamTypeSportsId) {
    this.teamTypeSportsId = teamTypeSportsId;
  }
  
  
    
 
  
  
  
  
}
