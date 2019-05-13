<%@page import="com.eomcs.lms.domain.AnnounceFile"%>
<%@page import="com.eomcs.lms.domain.Announce"%>
<%@page import="java.util.List"%>
<%@page errorPage="/errorpage/null.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항게시판</title>
<jsp:include page="../commonCss.jsp" />
</head>
<body>

	<div class="container">


		<h1>공지사항게시판</h1>

		<c:choose>
			<c:when test="${empty announce}">
				<p>해당 사진을 찾을 수 없습니다.</p>
			</c:when>

			<c:otherwise>
				<form action='update' method='post'>
					<div class="form-group row">
						<label for="no" class="col-sm-2 col-form-label">번호</label>
						<div class="col-sm-10">
							<input type="text" class="form-control-plaintext" id="no"
								name='no' value='${announce.no}' readonly>
						</div>
					</div>

					<div class="form-group row">
						<label for="title" class="col-sm-2 col-form-label">제목</label>
						<div class="col-sm-8">
							<textarea class="form-control" id="title" name='contents'
								rows='1' readonly>${announce.title}</textarea>
						</div>
					</div>

					<div class="form-group row">
						<label for="contents" class="col-sm-2 col-form-label">내용</label>
						<div class="col-sm-8">
							<textarea class="form-control" id="contents" name='contents'
								rows='5' readonly>${announce.contents}</textarea>
						</div>
					</div>


					<div>
						<c:forEach items="${announce.files}" var="file">
							<img id="pic"
								src='${contextRootPath}/upload/announce/${file.filePath}'
								onerror="this.style.display='none'" alt=''>
						</c:forEach>
					</div>

					<div class="form-group row">
						<label for="createdDate" class="col-sm-2 col-form-label">최근수정일</label>
						<div class="col-sm-10">
							<input type="text" readonly class="form-control-plaintext"
								id="createdDate" value="${announce.modifierDate}">
						</div>
					</div>

					<div class="form-group row">
						<label for="viewCount" class="col-sm-2 col-form-label">조회수</label>
						<div class="col-sm-10">
							<input type="text" readonly class="form-control-plaintext"
								id="viewCount" value="${announce.viewCount}">
						</div>
					</div>


					<div class="form-group row">
						<div class="col-sm-10">
							<a class="btn btn-primary" href='.'>목록</a> 
							<a class="btn btn-primary" href='delete/${announce.no}'>삭제</a> <a
								href='${contextRootPath}/app/announce/update/${announce.no}'
								class="btn btn-primary">변경</a>
						</div>
					</div>

				</form>
			</c:otherwise>
		</c:choose>

	</div>
	<script>
		
	</script>

	<jsp:include page="../javascript.jsp" />
</body>
</html>






