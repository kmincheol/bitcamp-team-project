package com.eomcs.lms.domain;

import java.io.Serializable;

public class TeamRecruit implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

 
  private Board board;
  private Team team;
  private int no;
  private String recruitStat;
  private int recruitMember;

  public Board getBoard() {
    return board;
  }

  public void setBoard(Board board) {
    this.board = board;
  }

  public Team getTeam() {
    return team;
  }

  public void setTeam(Team team) {
    this.team = team;
  }

  public String getRecruitStat() {
    return recruitStat;
  }

  public void setRecruitStat(String recruitStat) {
    this.recruitStat = recruitStat;
  }

  public int getRecruitMember() {
    return recruitMember;
  }

  public void setRecruitMember(int recruitMember) {
    this.recruitMember = recruitMember;
  }



}
