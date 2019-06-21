<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>공지사항 게시판</title>
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
<link href="${contextRootPath}/node_modules/mdbootstrap/css/addons/datatables.min.css" rel="stylesheet">
     

<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">

<link rel="stylesheet" href="${contextRootPath}/css/announce_board/announce_list.css">

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
    <img src="${contextRootPath}/images/announce.jpg" style="width: 100%; height: 100%;">
    <h1>공지사항</h1>
  </div>

  <div class="container" id="main-wrap">
   
      <table id="dtBasicExample" class="table" cellspacing="0" width="100%" style="text-align: center">
        <thead>
          <tr>
            <th class="th-sm">번호</th>   
            <th class="th-sm">제목</th>
            <th class="th-sm">작성자</th>
            <th class="th-sm">작성일</th>
            <th class="th-sm">조회</th>    
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${list}" var="announce">
            <tr>
              <td scope="row">${announce.no}</td>
              
              <td><a href='${contextRootPath}/app/announce/${announce.no}'>${announce.title}</a></td>
              
              <td>
              <!-- popover 적용됨 -->
					<div class="form">
            	<a href='#' class="js-tooltip-trigger" id="ref">${announce.member.name}</a>
          		<span class="js-tooltip" style="display: none;">
          			<strong>아이디:</strong>
          			${announce.member.id}<br>
          			<strong>연락처:</strong>
          			${announce.member.tel}<br>
          			<strong>이메일:</strong>
          			${announce.member.email}
            	</span>
       	 </div>
				<!-- popover끝 -->
              </td>
              <td>${announce.createdDate}</td>
              <td>${announce.viewCount}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

    <c:if test="${!empty sessionScope.loginUser}">
      <c:if test="${sessionScope.loginUser.manager}">
        <div id="in">
          <div id="write-btn">
            <a href='${contextRootPath}/app/announce/form' class="btn btn-outline-dark">새 글</a>  
          </div>
        </div>
      </c:if>
    </c:if>

  </div>
  <!-- .container -->   

   <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />
  
</body>

<script>
$(function () {
	  $('.js-tooltip-trigger').each(function(ind, ele){
	    
	    var $ele = $(ele),
	        $ttSpan = $ele.next('.js-tooltip'),
	        ttHtml = $ttSpan.html(),
	        rndID = 'ttid'+ String(Math.random()).substr(2);
	    
	    $ttSpan.attr('id', rndID).removeAttr('style').html('');
	    
	    $ele.popover({
	    	trigger: 'click',
	  		html: true,
	    	trigger: 'focus', 
	    	placement: 'right',
	    	container: '#'+rndID, 
	    	content: ttHtml
	  	});
	  });
	});
</script>
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


</html>







