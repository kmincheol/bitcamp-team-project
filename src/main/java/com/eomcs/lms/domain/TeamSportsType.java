package com.eomcs.lms.domain;

import java.io.Serializable;

public class TeamSportsType implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int teamSportsTypeId;
  private String teamSportsType;

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
