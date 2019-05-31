<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>질문글 등록</title>
<jsp:include page="../commonCss.jsp" />
<jsp:include page="../header.jsp" /> 
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
<link rel="stylesheet" href="${contextRootPath}/css/question_form.css">
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
</head>

<body>
  <div class="container">

    <div id="main-text">
      <div class="text-field" id="main-textfield">
        <span style="font-weight: bold; font-size: 2.0em;">궁금</span> <span
          style="font-size: 2.0em;"> 해하는 글을 간편하게</span>
        <div style="font-size: 2.0em;">등록할 수 있습니다.</div>
      </div>
    </div>

      <form id="add_form" action='add' method='post' onsubmit="return check()">
      <div id="table">
        <table class="table table-bordered">
          <tbody>
           
            <tr>
              <th id="table-header" scope="row">비밀글 설정</th>
              <td>
        <input type="checkbox" class="form-control col-sm-2"  name="password" id="password" />${question.password}
              </td>
            </tr>
            <tr>
              <th id="table-header" scope="row">제목</th>
              <td>
              <input type="text" class="form-control" name="title" id="title" value="${question.title}"/>
              </td>
            </tr>
            <tr>
              <th id="table-header" scope="row">내용</th>
              <td><textarea id="summernote" name='contents' rows='5'></textarea></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="form-group row" id="btnbtn">
        <div class="col-sm-12">
          <button  class="btn  btn-outline-dark">등록</button>
          <a class="btn  btn-outline-dark" href='${contextRootPath}/app/question' >취소</a>
        </div>
      </div>
   
    </form>
  </div>
  <!-- .container -->
 <jsp:include page="../javascript.jsp" />
 <jsp:include page="../footer.jsp" />
  <script src="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.js"></script>
<script>
"use strict"

$(document).ready(function() {
  $('#summernote').summernote({
    height: 400,
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
  
  var titleCheck = $.trim($('#title').val());
  var contentsCheck = $.trim($('#summernote').val());
  var areaSelect = $('#area_select').val();
  var localSelect = $('#local_select').val();
  var teamSelect = $('#select2').val();
  
  if (areaSelect == $('#area_select option:eq(0)').val() ||
      localSelect == $('#local_select option:eq(0)').val() ||
      teamSelect == $('#select2 option:eq(0)').val()) {
    alert("지역과 팀을 선택해주세요!");
    res = false;
  }

  if (titleCheck.length <= 0 ||
      contentsCheck.length <= 0 ||
      areaSelect.length <= 0 ||
      localSelect.length <= 0 ||
      teamSelect.length <= 0) {
    alert("필수 내용을 모두 입력해주세요!");
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



function check(){
    var title = $('#title').val(); 
    var content = $('#contents').val();
    var password = $('#password').val();
   if(title == ""){
     alert("제목을 입력 하세요.") ;
      return false;
   }
   else if(content == ""){
	     alert("내용을 입력 하세요.") ;
	      return false;
	   }
   else if(password >10000){
	   alert("1~9999 숫자만 입력가능합니다");
	   return false;
   }
}
  



</script>
</body>
</html>
