<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 회원가입</title>
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
            checkTerms();
        });
        
        function checkTerms() {
          
          const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
              confirmButton: 'btn btn-success btn-sss',
              cancelButton: 'btn btn-danger btn-fff'
            },
            buttonsStyling: false,
          })
          
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
          
          swalWithBootstrapButtons.fire({
            title: cmt + '<br>BATTLE MATCHING을 시작할까요?',
            html: '회원가입 시, BATTLE MATCHING의 이용약관과<br>개인정보처리방침에 따라 정보가 관리됩니다.',
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            reverseButtons: true
          }).then((result) => {
            if (result.value) {
              swalWithBootstrapButtons.fire({
                  title: '더 나은 서비스 제공을 위한<br>마케팅 정보 활용에 동의하시겠어요?',
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonText: '확인',
                  cancelButtonText: '취소',
                  reverseButtons: true
              }).then((result) => {
                var openUrl = "${contextRootPath}/app/member/signUpCompletion";
                var agreeMkt;
                if (result.value) {
                  agreeMkt = true;
                } else if (result.dismiss === Swal.DismissReason.cancel) {
                  agreeMkt = false;
                }
                console.log(agreeMkt);
                console.log(loginType);
                
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
                    swalWithBootstrapButtons.fire({
                        title: '회원가입에 실패했습니다!<br>다시 시도해주세요.',
                        html: '만약 이와 같은 현상이 반복된다면<br>고객센터로 문의해주시기 바랍니다.',
                        type: 'error'
                    }).then((result) => {
                        if (result.value) {
                          self.close();
                        }
                    })
                  }                     
                }).fail(function () {
                  swalWithBootstrapButtons.fire({
                    title: '회원가입에 실패했습니다.<br>다시 시도해주세요.',
                    html: '만약 이와 같은 현상이 반복된다면<br>고객센터로 문의해주시기 바랍니다.',
                    type: 'error'
                }).then((result) => {
                      if (result.value) {
                        self.close();
                      }
                  })
                })
              })
            } else if (result.dismiss === Swal.DismissReason.cancel) {
              self.close();
            }
            })
        }
</script>
</body>
</html>