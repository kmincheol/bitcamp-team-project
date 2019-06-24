package com.eomcs.lms.domain;

import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class TeamRecruit implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int teamNo;
  private int teamId;
  private String teamTitle;
  private String teamContents;
  private int teamViewCount;

  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
  private Date teamCreatedDate;
  
  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
  private Date teamModifyDate;
  
  private String teamRcrmStatus;
  private int teamRcrmPerson;

  private Team team;
  private TeamTypeSports teamTypeSports;
  private Member member;
  private TeamMember teamMember;
  private TeamAges teamAges;
  private JoinTeam joinTeam;
private TopLocation topLocation;
private MiddleLocation middleLocation;
@Override
public String toString() {
  return "TeamRecruit [teamNo=" + teamNo + ", teamId=" + teamId + ", teamTitle=" + teamTitle
      + ", teamContents=" + teamContents + ", teamViewCount=" + teamViewCount + ", teamCreatedDate="
      + teamCreatedDate + ", teamModifyDate=" + teamModifyDate + ", teamRcrmStatus="
      + teamRcrmStatus + ", teamRcrmPerson=" + teamRcrmPerson + ", team=" + team
      + ", teamTypeSports=" + teamTypeSports + ", member=" + member + ", teamMember=" + teamMember
      + ", teamAges=" + teamAges + ", joinTeam=" + joinTeam + ", topLocation=" + topLocation
      + ", middleLocation=" + middleLocation + "]";
}
public int getTeamNo() {
  return teamNo;
}
public void setTeamNo(int teamNo) {
  this.teamNo = teamNo;
}
public int getTeamId() {
  return teamId;
}
public void setTeamId(int teamId) {
  this.teamId = teamId;
}
public String getTeamTitle() {
  return teamTitle;
}
public void setTeamTitle(String teamTitle) {
  this.teamTitle = teamTitle;
}
public String getTeamContents() {
  return teamContents;
}
public void setTeamContents(String teamContents) {
  this.teamContents = teamContents;
}
public int getTeamViewCount() {
  return teamViewCount;
}
public void setTeamViewCount(int teamViewCount) {
  this.teamViewCount = teamViewCount;
}
public Date getTeamCreatedDate() {
  return teamCreatedDate;
}
public void setTeamCreatedDate(Date teamCreatedDate) {
  this.teamCreatedDate = teamCreatedDate;
}
public Date getTeamModifyDate() {
  return teamModifyDate;
}
public void setTeamModifyDate(Date teamModifyDate) {
  this.teamModifyDate = teamModifyDate;
}
public String getTeamRcrmStatus() {
  return teamRcrmStatus;
}
public void setTeamRcrmStatus(String teamRcrmStatus) {
  this.teamRcrmStatus = teamRcrmStatus;
}
public int getTeamRcrmPerson() {
  return teamRcrmPerson;
}
public void setTeamRcrmPerson(int teamRcrmPerson) {
  this.teamRcrmPerson = teamRcrmPerson;
}
public Team getTeam() {
  return team;
}
public void setTeam(Team team) {
  this.team = team;
}
public TeamTypeSports getTeamTypeSports() {
  return teamTypeSports;
}
public void setTeamTypeSports(TeamTypeSports teamTypeSports) {
  this.teamTypeSports = teamTypeSports;
}
public Member getMember() {
  return member;
}
public void setMember(Member member) {
  this.member = member;
}
public TeamMember getTeamMember() {
  return teamMember;
}
public void setTeamMember(TeamMember teamMember) {
  this.teamMember = teamMember;
}
public TeamAges getTeamAges() {
  return teamAges;
}
public void setTeamAges(TeamAges teamAges) {
  this.teamAges = teamAges;
}
public JoinTeam getJoinTeam() {
  return joinTeam;
}
public void setJoinTeam(JoinTeam joinTeam) {
  this.joinTeam = joinTeam;
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