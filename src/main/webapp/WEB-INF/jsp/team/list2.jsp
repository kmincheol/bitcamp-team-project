<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>팀 조회</title>
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<jsp:include page="../header.jsp" />
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
</head>
<body>

  <div class="container">
<br><br>

    <div id="main-text">
      <h2>팀 조회</h2>
    </div>

    <div id="recruit-list-out">
      <c:if test="${sessionScope.loginUser != null}">
        <p>
          <a href='${contextRootPath}/app/team/form' class="input-group-btn1 btn btn-dark">팀 생성</a>
        </p>
      </c:if>
      <br>
      <div class="team-list">
        <table class="table table-hover">
          <thead class="thead-dark">
            <tr id="team-list-tr">
              <th scope="col">번호</th>
              <th id="team-title" scope="col">팀이름</th>
              <th scope="col">팀소개</th>
              <th scope="col">지역</th>
              <th scope="col">연령대</th>
              <th scope="col">실력</th>
              <th scope="col">팀유형</th>
              <th scope="col">종목</th>
              <th scope="col">팀앰블럼</th>
              <th scope="col">팀 유니폼 사진</th>
              <th scope="col">생성일</th>
              <th scope="col">최근수정일</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${teams}" var="team">
              <tr>
                <th scope="row">${team.teamId}</th>
                <td><a href='${contextRootPath}/app/team/${team.teamId}'>${team.teamName}</a></td>
                <td>${team.teamInfo}</td>
                <td>${team.teamArea}</td>
                <td>${team.teamAges.teamAges}</td>
                <td>${team.teamLevel.teamLevel}</td>
                <td>${team.teamType.teamType}</td>
                <td>${team.teamTypeSports.teamSportsType}</td>
                <td><img src = '${team.teamEmblemPhoto}' style="width:100px; height:100px;"></td>
                <td><img src = '${team.teamUniformPhoto}' style="width:100px; height:100px;"></td>
                <td>${team.teamCreateDate}</td>
                <td>${team.teamInfoModifieDate}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <br><br><br><br>
  <%--   <nav aria-label="목록 페이지 이동">
      <ul class="pagination justify-content-center">
        <li class="page-item ${pageNo <= 1 ? 'disabled' : ''}"><a class="page-link"
          href="?pageNo=${pageNo - 1}&pageSize=${pageSize}">이전</a></li>
        <li class="page-item active"><span class="page-link">${pageNo}</span></li>
        <li class="page-item ${pageNo >= totalPage ? 'disabled' : ''}"><a class="page-link"
          href="?pageNo=${pageNo + 1}&pageSize=${pageSize}">다음</a></li>
      </ul>
    </nav> --%>

    <form action='search'>
      <input type='search' name='keyword' placeholder="검색어 입력">
      <button type='submit' class="input-group-btn btn btn-dark">검색</button>
    </form>
    </div>
  </div>

  <jsp:include page="../javascript.jsp" />
</body>
</html>







