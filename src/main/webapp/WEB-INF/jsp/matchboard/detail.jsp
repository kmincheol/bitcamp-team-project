<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/common.css" />
<link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">
</head>
<jsp:include page="../header.jsp" />

<style>
th {
width:70px;
}
td {
width:70px;
}
#teamArea{
text-align: right;
}
#btnsub2{
width:300px;
}
</style>

<body>

    <div id="main-text">
      <h2>${match.team.teamName}</h2>
    </div>

  <div class="container" id="main-wrap">

    <div id="detail_background">
      <form action='update' method='post'>
   
   <table class="table table-striped table-dark" id="detail_table">
  <tr>
      <th scope="col">
          <label for="no">번호</label>
      </th>
      <td>
            <label id="no" class="detail">${match.no}</label>
      </td>
      <th scope="col">
          <label for="viewCount">조회수</label>
      </th>   
      <td>   
            <label id="viewCnt">${match.viewCount}</label>
      </td>
      
      <td scope="col" rowspan="3" colspan="1" style="text-align: center;">
      엠블럼
      <div style="width:60px; height:50px;">
       ${match.team.teamEmblemPhoto}
      </div>
      </td>   
  </tr>
	  
  <tr>
        <th scope="col">
          <label for="playdt">경기날짜</label>
        </th>
        <td>
            <label> ${match.playDate}</label>
        </td>
        <th scope="col">
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
		<th scope="col">
          <label for="location" >경기장</label>
       </th>
       <td>  
          <input id="stadiumName" value="${match.stadiumName}" style="border:none;"readonly> <button id="map" type="button" onclick="openMap()">위치보기</button>
       </td>      
       <th scope="col">
          <label for="sportsType" id="typlab">종목</label>
       </th>
       <td>  
          <label id="sportsType">${match.teamTypeSports.teamSportsType}</label>
		</td>
</tr>

<tr>
     <th scope="col" colspan="1" >
          <label for="title">제목</label>
     </th>     
     <td colspan="4">
            <label >${match.title}</label>
      </td>
           
</tr>

<tr>
	<th scope="col" colspan="1" >
          <label for="contents" style="padding-top:130px;">내용</label>
    </th>
    <td colspan="4">
            <textArea class="form-control" style="height:300px;" readonly="readonly">${match.contents}</textArea>
	 </td>
</tr>	
	</table>  
  
      <div class="listbtn">
      <a id="listbutton" class="btn btn-dark" href='${contextRootPath}/app/matchboard/'>목록</a> 
  
          <div class="col-sm-10">
            <!-- 수정, 삭제는 해당팀의 팀장만 가능하게 조건필요 -->
             <c:if test="${!empty sessionScope.loginUser}">
             <c:if test="${sessionScope.loginUser.id eq matchuserId}">
          <a id="delt" class="btn btn-primary" href='delete/${match.no}'>삭제</a>
          <a id="updt" class="btn btn-primary" href='${contextRootPath}/app/matchboard/update_form/${match.no}'>변경</a> 
            </c:if>
            </c:if>
          </div>
<%--              <c:if test="${match.team.teamMember.teamLeader == 'true'}"> --%>
    </div>
      </form>
              <div id="mtaply" >
               <c:if test="${!empty sessionScope.loginUser}">
               <select name='teamId' class="form-control col-md-4" id="selectBox">
                 <option value="" selected>소속팀(Leader) 선택</option>
                  <c:forEach items="${myteam}" var="myteam">
                    <option value='${myteam.team.teamId}'>${myteam.team.teamName}</option>
                  </c:forEach>
               </select>
                <button class="btn btn-danger" id="btnsub2">신청하기</button>
              </c:if>
              </div>
      
    </div>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />


<script>
var openWin;
var choiceTeamValue; //신청팀번호
var matchTeamNo;// 매치글의 팀번호 들어옴
var sizesize = $("input[id='loginUserTeamNumbers']").length; // 신청자의 팀 배열 길이.
var teamnocom = sizesize;

console.log("${sessionScope.loginUser.id} + '로그인 유저 아이디'");
console.log("${matchuserId} + '매치글 작성 유저 아이디'");

function openMap(){
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    window.open("${contextRootPath}/app/matchboard/map2.jsp",
            "childForm", "width=800, height=500, resizable = no, scrollbars = no");    
}




$('#btnsub2').click(function() {
    var choiceTeamValue = $("#selectBox option:selected").val();

   var no = '${match.no}';
   matchTeamNo = '${match.team.teamId}';
   
   //console.log(typeof choiceTeamValue);
   console.log(no +"-> 매치번호"); // 매치번호
   console.log(choiceTeamValue+"-> 신청팀번호"); //신청팀번호
 

     
       console.log(no+"-> 매치번호");
       console.log(matchTeamNo+"-> 매치글작성한 팀번호");
   
   
   
   if (choiceTeamValue == "") {
 		 alert("팀을 선택해주세요.");
 	    return false;
 	  }
		if (matchTeamNo == choiceTeamValue) {
			alert("자기가 속한 팀에 신청을 할 수 없습니다.")
			return false;
		}
		
 	  $.ajax({
 	    type:"POST",
 	    url:'submit/' + no,
 	    contentType: 'application/json',
 	    dataType: "text",
 	    data:JSON.stringify({
 	      teamId: choiceTeamValue
 	    }),
 	    success : function(data) {
 	    	console.log(data)
 	    	if (data == 12345) {
 	        alert("신청 되었습니다.");
 	        location.href=".";
 	        	}
 	    	},
 	    error : function(data) {
 	       alert("이미 신청되었습니다.")
 	       location.href=".";
 	    	}
 	    })
 	 });




</script>





</body>
</html>


