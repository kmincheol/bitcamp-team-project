<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>공지사항 등록</title>
<jsp:include page="../commonCss.jsp" />
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
<link rel="stylesheet" href="${contextRootPath}/css/announce.css">
</head>
<body>
<jsp:include page="header.jsp" />
  <div class="container">
  <br>
    <h3>글 쓰기</h3>
    <hr>
    <br>
    <form action='add' method='post' enctype='multipart/form-data'>

      <div class="form-group row">
        <label for="title" class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-2">
          <input class="form-control" id="title" name='title'>${announce.title}
        </div>
      </div>

      <div class="announceSummernote">
        <textarea id="summernote" name="contents"></textarea>
      </div>

      <div class="form-group row">
        <div class="col-sm-10">
          <button id="add" class="btn btn-primary">등록</button>
          <a class="btn btn-primary" href='.'>목록</a>
        </div>
      </div>
    </form>
  </div>
  <!-- .container -->

      
      <!-- 제목을 입력하지 않고 확인버튼을 클릭시 alert 창 띄움 -->

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
});

$('#add').click((e) =>{
  e.preventDefault();
  var xhr = new XMLHttpRequest();
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
  aJson.title = titleStr;
  aJson.contents = contentsStr;
  var sJson = JSON.stringify(aJson);
  xhr.onreadystatechange = () => {
      if (xhr.readyState == 4) {
          if (xhr.status == 200) {  
            alert("저장되었습니다!");
            location.href = '.'
          } else {
            alert("실행 오류 입니다!");
          }
      }
  };
  xhr.open("POST", "../../app/announce/add", true);
  xhr.setRequestHeader("Content-type", "application/json");
  xhr.send(sJson);
});
</script>
</body>
</html>
