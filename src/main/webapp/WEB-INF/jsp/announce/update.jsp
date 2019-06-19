<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항게시판</title>
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

<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
<link rel="stylesheet" href="${contextRootPath}/css/announce_update.css">

<style>
th {
	vertical-align: middle !important;
	text-align: center;
	background: #f9f7f7;
}
</style>
</head>

<body>

  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />

  <div class="container" id="main-wrap">
    <div id="main-text">
      <div class="text-field" id="main-textfield">
        <span style="font-weight: bold; font-size: 2.0em;">문의</span> <span style="font-size: 1.8em;">
          했던 게시글을</span>
        <div style="font-size: 1.8em;">변경할 수 있습니다.</div>
      </div>
    </div>
    <c:choose>
      <c:when test="${empty announce}">
        <p>해당 공지사항게시물이 없습니다</p>
      </c:when>
      <c:otherwise>
        <form action='.' method='post' id='update_form'>
          <div id="table">
            <table class="table table-bordered">
              <tbody>
                <tr>
                  <div class="form-group row" style="display: none">
                    <label for="no" class="col-sm-2 col-form-label">번호</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="no" id="no"
                        value="${announce.no}" readonly />
                    </div>
                  </div>
                </tr>
                <tr>
                  <th id="table-header" scope="row">최근수정일</th>
                  <td><input type="text" readonly class="form-control-plaintext"
                    id="createdDate" value="${announce.modifierDate}"></td>
                </tr>
                <tr>
                  <th id="table-header" scope="row">제목</th>
                  <td><input class="form-control" id="title" name='title'
                    value="${announce.title}"></td>
                </tr>
                <tr>
                  <th id="table-header" scope="row" style="width: 151px;">내용</th>
                  <td><textarea class="form-control" id="summernote" name='contents' rows='5'>${announce.contents}</textarea></td>
                </tr>
              </tbody>
            </table>
          </div>

          <div class="form-group">
            <div class="col-sm-12" style="text-align: center;">
              <a class="btn btn-outline-dark" href='../'>목록</a>
              <button class="btn btn-outline-dark" id="update">변경하기</button>
            </div>
          </div>
        </form>
      </c:otherwise>
    </c:choose>

  </div>
  <!-- .container -->

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <script src="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.js"></script>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />


  <script>
"use strict"

$(document).ready(function() {
  $('#summernote').summernote({
    height: 300,
    minHeight: null,
    maxHeight: null,
    focus: true
  });
  
  $('#update').click((e) =>{
    submitAgree();
    return false;
  })
});

function checkTerms() {
  var res = true;
  var titleStr = $('#title').val();
  var titleCheck = $.trim(titleStr);
  var contentsStr = $('#summernote').summernote('code');
  var contentsCheck = $.trim($('#summernote').val());

  if (titleCheck.length <= 0 ||
      contentsCheck.length <= 0) {
    alert("내용을 입력해주세요!");
    res = false;
  }

  return res;
}

function submitAgree() {
  if (checkTerms() != true) {
    return false;
  }

  $("#update_form").submit();
  return true;
}

/* JSP는 굳이 ajax로 통신할 이유가 없다고 생각해서 다시 작성함.
$('#update').click((e) =>{
  submitAgree();
  return false;
  e.preventDefault();
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = () => {
    if (xhr.readyState == 4) {
        if (xhr.status == 200) {
          location.href = '../'
        } else {
          alert("실행 오류 입니다!");
        }
    }
};
  xhr.open("POST", ".", true);
  xhr.setRequestHeader("Content-type", "application/json");
  
  var anuncNo = $('#no').val();
  
  var titleStr = $('#title').val();
  var titleCheck = $.trim(titleStr);
  if (titleCheck.length <= 0) {
    alert("제목을 입력해주세요!");
    return;
  }
  var contentsStr = $('#summernote').summernote('code');
  var contentsCheck = $.trim($('#summernote').val());
  if (contentsCheck.length <= 0) {
    alert("내용을 입력해주세요!");
    return;
  }
  
  
  var aJson = new Object();
  aJson.no = anuncNo;
  aJson.title = titleStr;
  aJson.contents = contentsStr;
  var sJson = JSON.stringify(aJson);
  
  xhr.send(sJson);
  $("#update_form").submit();
});*/

</script>
</body>
</html>






