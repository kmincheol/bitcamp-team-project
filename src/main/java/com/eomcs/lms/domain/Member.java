package com.eomcs.lms.domain;
import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Member implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;
  
  private int no;
  private String id;
  private String password;
  private String name;
  
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date birthDay;
  
  private String gender;
  private String tel;
  private String email;
  private String baseAddress;
  private String detailAddress;
  private String photo;
  private String selfIntroduce;
  private String pid;
  private String loginType;
  private String status;
  
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date createdDate;
  
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date latestDate;
  
  private boolean withdrawalStatus;
  private String withdrawalReason;
  
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date withdrawalDate;
  
  private boolean manager;

  @Override
  public String toString() {
    return "Member [no=" + no + ", id=" + id + ", password=" + password + ", name=" + name
        + ", birthDay=" + birthDay + ", gender=" + gender + ", tel=" + tel + ", email=" + email
        + ", baseAddress=" + baseAddress + ", detailAddress=" + detailAddress + ", photo=" + photo
        + ", selfIntroduce=" + selfIntroduce + ", pid=" + pid + ", loginType=" + loginType
        + ", status=" + status + ", createdDate=" + createdDate + ", latestDate=" + latestDate
        + ", withdrawalStatus=" + withdrawalStatus + ", withdrawalReason=" + withdrawalReason
        + ", withdrawalDate=" + withdrawalDate + ", manager=" + manager + "]";
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
  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Date getBirthDay() {
    return birthDay;
  }

  public void setBirthDay(Date birthDay) {
    this.birthDay = birthDay;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getBaseAddress() {
    return baseAddress;
  }

  public void setBaseAddress(String baseAddress) {
    this.baseAddress = baseAddress;
  }

  public String getDetailAddress() {
    return detailAddress;
  }

  public void setDetailAddress(String detailAddress) {
    this.detailAddress = detailAddress;
  }

  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
  }

  public String getSelfIntroduce() {
    return selfIntroduce;
  }

  public void setSelfIntroduce(String selfIntroduce) {
    this.selfIntroduce = selfIntroduce;
  }

  public String getPid() {
    return pid;
  }

  public void setPid(String pid) {
    this.pid = pid;
  }

  public String getLoginType() {
    return loginType;
  }

  public void setLoginType(String loginType) {
    this.loginType = loginType;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }

  public Date getLatestDate() {
    return latestDate;
  }

  public void setLatestDate(Date latestDate) {
    this.latestDate = latestDate;
  }

  public boolean isWithdrawalStatus() {
    return withdrawalStatus;
  }

  public void setWithdrawalStatus(boolean withdrawalStatus) {
    this.withdrawalStatus = withdrawalStatus;
  }

  public String getWithdrawalReason() {
    return withdrawalReason;
  }

  public void setWithdrawalReason(String withdrawalReason) {
    this.withdrawalReason = withdrawalReason;
  }

  public Date getWithdrawalDate() {
    return withdrawalDate;
  }

  public void setWithdrawalDate(Date withdrawalDate) {
    this.withdrawalDate = withdrawalDate;
  }

  public boolean isManager() {
    return manager;
  }

  public void setManager(boolean manager) {
    this.manager = manager;
  }
  
  
  
 
  
  
  
  
}
  
  