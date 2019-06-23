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
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
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
						<li><a href="${contextRootPath}/app/main">Home</a></li>
            <c:if test="${empty sessionScope.loginUser}">
            <li><a href="${contextRootPath}/app/auth/form">Login</a></li>
            </c:if>
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
<script>
$(function() {
  
  var facebook = 'facebook';
  var naver = 'naver';
  var kakao = 'kakao';
  var google = 'google';
  
  $('#facebookBtn').click(function() {windowopenPopup(facebook);});
  $('#naverBtn').click(function() {windowopenPopup(naver);});
  $('#kakaoBtn').click(function() {windowopenPopup(kakao);});
  $('#googleBtn').click(function() {windowopenPopup(google);});
  
});

function windowopenPopup(type) {
  var popupX = (window.screen.width / 2) - (600 / 2);
  var popupY= (window.screen.height / 2) - (600 / 2);
  
  window.open(
      'auth/snsSignin?loginType=' + type, 
      type +' 로그인', 
      'width=600, height=600, left=' + popupX +
      ', top=' + popupY + ', toolbar=no, menubar=no, location=no, status=no'
      );
}
</script>
</body>
</html>