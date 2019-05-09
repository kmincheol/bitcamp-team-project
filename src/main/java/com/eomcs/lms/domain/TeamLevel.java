package com.eomcs.lms.domain;

import java.io.Serializable;

public class TeamLevel implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;


  private int teamLevelId;
  private String teamLevel;

  public String getTeamLevel() {
    return teamLevel;
  }

  public void setTeamLevel(String teamLevel) {
    this.teamLevel = teamLevel;
  }

  public int getTeamLevelId() {
    return teamLevelId;
  }

  public void setTeamLevelId(int teamLevelId) {
    this.teamLevelId = teamLevelId;
  }
}
