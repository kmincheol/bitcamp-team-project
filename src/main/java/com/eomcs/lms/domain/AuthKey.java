package com.eomcs.lms.domain;

import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class AuthKey implements Cloneable, Serializable  {

  private static final long serialVersionUID = 1L;
  
  private int no;
  private String email;
  private String keyContent;
  private int type;
  
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date createdDate;

  @Override
  public String toString() {
    return "AuthKey [no=" + no + ", email=" + email + ", keyContent=" + keyContent + ", type="
        + type + ", createdDate=" + createdDate + "]";
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getKeyContent() {
    return keyContent;
  }

  public void setKeyContent(String keyContent) {
    this.keyContent = keyContent;
  }

  public int getType() {
    return type;
  }

  public void setType(int type) {
    this.type = type;
  }

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }

}
