package com.eomcs.lms.domain;

import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Sms implements Cloneable, Serializable  {

  private static final long serialVersionUID = 1L;
  
  private int no;
  private String tel;
  private String smsContent;
  private int type;
  
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date createdDate;

  @Override
  public String toString() {
    return "Sms [no=" + no + ", tel=" + tel + ", smsContent=" + smsContent + ", type=" + type
        + ", createdDate=" + createdDate + "]";
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public String getSmsContent() {
    return smsContent;
  }

  public void setSmsContent(String smsContent) {
    this.smsContent = smsContent;
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
