<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<title>자유게시판_list</title>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- recruit_board_list.css -->
<link rel="stylesheet" href="${contextRootPath}/css/free/free.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">

<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">

<!-- MDBootstrap Datatables  -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/addons/datatables.min.css" rel="stylesheet">

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
<!-- <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700&display=swap&subset=korean"
  rel="stylesheet">

<style>
/* 페이지 컨트롤러 가운데 정렬 style */
.container {
	font-family: 'Nanum Gothic', sans-serif;
}

.pagination {
	display: inline-flex;
}

div.dataTables_wrapper div.dataTables_paginate {
	text-align: left;
	width: 100%;
}

.th-sm {
	text-align: center;
}

/* 테이블 헤더 색상 변경 */
.dataTable thead tr {
	background-color: #f9f7f7;
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
	background-color: #f7f4f4;
}
/* 테이블 목록 hover 색상 변경 */
#dtBasicExample tbody tr:hover>.sorting_1 {
	/* background-color: #ffa; */
	
}

table tbody tr {
	height: 80px;
	vertical-align: center;
}

.table>tbody>tr>td {
	vertical-align: middle;
}





</style>

</head>
<body>

  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />


 <div id="main-text">
 <img src="${contextRootPath}/images/freeboard2.png" style="width:100%; height:100%;">
      <h1>
       자유 게시판
      </h1>      
    </div>
    

  <div id="main-wrap" class="container">

  

    <table id="dtBasicExample" class="table" cellspacing="0" width="100%" style="text-align: center">
      <thead>
        <tr>
          <th class="th-sm">번호</th>
          <th class="th-sm">제목</th>
          <th class="th-sm">작성자</th>
          <th class="th-sm">작성일</th>
          <th class="th-sm">조회수</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${list}" var="free">
          <tr>
            <!-- 게시글 번호 -->
            <td>${free.no}</td>
            <td><a href='${contextRootPath}/app/free/${free.no}'>${free.title}</a></td>
            <td>${free.member.name}</td>
            <td>${free.createdDate}</td>
            <td>${free.viewCount}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <c:if test="${sessionScope.loginUser != null}">
      <div id="in">
        <div id="write-btn">
          <a class="input-group-btn1 btn btn-outline-dark" href="${contextRootPath}/app/free/form">글쓰기</a>
        </div>
      </div>
    </c:if>
  </div>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

  <!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  -->

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
					order : [ [ 0, "desc" ] ],
					"info" : false,
					"paging" : true,
					language : lang_kor
				});
				$('.dataTables_length').addClass('bs-select');
			});
		</script>

</body>
</html>