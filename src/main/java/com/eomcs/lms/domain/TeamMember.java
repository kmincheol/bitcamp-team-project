package com.eomcs.lms.domain;

public class TeamMember {
 private int teamMember_id;
 private int member_id;
 private boolean team_leader;
 private String positon;
public int getTeamMember_id() {
  return teamMember_id;
}
public void setTeamMember_id(int teamMember_id) {
  this.teamMember_id = teamMember_id;
}
public int getMember_id() {
  return member_id;
}
public void setMember_id(int member_id) {
  this.member_id = member_id;
}
public boolean isTeam_leader() {
  return team_leader;
}
public void setTeam_leader(boolean team_leader) {
  this.team_leader = team_leader;
}
public String getPositon() {
  return positon;
}
public void setPositon(String positon) {
  this.positon = positon;
}
 
 
 
 
}
