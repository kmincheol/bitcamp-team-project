<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>자유게시판</title>
<jsp:include page="../commonCss.jsp" />
</head>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
<!-- include summernote-ko-KR -->

<body>

  <!--<jsp:include page="../header.jsp" />-->

  <div class="container">
    <h1>자유게시판</h1>
    <section>
      <form action='../update' method='post' enctype='multipart/form-data'>

        <div class="form-group row">
          <label for="no" class="col-sm-2 col-form-label">번호</label>
          <div class="col-sm-10">
            <input type="text" class="form-control-plaintext" id="no" name='no' value='${free.no}'
              readonly>
          </div>
        </div>

        <div class="form-group row">
          <label for="title" class="col-sm-2 col-form-label">제목</label>
          <div class="col-sm-8">
            <textarea class="form-control" id="title" name='title' rows='1'>${free.title}</textarea>
          </div>
        </div>

        <div class="form-group row">
          <label for="title" class="col-sm-2 col-form-label">내용</label>
          <textarea id="summernote" name="contents">${free.contents}</textarea>
        </div>




        <div class="form-group row">
          <label for="createdDate" class="col-sm-2 col-form-label">최근수정일</label>
          <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" id="createdDate"
              value="${free.modifierDate}">
          </div>
        </div>

        <div class="form-group row">
          <label for="viewCount" class="col-sm-2 col-form-label">조회수</label>
          <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" id="viewCount"
              value="${free.viewCount}">
          </div>
        </div>

        <!-- 버튼과 관련된 영역 -->
        <!-- 버튼과 관련된 영역 -->
        <div class="form-group row">
          <div class="col-sm-10">
            <a class="btn btn-primary" href='${contextRootPath}/app/free'>목록</a>
            <button class="btn btn-primary">변경하기</button>
          </div>
        </div>
      </form>
    </section>
    <!-- .container -->
  </div>



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






