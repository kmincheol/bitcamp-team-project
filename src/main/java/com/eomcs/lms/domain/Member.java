package com.eomcs.lms.domain;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;
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
  private String post;
  private String baseAddress;
  private String detailAddress;
  private String photo;
  private String selfIntroduce;
  private String loginType;
  private String status;
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date createdDate;
  @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
  private Date latestDate;
  private boolean manager;
  
  private List<Team> team;
  private TeamMember teamMember;
  private TeamTypeSports teamTypeSports;
  
  
  @Override
  public String toString() {
    return "Member [no=" + no + ", id=" + id + ", password=" + password + ", name=" + name
        + ", birthDay=" + birthDay + ", gender=" + gender + ", tel=" + tel + ", email=" + email
        + ", post=" + post + ", baseAddress=" + baseAddress + ", detailAddress=" + detailAddress
        + ", photo=" + photo + ", selfIntroduce=" + selfIntroduce + ", loginType=" + loginType
        + ", status=" + status + ", createdDate=" + createdDate + ", latestDate=" + latestDate
        + ", manager=" + manager + ", team=" + team + ", teamMember=" + teamMember
        + ", teamTypeSports=" + teamTypeSports + "]";
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


  public String getPost() {
    return post;
  }


  public void setPost(String post) {
    this.post = post;
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


  public boolean isManager() {
    return manager;
  }


  public void setManager(boolean manager) {
    this.manager = manager;
  }


  public List<Team> getTeam() {
    return team;
  }


  public void setTeam(List<Team> team) {
    this.team = team;
  }


  public TeamMember getTeamMember() {
    return teamMember;
  }


  public void setTeamMember(TeamMember teamMember) {
    this.teamMember = teamMember;
  }


  public TeamTypeSports getTeamTypeSports() {
    return teamTypeSports;
  }


  public void setTeamTypeSports(TeamTypeSports teamTypeSports) {
    this.teamTypeSports = teamTypeSports;
  }
  
  
  
  
  
 
}
  
  