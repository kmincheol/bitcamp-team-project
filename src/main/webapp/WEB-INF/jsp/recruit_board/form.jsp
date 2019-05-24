<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>게시글 등록</title>
<!-- include header.jsp -->
<jsp:include page="../header.jsp" />
<!-- header.css -->
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_form.css">
</head>

<body>
  <div class="container">

    <div id="main-text">
      <div class="text-field">
        <span style="font-weight: bold; font-size: 2.0em;">팀원을 모집 </span> <span
          style="font-size: 1.7em;"> 하는 글을 간편하게</span>
        <div style="font-size: 1.7em;">등록할 수 있습니다.</div>
        <br> <span>종목과 지역을 설정하고 <span style="font-weight: bold;">팀원</span>을 구해보세요.
        </span>
      </div>
    </div>

    <form id='add_form' action='add' method='post'>
      <div id="table">
        <table class="table table-bordered">
          <tbody>
            <tr>
              <th class="table-header" scope="row">지역</th>
              <td><select id="area_select" class="custom-select">
                  <option selected>oo시</option>
                  <option value="1">서울</option>
                  <option value="2">부산</option>
                  <option value="3">대전</option>
              </select> <select id="local_select" class="custom-select">
                  <option selected>oo구</option>
                  <option value="1">강동</option>
                  <option value="2">강남</option>
              </select></td>
            </tr>
            <tr>
              <th class="table-header" scope="row">소속팀</th>
              <td><select class="custom-select" id="select2" name='team.teamId'>
                  <option selected>팀을 선택해주세요.</option>
                  <c:forEach items="${team}" var="team">
                    <option value='${team.teamId}'>${team.teamName}</option>
                  </c:forEach>
              </select></td>
            </tr>
            <tr>
              <th class="table-header" scope="row">제목</th>
              <td>
                <div class="col-sm-2">
                  <input class="form-control" id="title" name='teamTitle'>
                </div>
              </td>
            </tr>
            <tr>
              <th class="table-header" scope="row">내용</th>
              <td><div class="col-sm-8">
                  <textarea class="form-control" id="summernote" name='teamContents' rows='5'></textarea>
                </div></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="form-group row">
        <div class="col-sm-10">
          <button id="add" class="btn btn-primary">등록</button>
          <a class="btn btn-primary" href='${contextRootPath}/app/recruit_board'>목록</a>
        </div>
      </div>
    </form>
  </div>
  <!-- .container -->
  <jsp:include page="../footer.jsp" />
  <jsp:include page="../javascript.jsp" />
  <script src="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.js"></script>
  <script>
"use strict"

$(document).ready(function() {
  $('#summernote').summernote({
    height: 300,
    minHeight: null,
    maxHeight: null,
    focus: true
  });
  
  $('#add').click((e) =>{
    submitAgree();
    return false;
  })
});

function checkTerms() {
  var res = true;
  
  var titleCheck = $.trim($('#title').val());
  var contentsCheck = $.trim($('#summernote').val());
  var areaSelect = $('#area_select').val();
  var localSelect = $('#local_select').val();
  var teamSelect = $('#select2').val();
  
  if (areaSelect == $('#area_select option:eq(0)').val() ||
      localSelect == $('#local_select option:eq(0)').val() ||
      teamSelect == $('#select2 option:eq(0)').val()) {
    alert("지역과 팀을 선택해주세요!");
    res = false;
  }

  if (titleCheck.length <= 0 ||
      contentsCheck.length <= 0 ||
      areaSelect.length <= 0 ||
      localSelect.length <= 0 ||
      teamSelect.length <= 0) {
    alert("필수 내용을 모두 입력해주세요!");
    res = false;
  }

  return res;
}

function submitAgree() {
  if (checkTerms() != true) {
    return false;
  }

  $("#add_form").submit();
  return true;
}

</script>
</body>
</html>
