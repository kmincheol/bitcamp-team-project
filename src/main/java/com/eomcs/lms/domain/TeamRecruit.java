package com.eomcs.lms.domain;

import java.io.Serializable;
import java.sql.Date;

public class TeamRecruit implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int teamNo;
  private int teamId;
  private String teamTitl;
  private String teamConts;
  private int teamVwCnt;
  private Date teamCdt;
  private Date teamMdt;
  private String teamRcrmStat;
  private int teamRcrmPrsn;

  private Team team;

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

  public String getTeamTitl() {
    return teamTitl;
  }

  public void setTeamTitl(String teamTitl) {
    this.teamTitl = teamTitl;
  }

  public String getTeamConts() {
    return teamConts;
  }

  public void setTeamConts(String teamConts) {
    this.teamConts = teamConts;
  }

  public int getTeamVwCnt() {
    return teamVwCnt;
  }

  public void setTeamVwCnt(int teamVwCnt) {
    this.teamVwCnt = teamVwCnt;
  }

  public Date getTeamCdt() {
    return teamCdt;
  }

  public void setTeamCdt(Date teamCdt) {
    this.teamCdt = teamCdt;
  }

  public Date getTeamMdt() {
    return teamMdt;
  }

  public void setTeamMdt(Date teamMdt) {
    this.teamMdt = teamMdt;
  }

  public String getTeamRcrmStat() {
    return teamRcrmStat;
  }

  public void setTeamRcrmStat(String teamRcrmStat) {
    this.teamRcrmStat = teamRcrmStat;
  }

  public int getTeamRcrmPrsn() {
    return teamRcrmPrsn;
  }

  public void setTeamRcrmPrsn(int teamRcrmPrsn) {
    this.teamRcrmPrsn = teamRcrmPrsn;
  }

  public Team getTeam() {
    return team;
  }

  public void setTeam(Team team) {
    this.team = team;
  }


}
