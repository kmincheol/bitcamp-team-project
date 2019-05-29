package com.eomcs.lms.domain;

import java.sql.Date;

public class AnswerBoard {
      private int answerNo;
      private int questionNo;
      private String title;
      private String contents;
      private Date createdDate;
      private QuestionBoard questionBoard;
      
      
      
      
      @Override
      public String toString() {
        return "AnswerBoard [answerNo=" + answerNo + ", questionNo=" + questionNo + ", title="
            + title + ", contents=" + contents + ", createdDate=" + createdDate + ", questionBoard="
            + questionBoard + "]";
      }
      public int getAnswerNo() {
        return answerNo;
      }
      public void setAnswerNo(int answerNo) {
        this.answerNo = answerNo;
      }
      public int getQuestionNo() {
        return questionNo;
      }
      public void setQuestionNo(int questionNo) {
        this.questionNo = questionNo;
      }
      public String getTitle() {
        return title;
      }
      public void setTitle(String title) {
        this.title = title;
      }
      public String getContents() {
        return contents;
      }
      public void setContents(String contents) {
        this.contents = contents;
      }
      public Date getCreatedDate() {
        return createdDate;
      }
      public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
      }
      public QuestionBoard getQuestionBoard() {
        return questionBoard;
      }
      public void setQuestionBoard(QuestionBoard questionBoard) {
        this.questionBoard = questionBoard;
      }
     
     
 
      
       

}
