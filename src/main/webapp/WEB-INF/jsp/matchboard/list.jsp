<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
  <title>매치보드</title>
   <jsp:include page="../commonCss.jsp"/>
   <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">
   <link rel="stylesheet" href="${contextRootPath}/css/mainpage.css">
   
   <jsp:include page="header.jsp" />
</head>
<body> 

<%--     <div id="match_header">
      <img src="${contextRootPath}/images/match-header.jpg" class="img-fluid">
    </div>
    <div id="header">
        <nav class="navbar navbar-expand-lg justify-content-center">
            <a href="#"><img src="${contextRootPath}/images/logo.png" class="headerImg"></a>
        </nav>
    </div> --%> 
    
  <div class="container">
  <div id="match_content">
    <h2>등록된 <b>매치 글</b>을 검색하여 찾거나</h2>
    <h2>직접 매치글을 등록할 수 있습니다.</h2>
    <br>
    <p>원하는 <b>검색 결과에 맞춰</b> 경기를 매칭시키거나</p>
    <p><b>추천 매칭</b>을 통하여 경기를 매칭시켜보세요.</p>
   
      <form action='search' method='get'>
    <table id="match_table" class="table table-bordered">
  <thead>
    <tr>
    <th scope="row">경기 날짜</th>
      <td>
      <input class="form-control" id="playDate" type='date' name='playDate'/>
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">지역</th>
      <td>
       <div class="form-group row">
           <div class="col-sm">
              <div class="input-group mb-2">
                <select name='location' class="custom-select" id="inputGroupSelect01"> 
            <option value="" disabled selected hidden>지역선택</option> <!-- db명 toplc  -->
            <option value="01">서울</option>
            <option value="02">경기</option>
            <option value="03">인천</option>
                </select>
              </div>
            </div>
          <div class="col-sm">
              <div class="input-group mb-2">
                <select name='location2' class="custom-select" id="inputGroupSelect01">
          <option selected>지역선택</option> <!-- db명 midlc -->
          <c:forEach var="location" items="${location}" >
             <option value="${location.topLocationNo}">${location.topLocationName}</option>
          </c:forEach>
                </select>
              </div>
            </div>
          <div class="col-sm">
              <div class="input-group mb-2">
                <select name='location3' class="custom-select" id="inputGroupSelect01">
          <option selected>지역선택</option> <!-- db명 btmlc -->
            <option value="1">수유동</option>
                </select>
              </div>
            </div>
            </div>
      </td>
    </tr>
    <tr>
      <th scope="row">경기유형</th>
      <td>
        <div class="form-group row">
           <div class="col-sm">
              <div class="input-group mb-2">
                <select name='sportType' class="custom-select" id="inputGroupSelect01">
            <option selected>축구</option>  <!--  db명 spt_clsf -->
            <option value="1">야구</option>
            <option value="2">농구</option>
            <option value="3">탁구</option>
                </select>
              </div>
            </div>
            </div>
      </td>
    </tr>
    <tr>
      <th scope="row">연령대</th>
      <td>
        <div class="form-group row">
           <div class="col-sm">
              <div class="input-group mb-2">
                <select name='age' class="custom-select" id="inputGroupSelect01">
          <option selected>연령대선택</option> <!-- db명 age -->
            <option value="1">10대</option>
            <option value="2">20대</option>
            <option value="3">30대</option>
            <option value="4">40대</option>
            <option value="5">50대 이상</option>
                </select>
              </div>
            </div>
            </div>
      </td>
    </tr>
    <tr>
      <th scope="row">실력</th>
      <td>
        <div class="form-group row">
           <div class="col-sm">
              <div class="input-group mb-2">
                <select name='teamLevel' class="custom-select" id="inputGroupSelect01">
          <option selected>실력선택</option> <!-- db명 tm_lev -->
            <option value="1">상</option>
            <option value="2">중</option>
            <option value="3">하</option>
                </select>
              </div>
            </div>
            </div>
      </td>
    </tr>
    <tr>
      <th scope="row">키워드</th>
      <td>
      	<input name='search' value="${search}" class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요." aria-label="검색">
      </td>
    </tr>
  </tbody>
    <jsp:include page="sideBar.jsp"/>
