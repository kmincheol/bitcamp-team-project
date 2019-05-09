package com.eomcs.lms.domain;
import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class AttachedFile implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int no;
  private int postNo;
  private String filePath;
  private int fileType;
  
  @Override
  public String toString() {
    return "AttachedFile [no=" + no + ", postNo=" + postNo + ", filePath=" + filePath
        + ", fileType=" + fileType + "]";
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
  public String getFilePath() {
    return filePath;
  }
  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }
  public int getFileType() {
    return fileType;
  }
  public void setFileType(int fileType) {
    this.fileType = fileType;
  }
  
  
  
  
  
}
