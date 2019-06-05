<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
</head>
<body>
<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>
 <script>
        $(document).ready(function () {
            function redirect() {
                var message = "상세정보입력이 완료되었습니다! 다시 로그인 해주시기 바랍니다!";
                if ('' != '') {
                    message = '${message}'; 
                }
                alert(message);
                location.href = "http://localhost:8080/bitcamp-team-project/app/auth/form";
            }

            setTimeout(redirect, 100);
        });
</script>
</body>
</html>