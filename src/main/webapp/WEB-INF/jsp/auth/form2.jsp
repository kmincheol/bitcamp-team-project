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
  
  <div class="container-fluid" id="all">
  
    <form action='login' method='post'>
    <div style="height: 500px;
    width: 500px;
    margin: 0 auto;
    background: white;
    border-radius: 5%;
    padding-top: 50px;">
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
    
    <fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button>
    
  </div>
  <!-- JQuery -->
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp"/>
  
  <!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.2/js/mdb.min.js"></script>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp"/>
  
  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp"/>
  
<script>

function autoServerLogin(accessToken) {
  
  $.getJSON('../../app/auth/fblogin', {
    "accessToken" : accessToken
  }, (data) => {
    console.log(data);
    if (data.type == "join") {
      $.getJSON('../../app/member/fbJoin', {
        "accessToken" : accessToken
      })
    } else {
      location.href = "../../app/main"
    }
  });
}

function checkLoginState() {
  FB.getLoginStatus(function(response) { 
      if (response.status === 'connected') { // 로그인이 정상적으로 되었을 때,
          autoServerLogin(response.authResponse.accessToken);
      
      } else { // 로그인이 되지 않았을 때,
          alert("페이스북 로그인에 실패했습니다!");
      }
  });
}

window.fbAsyncInit = function() {
  FB.init({
    appId      : '564771240719772',
    cookie     : true,
    xfbml      : true,
    version    : 'v3.3'
  });
    
  FB.AppEvents.logPageView();   
    
};

(function(d, s, id){
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "https://connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
</body>
</html>
