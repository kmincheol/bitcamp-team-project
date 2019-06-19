<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>${match.team.teamName} 매치 글 상세보기</title>
<head>

<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/common.css" />
<link rel="stylesheet" href="${contextRootPath}/css/matchboarddetail.css">
</head>
<jsp:include page="../header.jsp" />

<body>
  <div class="container" id="main-wrap">

<div id="main-wrap" class="container">
  <div id="main-text">
    <h2 id="titleTeamName" style="cursor:pointer;"
    onClick="window.open('${contextRootPath}/app/team/${match.team.teamId}', '팝업!', 'width=804, height=752');return false;">
    
    ${match.team.teamName}</h2>
  </div>
  
  
  <div id="title-wrap" class="form-group row">
          <div id="title-row" class="col-sm-12">
            <div id="title" style="word-break:break-all; ">${match.title}</div>
          </div>
          <div id="teamName-row" class="col-sm-12">
            <span id="teamName">${match.team.teamName}</span> 
            <span>|</span>
            <span id="createdDate">${match.createdDate}(글작성일)</span> 
            <span>|</span>
            <span id="viewCount">${match.viewCount}</span>
          </div>
        </div>
</div>


    <div id="detail_background">
    <form action='update' method='post'>

<div id="contents-wrap">
        <div id="info-wrap">
          <table class="info-table">
            <tr>
              <th>
                <div>경기날짜</div>
              </th>
              <td>
                <div id="sportsType">${match.playDate}</div>
              </td>
              <th>
                <div>경기장</div>
              </th>
              <td>
                <div id="location">${match.stadiumName}</div>
              </td>
            </tr>
            <tr>
              <th>
                <div>종목</div>
              </th>
              <td>
                <div id="sportsType">
                           <c:choose>
                            <c:when test="${match.teamTypeSports.teamSportsType eq 'soccer'}">
                                축구<img style="width:30px; height:30px; margin-bottom:5px;" src="${contextRootPath}/images/football_list_min.png">
                            </c:when>
                            <c:when test="${match.teamTypeSports.teamSportsType eq 'baseball'}">
                                야구<img style="width:30px; height:30px; margin-bottom:5px;" src="${contextRootPath}/images/baseball_list_min.png">
                            </c:when>
                            <c:when test="${match.teamTypeSports.teamSportsType eq 'basketball'}">
                                농구<img style="width:30px; height:30px; margin-bottom:5px;" src="${contextRootPath}/images/basketball_list_min.png">
                            </c:when>
                            <c:when test="${match.teamTypeSports.teamSportsType eq 'pingpong'}">
                                탁구<img style="width:30px; height:30px; margin-bottom:5px;" src="${contextRootPath}/images/pingpong_list_min.png">
                            </c:when>
                          </c:choose>
                </div>
              </td>
              <th>
                <div>지역</div>
              </th>
              <td>
                <div id="location">${match.location}</div>
              </td>
            </tr>
          </table>
        </div>

        <div id="contents-section">
          <div class="contents-section-head">
            <div>내용</div>
          </div>
          <div class="contents-section-body">
            <div class="contents" style="word-break:break-all;">${match.contents}</div>
          </div>
        </div>

  
      <div id="control-box" class="form-group row">
          <div class="col-sm-12 text-center">                
            <a class="btn btn-outline-dark" href='${contextRootPath}/app/matchboard'>목록</a>
      
            <!-- 수정, 삭제는 해당팀의 팀장만 가능하게 조건필요 -->
            
             <c:if test="${!empty sessionScope.loginUser}">
             <c:if test="${sessionScope.loginUser.id eq matchuserId}">
          <a id="delt" class="btn btn-outline-dark" href='delete/${match.no}'>삭제</a>
          <a id="updt" class="btn btn-outline-dark" href='${contextRootPath}/app/matchboard/update_form/${match.no}'>변경</a> 
            </c:if>
            </c:if>
    </div>
    </div>
    </div>
    
      </form>
          <c:if test="${sessionScope.loginUser.id ne matchuserId}">
              <div id="mtaply">
               <c:if test="${!empty sessionScope.loginUser}">
              <h5 style="color: #557745;">나의 팀:</h5>
               <select name='teamId' class="form-control" id="selectBox">
                 <option value="" selected>소속팀(Leader) 선택</option>
                  <c:forEach items="${myteam}" var="myteam">
                    <option value='${myteam.team.teamId}'>${myteam.team.teamName}</option>
                  </c:forEach>
               </select>
               
                <button class="btn btn-danger" id="btnsub2">매치신청</button>
              </c:if>
              </div>
          </c:if>
      
    </div>
  </div> <!-- .container -->


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


