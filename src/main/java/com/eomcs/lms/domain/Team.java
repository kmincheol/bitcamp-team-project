package com.eomcs.lms.domain;

import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Team implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int teamId;
  private String teamName;
  private String teamInfo;
  private String teanArea;
  private int teamAgeId;
  private int teamTypeId;
  private int teamLevelId;
  private int teanSportsId;
  private String teamEmblemPhoto;
  private boolean teamUniform;
  private String teamUniformPhoto;
  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
  private Date teamCreateDate;
  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
  private Date teamInfoModifieDate;

  public int getTeamId() {
    return teamId;
  }

  public void setTeamId(int teamId) {
    this.teamId = teamId;
  }

  public String getTeamName() {
    return teamName;
  }

  public void setTeamName(String teamName) {
    this.teamName = teamName;
  }

  public String getTeamInfo() {
    return teamInfo;
  }

  public void setTeamInfo(String teamInfo) {
    this.teamInfo = teamInfo;
  }

  public String getTeanArea() {
    return teanArea;
  }

  public void setTeanArea(String teanArea) {
    this.teanArea = teanArea;
  }

  public int getTeamAgeId() {
    return teamAgeId;
  }

  public void setTeamAgeId(int teamAgeId) {
    this.teamAgeId = teamAgeId;
  }

  public int getTeamTypeId() {
    return teamTypeId;
  }

  public void setTeamTypeId(int teamTypeId) {
    this.teamTypeId = teamTypeId;
  }

  public int getTeamLevelId() {
    return teamLevelId;
  }

  public void setTeamLevelId(int teamLevelId) {
    this.teamLevelId = teamLevelId;
  }

  public int getTeanSportsId() {
    return teanSportsId;
  }

  public void setTeanSportsId(int teanSportsId) {
    this.teanSportsId = teanSportsId;
  }

  public String getTeamEmblemPhoto() {
    return teamEmblemPhoto;
  }

  public void setTeamEmblemPhoto(String teamEmblemPhoto) {
    this.teamEmblemPhoto = teamEmblemPhoto;
  }

  public boolean isTeamUniform() {
    return teamUniform;
  }

  public void setTeamUniform(boolean teamUniform) {
    this.teamUniform = teamUniform;
  }

  public String getTeamUniformPhoto() {
    return teamUniformPhoto;
  }

  public void setTeamUniformPhoto(String teamUniformPhoto) {
    this.teamUniformPhoto = teamUniformPhoto;
  }

  public Date getTeamCreateDate() {
    return teamCreateDate;
  }

  public void setTeamCreateDate(Date teamCreateDate) {
    this.teamCreateDate = teamCreateDate;
  }

  public Date getTeamInfoModifieDate() {
    return teamInfoModifieDate;
  }

  public void setTeamInfoModifieDate(Date teamInfoModifieDate) {
    this.teamInfoModifieDate = teamInfoModifieDate;
  }


}
