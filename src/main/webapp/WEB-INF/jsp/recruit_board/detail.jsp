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
            <td>제목자리입니다</td>
          </tr>
          <tr>
            <th scope="row">내용</th>
            <td>${teamRecruit.teamContents}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />

</body>

</html>