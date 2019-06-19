<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
  <div id="contents-section">
    <div class="contents-section-head">
      <div>답변</div>
    </div>
    <div class="contents-section-body">
      <div class="contents">${answer.contents}</div>
    </div>
  </div>

</body>
</html>
   