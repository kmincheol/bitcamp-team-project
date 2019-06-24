<%@page import="com.eomcs.lms.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 상세조회</title>
<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer1.css">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css"
	rel="stylesheet">


<style>
.container {
	font-family: 'Nanum Gothic', sans-serif;
}

div.button input {
	position: relative;
	top: 50px;
	padding: 5px;
	width: 100%;
	font-size: 18px;
}

h2 {
	text-align: center;
	margin: 15px;
}

h4 {
	text-align: center;
	margin: 15px;
}

h6 {
	text-align: center;
	margin: 15px;
}

.button {
	border: 1px solid black;
	height: 220px;
}

.page-content {
	height: 641px;
}
.hoverdiv:hover{    
box-shadow: 0px 0px 10px 3px gray;  
}
.footer{
margin-top: 0px!important;
}
</style>  
</head>
<body>
	<jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />
	<jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />

	<c:choose>
		<c:when test="${empty member}">
			<p>해당하는 회원이 없습니다.</p>
		</c:when>

		<c:otherwise>
			<div class="container">
				<div style="margin-top: 100px;">
					<h2>
						<b style="color: brown;">${member.name}</b>님! <br> 안전한 정보 관리를
						위해 <br>비밀번호를 주기적으로 변경해주세요.
					</h2>
					<h6 style="margin-bottom: 80px;">SNS 계정 사용자는 비밀번호 변경이 불가합니다.</h6>
				</div>
				<input class="loginType" type="hidden" value="${member.loginType}">     
				<div> 
				<div class="hoverdiv" style="width: 500px; height: 300px; border-radius: 5px; float: left; 
				    box-shadow: 0px 0px 10px -2px grey; margin-left: 50px; text-align: center;">
					<div style="margin-top: 60px">        
						<h4>프로필 변경</h4>
						<h6>프로필 사진 및 기본 정보를 변경할 수 있습니다.</h6>
					</div>
					<input class="prof_no" type="hidden" value="${member.no}">            
					<button class="prof-btn btn btn-dark" style="margin-top: 50px; width: 300px; height: 60px;">변경하기</button>
				</div>                 

				<div class="hoverdiv" style="width: 500px; height: 300px; border-radius: 5px; float: right;
				    box-shadow: 0px 0px 10px -2px grey; margin-right: 50px; text-align: center;">
					<div style="margin-top: 60px">    
						<h4>비밀번호 변경</h4>
						<h6 class="prevMs" style="display: none;">비밀번호를 변경할 수 있습니다.</h6>
					</div>      
					<c:if test="${member.loginType == 'homepage'}">
						<button class="password-btn btn btn-dark" style="margin-top: 50px; width: 300px; height: 60px;">변경하기</button>
					</c:if>
					<c:if test="${member.loginType != 'homepage'}">
						<br>
						<br>
						<h6 class="message" style="color: red;">SNS 계정 사용자는 비밀번호 변경이
							불가합니다.</h6>
					</c:if>
				</div>       
				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<jsp:include page="../commonSideHeaderFooter/commonSidebarBottom1.jsp" />

	<jsp:include
		page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

	<jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />


	<script>
		$(document).ready(function() {

			var login = $('.loginType').val();

			if (login != 'homepage') {
				$('.prevMs').hide();
			} else {
				$('.prevMs').show();
				$('.password-btn').show();
			}

		});

		$('.prof-btn').on('click', function() {
			var no = $('.prof_no').val();
			no2 = btoa(no);
			location = "profUpdate/" + no2;
			/* location="profUpdate/" + no; */
		});

		$('.password-btn').on('click', function() {
			var no = $('.prof_no').val();
			no2 = btoa(no);
			location = "passwordUpdate/" + no2;
		});
	</script>
</body>
</html>
