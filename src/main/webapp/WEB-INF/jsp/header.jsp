<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>모집게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/header.css">

</head>

<body>

  <!-- 헤더 -->
  <div id="header">

    <div id="header-top">
      <!-- 헤더 로고 이미지 -->
      <div id="header-img">
        <a href="${contextRootPath}/app/main"><img src="${contextRootPath}/images/logo.png"
          class="headerImg"></a>
      </div>
      <div id="header-item">
        <c:if test="${sessionScope.loginUser == null}">
          <a href="${contextRootPath}/app/auth/form">로그인</a>
        </c:if>
        <c:if test="${sessionScope.loginUser != null}">
          <a href="${contextRootPath}/app/auth/logout">로그아웃</a>
        </c:if>
        <c:if test="${sessionScope.loginUser == null}">
          / <a href="${contextRootPath}/app/member/agreeTerms">회원가입</a>
        </c:if>
        / <a href="#">고객센터</a>
      </div>
    </div>

    <div id="header-cate">
      <ul class="nav justify-content-center">
        <div class="header-category">
          <li class="nav-item"><a class="nav-link" href="${contextRootPath}/app/main">메인</a></li>
        </div>
        <div class="header-category">
          <li class="nav-item"><a class="nav-link" href="#">매치</a>
            <ul class="category">
              <li class="nav-item"><a class="nav-link" href="${contextRootPath}/app/matchboard">매치보드</a></li>
              <li class="nav-item"><a class="nav-link" href="${contextRootPath}/app/matchboard/form.jsp">매치등록</a></li>
            </ul></li>
        </div>
        <div class="header-category">
          <li class="nav-item"><a class="nav-link" href="#">팀</a>
            <ul class="category">
              <li class="nav-item"><a class="nav-link" href="${contextRootPath}/app/team/form">팀생성</a></li>
              <li class="nav-item"><a class="nav-link" href="${contextRootPath}/app/team">팀정보</a></li>
              <li class="nav-item"><a class="nav-link"
                href="${contextRootPath}/app/recruit_board">모집게시판</a></li>
            </ul></li>
        </div>
        <div class="header-category">
          <li class="nav-item"><a class="nav-link" href="#">커뮤니티</a>
            <ul class="category">
              <li class="nav-item"><a class="nav-link" href="${contextRootPath}/app/announce">공지사항</a></li>
              <li class="nav-item"><a class="nav-link" href="${contextRootPath}/app/free">자유게시판</a></li>
              <li class="nav-item"><a class="nav-link" href="${contextRootPath}/app/question">고객센터</a></li>
            </ul></li>
        </div>
        <div class="header-category">
          <li class="nav-item"><a class="nav-link" href="#">마이페이지</a>
            <ul class="category">
              <c:if test="${sessionScope.loginUser != null}">
                <li class="nav-item"><a class="nav-link"
                  href="${contextRootPath}/app/member/${sessionScope.loginUser.no}">개인정보</a></li>
              </c:if>
              <li class="nav-item"><a class="nav-link" href="#">나의 팀 정보</a></li>
            </ul></li>
        </div>
    </div>
  </div>


  <jsp:include page="javascript.jsp" />
  <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

  <script>
			$(document).ready(function() {
				var catebar = $('#header-cate').offset();
				$(window).scroll(function() {
					if ($(document).scrollTop() > catebar.top) {
						$('#header-cate').addClass('fixed');
					} else {
						$('#header-cate').removeClass('fixed');
					}
				});
			});
		</script>

</body>
<!-- <footer>
        
  </footer> -->

</html>