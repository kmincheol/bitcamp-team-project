<%@page import="com.eomcs.lms.domain.Match"%>
<%@page import="com.eomcs.lms.domain.Team"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<jsp:include page="../header.jsp" />

  <title>매치보드 글 등록하기</title>
   <%-- <jsp:include page="../header.jsp"/> --%>
   <jsp:include page="../commonCss.jsp"/>
   <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="${contextRootPath}/css/common.css" />
   <link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">
   

</head>
<body>
    
  <div id="main-text">    
    <h2 style="text-align:center;"><b>매치 글</b>을 <b>등록</b>할 수 있습니다.</h2>
    <br>
    <p><b>매치</b> 글을 등록한 후</p>
    <p>다른 팀의<b>대결 신청을 받아</b>경기를 진행해 보세요.</p>
  </div>

  <div class="container" id="main-wrap">
  
   <form action='add' method='post'>
    
    <table id="match_table" class="table table-bordered">
  <thead>
    <tr>
    <th scope="row">경기일</th>
      <td>
     <input class="form-control" type='date' id="playDate" name='playDate'/>
      </td>
    </tr>
  </thead>
  <tbody>
          <tr>
      <th scope="row" id="teamsteams" >소속팀</th>
      <td>
        <div class="form-group row">
           <div class="col-sm">
              <div class="input-group mb-2">
                <select name='teamNo' class="custom-select" id="selectBox22" >
         	 	<option value="" disabled selected hidden>소속팀(Leader) 선택</option>
                <c:forEach items="${match}" var="match">
                     <c:if test="${!match.team.teamMember.team_leader}">
                    	<option value='${match.team.teamId}'>${match.team.teamName}</option>
                     </c:if> 
                </c:forEach>
                </select>
              </div>
				</div>
			 </div>
    	  </td>
    	  </tr>
    	  <tr>
    	  <th scope="row">위치</th>
    	  <td>
			 <div class="form-group row">
				 <div class="col-sm">
              <div class="input-group mb-2">
                <select class="custom-select" id="sido" name="location" onchange="itemChange()">
            <option value="" disabled selected hidden>지역선택</option> <!-- db명 toplc  -->
            <option value="01">서울</option>
                </select>
              </div>
            </div>
				  <div class="col-sm">
              <div class="input-group mb-2"> <!-- 지역번호2를 받아야하니까 도메인 수정하장 -->
            <select name='location' class="custom-select" id="gugun">
            <option value="" disabled selected hidden>지역선택</option> 
              <!-- <option value="01">강남구</option> <option value="02">강동구</option> <option value="03">강북구</option>
              <option value="04">강서구</option> <option value="05">관악구</option> <option value="06">광진구</option>
              <option value="07">구로구</option> <option value="08">금천구</option> <option value="09">노원구</option>
              <option value="10">도봉구</option> <option value="11">동대문구</option> <option value="12">동작구</option>
              <option value="13">마포구</option> <option value="14">서대문구</option> <option value="15">서초구</option>
              <option value="16">성동구</option> <option value="17">성북구</option> <option value="18">송파구</option>
              <option value="19">양천구</option> <option value="20">영등포구</option> <option value="21">용산구</option>
              <option value="22">은평구</option> <option value="23">종로구</option> <option value="24">중구</option>
              <option value="25">중랑구</option> -->
                </select>
              </div>
            </div>
    	  </div>
 	   </td>
 	   </tr>
    <tr>
      <th scope="row">경기장</th>
      <td>
        <input id="pInput" class="form-control-sm" name="stadiumName"> 
        <a  onclick="openMap()">검색하기</a>
      </td>
    </tr>
    
      <tr>
      <th scope="row">종목</th>
      <td>
         <div class="col-sm" id="selectType" style="padding-left: 0px;">
              <div class="input-group mb-2">
                <select name='teamSportsId' class="custom-select" id="inputGroupSelect01"> 
            <option value="" disabled selected hidden>종목선택</option> <!-- db명 toplc  -->
            <option value="1">축구</option>
            <option value="2">야구</option>
            <option value="3">농구</option>
            <option value="4">탁구</option>
                </select>
              </div>
            </div>
      </td>
    </tr>
    <tr>
      <th scope="row">전화번호</th>
      <td>
      	<input type="text" class="form-control-sm" name="telephone">
      </td>
    </tr>
    <tr>
      <th scope="row">제목</th>
      <td>
      	<input type="text" class="form-control" name="title" >
      </td>
    </tr>
    <tr>
      <th scope="row" style="padding-top:120px;">내용</th>
      <td>
       <textarea name="contents" class="form-control" rows="10" cols="50"></textarea>
      </td>
    </tr>
    <tr>
      <th scope="row">비용</th>
      <td>
        <input type="number" class="form-control-sm" name="cost" value=0>원
      </td>
    </tr>

  </tbody>
