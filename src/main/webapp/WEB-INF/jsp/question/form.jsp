<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>질문글 등록</title>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">

<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">

<!-- MDBootstrap Datatables  -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/addons/datatables.min.css" rel="stylesheet">

<link rel="stylesheet" href="${contextRootPath}/css/question_form.css">
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">

<style>   
  th{
    vertical-align: middle!important;
    text-align: center;
    background: #f9f7f7;
  }
</style>
</head>

<body>
 <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />
  
  <div id="main-text">
    <img src="${contextRootPath}/images/qna.png" style="width:100%; height:100%;">
      <div class="text-field" id="main-textfield">
        <span style="font-weight: bold; font-size: 2.0em;">궁금해하는 글</span> 
        <span style="font-size: 1.8em;"> 을 간편하게</span>
        <div style="font-size: 1.8em;">등록할 수 있습니다.</div>  
      </div>
    </div>
    
  <div class="container" id="main-wrap">

      <form id="add_form" action='add' method='post' onsubmit="return check()">
      <div id="table" style="margin-top: 40px;">
        <table class="table table-bordered">
          <tbody>
            <tr>
              <th id="table-header" scope="row">제목</th>
              <td><input type="text" class="form-control" name="title" id="title"
                value="${question.title}" /></td>
            </tr>
            <tr>
              <th id="table-header" scope="row" style="width: 151px; min-width: 151px;">내용</th>
              <td><textarea id="summernote" name='contents' rows='5'></textarea></td>
            </tr>
            <tr>
              <th id="table-header" scope="row">비밀글 설정</th>
              <td><input type="checkbox" name="password"
                id="password" style="width: 30px; height: 30px; vertical-align: middle;"/>${question.password}</td>
            </tr>
          </tbody>    
        </table>
      </div>
      <div class="form-group">
        <div class="col-sm-12" style="text-align: center;">
          <a class="btn  btn-outline-dark " href='${contextRootPath}/app/question' style="width:80px">취소</a>
          <button  class="btn  btn-outline-dark"  style="width:80px">등록</button>
        </div>
      </div>
    </form>     
  </div>
  <!-- .container -->
 <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />
 
  <script src="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.js"></script>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

<script>
"use strict"

$(document).ready(function() {
  $('#summernote').summernote({
    height: 400,
    width:900,
    minHeight: null,
    maxHeight: null,
    focus: true
  });
  
  $('#add').click((e) =>{
    submitAgree();
    return false;
  })
});

function submitAgree() {
  if (checkTerms() != true) {
    return false;
  }

  $("#add_form").submit();
  return true;
}

function check(){
    var title = $('#title').val(); 
    var content = $('#contents').val();
   if(title == ""){
     alert("제목을 입력 하세요.") ;
      return false;
   }
   else if(content == ""){
	     alert("내용을 입력 하세요.") ;
	      return false;
	   }
}
  



</script>
</body>
</html>
