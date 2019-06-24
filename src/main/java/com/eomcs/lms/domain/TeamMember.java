package com.eomcs.lms.domain;

public class TeamMember {
 private int teamMemberNo;
 private int memberNo;
 private boolean teamLeader;
 private String position;
 private Member member;
 private Team team;
 private Position position2;
@Override
public String toString() {
  return "TeamMember [teamMemberNo=" + teamMemberNo + ", memberNo=" + memberNo + ", teamLeader="
      + teamLeader + ", position=" + position + ", member=" + member + ", team=" + team
      + ", position2=" + position2 + "]";
}
public int getTeamMemberNo() {
  return teamMemberNo;
}
public void setTeamMemberNo(int teamMemberNo) {
  this.teamMemberNo = teamMemberNo;
}
public int getMemberNo() {
  return memberNo;
}
public void setMemberNo(int memberNo) {
  this.memberNo = memberNo;
}
public boolean isTeamLeader() {
  return teamLeader;
}
public void setTeamLeader(boolean teamLeader) {
  this.teamLeader = teamLeader;
}
public String getPosition() {
  return position;
}
public void setPosition(String position) {
  this.position = position;
}
public Member getMember() {
  return member;
}
public void setMember(Member member) {
  this.member = member;
}
public Team getTeam() {
  return team;
}
public void setTeam(Team team) {
  this.team = team;
}
public Position getPosition2() {
  return position2;
}
public void setPosition2(Position position2) {
  this.position2 = position2;
}
 

 
}
