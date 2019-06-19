<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
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

<link rel="stylesheet" href="${contextRootPath}/css/question_update.css">

<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">

<style>
#hidden {
	display: none;
}

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

  <div id="hidden" class="form-group row">
    <label for="questionNo" class="col-sm-2 col-form-label">번호</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="questionNo" id="questionNo"
        value="${question.questionNo}" readonly />
    </div>
  </div>

  <div class="container" id="main-wrap">
    <div id="main-text">
      <div class="text-field" id="main-textfield">
        <span style="font-weight: bold; font-size: 2.0em;">문의</span> <span
          style="font-size: 2.0em;"> 했던 게시글을</span>
        <div style="font-size: 2.0em;">변경할 수 있습니다.</div>
      </div>
    </div>    

    <form id='update_form' action='../update' method='post' onsubmit="return update_check()">
      <div id="table">
        <table class="table table-bordered">
          <tbody>
            <tr>
              <div id="hidden" class="form-group row">
                <label for="questionNo" class="col-sm-2 col-form-label">번호</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" name="questionNo" id="questionNo"
                    value="${question.questionNo}" readonly />
                </div>
              </div>
            </tr>
            <tr>
              <th id="table-header" scope="row">작성일</th>
              <td><input type="text" class="form-control" name="createdDate" id="createdDate"
                value="${question.createdDate}" readonly /></td>
            </tr>
            <tr>
              <th id="table-header" scope="row">제목</th>
              <td><input type="text" class="form-control" name=title id="titleb"
                value="${question.title}" /></td>
            </tr>   
            <tr>      
              <th id="table-header" scope="row" style="width:151px;">내용</th>
              <td><textarea class="form-control col-sm-13" rows="5" name="contents"
                  id="summernote">${question.contents}</textarea></td>
            </tr>
          </tbody>
        </table>   
      </div>
      <div class="form-group">
        <div class="col-sm-12" style="text-align: center;">
          <a class="btn  btn-outline-dark" href='${contextRootPath}/app/question'>목록</a>
          <button class="btn  btn-outline-dark">저장</button>
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

function update_check(){
    
	   if($('#titleb').val() == "" ){
	     alert("제목을 입력해주세요.") ;
	      return false;
	   } else if($('#contentsb').val() == "" ){
	       alert("내용을 입력해주세요.") ;
	        return false;
	     }
	}


	  
	  
</script>
</body>
</html>