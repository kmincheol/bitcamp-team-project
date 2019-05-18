package com.eomcs.lms.domain;
import java.io.Serializable;

public class Tag implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int no;
  private int matchNo;
  private int memberNo;
  private String tagName;

  
  @Override
  public String toString() {
    return "Tag [no=" + no + ", matchNo=" + matchNo + ", memberNo=" + memberNo + ", tagName="
        + tagName + "]";
  }
  
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getMatchNo() {
    return matchNo;
  }
  public void setMatchNo(int matchNo) {
    this.matchNo = matchNo;
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public String getTagName() {
    return tagName;
  }
  public void setTagName(String tagName) {
    this.tagName = tagName;
  }
  
  
  
  
  
  
}
