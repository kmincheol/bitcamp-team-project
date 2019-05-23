<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>매치보드</title>
   <jsp:include page="../commonCss.jsp"/>
   <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">
</head>
<body>

  <h2 id="side_title">추천매칭</h2>
   <div id="sidebar-right">
       <div id="side_team">
       <br>
       <c:if test="${!empty sessionScope.loginUser}">
       <c:forEach items="${matches}" var="match">
        <ul>
          <li>${match.team.teamEmblemPhoto}</li>
          <li>${match.team.teamName}</li>
        </ul>
        <ul style = "cursor:pointer;" onClick = "location.href='${contextRootPath}/app/matchboard/${match.no}'"
        onMouseOver="this.style.backgroundColor='#424242';" onMouseOut="this.style.backgroundColor='' ">
          <li>${match.location}</li>
          <li>${match.teamTypeSports.teamSportsType}</li>
          <!-- <li>팀유형.</li> -->
          <br><br>
        </ul>
        </c:forEach>
        </c:if>
      </div>
    </div>
</body>
</html>
