<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 등록</title>
<jsp:include page="../commonCss.jsp" />
</head>
<body>

  <div class="container">
    <h1>글 쓰기</h1>
    <hr>
    <br>
    <form action='add' method='post' enctype='multipart/form-data'>

      <div class="form-group row">
        <label for="contents" class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-2">
          <input class="form-control" id="title" name='title'>${free.title}</input>
        </div>
      </div>

      <div class="form-group row">
        <label for="contents" class="col-sm-2 col-form-label">내용</label>
        <div class="col-sm-8">
          <textarea class="form-control" id="contents" name='contents' rows='5'>${free.contents}</textarea>
        </div>
      </div>
      
      <div class="form-group row">
      <div class="custom-file">
        <input name='photo' type="file" class="custom-file-input" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04">
        <label class="custom-file-label" for="inputGroupFile04">파일 업로드</label>
      </div>
    </div>
  
      <div class="form-group row">
        <div class="col-sm-10">
          <button class="btn btn-primary">등록</button>
          <a class="btn btn-primary" href='.'>목록</a>
        </div>
      </div>
    </form>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />
</body>
</html>
