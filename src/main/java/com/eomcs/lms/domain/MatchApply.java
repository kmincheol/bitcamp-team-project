package com.eomcs.lms.domain;

import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class MatchApply implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int matchNo;
  private int teamNo;
  private String applyStatus;
  
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date applyDate;
  
  private Match match;
  private Team team;
  private TopLocation topLocation;
  private MiddleLocation middleLocation;
@Override
public String toString() {
	return "MatchApply [matchNo=" + matchNo + ", teamNo=" + teamNo + ", applyStatus=" + applyStatus + ", applyDate="
			+ applyDate + ", match=" + match + ", team=" + team + ", topLocation=" + topLocation + ", middleLocation="
			+ middleLocation + "]";
}
public int getMatchNo() {
	return matchNo;
}
public void setMatchNo(int matchNo) {
	this.matchNo = matchNo;
}
public int getTeamNo() {
	return teamNo;
}
public void setTeamNo(int teamNo) {
	this.teamNo = teamNo;
}
public String getApplyStatus() {
	return applyStatus;
}
public void setApplyStatus(String applyStatus) {
	this.applyStatus = applyStatus;
}
public Date getApplyDate() {
	return applyDate;
}
public void setApplyDate(Date applyDate) {
	this.applyDate = applyDate;
}
public Match getMatch() {
	return match;
}
public void setMatch(Match match) {
	this.match = match;
}
public Team getTeam() {
	return team;
}
public void setTeam(Team team) {
	this.team = team;
}
public TopLocation getTopLocation() {
	return topLocation;
}
public void setTopLocation(TopLocation topLocation) {
	this.topLocation = topLocation;
}
public MiddleLocation getMiddleLocation() {
	return middleLocation;
}
public void setMiddleLocation(MiddleLocation middleLocation) {
	this.middleLocation = middleLocation;
}
  
  
}
