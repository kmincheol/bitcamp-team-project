<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Google 로그인 실패</title>
</head>
<body>
<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>
<script>
$(document).ready(function () {
  alertMsg();
});
        
function alertMsg() {
  var type = "${login_type}";
          
  if (type == "noEmail") {
    alert('회원가입 및 로그인에 이메일 정보가 반드시 필요합니다.\n' + 
        'google 계정 - 보안 - 다른 사이트 로그인 수단\n' +
        '- Google 계정을 통한 로그인 에서 BATTLE MATCHING을 \n' + 
        '삭제하신 후 다시 회원가입 및 로그인을 시도해주시고, \n' + 
        '정보제공설정에서 이메일 정보 제공에 동의해주세요.');
    self.close();
  } else if (type == "cancel") {
    self.close();
  } else {
    alert('이 이메일로 이미 가입된 계정이 존재합니다. \n 로그인 유형 : ' + type);
    self.close();
  } 
}
</script>
</body>
</html>