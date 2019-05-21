<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
</head>

<body>


  <div class="container">
    <form action='../update' method='post' >

       <div class="form-group row">
        <label for="no" class="col-sm-2 col-form-label">번호</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="no" id="no"
            value="${match.no}" readonly/>
        </div>
      </div> 

        <div class="form-group row">
          <label for="playdt" class="col-sm-2 col-form-label">경기날짜</label>
          <div class="col-sm-10">
            <input type="date" class="form-control" name="playDate"
              value="${match.playDate}"/>
          </div>
        </div>

      <div class="form-group row">
        <label for="location" class="col-sm-2 col-form-label">지역</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="teamArea" id="location"
            value="${match.location}" readonly />
        </div>
      </div>

      <div class="form-group row">
        <label for="teamName" class="col-sm-2 col-form-label">팀명</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="teamName" id="teamName"
            value="${match.team.teamName}" readonly />
        </div>
      </div>

      <div class="form-group row">
        <label for="title" class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="title" id="title"
            value="${match.title}" />
        </div>
      </div>

      <div class="form-group row">
        <label for="contents" class="col-sm-2 col-form-label">내용</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="contents" id="contents"
            value="${match.contents}" />
        </div>
      </div>

<%--       <div class="form-group row">
        <label for="viewCount" class="col-sm-2 col-form-label">조회수</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="matchViewCount" id="viewCount"
            value="${match.viewCount}" readonly />
        </div>
      </div> --%>

      <div class="form-group row">
        <div class="col-sm-10">
          <a class="btn btn-primary" href='${contextRootPath}/app/matchboard'>목록</a>
          <button class="btn btn-primary">변경하기</button>
        </div>
      </div>
    </form>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />

</body>

</html>