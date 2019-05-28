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

<jsp:include page="../header.jsp"/>

<div id="container">
  <div id="content">
  
    <h1>스포츠 매칭 <strong>홈페이지</strong> 방문을 환영합니다.</h1>
  
    <div class="join_step"><!-- step단계표현 -->
      <img src="../../images/signUp3.png">
    </div>
    
    <hr class="hrblack"/>
  
    <div id="successBox">
      <div id="successContent">
        <div id="checkImg">
          <img src="../../images/signUpCheck.png">
        </div>
        <div id="successComment">
          <p>회원가입이 <strong>완료</strong> 되었습니다.</p>
        </div>
        <div id="loginComment">
          <p>로그인해주시기 바랍니다.</p>
        </div>
        <hr class="hrSlim">
      </div><!-- #successContent -->
      <div id="successButton">
        <span id="leftBtnBox">
          <a class="btn btn-primary btn-lg" href="../main" id="mainBtn">메인화면</a>
        </span>
        <span id="rightBtnBox">
          <a class="btn btn-primary btn-lg" href="../auth/form" id="loginBtn">로그인</a>
        </span>        
      </div><!-- #successButton -->
    </div><!-- #successBox -->
  </div><!-- #content -->
</div><!-- #container -->

</body>
</html>