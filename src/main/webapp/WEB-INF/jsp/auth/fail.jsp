<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인 실패</title>
  <jsp:include page="../commonCss.jsp"/>
  <script src="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
<link href="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet"> 
<link href="http://sweetalert2.github.io/styles/bootstrap4-buttons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
.btn-sss, .btn-fff {
 cursor: pointer
}
</style>
</head>
<body>

<jsp:include page="../javascript.jsp"/>
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
  
  swalWithBootstrapButtons.fire({
        title: '로그인에 실패했습니다.',
        html: '비밀번호를 확인해주세요.',
        type: 'error',
        footer: '<a href="${contextRootPath}/app/member/findPassword">비밀번호를 찾으시려면 클릭해주세요.</a>'
    }).then((result) => {
      location.href = "${contextRootPath}/app/auth/form"
      })
}
</script>
</body>
</html>
