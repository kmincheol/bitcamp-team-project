<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입완료</title>
<jsp:include page="../commonCss.jsp"/>
<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />
<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />
<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
<link rel="stylesheet" href="${contextRootPath}/css/signUpCompletion.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />
<jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />

<div class="container" id="container">
  <div id="content">
  
      <div id="checkImg">
        <img src="${contextRootPath}/images/signUpCheck.png">
      </div>
  
    <div id="successBox">
      <div id="successContent">

        <div id="successComment">
          <p>회원가입이 <strong>완료</strong> 되었습니다.</p>
        </div>
        <div id="addComment">
          <p>추가정보를 입력하시면<br> <strong>개인 맞춤 서비스</strong>를 제공 받을 수 있습니다.</p>
        </div>
        <div id="addBtnArea">
          <a class="btn btn-lg btn-outline-dark" href="additional-form" id="addBtn">추가정보 입력하기</a>
        </div><!-- #successButton -->
        <div id="mainBtnArea">
          <a class="btn btn-lg btn-outline-dark" href="../main" id="mainBtn">메인화면</a>
        </div>
      </div><!-- #successContent -->
    </div><!-- #successBox -->
  </div><!-- #content -->
</div><!-- #container -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />
<jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />
<jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />
</body>
</html>