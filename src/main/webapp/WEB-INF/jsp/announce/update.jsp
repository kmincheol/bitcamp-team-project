<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항게시판</title>
<jsp:include page="../commonCss.jsp" />
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
<link rel="stylesheet" href="${contextRootPath}/css/announce.css">
</head>
<body>
<jsp:include page="header.jsp" />
	<!--<jsp:include page="../header.jsp" />-->

	<div class="container">
		<h3>공지사항</h3>
		<c:choose>
			<c:when test="${empty announce}">
				<p>해당 공지사항게시물이 없습니다</p>
			</c:when>
			<c:otherwise>
				<form action='.' method='post' id='update_form'>
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
							<textarea class="form-control" id="title" name='title' rows='1'>${announce.title}</textarea>
						</div>
					</div>

          <div class="form-group row">
            <label for="summernote" class="col-sm-2 col-form-label">내용</label>
            <div class="col-sm-8">
              <textarea class="form-control" id="summernote" name='contents' rows='5'>${announce.contents}</textarea>
            </div>
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
						<a class="btn btn-primary" href='../'>목록</a>
						<button class="btn btn-primary" id="update">변경하기</button>
					</div>
				</div>
		</form>
			</c:otherwise>
		</c:choose>

	</div>
	<!-- .container -->


      
<jsp:include page="../javascript.jsp" />
  <script src="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.js"></script>
<script>
"use strict"

$(document).ready(function() {
  $('#summernote').summernote({
    height: 300,
    minHeight: null,
    maxHeight: null,
    focus: true
  });
  
  $('#update').click((e) =>{
    submitAgree();
    return false;
  })
});

function checkTerms() {
  var res = true;
  var titleStr = $('#title').val();
  var titleCheck = $.trim(titleStr);
  var contentsStr = $('#summernote').summernote('code');
  var contentsCheck = $.trim($('#summernote').val());

  if (titleCheck.length <= 0 ||
      contentsCheck.length <= 0) {
    alert("내용을 입력해주세요!");
    res = false;
  }

  return res;
}

function submitAgree() {
  if (checkTerms() != true) {
    return false;
  }

  $("#update_form").submit();
  return true;
}

/* JSP는 굳이 ajax로 통신할 이유가 없다고 생각해서 다시 작성함.
$('#update').click((e) =>{
  submitAgree();
  return false;
  e.preventDefault();
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = () => {
    if (xhr.readyState == 4) {
        if (xhr.status == 200) {
          location.href = '../'
        } else {
          alert("실행 오류 입니다!");
        }
    }
};
  xhr.open("POST", ".", true);
  xhr.setRequestHeader("Content-type", "application/json");
  
  var anuncNo = $('#no').val();
  
  var titleStr = $('#title').val();
  var titleCheck = $.trim(titleStr);
  if (titleCheck.length <= 0) {
    alert("제목을 입력해주세요!");
    return;
  }
  var contentsStr = $('#summernote').summernote('code');
  var contentsCheck = $.trim($('#summernote').val());
  if (contentsCheck.length <= 0) {
    alert("내용을 입력해주세요!");
    return;
  }
  
  
  var aJson = new Object();
  aJson.no = anuncNo;
  aJson.title = titleStr;
  aJson.contents = contentsStr;
  var sJson = JSON.stringify(aJson);
  
  xhr.send(sJson);
  $("#update_form").submit();
});*/

</script>
</body>
</html>






