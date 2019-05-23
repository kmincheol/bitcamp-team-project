<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_detail.css">
</head>

<body>

  <div class="container">

    <div class="form-group row">
      <label for="no" class="col-sm-2 col-form-label">번호</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="questionType" id="type" value="${question.questionNo}"
          readonly />
      </div>
    </div>

    <div class="form-group row">
      <label for="contents" class="col-sm-2 col-form-label">작성일</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="createdDate" id="createdDate"
          value="${question.createdDate}" readonly />
      </div>
    </div>
    <div class="form-group row">
      <label for="title" class="col-sm-2 col-form-label">작성자</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="member" id="member" value="${question.member.name}" readonly />
      </div>
    </div>


    <div class="form-group row">
      <label for="title" class="col-sm-2 col-form-label">제목</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="title" id="title" value="${question.title}" readonly />
      </div>
    </div>
    
       <div class="form-group row">
      <label for="contents" class="col-sm-2 col-form-label">내용</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="contents" id="contents"
          value="${question.contents}" readonly />
      </div>
    </div>

    <div id ="aa" class="form-group row">
      <div class="col-sm-10">
        <a class="btn btn-primary" href='.'>목록</a> 
        <a class="btn btn-primary" href='delete/${question.questionNo}'>삭제</a> 
        <a class="btn btn-primary" href='${contextRootPath}/app/question/update/${question.questionNo}'>변경</a>
         <a class="btn btn-primary" href='${contextRootPath}/app/question/form2/${question.questionNo}'>답글달기</a>
      </div>
   </div> 
   <div class="container">
    
    <h1>답변하기</h1>
    <form id='add_form' action='../add2' method='post'>
    <div class="form-group row">

      <label for="title" class="col-sm-2 col-form-label">내용</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="contents" id="contents" value="${answer.contents}" />
      </div>
    
    </div>
      <div class="form-group row">
        <div class="col-sm-10">
          <button id="add" class="btn btn-primary" >등록</button>
          <a class="btn btn-primary" href='${contextRootPath}/app/question'>목록</a>
        </div>
      </div>
    </form>
  </div>
   
   
  </div>
  <!-- .container -->


 <%-- <jsp:include page="alist.jsp" /> --%>

  <jsp:include page="../javascript.jsp" />
 
 
 
<script>
</script>




</body>

</html>