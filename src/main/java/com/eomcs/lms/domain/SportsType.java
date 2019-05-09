package com.eomcs.lms.domain;
import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class SportsType implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

 private int sportsTypeId;
 private String sportsType;
 
 
public int getSportsTypeId() {
  return sportsTypeId;
}
public void setSportsTypeId(int sportsTypeId) {
  this.sportsTypeId = sportsTypeId;
}
public String getSportsType() {
  return sportsType;
}
public void setSportsType(String sportsType) {
  this.sportsType = sportsType;
}
  
  
}
