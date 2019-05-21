<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>자유 게시판</title>
<jsp:include page="../commonCss.jsp" />
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/free.css">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_list.css">
</head>
<body>

  <div class="container">

    <div id="main-backgroundImg">
      <img src="${contextRootPath}/images/match-header.jpg" class="img-fluid">

      <div id="header-item">
        <a href="#">로그인/</a> <a href="#">회원가입/</a> <a href="#">고객센터</a>
      </div>
    </div>

    <div id="header">
      <nav class="navbar navbar-expand-lg justify-content-center">
        <a href="#"><img src="${contextRootPath}/images/logo.png" class="headerImg"></a>
      </nav>

      <div id="header-cate">
        <div>
          <ul class="nav justify-content-center">
            <div class="header-category">
              <li class="nav-item"><a class="nav-link" href="#">메인</a></li>
            </div>
            <div class="header-category">
              <li class="nav-item"><a class="nav-link" href="#">매치</a>
                <ul class="category">
                  <li class="nav-item"><a class="nav-link" href="#">매치보드</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">매치등록</a></li>
                </ul></li>
            </div>
            <div class="header-category">
              <li class="nav-item"><a class="nav-link" href="#">팀</a>
                <ul class="category">
                  <li class="nav-item"><a class="nav-link" href="#">팀생성</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">팀정보</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">모집게시판</a></li>
                </ul></li>
            </div>
            <div class="header-category">
              <li class="nav-item"><a class="nav-link" href="#">커뮤니티</a>
                <ul class="category">
                  <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
                </ul></li>
            </div>
            <div class="header-category">
              <li class="nav-item"><a class="nav-link" href="#">마이페이지</a>
                <ul class="category">
                  <li class="nav-item"><a class="nav-link" href="#">개인정보</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">나의 팀 정보</a></li>
                </ul></li>
            </div>
          </ul>
        </div>
      </div>
    </div>

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







