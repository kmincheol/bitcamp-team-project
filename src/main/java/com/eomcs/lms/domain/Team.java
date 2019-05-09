package com.eomcs.lms.domain;
import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Team implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int teamId;
  private String name;
  private String teamInfo;
  private String area;
  private int ageId;
  private int teamTypeId;
  private int teamLevelId;
  private int sportsId;
  private String teamEmblemPhoto;
  private boolean teamUniform;
  private String teamUniformPhoto;
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date teamCreateDate;
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date teamDeleteDate;
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date teamInfoModifieDate;
  private String teamDeleteReason;
  
  @Override
  public String toString() {
    return "Team [teamId=" + teamId + ", name=" + name + ", teamInfo=" + teamInfo + ", area=" + area
        + ", ageId=" + ageId + ", teamTypeId=" + teamTypeId + ", teamLevelId=" + teamLevelId
        + ", sportsId=" + sportsId + ", teamEmblemPhoto=" + teamEmblemPhoto + ", teamUniform="
        + teamUniform + ", teamUniformPhoto=" + teamUniformPhoto + ", teamCreateDate="
        + teamCreateDate + ", teamDeleteDate=" + teamDeleteDate + ", teamInfoModifieDate="
        + teamInfoModifieDate + ", teamDeleteReason=" + teamDeleteReason + "]";
  }
  public int getTeamId() {
    return teamId;
  }
  public void setTeamId(int teamId) {
    this.teamId = teamId;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getTeamInfo() {
    return teamInfo;
  }
  public void setTeamInfo(String teamInfo) {
    this.teamInfo = teamInfo;
  }
  public String getArea() {
    return area;
  }
  public void setArea(String area) {
    this.area = area;
  }
  public int getAgeId() {
    return ageId;
  }
  public void setAgeId(int ageId) {
    this.ageId = ageId;
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
  public int getSportsId() {
    return sportsId;
  }
  public void setSportsId(int sportsId) {
    this.sportsId = sportsId;
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
  public Date getTeamDeleteDate() {
    return teamDeleteDate;
  }
  public void setTeamDeleteDate(Date teamDeleteDate) {
    this.teamDeleteDate = teamDeleteDate;
  }
  public Date getTeamInfoModifieDate() {
    return teamInfoModifieDate;
  }
  public void setTeamInfoModifieDate(Date teamInfoModifieDate) {
    this.teamInfoModifieDate = teamInfoModifieDate;
  }
  public String getTeamDeleteReason() {
    return teamDeleteReason;
  }
  public void setTeamDeleteReason(String teamDeleteReason) {
    this.teamDeleteReason = teamDeleteReason;
  }

 
 
}
