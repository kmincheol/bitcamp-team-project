package com.eomcs.lms.domain;
import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Board implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int no;
  private int memberNo;
  private int boardType;
  private String title;
  private String contents;
  private int viewCount;
  
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date createdDate;
  
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date modifierDate;
  
  private String Status;
  private String deleteReason;
  private int topPostNo;
  private Member member;
  
  @Override
  public String toString() {
    return "Board [no=" + no + ", memberNo=" + memberNo + ", boardType=" + boardType + ", title="
        + title + ", contents=" + contents + ", viewCount=" + viewCount + ", createdDate="
        + createdDate + ", modifierDate=" + modifierDate + ", Status=" + Status + ", deleteReason="
        + deleteReason + ", topPostNo=" + topPostNo + ", member=" + member + "]";
  }
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public int getBoardType() {
    return boardType;
  }
  public void setBoardType(int boardType) {
    this.boardType = boardType;
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
  public String getStatus() {
    return Status;
  }
  public void setStatus(String status) {
    Status = status;
  }
  public String getDeleteReason() {
    return deleteReason;
  }
  public void setDeleteReason(String deleteReason) {
    this.deleteReason = deleteReason;
  }
  public int getTopPostNo() {
    return topPostNo;
  }
  public void setTopPostNo(int topPostNo) {
    this.topPostNo = topPostNo;
  }
  public Member getMember() {
    return member;
  }
  public void setMember(Member member) {
    this.member = member;
  }
  
  
}
