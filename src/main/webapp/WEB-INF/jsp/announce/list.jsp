<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>공지사항 게시판</title>
<!-- <jsp:include page="../commonCss.jsp" /> -->
   <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextRootPath}/css/announce.css">
</head>
<body>

<jsp:include page="header.jsp" />

  <div class="container">
    <h3>공지사항</h3>
    
<c:if test="${!empty sessionScope.loginUser}">
<c:if test="${sessionScope.loginUser.manager}">
    <p>
      <a href='${contextRootPath}/app/announce/form.jsp' class="btn btn-primary btn-sm" >새 글</a>
    </p>
</c:if>    
</c:if>
    
    <br>
    <div class="announce-list">
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">번호</th>
            <th id="announce-title" scope="col" width="300px">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${list}" var="announce">
            <tr>
              <th scope="row">${announce.no}</th>
              <td><a href='${contextRootPath}/app/announce/${announce.no}'>${announce.title}</a></td>
              <td>${announce.member.name}</td>
              <td>${announce.createdDate}</td>
              <td>${announce.viewCount}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <!-- .bit-list -->

    <nav aria-label="목록 페이지 이동">
  <ul class="pagination justify-content-center">
  
    <li class="page-item ${pageNo <= 1 ? 'disabled' : ''}">
    <a class="page-link" href="?pageNo=${pageNo - 1}&pageSize=${pageSize}">이전</a></li>
    
    <li class="page-item ${pageNo <= 1 ? 'disabled' : ''}">
    <a class="page-link" href="?pageNo=${pageNo - 1}&pageSize=${pageSize}">${pageNo <= 1 ? "-" : pageNo - 1}</a></li>
    
    <li class="page-item active"><span class="page-link">${pageNo}</span></li>
    
    <li class="page-item ${pageNo >= totalPage ? 'disabled' : ''}">
    <a class="page-link" href="?pageNo=${pageNo + 1}&pageSize=${pageSize}">${pageNo >= totalPage ? "-" : pageNo + 1}</a></li>
    
    <li class="page-item ${pageNo >= totalPage ? 'disabled' : ''}">
      <a class="page-link" href="?pageNo=${pageNo + 1}&pageSize=${pageSize}">다음</a></li>
  </ul>
    </nav>



<!-- 
    <div class="form-group row" id="searchspace">
      <div class="col-sm-5">
        <div class="input-group mb-2">
          <select name='loc1' class="custom-select" id="inputGroupSelect01">
            <option selected>전체기간</option>
            <option value="1">일주일전</option>
            <option value="2">한달전</option>
            <option value="3">3개월전</option>
          </select>
          <div class="col-sm-5">
            <div class="input-group mb-2">
              <select name='loc1' class="custom-select" id="inputGroupSelect02">
                <option selected>제목+내용</option>
                <option value="1">제목</option>
                <option value="2">내용</option>
                <option value="3">작성자</option>
              </select>
            </div>
          </div>
        </div>
      </div>	
    		<form id="searchbox" action='search' class="form-inline my-2 my-lg-0 justify-content">
       	<input id="searchbox" class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요.">
			<button class="btn btn-outline-success my-2 my-sm-0">검색</button>
    		</form>
    </div>
   -->
  </div>
  
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />
</body>
</html>







