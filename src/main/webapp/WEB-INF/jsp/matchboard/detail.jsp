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
#detail_background{
  text-align: center;
}
#detail_table {
  background-color:#FDF7EF ;
  text-align: center;
  width:1000px;
}
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

  <div class="container">
    <br><br><br>
    <div id="main-text">
      <h2>작성글 확인</h2>
    </div>

    <div style="padding-left: 100px; padding-bottom: 10px; padding-top: 10px; ">
      <a class="btn btn-primary" href='${contextRootPath}/app/matchboard'>목록</a> 
    </div>
    
    
    <div id="detail_background">
      <form action='update' method='post' enctype='multipart/form-data'>
   
   <table class="table" id="detail_table">
  <tr>
      <th scope="col">
          <label for="no">번호</label>
      </th>
      <td>
            <label id="no">${match.no}</label>
      </td>
      <th scope="col">
          <label for="viewCount">조회수</label>
      </th>   
      <td>   
            <label id="viewCnt">${match.viewCount}</label>
      </td>
      
      <td scope="col" rowspan="3" colspan="1" style="text-align: center;">
            <label for="후후사진">엠블럼자리입니다</label>
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
	     <th id="teamArea" scope="col" colspan="4" rowspan="1" >
          <label for="teamName">팀명</label>
         </th>
         <td>
            <label> ${match.team.teamName} </label>
	     </td>
	     
</tr>
<tr>
     <th scope="col" colspan="1" >
          <label for="title">제목</label>
     </th>     
     <td>
            <label>${match.title}</label>
      </td>
           
</tr>

<tr>
	<th scope="col" colspan="1" >
          <label for="contents">내용</label>
    </th>
    <td colspan="4">
            <label class="form-control">${match.contents}</label>
	 </td>
</tr>	
	</table>  
        <div class="form-group row" style="padding-left:165px;">
          <div class="col-sm-10">
            <!-- 수정, 삭제는 해당팀의 팀장만 가능하게 조건필요 -->
             <c:if test="${!empty sessionScope.loginUser}">
             <c:if test="${sessionScope.loginUser.no eq match.team.teamMember.memberNo}">
             <c:if test="${match.team.teamMember.teamLeader == 'true'}">
          <a id="delt" class="btn btn-primary" href='delete/${match.no}'>삭제</a>
          <a id="updt" class="btn btn-primary" href='${contextRootPath}/app/matchboard/update/${match.no}'>변경</a> 
            </c:if> 
            </c:if>
            </c:if>
          </div>
        </div>
      </form>
              <form action='${contextRootPath}/app/matchboard/${match.no}/submit' id="mtaply" method='post'>
              <c:if test="${!empty sessionScope.loginUser}">
					<select name='teamId' class="form-control" id="selectBox" style="width:150px;">
					<option selected>소속팀 선택</option>
					<c:forEach items="${myteam}" var="myteam">
					<c:if test="${myteam.team.teamMember.teamleader}">  <!--!!!!! 왜 적용이 안될까... !!!!!-->
					<option value='${myteam.team.teamId}'>${myteam.team.teamName}</option>
                    </c:if>
					</c:forEach>
					</select>
              <button class="btn btn-primary" id="btnsub2">신청하기</button>
            </c:if>
				</form>
    </div>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />


<script>

var openWin;


function openMap()
{
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    window.open("${contextRootPath}/app/matchboard/map2.jsp",
            "childForm", "width=800, height=500, resizable = no, scrollbars = no");    
}

var ajaxSend = (function() {

  if (!isSubmitted) {

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
      if (xhr.readyState == 4) {
        if (xhr.status == 200) {
          
	alert("신청되었습니다.")
          
	    isSubmitted = true;
      location.href = '../'
          
    // 버튼 요소의 disabled 속성 추가
    ajaxButton.setAttribute('disabled', 'disabled');
  
        } else {
          alert("이미 매칭 신청을 보냈습니다.");
          location.href = ''
        }
      }
    };

  }
});
// Ajax 전송 버튼 이벤트
ajaxButton.addEventListener('click', ajaxSend);

</script>





</body>
</html>


