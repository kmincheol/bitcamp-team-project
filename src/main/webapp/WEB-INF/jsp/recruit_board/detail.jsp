<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>모집게시판_detail</title>
<!-- include header.jsp -->
<jsp:include page="../header.jsp" />
<!-- header.css -->
<link rel="stylesheet" href="${contextRootPath}/css/header.css">

<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_detail.css">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_list.css">



</head>

<body>

  <div class="container">

    <div id="main-text">
      <h2>게시글</h2>
    </div>

    <div>
      <form action='update' method='post' enctype='multipart/form-data'>
        <div class="form-group row">
          <div id="title-wrap" class="col-sm-12">
            <div id="title" name="teamTitle">${teamRecruit.teamTitle}</div>
          </div>

          <div id="teamName-row" class="col-sm-10">
            <span id="teamName" name="teamName">${teamRecruit.team.teamName}</span> 
            <span>|</span>
            <span id="createdDate" name="createdDate">${teamRecruit.teamCreatedDate}</span> 
            <span>|</span>
            <span id="viewCount" name="teamViewCount">${teamRecruit.teamViewCount}</span>
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
          <label for="viewCount" class="col-sm-2 col-form-label">조회수</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="teamViewCount" id="viewCount"
              value="${teamRecruit.teamViewCount}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="contents" class="col-sm-2 col-form-label">내용</label>
          <div class="col-sm-10">
            <p>${teamRecruit.teamContents}</p>
          </div>
        </div>

        <div class="form-group row">
          <div class="col-sm-10">
            <a class="btn btn-primary" href='${contextRootPath}/app/recruit_board'>목록</a> <a
              class="btn btn-primary" href='delete/${teamRecruit.teamNo}'>삭제</a> <a
              class="btn btn-primary"
              href='${contextRootPath}/app/recruit_board/update/${teamRecruit.teamNo}'>변경</a> <a
              class="btn btn-primary" href=''>가입신청</a>
          </div>
        </div>
      </form>
    </div>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />

</body>

</html>