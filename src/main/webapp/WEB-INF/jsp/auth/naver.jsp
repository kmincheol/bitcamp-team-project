<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Naver 로그인</title>
</head>
<body>
<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>

<img id="naverBtn" role="button" tabindex="0" 
onClick="windowopenPopup()" 
src="${contextRootPath}/images/naver.png" 
style="width: 220px; height: 40px;">

<script>

function windowopenPopup() {

  var popupX = (window.screen.width / 2) - (600 / 2);
  var popupY= (window.screen.height / 2) - (600 / 2);
  
  window.open(
      'naverSignin', 
      'Naver 로그인', 
      'width=600, height=600, left=' + popupX +
      ', top=' + popupY + ', toolbar=no, menubar=no, location=no, status=no'
      );
}
</script>

</body>
</html>