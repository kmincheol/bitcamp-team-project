<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

  <div id="main-wrap" class="container">
 <div>
 <c:forEach items="${matchs}" var="matchs">
 ${matchs.no}, 
 ${matchs.teamNo}, 
 ${matchs.teamSportsId}, 
 ${matchs.title}, 
 ${matchs.contents}, 
 ${matchs.createdDate}, 
 ${matchs.playDate}, 
 ${matchs.stadiumName}, 
 ${matchs.telephone}, 
 ${matchs.cost}
 
 <br>
 </c:forEach>
 </div>
  </div>

</body>
</html>