</table>
    <div class="button1">
      <button class="btn btn-outline-success my-2 my-sm-0">검색</button>
	</div>
      </form>



      <br> <br> <br> <br>
      
      <c:if test="${!match.team.teamMember.team_leader}">
		<div class="button2">
          <a href='${contextRootPath}/app/matchboard/form.jsp'
          class="btn btn-primary btn-sm" tabindex="-1" role="button"
          aria-disabled="true">등록</a>
       </div>
       </c:if>
           <br>
      <!--     <th scope="row" id="subtitle" scope="col" width = 100% >신청 가능 매치</th>-->

      <div id="subtable">
        <table class="table">
          <tr>
            <td id="subtitle" colspan="3" width="100%">신청 가능 매치</td>
          </tr>

          <tbody>
				<c:forEach items="${matches}" var="match">
            <tr>
                	<td id="teaminfo" class="tableline" rowspan="4" align="center">${match.team.teamEmblemPhoto}  <!-- 엠블럼 들어갑니다. -->
                <br> 
                <!-- team URL 매핑이 아직 안되있으므로 누르면 에러남. -->
                <br> <a href='${contextRootPath}/app/matchboard/team/${match.team.teamId}'> ${match.team.teamName}<br> 아직 팀 페이지가 없습니다. </a>
                	</td>
              <td id="info"><a href='${contextRootPath}/app/matchboard/${match.no}'>종목: ${match.team.teamTypeSports.teamSportsType}</a></td>
            </tr>
            <tr>
              <td id="info">위치: ${match.location} </td>
              <c:if test="${!empty sessionScope.loginUser}">
             <td id="button3from" rowspan="2" align="center"> 
              <div class="button3">
           		<div class="form-group pos-relative">
            	<a href='#' class="js-tooltip-trigger" id="ref">
            	<button id="btnsub" class="btn btn-primary btn-sm" role="button" aria-disabled="true">신청하기</button></a>
          		<span class="js-tooltip" style="display: none;">
          		
          		
          		</span>
       	 		</div>
       		</div>
             </td>
       		</c:if>
            </tr>
             <tr>
               <td id="info">경기장: ${match.stadiumName}</td>
             </tr>
             <tr>
               <td id="info" class="tableline">경기날짜: ${match.playDate}</td>
             </tr>
			</c:forEach>
          </tbody>
          
        </table>
      
      
      <nav aria-label="목록 페이지 이동" id="listnum">
  <ul class="pagination justify-content-center">
  
    <li class="page-item ${pageNo <= 1 ? 'disabled' : ''}">
    <a class="page-link" href="?pageNo=${pageNo -  1}&pageSize=${pageSize}">이전</a></li>
    
    <li class="page-item ${pageNo <= 1 ? 'disabled' : ''}">
    <a class="page-link" href="?pageNo=${pageNo - 1}&pageSize=${pageSize}">${pageNo <= 1 ? "-" : pageNo - 1}</a></li>
    
    <li class="page-item active"><span class="page-link">${pageNo}</span></li>
    
    <li class="page-item ${pageNo >= totalPage ? 'disabled' : ''}">
    <a class="page-link" href="?pageNo=${pageNo + 1}&pageSize=${pageSize}">${pageNo >= totalPage ? "-" : pageNo + 1}</a></li>
    
    <li class="page-item ${pageNo >= totalPage ? 'disabled' : ''}">
      <a class="page-link" href="?pageNo=${pageNo + 1}&pageSize=${pageSize}">다음</a></li>
  </ul>
    </nav>
    
    </div>
    </div>
  </div>  <!-- .container -->
</body>


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

<!-- <script>

