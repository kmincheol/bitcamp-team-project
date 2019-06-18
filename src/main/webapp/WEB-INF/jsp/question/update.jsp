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


</head>

<body>
<jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />
  
  <div class="container" id="main-wrap">
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
              <th id="table-header" scope="row">제목</th>
              <td><input type="text" class="form-control" name="title" id="title"
                value="${question.title}" /></td>
            </tr>
            <tr>
              <th id="table-header" scope="row">내용</th>
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
          <a class="btn  btn-outline-dark" href='${contextRootPath}/app/question' >취소</a>
          <button  class="btn  btn-outline-dark">등록</button>
        </div>
      </div>
   
    </form>
  </div>
  
  
  
  
  
  
  
  
  
  
  
  
  
  <div class="container" id="main-wrap">
  
    <form id='update_form' action='../update' method='post' onsubmit="return update_check()">

      <div class="form-group row">
        <label for="questionNo" class="col-sm-2 col-form-label">번호</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="questionNo" id="questionNo"
            value="${question.questionNo}" readonly/>
        </div>
      </div>

      <div class="form-group row">
        <label for="createdDate" class="col-sm-2 col-form-label">작성일</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="createdDate" id="createdDate"
            value="${question.createdDate}" readonly />
        </div>
      </div>

      <div class="form-group row">
        <label for="title" class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name=title id="titleb" value="${question.title}"/>
        </div>
      </div>

      <div class="form-group row">
        <label for="contents" class="col-sm-2 col-form-label">내용</label>
        <div class="col-sm-10">
         <textarea class="form-control col-sm-13" rows="5" name="contents" id="contentsb"
          >${question.contents}</textarea>
        </div>
      </div>

      <div class="form-group row">
        <div class="col-sm-10">
          <a class="btn  btn-outline-dark" href='${contextRootPath}/app/question'>목록</a>
          <button id="update" class="btn  btn-outline-dark" >저장</button>
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