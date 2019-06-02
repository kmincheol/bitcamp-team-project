<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<title>모집게시판_list</title>
<!-- sidebar css -->
<jsp:include page="../sidebar/commonSidebarCss.jsp" />
<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
<!-- recruit_board_list.css -->
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_list.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.2/css/mdb.min.css" rel="stylesheet">
<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">
<!-- MDBootstrap Datatables  -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/addons/datatables.min.css" rel="stylesheet">


<style>
/* 페이지 컨트롤러 가운데 정렬 style */
.pagination {
	display: inline-flex;
}

div.dataTables_wrapper div.dataTables_paginate {
	text-align: left;
	width: 100%;
}

/* 테이블 헤더 색상 변경 */
table.dataTable thead tr {
	/* background-color: gray; */
	
}
/* 테이블 목록 색상 변경 */
.table tbody tr.even {
	/* background-color: #eaeaea; */
	
}
/* 테이블 목록 색상 변경 */
.table tbody tr.odd {
	/* background-color: white; */
	
}
/* 테이블 목록 hover 색상 변경 */
#dtBasicExample tbody tr:hover {
	/* background-color: #ffa; */
	
}
/* 테이블 목록 hover 색상 변경 */
#dtBasicExample tbody tr:hover>.sorting_1 {
	/* background-color: #ffa; */
	
}
</style>

</head>

<body>
<jsp:include page="../sidebar/commonSidebarTop.jsp"/>
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
            <!-- 게시글 번호 -->
            <td>${list.teamNo}</td>
            <!-- 종목에 따라 이미지 출력 -->
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
            <!-- 제목 -->
            <td><a href="${contextRootPath}/app/recruit_board/${list.teamNo}">${list.teamTitle}</a></td>
            <!-- 팀명 -->
            <td>${list.team.teamName }</td>
            <!-- 지역 -->
            <td>${list.team.teamArea }</td>
            <!-- 게시글 상태(모집중, 모집완료) -->
            <td><c:choose>
                <c:when test="${list.teamRcrmStatus == 0}"> 모집중 </c:when>
                <c:otherwise>모집마감</c:otherwise>
              </c:choose></td>
            <!-- 게시글 작성일 -->
            <td>${list.teamCreatedDate}</td>
            <!-- 조회수 -->
            <td>${list.teamViewCount}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <c:forEach items="${member}" var="member">
      <c:if test="${sessionScope.loginUser.id eq member.id && member.teamMember.teamLeader == 'true'}">
        <div id="in">
          <div id="write-btn">
            <a class="input-group-btn1 btn btn-dark" href="${contextRootPath}/app/recruit_board/form">글쓰기</a>
          </div>
        </div>
      </c:if>
    </c:forEach>
  </div>
  
<jsp:include page="../sidebar/commonSidebarBottom.jsp"/>

  <jsp:include page="../footer.jsp" />

  <!-- SCRIPTS -->
  <!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.2/js/mdb.min.js"></script>
  <!-- MDBootstrap Datatables  -->
<script type="text/javascript" src="${contextRootPath}/node_modules/mdbootstrap/js/addons/datatables.min.js"></script>

  <script>
			var lang_kor = {
				"lengthMenu" : "_MENU_ 개씩 보기",
				"search" : "검색 : ",
				"zeroRecords" : "검색된 데이터가 없습니다.",
				"searchPlaceholder" : "검색어 입력",
				"paginate" : {
					"next" : "다음",
					"previous" : "이전"
				}
			};

			$(document).ready(function() {
				$('#dtBasicExample').DataTable({
					order : [ [ 1, "desc" ] ],
					"info" : false,
					language : lang_kor
				});
				$('.dataTables_length').addClass('bs-select');
			});
		</script>
</body>
</html>