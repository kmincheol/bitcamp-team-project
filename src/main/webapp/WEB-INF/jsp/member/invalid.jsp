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
                var message = "유효시간이 초과되거나, 잘못된 접근입니다. 처음부터 다시 시도하세요";
                if ('' != '') {
                    message = '${message}';
                }
                alert(message);
                location.href = "${contextRootPath}/app/member/agreeTerms";
            }

            setTimeout(redirect, 100);
        });
</script>
</body>
</html>