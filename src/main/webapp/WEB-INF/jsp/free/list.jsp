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

    <div id="recruit-list-out">
      <c:if test="${sessionScope.loginUser != null}">
        <p>
          <a href='${contextRootPath}/app/free/form' class="input-group-btn1 btn btn-dark">글쓰기</a>
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
          href="?pageNo=${pageNo - 1}&pageSize=${pageSize}">이전</a></li>
        <li class="page-item active"><span class="page-link">${pageNo}</span></li>
        <li class="page-item ${pageNo >= totalPage ? 'disabled' : ''}"><a class="page-link"
          href="?pageNo=${pageNo + 1}&pageSize=${pageSize}">다음</a></li>
      </ul>
    </nav>

    <form action='search'>
      <input type='search' name='keyword' placeholder="검색어 입력">
      <button type='submit' class="input-group-btn btn btn-dark">검색</button>
    </form>
    </div>
  </div>

  <jsp:include page="../javascript.jsp" />
</body>
</html>







