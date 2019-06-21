<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>
<script src="${contextRootPath}/js/rootpath.js"></script>
<script>
        $(document).ready(function () {
          opener.location.href = "${contextRootPath}/app/main";
          self.close();
        });
</script>
</body>
</html>