</table>

    <div class="listbtn">
    <a class="btn btn-dark" href='.'>목록</a>
    </div>

        <div id="regbtn">
          <button id="add" class="btn btn-dark" type=submit>매치보드에 등록하기</button>
        </div>
	
<br><br>
</form>

  </div> <!-- .container -->
  
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    
    <script type="text/javascript">
    
    var openWin;
    
    function openMap()
    {
        // window.name = "부모창 이름"; 
        window.name = "parentForm";
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
        openWin = window.open("${contextRootPath}/app/matchboard/map.jsp",
                "childForm", "width=800, height=500, resizable = no, scrollbars = no");    
    }

    
    	function getDate() {
    	  var today = new Date();
    	  var dd = today.getDate();
    	  var mm = today.getMonth()+1; //January is 0!
    	  var yyyy = today.getFullYear();

    	  if(dd<10) {
    	      dd = '0'+dd
    	  } 
    	  if(mm<10) {
    	      mm = '0'+mm
    	  } 
    	  today = yyyy + '-' + mm + '-' + dd;
    	  console.log(today);
    	  document.getElementById("playDate").value = today;
    	}
    	window.onload = function() {
    	  getDate();
    	};
		
	 </script>


<script>
function itemChange(number){
 	var Seoul = new Array(); 
 	Seoul[0] = '강남구';
	Seoul[1] = '강동구';
	Seoul[2] = '강북구';
	Seoul[3] = '강서구';
	Seoul[4] = '관악구';
	Seoul[5] = '광진구';
	Seoul[6] = '구로구';
	Seoul[7] = '금천구';
	Seoul[8] = '노원구';
	Seoul[9] = '도봉구';
	Seoul[10] = '동대문구';
	Seoul[11] = '동작구';
	Seoul[12] = '마포구';
	Seoul[13] = '서대문구';
	Seoul[14] = '서초구';
	Seoul[15] = '성동구';
	Seoul[16] = '성북구';
	Seoul[17] = '송파구';
	Seoul[18] = '양천구';
	Seoul[19] = '영등포구';
	Seoul[20] = '용산구';
	Seoul[21] = '은평구';
	Seoul[22] = '종로구';
	Seoul[23] = '중구';
	Seoul[24] = '중랑구';
	 
	var selectItem = $("#sido").val();
	 
	var changeItem;
	  
	if(selectItem == "01"){ // 서울
	  changeItem = Seoul;
	}
	$('#gugun').empty();
	 
	for(var count = 0; count < changeItem.length; count++){
	    var option = $("<option>"+changeItem[count]+"</option>");
	    $('#gugun').append(option);
	    } 
	
	
	/* var ssido = $("#sido").find("option:selected").val();
 	var ggugun = $("#gugun").find("option:selected").val();

	var location = ("$(ssido).text()" + "$(ggugun).text()"); 
	document.attr("#loc").text(location); */
}


	
</script>


	
</body>
</html>
