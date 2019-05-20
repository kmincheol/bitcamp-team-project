<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
  <title>매치보드 글 등록하기</title>
   <%-- <jsp:include page="../header.jsp"/> --%>
   <jsp:include page="../commonCss.jsp"/>
   <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">
</head>
<body>

   <form action='add' method='post' enctype='multipart/form-data'>

  <div class="container">
    <h2><b>매치 글</b>을 <b>등록</b>할 수 있습니다.</h2>
    <br>
    <p><b>매치</b> 글을 등록한 후</p>
    <p>다른 팀의<b>대결 신청을 받아</b>경기를 진행해 보세요.</p>
    
    <table id="match_table" class="table table-bordered">
  <thead>
    <tr>
    <th scope="row" >경기일</th>
      <td>
     <input class="form-control" type='date' name='playDate'/>
      </td>
    </tr>
  </thead>
  <tbody>
     <tr>
      <th scope="row">소속팀</th>
      <td>
        <div class="form-group row">
           <div class="col-sm">
              <div class="input-group mb-2">
                <select name='teamId' class="custom-select" id="select2">
         	 	<option selected>소속팀 선택</option>
                <c:forEach items="${match}" var="match">
                     <c:if test="${!match.team.teamMember.team_leader}">
                    	<option value='${match.team.teamId}'>${match.team.teamName}</option>
                     </c:if> 
                </c:forEach>
                </select>
              </div>
              <%-- ${match.team.teamArea} --%>
            </div>
            </div>
      </td>
      <td>
      </td>
    </tr>
         <tr>
      <th scope="row">위치</th>
      <td>
        <div class="form-group row">
           <div class="col-sm">
              <div class="input-group mb-2">
              <input type="number" name="cost">
              </div>
              <%-- ${match.team.teamArea} --%>
            </div>
            </div>
      </td>
      <td>
      </td>
    </tr>
    
    
    <tr>
      <th scope="row">비용</th>
      <td>
        <input type="number" name="cost">원
      </td>
    </tr>
    <tr>
      <th scope="row">제목</th>
      <td>
      	<input type="text" name="title">
      </td>
    </tr>
    <tr>
      <th scope="row">내용</th>
      <td>
       <textarea name="contents" rows="10" cols="50"></textarea>
      </td>
    </tr>
    <tr>
      <th scope="row">전화번호</th>
      <td>
      	<input type="text" name="telephone">
      </td>
    </tr>
    <tr>
      <th scope="row">태그</th>
      <td>
      	<input type="text" name="tag">
      </td>
    </tr>
  </tbody>
     <jsp:include page="createSideBar.jsp"/> 
</table>
      <div class="form-group row">
        <div class="col-sm-10">
          <button id="add" class="btn btn-primary">등록</button>
          <a class="btn btn-primary" href='.'>목록</a>
        </div>
      </div>
	
	<br><br><br><br><br>
	
  </div> <!-- .container -->
</form>

<!-- <script type="text/javascript">
function checkTerms() {
	  var res = true;
	  
	  var dateSelect = $('#playDate').val();
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

	  if (dateSelect.length <=  ||
	      titleCheck.length <= 0 ||
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

	  $("#add").submit();
	  return true;
	}
	
</script> -->
</body>
</html>
