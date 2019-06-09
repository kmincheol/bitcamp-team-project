<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kakao 로그인</title>
<style>
#kakaoBtn {
  display: inline-block;
  background: #fef01b;
  color: #444;
  width: 190px;
  border-radius: 5px;
  border: thin solid #fef01b;
  box-shadow: 0.4px 0.4px 0.4px lightgrey;
  white-space: nowrap;
}
#kakaoBtn:hover {
  cursor: pointer;
}
span.label {
  font-family: serif;
  font-weight: normal;
}
span.icon {
  background: url('${contextRootPath}/images/kakao.png') transparent 5px 50% no-repeat;
  display: inline-block;
  vertical-align: middle;
  width: 42px;
  height: 42px;
}
span.buttonText {
  display: inline-block;
  vertical-align: middle;
  font-size: 14px;
  font-weight: bold;
  font-family: 'Roboto', sans-serif;
  padding-left:   
}
</style>
</head>
<body>
<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>

<div id="kakaoBtn" class="kakaoSignIn">
  <span class="icon"></span>
  <span class="buttonText">Kakao로 계속하기</span>
</div>

<script>
$(function() {
  
  var kakao = 'kakao';
  var naver = 'naver';
  var google = 'google';
  var facebook = 'facebook';
  
  $('#kakaoBtn').click(function() {windowopenPopup(kakao);});
});

function windowopenPopup(type) {
  var popupX = (window.screen.width / 2) - (600 / 2);
  var popupY= (window.screen.height / 2) - (600 / 2);
  
  window.open(
      type +'Signin', 
      type +' 로그인', 
      'width=600, height=600, left=' + popupX +
      ', top=' + popupY + ', toolbar=no, menubar=no, location=no, status=no'
      );
}
</script>

</body>
</html>