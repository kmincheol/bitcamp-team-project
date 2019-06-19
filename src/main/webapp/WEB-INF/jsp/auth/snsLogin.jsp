<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 로그인</title>
<link rel="stylesheet" href="${contextRootPath}/css/snsLogin.css">
</head>
<body>
<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>

<div class="btnBox">
  <span id="facebookBtn">
    <img src="${contextRootPath}/images/facebookLogo.png" class="snsBtn facebookBtn">
  </span>

  <span id="naverBtn">
    <img src="${contextRootPath}/images/naverLogin.png" class="snsBtn">
  </span>

  <span id="kakaoBtn">
    <img src="${contextRootPath}/images/kakaoIcon.png" class="snsBtn">
  </span>

  <span id="googleBtn">
    <img src="${contextRootPath}/images/g-normal.png" class="snsBtn">
  </span>
</div>

<script src="${contextRootPath}/jsp/rootpath.js"></script>
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
      rootpath + 'app/auth/snsSignin?loginType=' + type, 
      type +' 로그인', 
      'width=600, height=600, left=' + popupX +
      ', top=' + popupY + ', toolbar=no, menubar=no, location=no, status=no'
      );
}
</script>

</body>
</html>