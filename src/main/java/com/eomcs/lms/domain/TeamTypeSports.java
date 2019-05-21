package com.eomcs.lms.domain;

import java.io.Serializable;

public class TeamTypeSports implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int teamSportsTypeId;
  private String teamSportsType;

  
  @Override
  public String toString() {
    return "TeamTypeSports [teamSportsTypeId=" + teamSportsTypeId + ", teamSportsType="
        + teamSportsType + "]";
  }

  public int getTeamSportsTypeId() {
    return teamSportsTypeId;
  }

  public void setTeamSportsTypeId(int teamSportsTypeId) {
    this.teamSportsTypeId = teamSportsTypeId;
  }

  public String getTeamSportsType() {
    return teamSportsType;
  }

  public void setTeamSportsType(String teamSportsType) {
    this.teamSportsType = teamSportsType;
  }
}
