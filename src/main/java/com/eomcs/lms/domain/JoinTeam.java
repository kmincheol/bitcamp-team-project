package com.eomcs.lms.domain;

import java.io.Serializable;

public class JoinTeam implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int mbrId;
  private int rcrmId;

  private Member member;
  private TeamRecruit teamRecruit;

  @Override
  public String toString() {
    return "JoinTeam [mbrId=" + mbrId + ", rcrmId=" + rcrmId + ", member=" + member
        + ", teamRecruit=" + teamRecruit + "]";
  }

  public int getMbrId() {
    return mbrId;
  }

  public void setMbrId(int mbrId) {
    this.mbrId = mbrId;
  }

  public int getRcrmId() {
    return rcrmId;
  }

  public void setRcrmId(int rcrmId) {
    this.rcrmId = rcrmId;
  }

  public Member getMember() {
    return member;
  }

  public void setMember(Member member) {
    this.member = member;
  }

  public TeamRecruit getTeamRecruit() {
    return teamRecruit;
  }

  public void setTeamRecruit(TeamRecruit teamRecruit) {
    this.teamRecruit = teamRecruit;
  }



}
