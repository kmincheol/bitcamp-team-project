package com.eomcs.lms.domain;

public class TeamMember {
 private int teamMemberNo;
 private int memberNo;
 private boolean teamLeader;
 private String positon;
 
@Override
public String toString() {
  return "TeamMember [teamMemberNo=" + teamMemberNo + ", memberNo=" + memberNo + ", teamLeader="
      + teamLeader + ", positon=" + positon + "]";
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
public String getPositon() {
  return positon;
}
public void setPositon(String positon) {
  this.positon = positon;
}

 
 
}
