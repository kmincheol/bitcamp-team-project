<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>게시글 등록</title>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- recruit_board_form.css -->
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board/recruit_board_form.css">

<!-- summernote -->
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_form.css">

<style>

</style>
</head>

<body>

  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp"/>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp"/>
  
  <div id="main-wrap" class="container">

    <div id="main-text">
      <div class="text-field">
        <span style="font-weight: bold; font-size: 2.0em;">팀원을 모집 </span> 
        <span style="font-size: 2.0em;"> 하는 글을 간편하게</span>
        <div style="font-size: 2.0em;">등록할 수 있습니다.</div>
        <br> <span>종목과 지역을 설정하고 <span style="font-weight: bold;">팀원</span>을 구해보세요.
        </span>
      </div>
    </div>

    <form id='add_form' name="add-cancle" action='add' method='post'>
      <div id="table">
        <table class="table table-bordered">
          <tbody>
            <tr>
              <th id="table-header" scope="row">지역</th>
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
              <th id="table-header" scope="row">소속팀</th>
              <td><select class="custom-select" id="select2" name='team.teamId'>
                  <option selected>팀을 선택해주세요.</option>
                  <c:forEach items="${team}" var="team">
                    <option value='${team.teamId}'>${team.teamName}</option>
                  </c:forEach>
              </select></td>
            </tr>
            <tr>
              <th id="table-header" scope="row">제목</th>
              <td><input id="title" name="teamTitle" class="form-control"></td>
            </tr>
            <tr>
              <th id="table-header" scope="row">내용</th>
              <td><textarea id="summernote" name='teamContents' rows='5'></textarea></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="form-group row">
        <div class="col-sm-12 text-center">
          <a id="cancle" class="btn btn-dark" href='${contextRootPath}/app/recruit_board'>취소</a>
          <button id="add" class="btn btn-dark">등록</button>
        </div>
      </div>
    </form>
  </div>
  
  <jsp:include page="../javascript.jsp" />
    
   <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp"/>
  
  <script src="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.js"></script>
  
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp"/>
  
  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp"/>
   
  <script>

$(document).ready(function() {
  $('#summernote').summernote({
    height: 400,
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
