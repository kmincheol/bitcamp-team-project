<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입약관동의</title>
</head>
<body>
<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>
 <script>
        $(document).ready(function () {
            function checkTerms() {
              if(confirm('페이스북으로 BATTLE MATCHING을 시작할까요? \n\n회원가입 시, BATTLE MATCHING의 이용약관과\n개인정보처리방침에 따라 정보가 관리됩니다.')) {
                var agreeMkt = confirm('더 나은 서비스 제공을 위한 마케팅 정보 활용에 동의하시겠어요?');
                var accessToken = ${accessToken};
                var openUrl = "../../app/member/signUpCompletion";
                $.getJSON('../../app/member/snsEnter', {
                  "loginType" : 'facebook',
                  "accessToken" : accessToken,
                  "termsRequired" : true,
                  "termsMarketing" : agreeMkt
                }, (data) => {
                  console.log(data);
                  if (data.status == "success") {
                    opener.location.href = openUrl;
                    self.close();
                  } else if (data.status == "notEmail") {
                    alert('회원가입에 이메일 정보 제공이 반드시 필요합니다.\n 페이스북 - 설정 - 앱 및 웹사이트 - 활성화 앱 및 웹사이트에서 \n 이메일 주소를 공유 가능하도록 설정하신 후 \n 다시 시도해주세요.');
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
        });
</script>
</body>
</html>