<%@ page language="java" 
         contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>비밀번호찾기</title>
  <jsp:include page="../commonCss.jsp"/>
  <link rel="stylesheet" href="${contextRootPath}/css/findPwd17.css">
</head>
<body>

<jsp:include page="../header.jsp"/>

<div class="container">
  <h1>비밀번호 찾기</h1>

  <hr class="hrblack"/>

  <p>초기화된 <strong>임시 비밀번호</strong>를 발송하였습니다.</p>
  <p>임시비밀번호로 로그인하신 뒤 반드시 비밀번호를 변경해 주시기 바랍니다.</p>

  
  <a class="btn btn-outline-secondary fpsend"
          type="button" href="../home.jsp">메인화면</a>
  <a class="btn btn-outline-secondary fpsend"
          type="button" href="form.jsp">로그인</a>
</div><!-- .container -->

<jsp:include page="../footer.jsp"/>
<jsp:include page="../javascript.jsp"/>

</body>
</html>