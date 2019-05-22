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
   
      <form action="post">
    <table id="match_table" class="table table-bordered">
  <thead>
    <tr>
    <th scope="row">날짜 선택</th>
      <td>
      <input class="form-control" type='date' name='playDate'/>
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
          <option selected>지역선택</option> <!-- db명 toplc  -->
            <option value="1">서울</option>
            <option value="2">경기</option>
            <option value="3">인천</option>
                </select>
              </div>
            </div>
          <div class="col-sm">
              <div class="input-group mb-2">
                <select name='location2' class="custom-select" id="inputGroupSelect01">
          <option selected>지역선택</option> <!-- db명 midlc -->
            <option value="1">강북</option>
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
          <option selected>종목선택</option> <!--  db명 spt_clsf -->
            <option value="1">축구</option>
            <option value="2">야구</option>
            <option value="3">농구</option>
            <option value="4">탁구</option>
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

    <script>
    $(function () {
  	  $('.js-tooltip-trigger').each(function(ind, ele){
  	    
  	    var $ele = $(ele),
  	        $ttSpan = $ele.next('.js-tooltip'),
  	        ttHtml = $ttSpan.html(),
  	        rndID = 'ttid'+ String(Math.random()).substr(2);
  	    
  	    $ttSpan.attr('id', rndID).removeAttr('style').html('');
  	   
  	    $ele.popover({
  	    	trigger: 'click',
  	  		html: true,
  	    	/* trigger: 'focus', */ 
  	    	placement: 'right',
  	    	container: '#'+rndID, 
  	    	content: ttHtml
  	  	});
  	  });
  	});
   
		/* 유저상태로 자기가 속한 팀의 팀장이여야 하고 팀 목록을 출력해야함 */
		/* 창의 확인, 취소 */

    </script>




</html>
