<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="../commonCss.jsp" />
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_detail.css">
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
</head>

<body>

  <div class="container">
    <form id='update_form' action='../update' method='post'>

      <div class="form-group row">
        <label for="questionNo" class="col-sm-2 col-form-label">번호</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="questionNo" id="questionNo"
            value="${questionBoard.questionNo}" readonly/>
        </div>
      </div>

<%--       <div class="form-group row">
        <label for="questionStatus" class="col-sm-2 col-form-label">답변상태</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="questionStatus" id="questionStatus"
            value = " <c:choose>
                <c:when test="${question.questionStatus == false}">답변대기</c:when>
                <c:otherwise>답변완료</c:otherwise>
              </c:choose>" readonly/>
        </div>
      </div>
 --%>
      <div class="form-group row">
        <label for="createdDate" class="col-sm-2 col-form-label">작성일</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="createdDate" id="createdDate"
            value="${questionBoard.createdDate}" readonly />
        </div>
      </div>

      <div class="form-group row">
        <label for="title" class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name=title id="title"
            value="${questionBoard.title}"/>
        </div>
      </div>

      <div class="form-group row">
        <label for="contents" class="col-sm-2 col-form-label">내용</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="contents" id="contents"
            value="${questionBoard.contents}" />
        </div>
      </div>

      <div class="form-group row">
        <div class="col-sm-10">
          <a class="btn btn-primary" href='${contextRootPath}/app/question'>목록</a>
          <button id="update" class="btn btn-primary" >저장</button>
        </div>
      </div>
    </form>
  </div>
  <!-- .container -->

<jsp:include page="../javascript.jsp" />  
<script>

</script>
</body>
</html>