var js_select_region_sido = new Array(
		'서울'
/* 		'경기',
		'인천',
		'부산', */
/* 		'대구',
		'광주',
		'대전',
		'울산',
		'강원',
		'경남',
		'경북',
		'전남',
		'전북',
		'제주',
		'충남',
		'충북' */
		);

		var js_select_region_gugun = new Object();
		js_select_region_gugun['서울'] = new Array(
		'강남구','강동구','강북구','강서구','관악구','광진구',
		'구로구','금천구','노원구','도봉구','동대문구','동작구',
		'마포구','서대문구','서초구','성동구','성북구','송파구',
		'양천구','영등포구','용산구','은평구','종로구','중구',
		'중랑구'			  
		);
		
		
/* 		js_select_region_gugun['경기'] = new Array(
		'고양시 덕양구','고양시 일산동구','고양시 일산서구','과천시','광명시',
		'광주시','구리시','군포시','김포시','남양주시','동두천시',
		'부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구',
		'성남시 수정구','성남시 중원구','수원시 권선구','수원시 영통구',
		'수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구',
		'안성시','안양시 동안구','안양시 만안구','양주시','오산시','용인시 기흥구',
		'용인시 수지구','용인시 처인구','의왕시','의정부시','이천시','파주시',
		'평택시','포천시','하남시','화성시','가평군','양평군','여주군','연천군'
		);
		
		 js_select_region_gugun['인천'] = new Array(
		'계양구','남구','남동구','동구','부평구','서구',
		'연수구','중구','강화군','옹진군'
		);
		js_select_region_gugun['부산'] = new Array(
		'강서구','금정구','남구','동구','동래구','부산진구',
		'북구','사상구','사하구','서구','수영구','연제구',
		'영도구','중구','해운대구','기장군'  
		);  
		
		 js_select_region_gugun['대구'] = new Array(
		'남구','달서구','동구','북구','서구','수성구','중구',
		'달성군'
		);
		js_select_region_gugun['광주'] = new Array(
		'광산구','남구','동구','북구','서구'
		);
		js_select_region_gugun['대전'] = new Array(
		'대덕구','동구','서구','유성구','중구'
		);
		js_select_region_gugun['울산'] = new Array(
		'남구','동구','북구','중구','울주군'
		);
		js_select_region_gugun['강원'] = new Array(
		'강릉시','동해시','삼척시','속초시','원주시','춘천시',
		'태백시','고성군','양구군','양양군','영월군','인제군',
		'정선군','철원군','평창군','홍천군','화천군','횡성군'
		);
		js_select_region_gugun['경남'] = new Array(
		'거제시','김해시','마산시','밀양시','사천시','양산시','진주시',
		'진해시','창원시','통영시','거창군','고성군','남해군','산청군',
		'의령군','창녕군','하동군','함안군','함양군','합천군'
		);
		js_select_region_gugun['경북'] = new Array(
		'경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시',
		'영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군',
		'영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군'
		);
		js_select_region_gugun['전남'] = new Array(
		'광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군',
		'담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군',
		'진도군','함평군','해남군','화순군'
		);
		js_select_region_gugun['전북'] = new Array(
		'군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군',
		'무주군','부안군','순창군','완주군','임실군','장수군','진안군'
		);
		js_select_region_gugun['제주'] = new Array(
		'제주시','서귀포시'
		);
		js_select_region_gugun['충남'] = new Array(
		'계룡시','공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군',
		'부여군','서천군','연기군','예산군','청양군','태안군','홍성군'
		);
		js_select_region_gugun['충북'] = new Array(
		'제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군',
		'영동군','옥천군','음성군','증평군','진천군','청원군'
		); */

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

    </script> -->
    
    
    <script>
/*     $(function () {
  	  $('.js-tooltip-trigger').each(function(ind, ele){
  	    
  	    var $ele = $(ele),
  	        $ttSpan = $ele.next('.js-tooltip'),
  	        ttHtml = $ttSpan.html(),
  	        rndID = 'ttid'+ String(Math.random()).substr(2);
  	    
  	    $ttSpan.attr('id', rndID).removeAttr('style').html('');
  	   
  	    $ele.popover({
  	    	trigger: 'click',
  	  		html: true,
  	    //	trigger: 'focus', //
  	    	placement: 'right',
  	    	container: '#'+rndID, 
  	    	content: ttHtml
  	  	});
  	  });
  	}); 
  	*/
   
    </script>

</html>
