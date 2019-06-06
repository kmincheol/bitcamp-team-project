package com.eomcs.lms.domain;

import java.io.Serializable;

public class SnsLogin implements Cloneable, Serializable  {

  private static final long serialVersionUID = 1L;
  
  private int no;
  private String id;
  private String name;
  private String loginType;
  
  @Override
  public String toString() {
    return "SnsLogin [no=" + no + ", id=" + id + ", name=" + name + ", loginType=" + loginType
        + "]";
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getLoginType() {
    return loginType;
  }

  public void setLoginType(String loginType) {
    this.loginType = loginType;
  }
}
