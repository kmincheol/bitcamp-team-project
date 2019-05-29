<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>자유 게시판</title>
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<jsp:include page="../header.jsp" />
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
<link rel="stylesheet" href="${contextRootPath}/css/free.css">
</head>
<body>

  <div class="container">
<br><br>

    <div id="main-text">
      <h2>자유게시판</h2>
    </div>

    <div id="freeForm">
      <c:if test="${sessionScope.loginUser != null}">
        <p>
          <a href='${contextRootPath}/app/free/form' class="input-group-btn1 btn btn-dark" style="left:330px; position:relative;">글쓰기</a>
          
        </p>
      </c:if>
      <br>
      <div class="free-list">
        <table class="table table-hover">
          <thead class="thead-dark">
            <tr id="free-list-tr">
              <th scope="col">번호</th>
              <th id="free-title" scope="col">제목</th>
              <th scope="col">작성자</th>
              <th scope="col">작성일</th>
              <th scope="col">조회</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${list}" var="free">
              <tr>
                <th scope="row">${free.no}</th>
                <td><a href='${contextRootPath}/app/free/${free.no}'>${free.title}</a></td>
                <td>${free.member.name}</td>
                <td>${free.createdDate}</td>
                <td>${free.viewCount}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <br><br><br><br>
   <nav aria-label="목록 페이지 이동">
  <ul class="pagination justify-content-center">
    <li class="page-item ${pageNo <= 1 ? 'disabled' : ''}"><a class="page-link" 
    href="?pageNo=${pageNo-1}&pageSize=${pageSize}">이전</a></li>
    
    <c:choose>
    
    <c:when test="${rowCount <= pageSize*3}">
      <c:forEach var="no" begin="1" end="${totalPage}" step="1">
        <li class="page-item"><a class="page-link" href="?pageNo=${no}&pageSize=${pageSize}">${no}</a></li>
      </c:forEach>
    </c:when>
        
    <c:otherwise>
      <c:choose>
        <c:when test="${pageNo == 1}">
          <c:forEach var="no" begin="1" end="3" step="1">
          <li class="page-item"><a class="page-link" href="?pageNo=${no}&pageSize=${pageSize}">${no}</a></li>
          </c:forEach>
        </c:when>
        <c:when test="${pageNo == totalPage}">
          <c:forEach var="no" begin="${totalPage-2}" end="${totalPage}" step="1">
          <li class="page-item"><a class="page-link" href="?pageNo=${no}&pageSize=${pageSize}">${no}</a></li>
          </c:forEach>
        </c:when>
      <c:otherwise>
        <c:forEach var="no" begin="${pageNo-1}" end="${pageNo+1}" step="1">
          <li class="page-item"><a class="page-link" href="?pageNo=${no}&pageSize=${pageSize}">${no}</a></li>
        </c:forEach>
      </c:otherwise>
      </c:choose>
    </c:otherwise>
    
    </c:choose>
    
    
    
    <li class="page-item ${pageNo == totalPage ? 'disabled' : ''}"><a class="page-link" 
    href="?pageNo=${pageNo+1}&pageSize=${pageSize}">다음</a></li>
  </ul>
</nav>

    <form action='search'>
      <input type='${contextRootPath}/app/free/search' name='keyword' placeholder="검색어 입력">
      <button type='submit' class="input-group-btn btn btn-dark">검색</button>
    </form>
    </div>
  </div>

  <jsp:include page="../javascript.jsp" />
</body>
</html>







