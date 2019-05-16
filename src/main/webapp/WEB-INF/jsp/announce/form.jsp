<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet"href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"href="${contextRootPath}/css/announce.css">

<head>
<title>공지사항 등록</title>
<jsp:include page="../commonCss.jsp" />
</head>
<body>
<jsp:include page="header.jsp" />
  <div class="container">
  <br>
    <h3>글 쓰기</h3>
    <hr>
    <br>
    <form action='add' method='post' enctype='multipart/form-data'>

      <div class="form-group row">
        <label for="contents" class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-2">
          <input class="form-control" id="title" name='title'>${announce.title}
        </div>
      </div>

      <div class="form-group row">
        <label for="contents" class="col-sm-2 col-form-label">내용</label>
        <div class="col-sm-8">
          <textarea class="form-control" id="contents" name='contents' rows='5'>${announce.contents}</textarea>
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
          <button class="btn btn-primary" id="add" onclick="add_click();" >등록</button>
          <a class="btn btn-primary" href='.'>목록</a>
        </div>
      </div>
    </form>
  </div>
  <!-- .container -->

      
      <!-- 제목을 입력하지 않고 확인버튼을 클릭시 alert 창 띄움 -->
      <script>
		function add_click() {
		var title = document.getElementById("title").value;
		if(title.length < 1) {
		alert("제목을 입력해주세요!")
		}
	}
    </script>

  <jsp:include page="../javascript.jsp" />
</body>
</html>
