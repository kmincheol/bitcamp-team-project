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
  <link rel="stylesheet" href="${contextRootPath}/css/findPwd16.css">
</head>
<body>

<jsp:include page="../header.jsp"/>

<div class="container">
  <h1>비밀번호 찾기</h1>

  <hr />

  <p>비밀번호를 초기화합니다.</p>
  <p>초기화된 <strong>임시 비밀번호</strong>를 받으실 방법을 선택하세요.</p>
  <p>임시비밀번호로 로그인하신 뒤 반드시 비밀번호를 변경해 주시기 바랍니다.</p>

  <table class="table">
    <tr>
      <td>아이디</td>
      <td>아이디정보</td>
    </tr>
    <tr>
      <td>휴대폰</td>
      <td id="fpradio">휴대폰정보 <input type="radio" name="check-method" value="hp"/></td>
      
    </tr>
    <tr>
      <td>이메일</td>
      <td id="fpradio">이메일정보 <input type="radio" name="check-method" value="email"/></td>
    </tr>
  </table>
  
  <hr />
  <button class="btn btn-outline-secondary" id="fpsend" 
          type="button">임시비밀번호 발송</button>
</div><!-- .container -->

<jsp:include page="../footer.jsp"/>
<jsp:include page="../javascript.jsp"/>

<script>
"use strict"

var send = document.querySelector("#fpsend");

send.addEventListener("click", () => {
    var str = "초기화된 임시비밀번호가 전송되었습니다!";
    window.alert(str);
});


</script>
</body>
</html>