<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>모집게시판</title>
<!-- include header.jsp -->
<jsp:include page="../header.jsp" />
<!-- header.css -->
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
<!-- recruit_board_list.css -->
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_list.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<!-- Bootstrap core CSS -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/mdb.min.css" rel="stylesheet">
<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">
<!-- MDBootstrap Datatables  -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/addons/datatables.min.css"
  rel="stylesheet">

<style>
.pagination {
	display: inline-flex;
}

div.dataTables_wrapper div.dataTables_paginate {
	text-align: left;
	width: 100%;
}
</style>

</head>

<body>
  <div class="container">

    <div id="main-text">
      <h2>모집게시판</h2>
    </div>

    <table id="dtBasicExample" class="table" cellspacing="0" width="100%" style="text-align: center">
      <thead>
        <tr>
          <th class="th-sm">번호</th>
          <th class="th-sm">종목</th>
          <th class="th-sm">제목</th>
          <th class="th-sm">팀명</th>
          <th class="th-sm">지역</th>
          <th class="th-sm">상태</th>
          <th class="th-sm">작성일</th>
          <th class="th-sm">조회수</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${list}" var="list">
          <tr>
            <td>${list.teamNo}</td>
            <td><c:choose>
                <c:when test="${list.teamTypeSports.teamSportsType eq '축구'}">
                  <img src="${contextRootPath}/images/football_list.png">
                </c:when>
                <c:when test="${list.teamTypeSports.teamSportsType eq '농구'}">
                  <img src="${contextRootPath}/images/basketball_list.png">
                </c:when>
                <c:when test="${list.teamTypeSports.teamSportsType eq '야구'}">
                  <img src="${contextRootPath}/images/baseball_list.png">
                </c:when>
                <c:when test="${list.teamTypeSports.teamSportsType eq '탁구'}">
                  <img src="${contextRootPath}/images/pingpong_list.png">
                </c:when>
              </c:choose></td>
            <td><a href="${contextRootPath}/app/recruit_board/${list.teamNo}">${list.teamTitle}</a></td>
            <td>${list.team.teamName }</td>
            <td>${list.team.teamArea }</td>
            <td><c:choose>
                <c:when test="${list.teamRcrmStatus == 0}"> 모집중 </c:when>
                <c:otherwise>모집마감</c:otherwise>
              </c:choose></td>
            <td>${list.teamCreatedDate}</td>
            <td>${list.teamViewCount}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <div id="in">
      <div id="write-btn">
        <a class="input-group-btn1 btn btn-dark" href="${contextRootPath}/app/recruit_board/form">글쓰기</a>
      </div>
    </div>
  </div>

  <jsp:include page="../footer.jsp" />

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript"
    src="${contextRootPath}/node_modules/mdbootstrap/js/jquery-3.4.0.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="${contextRootPath}/node_modules/mdbootstrap/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript"
    src="${contextRootPath}/node_modules/mdbootstrap/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="${contextRootPath}/node_modules/mdbootstrap/js/mdb.min.js"></script>
  <!-- MDBootstrap Datatables  -->
  <script type="text/javascript"
    src="${contextRootPath}/node_modules/mdbootstrap/js/addons/datatables.min.js"></script>

  <script>
			var lang_kor = {
				"lengthMenu" : "_MENU_ 개씩 보기",
				"search" : "검색 : ",
				"paginate" : {
					"next" : "다음",
					"previous" : "이전"
				}
			};

			$(document).ready(function() {
				$('#dtBasicExample').DataTable({
					"info" : false,
					/* "lengthChange":false, */
					language : lang_kor
				});
				$('.dataTables_length').addClass('bs-select');
			});
		</script>
</body>
</html>