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
    <div id="table">
      <table class="table table-bordered">
        <tbody>
          <tr>
            <th scope="row">지역</th>
            <td>${teamRecruit.team.teamArea}</td>
          </tr>
          <tr>
            <th scope="row">종목</th>
            <td>${teamRecruit.teamTypeSports.teamSportsType}</td>
          </tr>
          <tr>
            <th scope="row">팀명</th>
            <td>비트축구단${teamRecruit.teamCreatedDate }</td>
          </tr>
          <tr>
            <th scope="row">제목</th>
            <td>${teamRecruit.teamTitle}</td>
          </tr>
          <tr>
            <th scope="row">내용</th>
            <td>${teamRecruit.teamContents}</td>
          </tr>
           <tr>
            <th scope="row">조회수</th>
            <td>${teamRecruit.teamViewCount}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="form-group row">
      <div class="col-sm-10">
        <a class="btn btn-primary" href='.'>목록</a> <a class="btn btn-primary"
          href='delete/${teamRecruit.teamNo}'>삭제</a>
        <button class="btn btn-primary">변경</button>
      </div>
    </div>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />

</body>

</html>