package com.eomcs.lms.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Match implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int no;
  private int teamNo;
  private int otherTeamNo;
  private int teamSportsId;
  private String title;
  private String contents;
  private int viewCount;
  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
  private Date createdDate;
  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
  private Date modifierDate;
  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
  private Date playDate;
  private String location;
  private String stadiumName;
  private String stadiumLatitude;
  private String stadiumLongitude;
  private String telephone;
  private int cost;
  
  private Team team;
  private TeamTypeSports teamTypeSports;
  private MatchApply matchApply;
  private List<Tag> tags;
  
  
  @Override
  public String toString() {
    return "Match [no=" + no + ", teamNo=" + teamNo + ", otherTeamNo=" + otherTeamNo
        + ", teamSportsId=" + teamSportsId + ", title=" + title + ", contents=" + contents
        + ", viewCount=" + viewCount + ", createdDate=" + createdDate + ", modifierDate="
        + modifierDate + ", playDate=" + playDate + ", location=" + location + ", stadiumName="
        + stadiumName + ", stadiumLatitude=" + stadiumLatitude + ", stadiumLongitude="
        + stadiumLongitude + ", telephone=" + telephone + ", cost=" + cost + ", team=" + team
        + ", teamTypeSports=" + teamTypeSports + ", matchApply=" + matchApply + ", tag=" + tags
        + "]";
  }
  
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getTeamNo() {
    return teamNo;
  }
  public void setTeamNo(int teamNo) {
    this.teamNo = teamNo;
  }
  public int getOtherTeamNo() {
    return otherTeamNo;
  }
  public void setOtherTeamNo(int otherTeamNo) {
    this.otherTeamNo = otherTeamNo;
  }
  public int getTeamSportsId() {
    return teamSportsId;
  }
  public void setTeamSportsId(int teamSportsId) {
    this.teamSportsId = teamSportsId;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContents() {
    return contents;
  }
  public void setContents(String contents) {
    this.contents = contents;
  }
  public int getViewCount() {
    return viewCount;
  }
  public void setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }
  public Date getCreatedDate() {
    return createdDate;
  }
  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }
  public Date getModifierDate() {
    return modifierDate;
  }
  public void setModifierDate(Date modifierDate) {
    this.modifierDate = modifierDate;
  }
  public Date getPlayDate() {
    return playDate;
  }
  public void setPlayDate(Date playDate) {
    this.playDate = playDate;
  }
  public String getLocation() {
    return location;
  }
  public void setLocation(String location) {
    this.location = location;
  }
  public String getStadiumName() {
    return stadiumName;
  }
  public void setStadiumName(String stadiumName) {
    this.stadiumName = stadiumName;
  }
  public String getStadiumLatitude() {
    return stadiumLatitude;
  }
  public void setStadiumLatitude(String stadiumLatitude) {
    this.stadiumLatitude = stadiumLatitude;
  }
  public String getStadiumLongitude() {
    return stadiumLongitude;
  }
  public void setStadiumLongitude(String stadiumLongitude) {
    this.stadiumLongitude = stadiumLongitude;
  }
  public String getTelephone() {
    return telephone;
  }
  public void setTelephone(String telephone) {
    this.telephone = telephone;
  }
  public int getCost() {
    return cost;
  }
  public void setCost(int cost) {
    this.cost = cost;
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

  public MatchApply getMatchApply() {
    return matchApply;
  }
  public void setMatchApply(MatchApply matchApply) {
    this.matchApply = matchApply;
  }
  public List<Tag> getTags() {
    return tags;
  }
  public void setTags(List<Tag> tags) {
    this.tags = tags;
  }


  
}
