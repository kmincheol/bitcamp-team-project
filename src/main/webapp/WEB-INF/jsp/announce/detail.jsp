<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항게시판</title>
<!-- <jsp:include page="../commonCss.jsp" /> -->
<link rel="stylesheet"
	href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/announce.css">
</head>
<body>
<jsp:include page="header.jsp" />
	<div class="container">

		<h3>공지사항</h3>

		<c:choose>
			<c:when test="${empty announce}">
				<p>해당 사진을 찾을 수 없습니다.</p>
			</c:when>

			<c:otherwise>
				<form>
					<div class="form-group row">
						<label for="no" class="col-sm-2 col-form-label">번호</label>
						<div class="col-sm-10">
							<label for="no" class="col-sm-2 col-form-label">${announce.no}</label>
							<label id="space"></label> <label id="space"></label> <label
								id="space"></label> <label id="viewlabel" for="viewCount"
								class="col-sm-2 col-form-label">조회수</label> <label
								id="viewcount" for="viewCount" class="col-sm-2 col-form-label">${announce.viewCount}</label>
						</div>

					</div>

					<div class="form-group row">
						<label class="col-sm-2 col-form-label">이름</label>
						<div class="col-sm-10">
							<label for="name" class="col-sm-2 col-form-label">${announce.member.name}</label>
							<label id="space"></label> <label id="space"></label> <label
								id="space"></label> <label id="space"></label> <label
								id="crtlabel" class="col-sm-2 col-form-label">글작성일(수정일)</label>
							<label id="crtdate" class="col-sm-2 col-form-label"
								id="createdDate">${announce.modifierDate}</label>
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

					<c:forEach items="${announce.files}" var="file">
						<div id="divphoto">
						<a href='${contextRootPath}/upload/member/${member.photo}' data-toggle="modal" data-target="#bit-announce-${file.filePath}">
							<img class="img-polaroid" src='${contextRootPath}/upload/announce/${file.filePath}' 
								onerror="this.style.display='none'">
						</a>
						</div>
                <!-- Modal -->
                <div class="modal fade bd-example-modal-xl" id="bit-announce-${file.filePath}" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-xl" role="document">
                    <div class="modal-content">
                      <div class="modal-body">
                          <img src='${contextRootPath}/upload/announce/${file.filePath}' class="img-thumbnail"/>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      </div>
                    </div>
                  </div>
                </div>
					</c:forEach>

					<label id="space"></label>

					<div class="form-group row">
						<div class="col-sm-10">
							<a class="btn btn-primary" href='.'>목록</a>

							<c:if test="${!empty sessionScope.loginUser}">
								<c:if test="${sessionScope.loginUser.manager}">
									<a class="btn btn-primary" href='delete/${announce.no}'>삭제</a>
									<a href='${contextRootPath}/app/announce/update/${announce.no}'
										class="btn btn-primary">변경</a>
								</c:if>
							</c:if>
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






