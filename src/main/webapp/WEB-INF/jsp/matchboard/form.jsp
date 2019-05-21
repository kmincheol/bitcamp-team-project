<%@page import="com.eomcs.lms.domain.Match"%>
<%@page import="com.eomcs.lms.domain.Team"%>
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
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>


  <div class="container">
   <form action='add' method='post' enctype='multipart/form-data'>
    <h2><b>매치 글</b>을 <b>등록</b>할 수 있습니다.</h2>
    <br>
    <p><b>매치</b> 글을 등록한 후</p>
    <p>다른 팀의<b>대결 신청을 받아</b>경기를 진행해 보세요.</p>
    
    <table id="match_table" class="table table-bordered">
  <thead>
    <tr>
    <th scope="row">경기일</th>
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
                <select name='teamNo' class="custom-select" id="selectBox" onchange="chageSelect()" >
         	 	<option selected>소속팀 선택</option>
                <c:forEach items="${match}" var="match">
                     <c:if test="${!match.team.teamMember.team_leader}">
                    	<option value='${match.team.teamId}'>${match.team.teamName}</option>
                     </c:if> 
                </c:forEach>
                </select>
              </div>
				</div>
            <select name="location" class="custom-select-sm" id="select2">
            <c:forEach items="${match}" var="match">
            <c:if test="${!match.team.teamMember.team_leader}">
            <option value="${match.team.teamArea}">${match.team.teamArea}</option>
            </c:if> 
            </c:forEach>
            </select>
<%--             		<select name="teamSportsId" class="custom-select-sm" id="select3">
            		<c:forEach items="${match}" var="match">
            		<c:if test="${!match.team.teamMember.team_leader}">
            		<option value="${match.team.teamSportsId}">${match.team.teamTypeSports.teamSportsType}</option>
            		</c:if> 
            		</c:forEach>
            		</select> --%>
        </div>
      </td>
    </tr>
    <%-- 팀의 이름을 출력할때 그렇다면 , leader 조건을 팀 지역에도 걸면
    팀의 번호와 leader의 개수가 같고 순서또한 같을것이다. 그럼 팀의 번호와 같은 지역만 출력해준다?--%>
    
    <tr>
      <th scope="row">비용</th>
      <td>
        <input type="number" class="form-control-sm" name="cost">원
      </td>
    </tr>
    <tr>
      <th scope="row">제목</th>
      <td>
      	<input type="text" class="form-control" name="title" >
      </td>
    </tr>
    <tr>
      <th scope="row">내용</th>
      <td>
       <textarea name="contents" class="form-control" rows="10" cols="50"></textarea>
      </td>
    </tr>
    <tr>
      <th scope="row">전화번호</th>
      <td>
      	<input type="text" class="form-control-sm" name="telephone">
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
	
</form>
  </div> <!-- .container -->

<script type="text/javascript">


/* function itemChange(){
	var teamArea = [${team.teamArea}];
	var selectItem = $("#selectBox").val();
	var changeItem;
	
	  
	if(selectItem == "팀정보"){
	  changeItem = teamArea;
	}
	 
	$('#select2').empty();
	 
	for(var count = 0; count < changeItem.size(); count++){                
	                var option = $("<option>"+changeItem[count]+"</option>");
	                $('#select2').append(option);
	            }
	 
	} */


</script>

	
</body>
</html>
