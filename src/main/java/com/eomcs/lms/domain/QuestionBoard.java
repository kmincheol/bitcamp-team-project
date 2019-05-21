package com.eomcs.lms.domain;

import java.sql.Date;

public class QuestionBoard {
      private int questionNo;
      private int memberNo;
      private String title;
      private String contents;
      private String questionType;
      private boolean questionStatus;
      private Date createdDate;
      private Member member;
     
        
        
        
        
        @Override
	public String toString() {
		return "QuestionBoard [questionNo=" + questionNo + ", memberNo=" + memberNo + ", title=" + title + ", contents="
				+ contents + ", questionType=" + questionType + ", questionStatus=" + questionStatus + ", createdDate="
				+ createdDate + ", member=" + member + "]";
	}
		public Member getMember() {
          return member;
        }
        public void setMember(Member member) {
          this.member = member;
        }
     
        public int getQuestionNo() {
          return questionNo;
        }
        public void setQuestionNo(int questionNo) {
          this.questionNo = questionNo;
        }
        public int getMemberNo() {
          return memberNo;
        }
        public void setMemberNo(int memberNo) {
          this.memberNo = memberNo;
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
        public String getQuestionType() {
          return questionType;
        }
        public void setQuestionType(String questionType) {
          this.questionType = questionType;
        }
        public boolean isQuestionStatus() {
          return questionStatus;
        }
        public void setQuestionStatus(boolean questionStatus) {
          this.questionStatus = questionStatus;
        }
        public Date getCreatedDate() {
          return createdDate;
        }
        public void setCreatedDate(Date createdDate) {
          this.createdDate = createdDate;
        }


}
