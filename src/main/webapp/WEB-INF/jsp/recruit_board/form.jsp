<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>게시글 등록</title>
<jsp:include page="../commonCss.jsp" />
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_list.css">
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
</head>

<body>
  <div class="container">

    <%-- <jsp:include page="../header.jsp"></jsp:include> --%>

    <h1>새 글</h1>
    <form id='add_form' action='add' method='post'>
      <div id="table">
        <table class="table table-bordered">
          <tbody>
            <tr>
            <th scope="row">지역</th>
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
              <th scope="row">소속팀</th>
              <td><select class="custom-select" id="select2" name='team.teamId'>
                  <option selected>팀을 선택해주세요.</option>
                  <c:forEach items="${team}" var="team">
                    <option value='${team.teamId}' >${team.teamName}</option>
                  </c:forEach>
              </select></td>
            </tr>
            <tr>
            <th scope="row">제목</th>
            <td>
              <div class="col-sm-2">
                <input class="form-control" id="title" name='teamTitle'>
              </div>
            </td>
            </tr>
            <tr>
              <th scope="row">내용</th>
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
