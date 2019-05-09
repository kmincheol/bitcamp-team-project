package com.eomcs.lms.domain;
import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Tag implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int no;
  private int postNo;
  private String tagName;
  
  
  @Override
  public String toString() {
    return "Tag [no=" + no + ", postNo=" + postNo + ", tagName=" + tagName + "]";
  }
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getPostNo() {
    return postNo;
  }
  public void setPostNo(int postNo) {
    this.postNo = postNo;
  }
  public String getTagName() {
    return tagName;
  }
  public void setTagName(String tagName) {
    this.tagName = tagName;
  }
  
  
  
  
  
}
