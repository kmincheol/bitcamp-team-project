<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_detail.css">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_list.css">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board.css">
</head>

<body>

  <div class="container">
    <div>
      <jsp:include page="../header.jsp" />
    </div>
    
    <div id="main-text">
      <h2>모집게시판</h2>
    </div>

    <div>
      <form action='update' method='post' enctype='multipart/form-data'>
        <div class="form-group row">
          <label for="no" class="col-sm-2 col-form-label">번호</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="teamNo" id="no"
              value="${teamRecruit.teamNo}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="location" class="col-sm-2 col-form-label">지역</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="teamArea" id="location"
              value="${teamRecruit.team.teamArea}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="sportsType" class="col-sm-2 col-form-label">종목</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="teamSportsType" id="sportsType"
              value="${teamRecruit.teamTypeSports.teamSportsType}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="teamName" class="col-sm-2 col-form-label">팀명</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="teamName" id="teamName"
              value="${teamRecruit.team.teamName}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="title" class="col-sm-2 col-form-label">제목</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="teamTitle" id="title"
              value="${teamRecruit.teamTitle}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="contents" class="col-sm-2 col-form-label">내용</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="teamContents" id="contents"
              value="${teamRecruit.teamContents}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="viewCount" class="col-sm-2 col-form-label">조회수</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="teamViewCount" id="viewCount"
              value="${teamRecruit.teamViewCount}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <div class="col-sm-10">
            <a class="btn btn-primary" href='${contextRootPath}/app/recruit_board'>목록</a> <a
              class="btn btn-primary" href='delete/${teamRecruit.teamNo}'>삭제</a> <a
              class="btn btn-primary"
              href='${contextRootPath}/app/recruit_board/update/${teamRecruit.teamNo}'>변경</a>
          </div>
        </div>
      </form>
    </div>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />

</body>

</html>