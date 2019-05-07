<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
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
        <ul> 
          <img src="${contextRootPath}/images/man_u2.jpeg" width=80px height=80px>
        </ul> 
          <p>
            맨체스터 유나이티드<br>
            20~30대<br>
            직장인<br>
          </p>
          <br>
        <ul>
          <li>1</li>
          <li>2</li>
          <li>3</li>
        </ul>
        <ul>
          <li>1</li>
          <li>2</li>
          <li>3</li>
        </ul>
        <ul>
          <li>1</li>
          <li>2</li>
          <li>3</li>
        </ul>
        <ul>
          <li>1</li>
          <li>2</li>
          <li>3</li>
        </ul> 
        
      </div>
    </div>

</body>
</html>
