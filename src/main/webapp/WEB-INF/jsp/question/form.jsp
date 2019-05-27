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
</head>

<body>

  <div class="container">

 <div id="main_title">
    <h2>질문작성하기</h2>
</div>

    <form id="add_form" action='add' method='post' onsubmit="return check()">

    <div class="form-group row">
      <label for="no" class="col-sm-2 col-form-label">제목</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="title" id="title" value="${question.title}"/>
      </div>
    </div>
 <hr class="hrr">
    <div class="form-group row">
      <label for="title" class="col-sm-2 col-form-label">내용</label>
      <div class="col-sm-10">
        <input type="textarea" class="form-control" name="contents" id="contents" value="${question.contents}" />
      </div>
    
    </div>
      <div class="form-group row">
        <div class="col-sm-12">
          <a class="btn btn-dark" href='${contextRootPath}/app/question' >취소하기</a>
          <button  class="btn btn-dark">질문하기</button>
        </div>
      </div>
    </form>
  </div>
  <!-- .container -->
 <jsp:include page="../javascript.jsp" />
 
<script>

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
