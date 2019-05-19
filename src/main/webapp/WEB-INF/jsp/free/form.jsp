<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>게시글 등록</title>
<jsp:include page="../commonCss.jsp" />
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
</head>
<body>

  <div class="container">
    <h1>글 쓰기</h1>
    <br>

    <section>
      <form id='add_form' action='add' method='post'>

        <div class="form-group row">
          <label for="title" class="col-sm-10 col-form-label">제목</label>
          <div class="col-sm-10">
            <input class="form-control" id="title" name='title'>
          </div>
        </div>


        <!-- summernote와 관련된 영역 -->
        <hr>
        <b>내용</b> <br>
        
        <div class="freeSummernote">
          <textarea id="summernote" name="contents"></textarea>
        </div>

        <!-- 버튼과 관련된 영역 -->
        <div class="form-group row">
          <div class="col-sm-10">
            <a class="btn btn-primary" href='./'>목록</a>
            <button class="btn btn-primary" id="add">작성하기</button>
          </div>
        </div>
      </form>
    </section>
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
  
  $('#add').click((e) =>{
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

  $("#add_form").submit();
  return true;
}
/*  
$('#add').click((e) =>{
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
  xhr.open("POST", "add", true);
  xhr.setRequestHeader("Content-type", "application/json");
  
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
  
  xhr.send(sJson);
});
*/
</script>
</body>
</html>