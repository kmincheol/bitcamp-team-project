<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_detail.css">
</head>

<body>


  <div class="container">

    <div class="form-group row">
      <label for="no" class="col-sm-2 col-form-label">번호</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="questionType" id="type" value="${question.questionNo}"
          readonly />
      </div>
    </div>

    <div class="form-group row">
      <label for="viewCount" class="col-sm-2 col-form-label">답변상태</label>
      <div class="col-sm-10">
          <input tyep="text" class="form-control"
          value = " <c:choose>
                <c:when test="${question.questionStatus == false}">대기</c:when>
                <c:otherwise>완료</c:otherwise>
              </c:choose>" readonly/>
      </div>
    </div>

    <div class="form-group row">
      <label for="contents" class="col-sm-2 col-form-label">작성일</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="createdDate" id="createdDate"
          value="${question.createdDate}" readonly />
      </div>
    </div>
    <div class="form-group row">
      <label for="title" class="col-sm-2 col-form-label">작성자</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="member" id="member" value="${question.member.name}" readonly />
      </div>
    </div>


    <div class="form-group row">
      <label for="title" class="col-sm-2 col-form-label">제목</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="title" id="title" value="${question.title}" readonly />
      </div>
    </div>
    
       <div class="form-group row">
      <label for="contents" class="col-sm-2 col-form-label">내용</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="contents" id="contents"
          value="${question.contents}" readonly />
      </div>
    </div>

    <div class="form-group row">
      <div class="col-sm-10">
        <a class="btn btn-primary" href='.'>목록</a> <a class="btn btn-primary"
          href='delete/${question.questionNo}'>삭제</a> <a class="btn btn-primary"
          href='${contextRootPath}/app/question/update/${question.questionNo}'>변경</a>
      </div>
    </div> 
  </div>
  <!-- .container -->
    <jsp:include page="answer.jsp" />
</body>

</html>