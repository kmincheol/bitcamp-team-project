package com.eomcs.lms.domain;

import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Match implements Cloneable, Serializable {
  private static final long serialVersionUID = 1L;

  private int no;
  private int teamNo;
  private int otherTeamNo;
  private int teamArea;
  private int teamAgeId;
  private int teamTypeId;
  private int teamLevelId;
  private int teamSportsId;
  private String teamEmblemPhoto;
  private boolean teamUniform;
  private String teamUniformPhoto;
  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
  private Date teamCreateDate;
  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
  private Date teamInfoModifieDate;





}
