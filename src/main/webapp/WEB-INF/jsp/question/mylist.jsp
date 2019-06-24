<%@page import="org.aspectj.weaver.patterns.TypePatternQuestions.Question"%>
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
<link rel="stylesheet" href="${contextRootPath}/css/footer1.css">

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

<link rel="stylesheet" href="${contextRootPath}/css/question_board/question_list.css">

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
  .dataTable thead tr
  {
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
.footer{
    margin-top: 70px!important;
    }
</style>
</head>
     
<body>

  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />
<div id="main-text">
 <img src="${contextRootPath}/images/qna.png" style="width:100%; height:100%;">
      <h1>
       나의 질문 내역
      </h1>      
    </div>

  <div class="container" id="main-wrap">
  

     
    <table id="dtBasicExample" class="table" cellspacing="0" width="100%" style="text-align: center">
      <thead>
        <tr>
          <th scope="col">번호</th>
          <th scope="col">제목</th>
          <th scope="col">작성자</th>
          <th scope="col">작성일</th>
          <th scope="col">답변상태</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${question}" var="question">
          <tr>
            <td>${question.questionNo}</td>
            <td><c:choose>
                <c:when test="${question.password == 'true'}">
                  <a href="${contextRootPath}/app/question/${question.questionNo}">${question.title}</a>
                  <img src="${contextRootPath}/images/locked.png" style="width: 20px">
                </c:when>
                <c:otherwise>
                  <a href="${contextRootPath}/app/question/${question.questionNo}">${question.title}</a>
                </c:otherwise>
              </c:choose>
            <td>${question.member.id}</td>
            <td>${question.createdDate}</td>
            <td><c:choose>   
                <c:when test="${(question.questionStatus) == 'false'}">
                  <div>답변대기</div>
                </c:when>
                <c:otherwise>
                  <div style="color:green">답변완료</div>
                </c:otherwise>
              </c:choose>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <div>
      <a id="btnbtn" class="btn  btn-outline-dark" href="${contextRootPath}/app/question">목록 이동</a>
    </div>

  </div>
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom1.jsp" />

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