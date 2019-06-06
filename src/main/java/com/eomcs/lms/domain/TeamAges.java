package com.eomcs.lms.domain;

import java.io.Serializable;

public class TeamAges implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int teamAgeId;
  private String teamAges;
  
public int getTeamAgeId() {
	return teamAgeId;
}
public void setTeamAgeId(int teamAgeId) {
	this.teamAgeId = teamAgeId;
}
public String getTeamAges() {
	return teamAges;
}
public void setTeamAges(String teamAges) {
	this.teamAges = teamAges;
}
@Override
public String toString() {
	return "TeamAges [teamAgeId=" + teamAgeId + ", teamAges=" + teamAges + "]";
}
  

  

}
