<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">
<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />
<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />
<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
<!-- auth-form -->
<link rel="stylesheet" href="${contextRootPath}/css/auth_form.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">
  <!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/mdb.min.css" rel="stylesheet">
<!-- sns Login -->
<link rel="stylesheet" href="${contextRootPath}/css/snsLogin.css">
<!-- Jua -->
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<style>
.custom-control-input:checked ~.custom-control-label::before {
	color: #fff;
	border-color: #262626;
	background-color: #262626;
}
</style>
</head>
<body>
<jsp:include page="../commonSideHeaderFooter/commonHeader.jsp"/>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp"/>
  
  <div class="container container-fluid" id="all">
    <form action='login' method='post'>
    <div style="height: 500px;
    width: 500px;
    margin: 0 auto;
    background: white;
    border-radius: 5%;
    padding-top: 50px;">
    
      <div class="snsLoginBox">
        <h6 class="snsLoginHeading">소셜 로그인으로 더 빠르게 시작하세요!</h6>
        
        <div class="snsLoginBtnBox">
          <span id="facebookBtnAuth" class="snsLoginBtn">
            <img src="${contextRootPath}/images/facebookLogo.png" class="snsBtn facebookBtn">
          </span>
        
          <span id="naverBtnAuth" class="snsLoginBtn">
            <img src="${contextRootPath}/images/naverLogin.png" class="snsBtn">
          </span>
        
          <span id="kakaoBtnAuth" class="snsLoginBtn">
            <img src="${contextRootPath}/images/kakaoIcon.png" class="snsBtn">
          </span>
        
          <span id="googleBtnAuth" class="snsLoginBtn">
            <img src="${contextRootPath}/images/g-normal.png" class="snsBtn">
          </span>
        </div>
      </div>
    
      <div class="md-form">
        <i class="fas fa-user prefix"></i> <input autocomplete=off type="text" id="inputIconEx2"
          class="form-control" aria-describedby="emailHelp" name='id' value='${cookie.id.value}'>
        <label for="inputIconEx2">Username</label> <small id="idHelp" class="form-text text-muted">당신의
          정보를 다른 사이트와 공유하지 않습니다.</small>
      </div>
      
      <div class="md-form">
        <i class="fas fa-lock prefix"></i> <input type="password" id="inputValidationEx2"
          class="form-control validate" name='password'> <label for="inputValidationEx2"
          data-error="wrong" data-success="right">password</label>
      </div>

      <div class="md-form">
        <button type="submit" class="btn btn-dark rounded-pill" style="width: 100%;">로그인</button>
      </div>

      <div class="md-form">
        <div class="custom-control custom-checkbox" style="margin-left: 31px; top: -20px;">
          <input type="checkbox" class="custom-control-input" checked="checked"
            id="defaultUnchecked" name="saveId"> <label class="custom-control-label"
            for="defaultUnchecked">아이디 저장</label>
        </div>
        <div class="info-search">
          <a href="${contextRootPath}/app/member/findUserId">아이디찾기</a> 
          <a>/</a> 
          <a href="${contextRootPath}/app/member/findPassword">비밀번호찾기</a>
          <a>/</a> 
          <a href="${contextRootPath}/app/member/agreeTerms">회원가입</a>
        </div>
        </div>
        
      </div>
    </form>
    
  </div>
  <!-- JQuery -->
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp"/>
  
  <!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.2/js/mdb.min.js"></script>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp"/>
  
  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp"/>
  
<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>
<script src="${contextRootPath}/js/rootpath.js"></script>
<script>
$(function() {
  
  var facebook = 'facebook';
  var naver = 'naver';
  var kakao = 'kakao';
  var google = 'google';
  
  $('#facebookBtnAuth').click(function() {windowopenPopup(facebook);});
  $('#naverBtnAuth').click(function() {windowopenPopup(naver);});
  $('#kakaoBtnAuth').click(function() {windowopenPopup(kakao);});
  $('#googleBtnAuth').click(function() {windowopenPopup(google);});
  
});

function windowopenPopup(type) {
  var popupX = (window.screen.width / 2) - (600 / 2);
  var popupY= (window.screen.height / 2) - (600 / 2);
  
  window.open(
      rootpath + 'app/auth/snsSignin?loginType=' + type, 
      type +' 로그인', 
      'width=600, height=600, left=' + popupX +
      ', top=' + popupY + ', toolbar=no, menubar=no, location=no, status=no'
      );
} 
</script>


</body>
</html>
