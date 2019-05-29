<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BATTLE MATCHING::페이지를 찾을 수 없습니다.</title>
<link rel="stylesheet" href="${contextRootPath}/css/error_common.css">
</head>
<body>

<jsp:include page="../header.jsp"/>

  <div id="container">
    <img class="errorImg" src="${contextRootPath}/images/error_outline.svg">
    <h2 class="error_title">요청하신 페이지를 찾을 수 없습니다.</h2>
    <div class="content">
      <p class="paragraph">
        1) 방문하시려는 페이지의 주소가 잘못 입력되었거나, 
        <br>
        2) 페이지의 주소가 변경 혹은 삭제되었거나,
        <br>
        3) 해당 페이지에 대한 비정상적인 접근으로 인하여
        <br> 
        요청하신 페이지를 찾을 수 없습니다.
        <br>
        <br>
        입력하신 페이지의 주소가 정확한지 다시 한번 확인해 주시기 바랍니다. 
        <br> 
        <br>
        요청하신 페이지의 URL 경로 : <strong>${path}</strong>
        <br> 
        <br> 
        이와 관련하여 문의사항이 있으신 경우, 
        <br> 
        <a href="${contextRootPath}/app/question">고객센터</a>로 문의해 주시면 친절하게 안내해 드리겠습니다.
      </p>
    </div>
  </div>

  <jsp:include page="../footer.jsp"/>

<!-- 
Failed URL: ${url} 
Exception: ${exception.message} 
<c:forEach items="${exception.stackTrace}" var="ste"> 
${ste} 
</c:forEach> 
-->

</body>
</html> 