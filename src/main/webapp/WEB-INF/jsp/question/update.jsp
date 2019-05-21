<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
</head>

<body>

  <div class="container">
    <form id='update_form' action='../update' method='post'>

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
          <input type="text" class="form-control" name=title id="title"
            value="${question.title}"/>
        </div>
      </div>

      <div class="form-group row">
        <label for="contents" class="col-sm-2 col-form-label">내용</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="contents" id="contents"
            value="${question.contents}" />
        </div>
      </div>

      <div class="form-group row">
        <div class="col-sm-10">
          <a class="btn btn-primary" href='${contextRootPath}/app/question'>목록</a>
          <button id="update" class="btn btn-primary" >저장</button>
        </div>
      </div>
    </form>
  </div>
  <!-- .container -->

<script>

</script>
</body>
</html>