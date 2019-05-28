<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">
</head>
<jsp:include page="../header.jsp" />

<style>

#detail_table {
  text-align: center;
  width:1100px;
}
#detail_background{
  text-align: center;
}

th {
width:70px;
}

td {
width:70px;
}
</style>


<body>

  <div class="container">
    <br><br><br>
    <div id="main-text">
      <h2>작성글 확인</h2>
    </div>

    <div id=detail_background>
      <form action='update' method='post' enctype='multipart/form-data'>
   
   <table id="detail_table">
  <tr>
      <th>
          <label for="no">번호</label>
      </th>
      <td>
            <label id="no">${match.no}</label>
      </td>
      <th>
          <label for="viewCount">조회수</label>
      </th>   
      <td>   
            <label id="viewCnt">${match.viewCount}</label>
      </td>
  </tr>
	  
  <tr>
        <th>
          <label for="playdt">경기날짜</label>
        </th>
        <td>
            <label> ${match.playDate}</label>
        </td>
        <th>
          <label for="location" id="loclab">지역</label>
          </th>
        <td>
            <label id="location">${match.location}</label>
        </td>
  </tr>
<%--         <div class="form-group row">
          <label for="playdt" class="col-sm-2 col-form-label">연령대</label>
          <div class="col-sm-10">
            <input type="number" class="form-control" name="teamAges"
              value="${match.teamAges.teamAges}" readonly/>
          </div>
        </div> --%>

<tr>
		<th>
          <label for="location" >경기장</label>
       </th>
       <td>  
          <label id="stadiumName">${match.stadiumName}</label>
       </td>      
       <th>
          <label for="sportsType" id="typlab">종목</label>
       </th>
       <td>  
          <label id="sportsType">${match.teamTypeSports.teamSportsType}</label>
		</td>
</tr>

<tr>
	     <th>
          <label for="teamName" >팀</label>
         </th>
         <td>
            <label> ${match.team.teamName} </label>
	     </td>
</tr>
<tr>
     <th>
          <label for="title">제목</label>
     </th>     
     <td>
            <label>${match.title}</label>
      </td>
           
</tr>

<tr>
	<th>
          <label for="contents">내용</label>
    </th>
    <td>
            <label class="form-control">${match.contents}</label>
	 </td>
</tr>	
	</table>  


        <div class="form-group row">
          <div class="col-sm-10">
            <a class="btn btn-primary" href='${contextRootPath}/app/matchboard'>목록</a> 

              
              <c:if test="${!empty sessionScope.loginUser}">
              <a href='${contextRootPath}/app/matchboard' id="btnsub2"
               class="btn btn-primary" role="button" aria-disabled="true">신청하기</a>
            </c:if>
            <!-- 로그인 한 사용자와 글을 작성한 팀장과 같다면 버튼을 가림 -->


            <!-- 팀장이 매칭글을 적고 나서 수정, 삭제는 해당팀의 팀장만 가능하게 조건필요 -->
             <c:if test="${!empty sessionScope.loginUser}">
             <c:if test="${match.team.teamMember.team_leader == true}"> 
          <a id="delt" class="btn btn-primary" href='delete/${match.no}'>삭제</a>
          <a id="updt" class="btn btn-primary" href='${contextRootPath}/app/matchboard/update/${match.no}'>변경</a> 
             </c:if>
            </c:if> 
          </div>
        </div>
      </form>
    </div>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />

</body>

</html>