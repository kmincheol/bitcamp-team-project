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
   <link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>
<br><br><br>

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
     <input class="form-control" type='date' id="playDate" name='playDate'/>
      </td>
    </tr>
  </thead>
  <tbody>
          <tr>
      <th scope="row" >소속팀</th>
      <td>
        <div class="form-group row">
           <div class="col-sm">
              <div class="input-group mb-2">
                <select name='teamNo' class="custom-select" id="selectBox" >
         	 	<option selected>소속팀 선택</option>
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
                <select name='location' class="custom-select" id="sido" onchange="itemChange()">
            <option value="" disabled selected hidden>지역선택</option> <!-- db명 toplc  -->
            <option value="01">서울</option>
            <!-- <option value="02">경기</option>
            <option value="03">인천</option>  -->
                </select>
              </div>
            </div>
				  <div class="col-sm">
              <div class="input-group mb-2">
                <select name='location' class="custom-select" id="gugun">
            <option value="" disabled selected hidden>지역선택</option> <!-- db명 toplc  -->
                </select>
              </div>
            </div>
    	  </div>
 	   </td>
 	   </tr>
    <tr>
      <th scope="row">경기장</th>
      <td>
        <input type="text" class="form-control-sm" name="stadiumName">
      </td>
    </tr>
    
      <tr>
      <th scope="row">종목</th>
      <td>
         <div class="col-sm">
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
      <th scope="row">내용</th>
      <td>
       <textarea name="contents" class="form-control" rows="10" cols="50"></textarea>
      </td>
    </tr>
    <tr>
      <th scope="row">비용</th>
      <td>
        <input type="number" class="form-control-sm" name="cost">원
      </td>
    </tr>

    
  </tbody>
     <jsp:include page="createSideBar.jsp"/> 
</table>
      <div class="form-group row">
        <div class="col-sm-10">
          <a class="btn btn-primary" href='.'>목록</a>
          <button id="add" class="btn btn-primary">매치보드에 등록하기</button>
        </div>
      </div>
	
	<br><br><br><br><br>
	
</form>
  </div> <!-- .container -->
    <script type="text/javascript">

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
function itemChange(){
	var Seoul = [
		'강남구','강동구','강북구','강서구','관악구','광진구',
		'구로구','금천구','노원구','도봉구','동대문구','동작구',
		'마포구','서대문구','서초구','성동구','성북구','송파구',
		'양천구','영등포구','용산구','은평구','종로구','중구',
		'중랑구'
		];
	 /* var Gyeonggi = [
		'고양시 덕양구','고양시 일산동구','고양시 일산서구','과천시','광명시',
		'광주시','구리시','군포시','김포시','남양주시','동두천시',
		'부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구',
		'성남시 수정구','성남시 중원구','수원시 권선구','수원시 영통구',
		'수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구',
		'안성시','안양시 동안구','안양시 만안구','양주시','오산시','용인시 기흥구',
		'용인시 수지구','용인시 처인구','의왕시','의정부시','이천시','파주시',
		'평택시','포천시','하남시','화성시','가평군','양평군','여주군','연천군'
		];
	var Incheon = [
		'계양구','남구','남동구','동구','부평구','서구',
		'연수구','중구','강화군','옹진군'
		];  */
	 
	var selectItem = $("#sido").val();
	 
	var changeItem;
	  
	if(selectItem == "01"){ // 서울
	  changeItem = Seoul;
	}
	/*  else if(selectItem == "02"){ // 경기
	  changeItem = Gyeonggi;
	}
	else if(selectItem == "03"){ // 인천
	  changeItem =  Incheon;
	}  */
	 
	$('#gugun').empty();
	 
	for(var count = 0; count < changeItem.length; count++){                
	    var option = $("<option>"+changeItem[count]+"</option>");
	    $('#gugun').append(option);
	            }
	
	}
	
</script>




<!-- <script type="text/javascript">

function js_select_region(select1,select2){
	if(!select1){alert('error');return;}
	if(!select2){alert('error');return;}
	if(!js_select_region_select_sido(select1)){alert('error');return;}
	if(!js_select_region_select_gugun(select1,select2)){alert('error');return;}	
	select1.onchange=function(){
		select2.value = '';
		js_select_region_select_gugun(select1,select2)
	}
}

function js_select_region_select_sido(select1){
	if(!js_select_region_sido){return false;}
	if(select1.tagName !='SELECT'){return false;}

	var sido = js_select_region_sido;
	var val = select1.value;
	var opts = select1.options;
	select1.length = 0;

	var opt = new Option('시/도','',(val==''),(val==''));
	opts.add(opt);
	
	for(var i=0,m=sido.length;i<m;i++){
		var opt = new Option(sido[i],sido[i],(val==sido[i]),(val==sido[i]));
		opts.add(opt);		
	}
	return true;
}
function js_select_region_select_gugun(select1,select2){
	if(!js_select_region_gugun){return false;}
	if(select1.tagName !='SELECT'){return false;}
	if(select2.tagName !='SELECT'){return false;}
	
	var gugun = js_select_region_gugun;
	var val = select2.value;
	var opts = select2.options;
	select2.length = 0;	
	var opt = new Option('구/군','',(val==''),(val==''));
	opts.add(opt);

	if(!select1.value){		select2.disabled=true;			return true;	}
	else{		select2.disabled=false;		}
	
	var list = gugun[select1.value];
	if(!list){return false;}
	   
	for(var i=0,m=list.length;i<m;i++){
		var opt = new Option(list[i],list[i],(val==list[i]),(val==list[i]));
		opts.add(opt);		
	}
	return true;	
}

var js_select_region_sido = new Array(
		'서울',
		'인천',
		'경기',
		);

		var js_select_region_gugun = new Object();
		js_select_region_gugun['서울'] = new Array(
		'강남구','강동구','강북구','강서구','관악구','광진구',
		'구로구','금천구','노원구','도봉구','동대문구','동작구',
		'마포구','서대문구','서초구','성동구','성북구','송파구',
		'양천구','영등포구','용산구','은평구','종로구','중구',
		'중랑구'			  
		);
		js_select_region_gugun['인천'] = new Array(
		'계양구','남구','남동구','동구','부평구','서구',
		'연수구','중구','강화군','옹진군'
		);
		js_select_region_gugun['경기'] = new Array(
		'고양시 덕양구','고양시 일산동구','고양시 일산서구','과천시','광명시',
		'광주시','구리시','군포시','김포시','남양주시','동두천시',
		'부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구',
		'성남시 수정구','성남시 중원구','수원시 권선구','수원시 영통구',
		'수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구',
		'안성시','안양시 동안구','안양시 만안구','양주시','오산시','용인시 기흥구',
		'용인시 수지구','용인시 처인구','의왕시','의정부시','이천시','파주시',
		'평택시','포천시','하남시','화성시','가평군','양평군','여주군','연천군'
		);

</script> -->
	
</body>
</html>
