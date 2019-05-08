<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>자유 게시판</title>
<jsp:include page="../commonCss.jsp" />
   <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextRootPath}/css/freeboard.css">
</head>
<body>

  <div class="container">
    <h1>게시물 목록</h1>
    <p>
      <a href='form' class="btn btn-primary btn-sm">새 글</a>
    </p>
    
    <div class="bit-list">
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${list}" var="board">
            <tr>
              <th scope="row">${board.no}</th>
              <td><a href='${board.no}'>${board.contents}</a></td>
              <td>홍길동</td>
              <td>${board.createdDate}</td>
              <td>${board.viewCount}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <!-- .bit-list -->

    <nav aria-label="목록 페이지 이동">
      <ul class="pagination justify-content-center">
        <li class="page-item ${pageNo <= 1 ? 'disabled' : ''}"><a class="page-link"
          href="?pageNo=${pageNo - 1}&pageSize=${pageSize}">이전</a></li>
        <li class="page-item active"><span class="page-link">${pageNo}</span></li>
        <li class="page-item ${pageNo >= totalPage ? 'disabled' : ''}"><a class="page-link"
          href="?pageNo=${pageNo + 1}&pageSize=${pageSize}">다음</a></li>
      </ul>
    </nav>

    <div class="form-group row">
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
              <select name='loc1' class="custom-select" id="inputGroupSelect01">
                <option selected>제목+내용</option>
                <option value="1"></option>
                <option value="2">Two</option>
                <option value="3">Three</option>
              </select>
            </div>
          </div>
        </div>
      </div>
      <input type="text">
    </div>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />
</body>
</html>







