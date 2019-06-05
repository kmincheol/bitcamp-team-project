package com.eomcs.lms.domain;

import java.io.Serializable;

public class TeamAges implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int teamAgeId;
  private String ages;
  
  
  
  @Override
  public String toString() {
    return "TeamAges [teamAgeId=" + teamAgeId + ", ages=" + ages + "]";
  }
  public int getTeamAgeId() {
    return teamAgeId;
  }
  public void setTeamAgeId(int teamAgeId) {
    this.teamAgeId = teamAgeId;
  }
  public String getAges() {
    return ages;
  }
  public void setAges(String ages) {
    this.ages = ages;
  }



}
