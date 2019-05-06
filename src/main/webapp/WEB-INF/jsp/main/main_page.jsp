<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>팀원 구함(뷰페이지)</title>
<!--  <jsp:include page="../commonCss.jsp"/> -->
<link rel="stylesheet"
	href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/mainpage.css">
</head>
<body>


	<div class="container">
		<div id="main-backgroundImg">
			<img src="${contextRootPath}/images/mainpage.jpg" class="img-fluid">
		</div>

		<div id="header">
			<nav class="navbar navbar-expand-lg justify-content-center">
				<a href="#"><img src="${contextRootPath}/images/logo.png"
					class="headerImg"></a>
			</nav>

			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link" href="#">메인</a></li>
				<li class="nav-item"><a class="nav-link" href="#">매치</a></li>
				<li class="nav-item"><a class="nav-link" href="#">팀</a></li>
				<li class="nav-item"><a class="nav-link" href="#">커뮤니티</a></li>
				<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
			</ul>
		</div>

		<div id="main-text">
			<h1>S P O R T S - M A T C H I N G</h1>
		</div>

		<div class="search-form">
			<div class="cell option"></div>

		</div>
		<!-- <ul class="list-group list-group-horizontal-lg">
                    <li class="list-group-item">종목</li>
                    <li class="list-group-item">지역</li>
                    <li class="list-group-item">날짜</li>
                    <li class="list-group-item">검색</li>
                </ul> -->

	</div>
	<!-- .container -->


	<jsp:include page="../javascript.jsp" />
</body>
</html>
