<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>모집게시판</title>
<link rel="stylesheet"
	href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
<%-- <link rel="stylesheet" href="${contextRootPath}/css/recruit_board_list.css"> --%>
</head>

<body>

	<jsp:include page="../header.jsp"></jsp:include>

	<div class="container">

		<!--     <div id="main-text">
      <h2>모집게시판</h2>
    </div> -->
		<br>

		<div id="recruit-list-out">
			<div class="input-group mb-3" style="width: 150px;">
				<select class="custom-select" id="inputGroupSelect01">
					<option selected>종목</option>
					<option value="1">축구</option>
					<option value="2">야구</option>
					<option value="3">농구</option>
				</select>
			</div>

			<form action='${contextRootPath}/app/recruit_board/search'>
				<div class="form-group row">
					<div class="col-xs-4">
						<input id="searchwindow" name='keyword' class="form-control"
							type="search" placeholder="검색어 입력">
					</div>
					<div id="search-btn">
						<button id="searchbtn" class="input-group-btn btn btn-dark">검색</button>
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
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.teamNo}</td>
							<td>${list.teamTypeSports.teamSportsType}</td>
							<td><a
								href="${contextRootPath}/app/recruit_board/${list.teamNo}">${list.teamTitle}</a></td>
							<td>${list.team.teamName }</td>
							<td>${list.team.teamArea }</td>
							<td><c:choose>
									<c:when test="${list.teamRcrmStatus == 0}"> 모집중 </c:when>
									<c:otherwise>모집마감</c:otherwise>
								</c:choose></td>
							<td>${list.teamCreatedDate}</td>
							<td>${list.teamViewCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="in">
				<div id="write-btn" style="position: absolute; right: 0;">
					<a class="input-group-btn1 btn btn-dark"
						href="${contextRootPath}/app/recruit_board/form">글쓰기</a>
				</div>
				<nav aria-label="목록 페이지 이동">
					<ul class="pagination justify-content-center">
						<li class="page-item ${pageNo <= 1 ? 'disabled' : ''}"><a
							class="page-link"
							href="?pageNo=${pageNo - 1}&pageSize=${pageSize}"
							style="background-color: gray; color: white; border-color: gray;">이전</a></li>
						<li class="page-item active"><span class="page-link"
							style="background-color: black; color: white; border-color: gray;">${pageNo}</span></li>
						<li class="page-item ${pageNo >= totalPage ? 'disabled' : ''}"><a
							class="page-link"
							href="?pageNo=${pageNo + 1}&pageSize=${pageSize}"
							style="background-color: gray; color: white; border-color: gray;">다음</a></li>
					</ul>
				</nav>

			</div>



		</div>


	</div>

	<jsp:include page="../javascript.jsp" />

	<script>
		
	</script>


</body>
<!-- <footer>
        
  </footer> -->

</html>