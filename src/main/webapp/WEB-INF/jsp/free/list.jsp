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
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">

<style>
/* 페이지 컨트롤러 가운데 정렬 style */

.container {
font-family: 'Do Hyeon', sans-serif;
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

  <div id="main-wrap" class="container">

    <div id="main-text">
      <h2>
        <img src="${contextRootPath}/images/edit.png">자유게시판
      </h2>
    </div>
 
    <table id="dtBasicExample" class="table" cellspacing="0" width="100%" style="text-align: center">
      <thead>
        <tr>
          <th class="th-sm">번호</th>
          <th id="free-title" class="th-sm">제목</th>
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
      <c:if
        test="${sessionScope.loginUser != null}">
        <div id="in">
          <div id="write-btn">
            <a class="input-group-btn1 btn btn-dark"
              href="${contextRootPath}/app/free/form">글쓰기</a>
          </div>
        </div>
      </c:if>
      
      
      <!--  기존 페이지네이션 -->
      <%--   <nav aria-label="목록 페이지 이동">
  <ul class="pagination justify-content-center">
    <li class="page-item ${pageNo <= 1 ? 'disabled' : ''}"><a class="page-link" 
    href="?pageNo=${pageNo-1}&pageSize=${pageSize}">이전</a></li>
    
    <c:choose>
    
    <c:when test="${rowCount <= pageSize*3}">
      <c:forEach var="no" begin="1" end="${totalPage}" step="1">
        <li class="page-item"><a class="page-link" href="?pageNo=${no}&pageSize=${pageSize}">${no}</a></li>
      </c:forEach>
    </c:when>
        
    <c:otherwise>
      <c:choose>
        <c:when test="${pageNo == 1}">
          <c:forEach var="no" begin="1" end="3" step="1">
          <li class="page-item"><a class="page-link" href="?pageNo=${no}&pageSize=${pageSize}">${no}</a></li>
          </c:forEach>
        </c:when>
        <c:when test="${pageNo == totalPage}">
          <c:forEach var="no" begin="${totalPage-2}" end="${totalPage}" step="1">
          <li class="page-item"><a class="page-link" href="?pageNo=${no}&pageSize=${pageSize}">${no}</a></li>
          </c:forEach>
        </c:when>
      <c:otherwise>
        <c:forEach var="no" begin="${pageNo-1}" end="${pageNo+1}" step="1">
          <li class="page-item"><a class="page-link" href="?pageNo=${no}&pageSize=${pageSize}">${no}</a></li>
        </c:forEach>
      </c:otherwise>
      </c:choose>
    </c:otherwise>
    
    </c:choose>
    
    
    
    <li class="page-item ${pageNo == totalPage ? 'disabled' : ''}"><a class="page-link" 
    href="?pageNo=${pageNo+1}&pageSize=${pageSize}">다음</a></li>
  </ul>
</nav>
  </div> --%>

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
          order : [ [ 1, "desc" ] ],
          "info" : false,
          "paging" : true,
          language : lang_kor
        });
        $('.dataTables_length').addClass('bs-select');
      });
    </script>

</body>
</html>