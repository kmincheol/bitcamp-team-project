<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>게시글 등록</title>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- recruit_board_form.css -->
<link rel="stylesheet" href="${contextRootPath}/css/free/free_form.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">

<!-- Material Design Bootstrap -->
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.2/css/mdb.min.css" rel="stylesheet"> -->

<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">

<!-- MDBootstrap Datatables  -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/addons/datatables.min.css"
  rel="stylesheet">

<!-- summernote -->
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">

<style>
th {
	vertical-align: middle !important;
	text-align: center;
	background: #f9f7f7;
}
</style>
</head>
<body>

  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />

  <div id="main-text">
    <img src="${contextRootPath}/images/freeboard.png" style="width: 100%; height: 100%;">
    <div class="text-field" id="main-textfield">
      <span style="font-weight: bold; font-size: 2.0em;">자유롭게 </span> <span
        style="font-size: 1.8em;"> 글을 </span>
      <div style="font-size: 1.8em;">등록할 수 있습니다.</div>
    </div>
  </div>

  <div id="main-wrap" class="container">

    <form id='add_form' name="add-cancle" action='add' method='post'>
      <div id="table" style="margin-top: 40px;">
        <table class="table table-bordered">
          <tbody>
            <tr>
              <th id="table-header" scope="row">제목</th>
              <td><input id="title" name="title" class="form-control"></td>
            </tr>
            <tr>
              <th id="table-header" scope="row" style="width: 151px;">내용</th>
              <td><textarea id="summernote" name='contents' rows='5'></textarea></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="form-group row">
        <div class="col-sm-12 text-center">
          <a id="cancle" class="btn btn-outline-dark" href='${contextRootPath}/app/free'
            style="width: 80px">취소</a>
          <button id="add" class="btn btn-outline-dark" style="width: 80px">등록</button>
        </div>
      </div>
    </form>
  </div>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <script src="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.js"></script>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

  <script>
"use strict"  

$(document).ready(function() {
  $('#summernote').summernote({
    height: 400,
    width: 900,
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
    alert("제목과 내용을 입력해주세요!");
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


</script>
</body>
</html>