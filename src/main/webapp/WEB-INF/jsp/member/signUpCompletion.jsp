<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입완료</title>
<jsp:include page="../commonCss.jsp"/>
<link rel="stylesheet" href="${contextRootPath}/css/signUpCompletion.css">
</head>
<body>

<div id="container">
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
          <p>상세정보를 입력하시면<br> <strong>개인 맞춤 서비스</strong>를 제공 받을 수 있습니다.</p>
        </div>
        <div id="addBtnArea">
          <a class="btn btn-primary btn-lg" href="additional-form" id="addBtn">상세정보 입력하기</a>
        </div><!-- #successButton -->
        <div id="mainBtnArea">
          <a class="btn btn-primary btn-lg" href="../main" id="mainBtn">메인화면</a>
        </div>
      </div><!-- #successContent -->
    </div><!-- #successBox -->
  </div><!-- #content -->
</div><!-- #container -->

</body>
</html>