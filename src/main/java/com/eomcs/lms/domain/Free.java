package com.eomcs.lms.domain;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Free implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;
  
  private int no;
  private int MemberNo;
  private String title;
  private String contents;
  private int viewCount;
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date createdDate;
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date modifierDate;
  private Member member;
  private List<FreeFile> files;
  
  @Override
  public String toString() {
    return "Free [no=" + no + ", MemberNo=" + MemberNo + ", title=" + title + ", contents="
        + contents + ", viewCount=" + viewCount + ", createdDate=" + createdDate + ", modifierDate="
        + modifierDate + ", member=" + member + ", files=" + files + "]";
  }
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getMemberNo() {
    return MemberNo;
  }
  public void setMemberNo(int memberNo) {
    MemberNo = memberNo;
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
  public Member getMember() {
    return member;
  }
  public void setMember(Member member) {
    this.member = member;
  }
  public List<FreeFile> getFiles() {
    return files;
  }
  public void setFiles(List<FreeFile> files) {
    this.files = files;
  }
  
}
