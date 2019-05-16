<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>공지사항 게시판</title>
	<meta charset="UTF-8">
   <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap-theme.min.css">
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <link rel="stylesheet" href="${contextRootPath}/css/announce.css">
</head>

<body>

<jsp:include page="header.jsp" />

  <div class="container">
    <h3>공지사항</h3>
    
<c:if test="${!empty sessionScope.loginUser}">
<c:if test="${sessionScope.loginUser.manager}">
    <p>
      <a href='${contextRootPath}/app/announce/form.jsp' class="btn btn-primary btn-sm" >새 글</a>
    </p>
</c:if>    
</c:if>
    
    <br>
    <div class="announce-list">
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">번호</th>
            <th id="announce-title" scope="col" width="300px">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${list}" var="announce">
            <tr>
              <th scope="row">${announce.no}</th>
              
              <td><a href='${contextRootPath}/app/announce/${announce.no}'>${announce.title}</a></td>
              
              <td>
              <!-- popover 적용됨 -->
					<div class="form-group pos-relative">
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
    </div>
    <!-- .bit-list -->

    <nav aria-label="목록 페이지 이동">
  <ul class="pagination justify-content-center">
  
    <li class="page-item ${pageNo <= 1 ? 'disabled' : ''}">
    <a class="page-link" href="?pageNo=${pageNo -  1}&pageSize=${pageSize}">이전</a></li>
    
    <li class="page-item ${pageNo <= 1 ? 'disabled' : ''}">
    <a class="page-link" href="?pageNo=${pageNo - 1}&pageSize=${pageSize}">${pageNo <= 1 ? "-" : pageNo - 1}</a></li>
    
    <li class="page-item active"><span class="page-link">${pageNo}</span></li>
    
    <li class="page-item ${pageNo >= totalPage ? 'disabled' : ''}">
    <a class="page-link" href="?pageNo=${pageNo + 1}&pageSize=${pageSize}">${pageNo >= totalPage ? "-" : pageNo + 1}</a></li>
    
    <li class="page-item ${pageNo >= totalPage ? 'disabled' : ''}">
      <a class="page-link" href="?pageNo=${pageNo + 1}&pageSize=${pageSize}">다음</a></li>
  </ul>
    </nav>

  </div>
  <!-- .container -->


  <jsp:include page="../javascript.jsp" />
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


</html>







