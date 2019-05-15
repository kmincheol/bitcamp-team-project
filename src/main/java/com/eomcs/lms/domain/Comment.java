package com.eomcs.lms.domain;
import java.io.Serializable;
import java.sql.Date;

public class Comment implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;
  private int no;
  private int freeNo;
  private int memberNo;
  private int procedure;
  private int level;
  private String contents;
  private Date writeDate;
  private Date modifierDate;
  private Member member;
  private Free free;
  
  public Free getFree() {
    return free;
  }

  public void setFree(Free free) {
    this.free = free;
  }

  public Member getMember() {
    return member;
  }

  public void setMember(Member member) {
    this.member = member;
  }

  @Override
  public String toString() {
    return "Comment [no=" + no + ", freeNo=" + freeNo + ", memberNo=" + memberNo + ", procedure="
        + procedure + ", level=" + level + ", contents=" + contents + ", writeDate=" + writeDate
        + ", modifierDate=" + modifierDate + "]";
  }

  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getFreeNo() {
    return freeNo;
  }
  public void setFreeNo(int freeNo) {
    this.freeNo = freeNo;
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public int getProcedure() {
    return procedure;
  }
  public void setProcedure(int procedure) {
    this.procedure = procedure;
  }
  public int getLevel() {
    return level;
  }
  public void setLevel(int level) {
    this.level = level;
  }
  public String getContents() {
    return contents;
  }
  public void setContents(String contents) {
    this.contents = contents;
  }
  public Date getWriteDate() {
    return writeDate;
  }
  public void setWriteDate(Date writeDate) {
    this.writeDate = writeDate;
  }
  public Date getModifierDate() {
    return modifierDate;
  }
  public void setModifierDate(Date modifierDate) {
    this.modifierDate = modifierDate;
  }



}
