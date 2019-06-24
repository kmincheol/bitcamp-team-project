<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 로그인 실패</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
<link href="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet"> 
<link href="https://sweetalert2.github.io/styles/bootstrap4-buttons.css" rel="stylesheet">
<style>
.btn-sss, .btn-fff {
 cursor: pointer
}
</style>
</head>
<body>
<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>
<script src="${contextRootPath}/js/rootpath.js"></script>
<script>
$(document).ready(function () {
  alertMsg();
});
        
function alertMsg() {
  
  const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
      confirmButton: 'btn btn-success btn-sss',
      cancelButton: 'btn btn-danger btn-fff'
    },
    buttonsStyling: false,
  })
  
  var type = "${error_type}";
  var loginType = "${login_type}";
  
  if (type == "noEmail") {
    if (loginType == "facebook") {
      swalWithBootstrapButtons.fire({
        title: '회원가입 및 로그인에 이메일 정보가 반드시 필요합니다.',
        html: '페이스북 설정 - 앱 및 웹사이트 - BATTLE MATCHING을<br>삭제하신 후 다시 회원가입 및 로그인을 시도해주시고,<br>정보제공설정에서 이메일 정보 제공에 동의해주세요.',
        type: 'error'
    }).then((result) => {
          if (result.value) {
            self.close();
          }
      })
    } else if (loginType == "naver") {
      swalWithBootstrapButtons.fire({
        title: '회원가입 및 로그인에 이메일 정보가 반드시 필요합니다.',
        html: '네이버 - 내정보 - 보안설정 - 외부사이트 연결에서<br>BATTLE MATCHING 연결을 해제하신후에 다시 시도해주시고,<br>정보제공설정에서 이메일 정보 제공에 동의해주세요.',
        type: 'error'
    }).then((result) => {
          if (result.value) {
            self.close();
          }
      })
    } else if (loginType == "kakao") {
      swalWithBootstrapButtons.fire({
        title: '회원가입 및 로그인에 이메일 정보가 반드시 필요합니다.',
        html: '카카오 계정 - 연결된 서비스 관리 - 외부서비스에서<br>BATTLE MATCHING 연결을 해제하신후에 다시 시도해주시고,<br>정보제공설정에서 이메일 정보 제공에 동의해주세요.',
        type: 'error'
    }).then((result) => {
          if (result.value) {
            self.close();
          }
      })
    } else if (loginType == "google") {
      swalWithBootstrapButtons.fire({
        title: '회원가입 및 로그인에 이메일 정보가 반드시 필요합니다.',
        html: 'google 계정 - 보안 - 다른 사이트 로그인 수단<br>- Google 계정을 통한 로그인 에서 BATTLE MATCHING을<br>삭제하신 후 다시 회원가입 및 로그인을 시도해주시고,<br>정보제공설정에서 이메일 정보 제공에 동의해주세요.',
        type: 'error'
    }).then((result) => {
          if (result.value) {
            self.close();
          }
      })
    } else {
      swalWithBootstrapButtons.fire({
        title: '잘못된 접근입니다.',
        type: 'error'
    }).then((result) => {
          if (result.value) {
            self.close();
          }
      })
    }
  } else if (type == "cancel") {
      self.close();
  } else if (type == "error") {
    swalWithBootstrapButtons.fire({
      title: '잘못된 접근입니다.',
      type: 'error'
  }).then((result) => {
        if (result.value) {
          self.close();
        }
    })
  } else {
    swalWithBootstrapButtons.fire({
      title: '이 이메일로 가입된 계정이 있습니다.',
      html: '로그인 유형 : ' + loginType,
      type: 'error'
  }).then((result) => {
        if (result.value) {
          self.close();
        }
    })
  }
}

</script>
</body>
</html>