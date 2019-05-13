<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
<!-- include summernote-ko-KR -->
<script src="lang/summernote-ko-KR.js"></script>

<head>
<title>게시글 등록</title>
<jsp:include page="../commonCss.jsp" />
</head>
<body>

  <div class="container">
    <h1>글 쓰기</h1>
    <hr>
    <br>
    <section>
      <form action='add' method='post' enctype='multipart/form-data'>

        <div class="form-group row">
          <label for="contents" class="col-sm-2 col-form-label">제목</label>
          <div class="col-sm-2">
            <input class="form-control" id="title" name='title'>${free.title}</input>
          </div>
        </div>


        <!-- summernote와 관련된 영역 -->
        <b>내용</b> <br>
        <textarea id="summernote" name="contents"></textarea>

        <!-- 버튼과 관련된 영역 -->
        <div class="form-group row">
          <div class="col-sm-10">
            <a class="btn btn-primary" href='./'>목록</a>
            <button class="btn btn-primary">작성하기</button>
          </div>
        </div>
      </form>
    </section>
  </div>
  <!-- .container -->
  <script>
      $(document).ready(function() {
        $('#summernote').summernote({
          height : 300, // 에디터의 높이 
          minHeight : null,
          maxHeight : null,
          focus : true,
          lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경
        });
      });

      var postForm = function() {
        var contents = $('textarea[name="contents"]').html(
            $('#summernote').code());
      }
    </script>
  <jsp:include page="../javascript.jsp" />
</body>
</html>