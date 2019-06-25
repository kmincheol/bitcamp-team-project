<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>모집게시판_detail</title>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- detail css -->
<link rel="stylesheet"
	href="${contextRootPath}/css/recruit_board/recruit_board_detail.css">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
  
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <script src="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
<link href="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet"> 
</head>

<body>
	<jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />
	<jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />

	<div id="main-text" style="margin-bottom: 40px;">
		<img src="${contextRootPath}/images/recruit.png"
			style="width: 100%; height: 100%;">
		<h1>모집 게시판</h1>
	</div>

	<div id="main-wrap" class="container"
		style="box-shadow: 0px 0px 10px 0px darkgrey; padding: 15px; margin-bottom: 100px;">
		<form action='update' method='post' name="remove"
			enctype='multipart/form-data'>
			<div id="title-wrap" class="form-group row">
				<div id="title-row" class="col-sm-12">
					<div id="title" name="teamTitle">${teamRecruit.teamTitle}</div>
				</div>
				<div id="teamName-row" class="col-sm-12">
					<span id="teamName" name="teamName">${teamRecruit.team.teamName}</span>
					<span>|</span> <span id="createdDate" name="createdDate">${teamRecruit.teamCreatedDate}</span>
					<span>|</span> <span id="viewCount" name="teamViewCount">${teamRecruit.teamViewCount}</span>
				</div>
			</div>
			<div id="contents-wrap">
				<div id="info-wrap">
					<table class="info-table">
						<tr>
							<th style="border-left: 1px solid #ccc;">
								<div>종목</div>
							</th>
							<td>
								<div id="sportsType" name="teamSportsType">${teamRecruit.teamTypeSports.teamSportsType}</div>
							</td>
							<th>
								<div>지역</div>
							</th>
							<td style="border-right: 1px solid #ccc;">
								<div id="location" name="teamArea">${teamRecruit.topLocation.topLocationName}</div>
							</td>
						</tr>
					</table>
				</div>

				<div id="contents-section">
					<div class="contents-section-head">
						<div>내용</div>
					</div>
					<div class="contents-section-body">
						<div class="contents">${teamRecruit.teamContents}</div>
					</div>
				</div>
				<div id="control-box" class="form-group row">
					<div class="col-sm-12 text-center">
						<a class="btn btn-outline-dark"
							href='${contextRootPath}/app/recruit_board' style="width: 80px;">목록</a>
						<c:forEach var="teamMember" items="${teamMember}">
							<c:if
								test="${teamMember.memberNo eq sessionScope.loginUser.no && teamMember.teamLeader == 'true'}">
								<button type="button" id="dd" class="btn btn-outline-dark" onclick="removeCheck()"
									 style="width: 80px;">삭제</button>
								<a class="btn btn-outline-dark"
									href='${contextRootPath}/app/recruit_board/update/${teamRecruit.teamNo}'
									style="width: 80px;">변경</a>
                  <a class="btn btn-outline-dark" onclick="return removeCheck1()"
                  href='delete/${teamRecruit.teamNo}'>모집마감</a>
							</c:if>     
						</c:forEach>
						<c:set var="doneLoop" value="false" />
						<c:forEach var="team" items="${team}">
							<%-- <c:if test="${team.teamId != teamRecruit.teamId}"> --%>
							<input type="hidden" class="teamId" value="${team.teamId}">
							<input type="hidden" id="ReteamId" value="${teamRecruit.teamId}">
							<c:set var="doneLoop" value="true" />
							<%-- </c:if> --%>
						</c:forEach>
						<button type="button" id="join1" onclick="return joinCheck()" class="btn btn-outline-dark">가입신청</button>
					</div>
				</div>
			</div>
        <input id="ddddd" type="hidden" value="${teamRecruit.teamNo}"> 
        <input id="join" type="hidden" value="${teamRecruit.teamNo}/${sessionScope.loginUser.no}"> 
		</form>
	</div>
	<!-- .container -->

	<jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

	<jsp:include
		page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

	<jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

	<script>
		$(document).ready(function() {
			$('.teamId').each(function(index, item) {
				if ($(item).val() == $('#ReteamId').val()) {
					$('#join').hide();
					return false;
				} else {
					$('#join').show();
				}
			});
		}); // ready
		
		$('#dd').on('click', function(){   
			  var ddddd = $('#ddddd').val(); 
			Swal.fire({
			      title: '정말 삭제 하시겠습니까??',
			      type: 'warning',
			      showCancelButton: true,
			      confirmButtonColor: '#3085d6',
			      cancelButtonColor: '#d33',
			      confirmButtonText: '예! 삭제하겠습니다.',
			      cancelButtonText: '아니오'
			    }).then((result) => {
			      if (result.value) {
			        Swal.fire(
			         '삭제하였습니다'
			        )
			       location.href='../recruit_board/delete/' + ddddd
			      }
			    })
			  });
		
		$('#join1').on('click', function(){  
	        var join = $('#join').val(); 
	      Swal.fire({
	            title: '신청 하시겠습니까??',
	            type: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '예! 신청하겠습니다.',
	            cancelButtonText: '아니오'
	          }).then((result) => {
	            if (result.value) {
	              Swal.fire(
	               '신청되었습니다.'
	              )
	             location.href='../recruit_board/' + join
	            }
	          })
	        });

	/* 	function removeCheck() {
			if (confirm("정말 삭제하시겠습니까??") == true) { //확인
				document.remove.submit();
				alert('삭제되었습니다.');
			} else { //취소
				return false;
			}
		} */
		    
		function removeCheck1() {
		      if (confirm("모집을 마감하시겠습니까?\n모집 마감 시 게시글이 삭제됩니다.") == true) { //확인
		        document.remove.submit();
		        alert('삭제되었습니다.');
		      } else { //취소
		        return false;
		      }
		    }

	</script>


</body>

</html>