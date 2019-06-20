<%@page import="com.eomcs.lms.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 상세조회</title>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<link rel="stylesheet" href="${contextRootPath}/css/free/free.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">

<!-- Material Design Bootstrap -->
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.2/css/mdb.min.css" rel="stylesheet"> -->

<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">


<style>
.container {
	font-family: 'Nanum Gothic', sans-serif;
}

div.button {
	margin: auto;
	width: 50%;
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
      <%-- <jsp:include page="../header.jsp" /> --%>

      <div class="container" id="main-wrap">
        <br> <br>
        <h2>
          <b style="color: brown;">${member.name}</b>님! <br> 안전한 정보 관리를 위해 <br>비밀번호를 주기적으로
          변경해주세요.
        </h2>
        <h6 style="margin-bottom: 80px;">SNS 계정 사용자는 비밀번호 변경이 불가합니다.</h6>
        <input class="loginType" type="hidden" value="${member.loginType}">
        <div class="row">
          <div class="col button">
            <br>
            <h4>프로필 변경</h4>
            <h6>프로필 사진 및 기본 정보를 변경할 수 있습니다.</h6>
            <input class="prof_no" type="hidden" value="${member.no}"> <input
              class="prof-btn input-group-btn btn btn-dark" type="button" value="변경하기">
          </div>

          <div class="col button">
            <br>
            <h4>비밀번호 변경</h4>
            <h6 class="prevMs" style="display: none;">비밀번호를 변경할 수 있습니다.</h6>

            <c:if test="${member.loginType == 'homepage'}">
              <input class="password-btn input-group-btn btn btn-dark" type="button"
                style="display: none" value="변경하기">
            </c:if>
            <c:if test="${member.loginType != 'homepage'}">
              <br>
              <br>
              <h6 class="message" style="color: red;">SNS 계정 사용자는 비밀번호 변경이 불가합니다.</h6>
            </c:if>

          </div>
        </div>
      </div>
    </c:otherwise>
  </c:choose>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

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
