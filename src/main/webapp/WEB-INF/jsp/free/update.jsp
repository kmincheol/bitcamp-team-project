<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>자유게시판</title>
<jsp:include page="../commonCss.jsp" />
<jsp:include page="../header.jsp" />
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
</head>

<body>

  <div class="container">
  <br><br> 
    <h1>자유게시판</h1>
    <section>
      <form id='update_form' action='../update' method='post'>

        <div class="form-group row">
          <label for="no" class="col-sm-2 col-form-label">번호</label>
          <div class="col-sm-10">
            <input type="text" class="form-control-plaintext" id="no" name='no' value='${free.no}'
              readonly>
          </div>
        </div>

        <div class="form-group row">
          <label for="title" class="col-sm-2 col-form-label">제목</label>
          <div class="col-sm-8">
            <input class="form-control" id="title" name='title' value='${free.title}'>
          </div>
        </div>

        <div class="form-group row">
          <label for="summernote" class="col-sm-2 col-form-label">내용</label>
          <textarea id="summernote" name="contents">${free.contents}</textarea>
        </div>

        <div class="form-group row">
          <label for="createdDate" class="col-sm-2 col-form-label">최근수정일</label>
          <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" id="createdDate"
              value="${free.modifierDate}">
          </div>
        </div>

        <div class="form-group row">
          <label for="viewCount" class="col-sm-2 col-form-label">조회수</label>
          <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" id="viewCount"
              value="${free.viewCount}">
          </div>
        </div>

        <!-- 버튼과 관련된 영역 -->
        <div class="form-group row">
          <div class="col-sm-10">
            <a class="btn btn-primary" href='${contextRootPath}/app/free'>목록</a>
            <button id='update' class="btn btn-primary">변경하기</button>
          </div>
        </div>
      </form>
    </section>
    <!-- .container -->
  </div>

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

/*
$(document).ready(function() {
  $('#summernote').summernote({
    height : 300,
    minHeight : null,
    maxHeight : null,
    focus : true
  });
});
  
$('#update').click((e) =>{
  e.preventDefault();
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = () => {
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        location.href = '.'
      } else {
        alert("실행 오류 입니다!");
      }
    }
  };
  xhr.open("POST", ".", true);
  xhr.setRequestHeader("Content-type", "application/json");
  
  var freeNo = $('#no').val();
  
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
  console.log(contentsStr);
  var aJson = new Object();
  aJson.no = freeNo;
  aJson.title = titleStr;
  aJson.contents = contentsStr;
  var sJson = JSON.stringify(aJson);
  
  xhr.send(sJson);
});*/

</script>
</body>
</html>






