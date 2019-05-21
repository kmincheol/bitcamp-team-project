<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>질문글 등록</title>
<jsp:include page="../commonCss.jsp" />
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_list.css">
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
</head>

<body>
  <div class="container">

    <h1>새 글</h1>
    <form id='add_form' action='add' method='post'>
    <div class="form-group row">
      <label for="no" class="col-sm-2 col-form-label">제목</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="title" id="title" value="${question.title}"
         />
      </div>
    </div>

    <div class="form-group row">
      <label for="title" class="col-sm-2 col-form-label">내용</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="contents" id="contents" value="${question.contents}" />
      </div>
    
    </div>
      <div class="form-group row">
        <div class="col-sm-10">
          <button id="add" class="btn btn-primary">등록</button>
          <a class="btn btn-primary" href='${contextRootPath}/app/question'>목록</a>
        </div>
      </div>
    </form>
  </div>
  <!-- .container -->

<script>

</script>
</body>
</html>
