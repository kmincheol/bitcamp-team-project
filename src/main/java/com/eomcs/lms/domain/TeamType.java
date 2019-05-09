package com.eomcs.lms.domain;
import java.io.Serializable;

public class TeamType implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;  
  
  private int teamTypeId;
  private String teamType;
  
  public int getTeamTypeId() {
    return teamTypeId;
  }
  public void setTeamTypeId(int teamTypeId) {
    this.teamTypeId = teamTypeId;
  }
  public String getTeamType() {
    return teamType;
  }
  public void setTeamType(String teamType) {
    this.teamType = teamType;
  }
  
  
  
  
  
}
