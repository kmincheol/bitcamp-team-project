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
      <form action='../../comment/update' method='post' enctype='multipart/form-data'>

            <input type="text" class="form-control-plaintext" id="no" name='no' value='${comment.no}'
              style="display:none;">

            <input class="form-control" id="contents" name='contents' >${comment.contents}

            <button class="btn btn-primary">변경하기</button>
      </form>
  </div>

  <jsp:include page="../javascript.jsp" />
</body>
</html>






