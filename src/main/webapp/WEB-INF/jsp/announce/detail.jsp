<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<html>
<head>
<title>공지사항게시판</title>
<jsp:include page="../commonCss.jsp" />

<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/announce_detail.css">
</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="container">
    <div id="main-text">
      <h2>공지사항</h2>
    </div>
		<c:choose>
			<c:when test="${empty announce}">
				<p>해당 게시물을 찾을 수 없습니다.</p>
			</c:when>
			<c:otherwise>
				<form>
				<div id="contents-wrap">
				<div id="info-wrap">
				    <table class="info-table">
			  <tr>
              <th>
                <div>번호</div>
              </th>
              <td>
                <div id="no">${announce.no}</div>
              </td>
              <th>
                <div>조회수</div>
              </th>
              <td>
                <div id="viwecount">${announce.viewCount}</div>
              </td>
            </tr>
            <tr>
              <th>
                <div>이름</div>
              </th>
              <td>
                <div id="member">${announce.member.name}</div>
              </td>
              <th>
                <div>글작성일</div>
              </th>
              <td>
                <div id="wirteDate">${announce.modifierDate}</div>
              </td>
            </tr>
		     <tr>
              <th>
                <div>제목</div>
              </th>
              <td colspan="3">
                <div id="title2" style="text-align:left; padding-left: 20px;">${announce.title}</div>
              </td>
            </tr>
					</table>
					</div> <!-- 내용 전 -->

			<div id="contents-section">
          <div class="contents-section-head">
            <div>내용</div>
          </div>
          <div class="contents-section-body">
            <div class="contents">${announce.contents}</div>
          </div>
          </div>
          <div id="control-box" class="form-group row">
          		<div class="col-sm-12 text-center">
							<a class="btn btn-dark" href='.'>목록</a>
							<c:if test="${!empty sessionScope.loginUser}">
								<c:if test="${sessionScope.loginUser.manager}">
									<a class="btn btn-dark" href='delete/${announce.no}'>삭제</a>
									<a href='${contextRootPath}/app/announce/update/${announce.no}'
										class="btn btn-dark">변경</a>
								</c:if>
							</c:if>
					</div>
					</div>
					</div>
				</form>
			</c:otherwise>
		</c:choose>
	</div>

<jsp:include page="../javascript.jsp" />
</body>
</html>






