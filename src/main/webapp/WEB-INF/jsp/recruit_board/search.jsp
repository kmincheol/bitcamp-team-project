<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>모집게시판</title>
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<%-- <link rel="stylesheet" href="${contextRootPath}/css/recruit_board_list.css">
<link rel="stylesheet" href="${contextRootPath}/css/header.css"> --%>
</head>

<body>
  <div class="container">

    <%-- <jsp:include page="../header.jsp"></jsp:include> --%>

    <div id="main-text">
      <h2>모집게시판</h2>
    </div>
    
    <br>
    
    <div id="recruit-list-out">

    <!--   <div class="input-group mb-3" style="width: 150px;">
        <select class="custom-select" id="inputGroupSelect01">
          <option selected>종목</option>
          <option value="1">축구</option>
          <option value="2">야구</option>
          <option value="3">농구</option>
        </select>
      </div> -->

      <form id="keywordbox" action='search'>
        <div class="form-group row">
          <div class="col-xs-4">
            <input id="keywordbox" name='keyword' class="form-control" type="keyword"
              placeholder="검색어 입력">
          </div>
          <button class="input-group-btn btn btn-dark">검색</button>
          <div id="write-btn" style="position: absolute; right: 0;">
            <button class="input-group-btn1 btn btn-dark">
              <a href="${contextRootPath}/app/recruit_board/form">글쓰기</a>
            </button>
          </div>
        </div>
      </form>

      <table class="table">
        <thead class="thead-light">
          <tr>
            <td colspan="8" class="search-result">검색 결과 총 : (3)건</td>
          </tr>
          <tr>
            <th scope="col">번호</th>
            <th scope="col">종목</th>
            <th scope="col">제목</th>
            <th scope="col">팀명</th>
            <th scope="col">지역</th>
            <th scope="col">상태</th>
            <th scope="col">작성일</th>
            <th scope="col">조회수</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${search}" var="search">
            <tr>
              <td>${search.teamNo}</td>
              <td>${search.teamTypeSports.teamSportsType}</td>
              <td><a href="${search.teamNo}">${search.teamTitle}</a></td>
              <td>${search.team.teamName }</td>
              <td>${search.team.teamArea }</td>
              <td>${search.teamRcrmStatus}</td>
              <td>${search.teamCreatedDate}</td>
              <td>${search.teamViewCount}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <%-- <div id="in">
        <nav aria-label="목록 페이지 이동">
          <ul class="pagination justify-content-center">
            <li class="page-item ${pageNo <= 1 ? 'disabled' : ''}"><a class="page-link"
              href="?pageNo=${pageNo - 1}&pageSize=${pageSize}">이전</a></li>
            <li class="page-item active"><span class="page-link">${pageNo}</span></li>
            <li class="page-item ${pageNo >= totalPage ? 'disabled' : ''}"><a class="page-link"
              href="?pageNo=${pageNo + 1}&pageSize=${pageSize}">다음</a></li>
          </ul>
        </nav>
      </div> --%>
    </div>


  </div>

  <jsp:include page="../javascript.jsp" />



</body>
<!-- <footer>
        
  </footer> -->
</html>