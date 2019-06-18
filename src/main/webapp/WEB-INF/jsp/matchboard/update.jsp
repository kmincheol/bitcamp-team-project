<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>매치보드 글 수정하기</title>
<head>
<link rel="stylesheet" href="${contextRootPath}/css/common.css">
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">
<style>
  th{
    vertical-align: middle!important;
    text-align: center;
    background: #f9f7f7;
  }    
</style>

</head>
<body>
  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" /> 

  <div id="main-text">    
    <h2 style="text-align:center;"><b>매치 글</b>을 <b>수정</b>할 수 있습니다.</h2>
  </div>
  
  <div class="container" id="main-wrap" style="margin-top: 50px;">

    <form action='../update' method='post' name="update">
    
    <input type="hidden" name="no" value="${match.no}" style="display: none;" />
    <input type="hidden" name="teamNo" value="${match.teamNo}" style="display: none;">
      
      <table id="match_table" class="table table-bordered table-white">
        <tbody>
          <tr>
            <th scope="row">제목</th>
            <td colspan="3"><input type="text" id="title" class="form-control col-md-12"
              name="title" value="${match.no}"></td>
          </tr>
          <tr>
            <th scope="row">소속팀</th>
            <td>
            ${match.team.teamName}
            </td>
            <th scope="row">경기일</th>
            <td>
            <input class="form-control" type='date' id="playDate" name='playDate' value="${match.playDate}" />
            </td>
          </tr>
          <tr>
            <th scope="row">종목</th>
            <td><select name='teamSportsId' class="custom-select" id="inputGroupSelect01">
                <option value="{match.teamTypeSports.teamSportsTypeId}" disabled selected hidden>${match.teamTypeSports.teamSportsType}</option>
                <!-- db명 toplc  -->
                <option value="1">축구</option>
                <option value="2">야구</option>
                <option value="3">농구</option>
                <option value="4">탁구</option>
            </select></td>
            <th scope="row">경기장</th>
            <td>
              <div class="input-group md-form form-sm form-2 pl-0">
              <input id="pInput" value="${match.stadiumName}" class="form-control-sm" name="stadiumName"> 
              <a onclick="openMap()">검색하기</a>
              </div>
            </td>
          </tr>
          <tr>
            <th scope="row">경기 지역</th>
            <td>
              <div class="form-group row" style="margin-bottom: 0;">
                <div class="col-sm">
                  <div class="input-group">
                    <select class="custom-select" id="sido" name="location" onchange="itemChange()">
                      <option value="" disabled selected hidden>지역선택</option>
                      <!-- db명 toplc_name  -->
                      <option value="서울">서울</option>   
                    </select>
                  </div>
                </div>
                <div class="col-sm">
                  <div class="input-group">
                    <!-- 지역번호2를 받아야하니까 도메인 수정하장 -->
                    <select name='location' class="custom-select" id="gugun">
                      <option value="" disabled selected hidden>지역선택</option>
                    </select>
                  </div>
                </div>
              </div>
            </td>
            <th scope="row">전화번호</th>
            <td><input type="text" class="form-control" name="telephone" value="${match.telephone}"></td>
          </tr>
          <tr>
            <th scope="row">내용</th>
            <td colspan="3"><textarea name="contents" class="form-control" rows="10" cols="50">${match.contents}</textarea>
            </td>
          </tr>    
          <tr>    
            <th scope="row">비용(원)</th>                      
            <td colspan="3"><input type="number" class="form-control" name="cost" value="${match.cost}" style="width: 343px;"></td>
          </tr>
        </tbody>
      </table>

      <div id="btnArea" style=" text-align: center;">       
          <a class="btn btn-outline-dark" href='.'>목록</a>
          <input type="button" id="add" class="btn btn-outline-dark" onclick="check_onclick()" value="매치보드 글 수정하기">
      </div>
    </form>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />
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
	var mm = today.getMonth() + 1; //January is 0!
	var yyyy = today.getFullYear();

	if (dd < 10) {
		dd = '0' + dd
	}
	if (mm < 10) {
		mm = '0' + mm
	}
	today = yyyy + '-' + mm + '-' + dd;
	console.log(today);
	document.getElementById("playDate").value = today;
}
window.onload = function() {
	getDate();
};

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
	  
	if(selectItem == "서울"){ // 서울
	  changeItem = Seoul;
	}
	$('#gugun').empty();
	 
	for(var count = 0; count < changeItem.length; count++){
	    var option = $("<option>"+changeItem[count]+"</option>");
	    $('#gugun').append(option);
	    }
}
	
	function check_onclick(){
  		theForm=document.update;
  		var choicelocation1 = $("#sido option:selected").val();
  		var choicelocation2 = $("#gugun option:selected").val();
  
  if(theForm.title.value=="" || theForm.playDate.value==""
      || choicelocation1=="" || theForm.teamSportsId.value=="" || theForm.contents.value==""
        || theForm.cost.value==""){
    
  		if(theForm.title.value==""){
  			alert("제목 입력란이 비어있습니다. 확인해 주세요.");
 			 theForm.title.focus();
  		}
      else if(theForm.playDate.value==""){
    			alert("경기 날짜를 입력해주세요.");
    		}
       else if(choicelocation1==""){
    			alert("지역을 선택 해주세요.");
    		}
      else if(theForm.teamSportsId.value==""){
    			alert("종목을 선택해 주세요.");
       theForm.teamSportsId.focus();
    		}
      else if(theForm.contents.value==""){
        			alert("내용을 입력해 주세요.");
        }
      else if(theForm.cost.value==""){
        		alert("비용을 입력해 주세요.");
           theForm.teamSportsId.focus();
        }
  } else {
    if (confirm("매치 수정하시겠습니까?") == true){    //확인
      document.update.submit();
  	}  else {   //취소
      return false;
 		 }
  }
	
}
</script>

</body>


</html>