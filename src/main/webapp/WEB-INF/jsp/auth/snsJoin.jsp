<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 회원가입</title>
</head>
<body>
<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>
<script>
        $(document).ready(function () {
            checkTerms();
        });
        
        function checkTerms() {
          var loginType = "${login_type}";
          var cmt;
          
          if (loginType == "facebook") {
            cmt = "페이스북으로 "
          } else if (loginType == "naver") { 
            cmt = "네이버로 "
          } else if (loginType == "kakao") {
            cmt = "카카오로 "
          } else if (loginType == "google") {
            cmt = "구글로 "
          } else {
          }
          
          if(confirm(cmt + 'BATTLE MATCHING을 시작할까요? \n\n회원가입 시, BATTLE MATCHING의 이용약관과\n개인정보처리방침에 따라 정보가 관리됩니다.')) {
            var agreeMkt = confirm('더 나은 서비스 제공을 위한 마케팅 정보 활용에 동의하시겠어요?');
            var openUrl = "${contextRootPath}/app/member/signUpCompletion";
            $.getJSON('${contextRootPath}/app/auth/snsEnter', {
              "termsRequired" : true,
              "termsMarketing" : agreeMkt,
              "loginType" : loginType
            }, (data) => {
              console.log(data);
              if (data.status == "success") {
                opener.location.href = openUrl;
                self.close();
              } else {
                alert('회원가입에 실패했습니다. 다시 시도해주세요. \n 만약 이와 같은 현상이 반복된다면 고객센터로 문의해주시기 바랍니다.')
                self.close();
              }
              })
          } else {
            self.close();
          }
        }
</script>
</body>
</html>