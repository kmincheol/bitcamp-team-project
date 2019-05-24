<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<!-- include header.jsp -->
<jsp:include page="../header.jsp" />
<!-- header.css -->
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_update.css">
</head>

<body>

  <div class="container">

    <div id="main-text">
      <div class="text-field">
        <span style="font-weight: bold; font-size: 2.0em;">팀원을 모집 </span> 
        <span style="font-size: 2.0em;"> 하는 글을 <br></span>
        <span style="font-weight: bold; font-size: 2.0em;">수정</span>
        <span style="font-size: 2.0em;">할 수 있습니다. </span> 
        <br> <br> 
        <span>수정할 항목을 변경 후 <span style="font-weight: bold;">저장</span> 버튼을 누르세요.</span>
      </div>
    </div>

    <form id='update_form' action='../update' name="change" method='post'>
      <div id="table">
        <table class="table table-bordered">
          <tbody>
            <!-- 번호 넘겨줘야함 / 화면에 보이지 않음 -->
            <div class="content-number">
              <label for="no" class="col-sm-2 col-form-label">번호</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="teamNo" id="no"
                  value="${teamRecruit.teamNo}" readonly />
              </div>
            </div>

            <tr>
              <th id="table-header" scope="row">지역</th>
              <td>
                <div id="area_select" name="teamArea">${teamRecruit.team.teamArea}</div>
                <div id="local_select"></div>
              </td>
            </tr>
            <tr>
              <th id="table-header" scope="row">소속팀</th>
              <td>
                <div name="teamName" id="teamName">${teamRecruit.team.teamName}</div>
              </td>
            </tr>
            <tr>
              <th id="table-header" scope="row">제목</th>
              <td><input type="text" class="form-control" name="teamTitle" id="title"
                value="${teamRecruit.teamTitle}" /></td>
            </tr>
            <tr>
              <th id="table-header" scope="row">내용</th>
              <td><textarea class="form-control" id="summernote" name='teamContents' rows='5'>${teamRecruit.teamContents}</textarea></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="form-group row">
        <div class="col-sm-12 text-center">
          <a class="btn btn-dark" href='${contextRootPath}/app/recruit_board'>취소</a>
          <a class="btn btn-dark" id="update" >저장</a>
        </div>
      </div>
    </form>
  </div>
  <!-- .container -->
  <jsp:include page="../footer.jsp" />
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
	  e.preventDefault();
	  if(confirm('변경 사항을 저장하시겠습니까?')) {
    submitAgree();
    return false;		  
	  } else {
		  return false;
		}
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
function changeCheck(){
	if(confirm('변경 사항을 저장하시겠습니까?')){
		//document.change.submit();
		console.log("true");
		alert('저장되었습니다.');
	} 
}
*/

</script>
</body>
</html>