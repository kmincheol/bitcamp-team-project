<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">

<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">

<!-- MDBootstrap Datatables  -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/addons/datatables.min.css"
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

#main-text {
	position: relative;
	text-align: center;
	width: 100%;
	height: 230px;
	border-bottom: 2px solid black;
	margin-bottom: 40px;
}

#main-text h1 {
	text-shadow: 4px 4px 6px black;
	position: relative;
	top: -60%;
	color: white;
}

.footer {
	margin-top: 18px !important;
}
</style>
</head>
<body>
  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />
  <div id="main-text">
    <img src="${contextRootPath}/images/국대.jpg" style="width: 100%; height: 100%;">
    <h1>팀 게시물</h1>
  </div>   

  <div id="main-wrap" class="container">
  <div id="cdcd" style="width:1080px;height: 50px;margin-top: 30px;">
             <div id="myTeamHeader" style="text-align: center; font-size: 20px;">
          <span style="margin : 50px;"><a href="${contextRootPath}/app/myteam"style="text-decoration:none; color:black"> 나의팀 </a> </span> 
        <span style="margin : 50px;"><a href="${contextRootPath}/app/myteam/list3/${tno}" style="text-decoration:none; color:black">요청한 경기</a></span > 
        <span style="margin : 50px;"><a href="${contextRootPath}/app/myteam/list2/${tno}" style="text-decoration:none; color:black">요청받은 경기</a></span>
        <span style="margin : 50px;"><a href="${contextRootPath}/app/myteam/list5/${tno}" style="text-decoration:none; color:black">성사된 나의 경기</a></span>
         <span style="margin : 50px; border-bottom: 2px solid #51c321;"><a href="${contextRootPath}/app/myteam/list4/" style="text-decoration:none; color:black">등록한 게시글</a></span>
                </div>
                </div>
    <table id="dtBasicExample" class="table" cellspacing="0" width="100%" style="text-align: center">
      <thead>
        <tr>
          <th class="th-sm">번호</th>
          <th class="th-sm">제목</th>
          <th class="th-sm">작성일</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${matchs}" var="matchs">
          <tr>
            <!-- 게시글 번호 -->
            <td>${matchs.no}</td>
            <td><a href='${contextRootPath}/app/matchboard/${matchs.no}' style="color:black;">${matchs.title}</a></td>
            <td>${matchs.createdDate}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <%--  <div>
 <c:forEach items="${matchs}" var="matchs">
 ${matchs.no}, 
 ${matchs.teamNo}, 
 ${matchs.teamSportsId}, 
 ${matchs.title}, 
 ${matchs.contents}, 
 ${matchs.createdDate}, 
 ${matchs.playDate}, 
 ${matchs.stadiumName}, 
 ${matchs.telephone}, 
 ${matchs.cost}
 
 </c:forEach>
 </div> --%>
  </div>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

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