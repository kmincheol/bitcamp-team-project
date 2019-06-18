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

    <form action='../update' method='post'>
      <table id="match_table" class="table table-bordered table-white"> <!-- 여기서부터  -->
        <tbody>
          <tr>
            <th scope="row">제목</th>
            <td colspan="3"><input type="text" id="title" name=title class="form-control col-md-12" value="${match.no}"/>
            </td>
          </tr>
          <tr>
             <th scope="row">경기일</th>
             <td><input type="date" class="form-control" name="playDate" value="${match.playDate}"/>
             </td>
          <th scope="row">종목</th>
          <td><div class="col-sm" id="selectType" style="padding-left: 0px;">
              <div class="input-group mb-2">
                <select name='teamSportsId' class="custom-select" id="inputGroupSelect01"> 
            <option value="" disabled selected hidden>${match.teamTypeSports.teamSportsType}</option> <!-- db명 toplc  -->
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
        <th scope="row">경기장</th>
        <td>
        <input id="pInput" value="${match.stadiumName}" class="form-control-sm" name="stadiumName"> 
        <a onclick="openMap()">검색하기</a>
        </td>
        <th scope="row">
          <label for="location" id="loclab">지역</label>
          </th>
        <td id="locationsetting">
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
<%--         <div class="form-group row">
          <label for="playdt" class="col-sm-2 col-form-label">연령대</label>
          <div class="col-sm-10">
            <input type="number" class="form-control" name="teamAges"
              value="${match.teamAges.teamAges}" readonly/>
          </div>
        </div> --%>



<tr>
  <th scope="col" colspan="1" >
          <label for="contents" style="padding-top:130px;">내용</label>
    </th>
    <td colspan="4">
            <textArea class="form-control" name="contents" style="height:300px;">${match.contents}</textArea>
   </td>
</tr> 
  </table>   <!-- 여기까지 -->

      <div class="form-group row" id="listbtn">
          <a id="listbutton2" class="btn btn-primary" href='${contextRootPath}/app/matchboard/'>목록</a>
          <button id="delt" class="btn btn-primary" type=submit>변경하기</button>
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
	  
	if(selectItem == ""){ // 서울
	  changeItem = Seoul;
	}
	$('#gugun').empty();
	 
	for(var count = 0; count < changeItem.length; count++){
	    var option = $("<option>"+changeItem[count]+"</option>");
	    $('#gugun').append(option);
	    } 
	
}
</script>

</body>


</html>