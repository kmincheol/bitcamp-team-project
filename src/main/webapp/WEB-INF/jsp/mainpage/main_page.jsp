<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>main page</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- header -->
<link rel="stylesheet" href="${contextRootPath}/css/mainpage-header.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<jsp:include page="../mainSidebar/commonSidebarCss.jsp" />
</head>

<body>
	<jsp:include page="../mainSidebar/commonSidebarTop.jsp" />
	<!-- 본문 영역 -->
	<div class="container-fluid">
		<header>
			<nav class="header-nav">
				<div class="menu">
					<ul>
						<li><a href="${contextRootPath}/app/auth/form">로그인</a></li>
						<li><a href="#">About</a></li>
						<li><a href="#">Blog</a></li>
					</ul>
				</div>
			</nav>
		</header>
	</div>
	<jsp:include page="../mainSidebar/commonSidebarBottom.jsp" />
	
	<script type="text/javascript">
		// Scrolling Effect

		$(window).on("scroll", function() {
			if ($(window).scrollTop()) {
				$('nav').addClass('black');
			} else {
				$('nav').removeClass('black');
			}
		})
	</script>

</body>
</html>