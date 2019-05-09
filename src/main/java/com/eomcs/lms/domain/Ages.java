package com.eomcs.lms.domain;
import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Ages implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;  
  
  private int ageId;
  private String ages;
  
  public int getAgeId() {
    return ageId;
  }
  public void setAgeId(int ageId) {
    this.ageId = ageId;
  }
  public String getAges() {
    return ages;
  }
  public void setAges(String ages) {
    this.ages = ages;
  }
  
  
  
  
}
