<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="../commonCss.jsp" />
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_detail.css">
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
</head>

<body>

  <div class="container">
    <form id='update_form' action='../update' method='post'>

      <div class="form-group row">
        <label for="no" class="col-sm-2 col-form-label">번호</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="teamNo" id="no"
            value="${teamRecruit.teamNo}" readonly/>
        </div>
      </div>

      <div class="form-group row">
        <label for="location" class="col-sm-2 col-form-label">지역</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="teamArea" id="location"
            value="${teamRecruit.team.teamArea}" readonly />
        </div>
      </div>

      <div class="form-group row">
        <label for="sportsType" class="col-sm-2 col-form-label">종목</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="teamSportsType" id="sportsType"
            value="${teamRecruit.teamTypeSports.teamSportsType}" readonly />
        </div>
      </div>

      <div class="form-group row">
        <label for="teamName" class="col-sm-2 col-form-label">팀명</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="teamName" id="teamName"
            value="${teamRecruit.team.teamName}" readonly />
        </div>
      </div>

      <div class="form-group row">
        <label for="title" class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="teamTitle" id="title"
            value="${teamRecruit.teamTitle}" />
        </div>
      </div>

      <div class="form-group row">
        <label for="viewCount" class="col-sm-2 col-form-label">조회수</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="teamViewCount" id="viewCount"
            value="${teamRecruit.teamViewCount}" readonly />
        </div>
      </div>
      
      <div class="form-group row">
        <label for="summernote" class="col-sm-2 col-form-label">내용</label>
        <div class="col-sm-10">
          <textarea class="form-control" id="summernote" name='teamContents' rows='5'>${teamRecruit.teamContents}</textarea>
        </div>
      </div>

      <div class="form-group row">
        <div class="col-sm-10">
          <a class="btn btn-primary" href='${contextRootPath}/app/recruit_board'>목록</a>
          <button id="update" class="btn btn-primary" >저장</button>
        </div>
      </div>
    </form>
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

</script>
</body>
</html>