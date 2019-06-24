<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>모집게시판_list</title>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- recruit_board_list.css -->
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board/recruit_board_list.css">

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

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
/* 페이지 컨트롤러 가운데 정렬 style */
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
    <img src="${contextRootPath}/images/recruit.png" style="width: 100%; height: 100%;">
    <h1>모집 게시판</h1>
  </div>
  
  <div id="main-wrap" class="container">
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
                  <img src="${contextRootPath}/images/football_list.png" style=" width: 30px; height: 30px;">
                </c:when>
                <c:when test="${list.teamTypeSports.teamSportsType eq '농구'}">
                  <img src="${contextRootPath}/images/basketball_list.png" style=" width: 30px; height: 30px;">
                </c:when>
                <c:when test="${list.teamTypeSports.teamSportsType eq '야구'}">
                  <img src="${contextRootPath}/images/baseball_list.png" style=" width: 30px; height: 30px;">
                </c:when>
                <c:when test="${list.teamTypeSports.teamSportsType eq '탁구'}">
                  <img src="${contextRootPath}/images/pingpong_list.png" style=" width: 30px; height: 30px;">
                </c:when>
              </c:choose></td>
            <!-- 제목 -->
            <td><a href="${contextRootPath}/app/recruit_board/${list.teamNo}">${list.teamTitle}</a></td>
            <!-- 팀명 -->
           <td>
           <a tabindex="0" class="btn popovers" role="button" data-toggle="popover" data-trigger="focus"
              title="팀명 : ${list.team.teamName }"
              data-content="종목 : ${list.teamTypeSports.teamSportsType}<br>연령대 : ${list.teamAges.teamAges}<br>
              " style="cursor: pointer">${list.team.teamName }</a><br>
              <a class='openTm' href='#' title='test add link' style="font-size:12px;">상세정보
                <input id="tmNo" type="hidden" value="${list.team.teamId}">
              </a>  
            </td>       
            <!-- 상세정보검색 -->
            
              <%-- <td><a tabindex="0" role="button"
              data-toggle="popover" data-trigger="focus" title="${list.team.teamName }"
              data-content="종목 : ${list.teamTypeSports.teamSportsType}<br>
              ">${list.team.teamName }</a><br>
              <a href='#' id="openTm2" class="openTm" title='test add link'>상세정보</a>
              <input id="openTm1" value="${list.team.teamName}" type="hidden">
              </td>   --%>
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
      <c:if
        test="${sessionScope.loginUser.id eq member.id && member.teamMember.teamLeader == 'true'}">
        <div id="in">
          <div id="write-btn">
            <a class="input-group-btn1 btn btn-outline-dark"
              href="${contextRootPath}/app/recruit_board/form">글쓰기</a>
          </div>
        </div>            
      </c:if>      
    </c:forEach>
  </div>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

  <!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  -->
  
  <script>
			$(function() {
				$('[data-toggle="popover"]').popover({
					html : true
				})
			})

		
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
			$('.dataTables_length').addClass('bs-select');

		
			$(document).ready(function() {
								$('#dtBasicExample').DataTable({
									order : [ [ 1, "desc" ] ],
									"info" : false,
									"paging" : true,
									language : lang_kor
								});

			/* 상세정보검색 */
			$('.openTm').on('click',function() {
			/* window.name = "parentForm"; */
      var no = $(this).children().val();
			console.log(no)
			window.open("${contextRootPath}/app/team/" + no,"childForm","width=800, height=750, resizable = no, scrollbars = no");  
					}); 
			});
		</script>
</body>
</html>