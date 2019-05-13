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
  
  
  @Override
  public String toString() {
    return "TeamRecruit [teamNo=" + teamNo + ", teamId=" + teamId + ", teamTitle=" + teamTitle
        + ", teamContents=" + teamContents + ", teamViewCount=" + teamViewCount
        + ", teamCreatedDate=" + teamCreatedDate + ", teamModifyDate=" + teamModifyDate
        + ", teamRcrmStatus=" + teamRcrmStatus + ", teamRcrmPerson=" + teamRcrmPerson + ", team="
        + team + ", teamTypeSports=" + teamTypeSports + "]";
  }

  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
  private Date teamCreatedDate;
  
  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
  private Date teamModifyDate;
  
  private String teamRcrmStatus;
  private int teamRcrmPerson;

  private Team team;
  private TeamTypeSports teamTypeSports;
  
  
  
  
  @Override
  public String toString() {
    return "TeamRecruit [teamNo=" + teamNo + ", teamId=" + teamId + ", teamTitle=" + teamTitle
        + ", teamContents=" + teamContents + ", teamViewCount=" + teamViewCount
        + ", teamCreatedDate=" + teamCreatedDate + ", teamModifyDate=" + teamModifyDate
        + ", teamRcrmStatus=" + teamRcrmStatus + ", teamRcrmPerson=" + teamRcrmPerson + ", team="
        + team + ", teamTypeSports=" + teamTypeSports + "]";
  }

  public TeamTypeSports getTeamTypeSports() {
    return teamTypeSports;
  }

  public void setTeamTypeSports(TeamTypeSports teamTypeSports) {
    this.teamTypeSports = teamTypeSports;
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


}
