<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<title>매치보드</title>
<jsp:include page="../commonCss.jsp" />
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">


<jsp:include page="../header.jsp" />
<style>
.results tr[visible='false'], .no-result {
  display: none;
}
.results tr[visible='true'] {
  display: table-row;
}
</style>
</head>
<body>

  <div class="container">
    <div id="match_content">
      <h2>
        등록된 <b>매치 글</b>을 검색하여 찾거나
      </h2>
      <h2>직접 매치글을 등록할 수 있습니다.</h2>
      <br>
      <p>
        원하는 <b>검색 결과에 맞춰</b> 경기를 매칭시키거나
      </p>
      <p>
        <b>추천 매칭</b>을 통하여 경기를 매칭시켜보세요.
      </p>

      <div class="form-group pull-right">
        <input type="text" class="search form-control"
          placeholder="검색어를 입력하세요." style="witdh: 30px;">
      </div>

      <c:if test="${!match.team.teamMember.teamLeader}"> <!--!!!!! 왜 적용이 안될까... !!!!!-->
        <div style="text-align: center;">
          <a href='${contextRootPath}/app/matchboard/form.jsp'
            class="btn btn-primary btn-sm" tabindex="-1" role="button"
            aria-disabled="true" style="width: 300px;"> 매치 등록하기 </a>
        </div>
      </c:if>
      <br>
      <span class="counter pull-right"></span>
      <div id="subtable">
        <table id="dtBasicExample" class="table table-bordered table-striped results" cellspacing="0" width="100%">
          
          <!-- 검색결과 없을때 -->
          <tr class="warning no-result">
            <td colspan="4"><i class="fa fa-warning"></i> No result</td>
          </tr>

          <tbody>
          
            <c:forEach items="${all}" var="match">

              <tr>
                <td id="teaminfo" class="th-sm sorting_asc" rowspan="1" 
                  align="center" style="cursor: pointer;"
                  onClick="location.href='${contextRootPath}/app/matchboard/team/${match.team.teamId}'"
                  onMouseOver="this.style.backgroundColor='#f2fffd';"
                  onMouseOut="this.style.backgroundColor='' ">
                  ${match.team.teamEmblemPhoto} 엠블럼자리 <!-- 엠블럼 들어갑니다. -->
                  <br> <br> ${match.team.teamName}<br>
                </td>
            
                <td class="detail" id="${match.no}" 
                style="cursor: pointer;" 
                data-toggle="modal" data-target="#exampleModalCenter"
                onMouseOver="this.style.backgroundColor='#f2fffd';"
                onMouseOut="this.style.backgroundColor='' "
                onClick="modalEvent('${match.no}');">
                  종목: ${match.teamTypeSports.teamSportsType} 
                <br>
                <br> 
                  위치: ${match.location}
                <br>
                <br>
                  경기장: ${match.stadiumName}
                <br>
                <br>
                  경기날짜: ${match.playDate} 
                <br>
                </td>
              </tr>
              <!-- 모달 시작 -->
           <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalCenterTitle">요기가 머릿글</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
           </div>
               <div class="modal-body">
               요기가 몸통부분
           </div>
             <div class="modal-footer">
             
          <form action='${contextRootPath}/app/matchboard/${match.no}/submit' id="mtaply" method='post'>
          <c:if test="${!empty sessionScope.loginUser}">
            <select name='teamId' class="form-control" id="selectBox" style="width:150px;">
            <option selected>소속팀 선택</option>
            <c:forEach items="${myteam}" var="match">
              <c:if test="${match.team.teamMember.teamLeader}">  <!--!!!!! 왜 적용이 안될까... !!!!!-->
                <option value='${match.team.teamId}'>${match.team.teamName}</option>
              </c:if>
            </c:forEach>
          </select> <button class="btn btn-primary" id="btnsub2">신청하기</button>
          </c:if>
          </form>
             </div>
             </div>
             </div>
             </div>
             <!-- 모달 끝 -->
             
            </c:forEach>
          </tbody>
        </table>



      </div>
    </div>
  </div>
  <!-- .container -->

<%--                 <c:if test="${!empty sessionScope.loginUser}"> <!-- 로그인 했을 때만 신청할 수 있게끔.  -->
                </c:if> --%>
  <jsp:include page="../javascript.jsp" />
  
  <script type="text/javascript" src="${contextRootPath}/node_modules/mdbootstrap/js/jquery-3.4.0.min.js"></script>
  <script type="text/javascript" src="${contextRootPath}/node_modules/mdbootstrap/js/popper.min.js"></script>
  
 <script>
$(document).ready(function() {
	  $(".search").keyup(function () { //검색관련
	    var searchTerm = $(".search").val();
	    var listItem = $('.results tbody').children('tr');
	    var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
    
	  $.extend($.expr[':'], {'containsi': function(elem, i, match, array){
	        return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
	    }
	  });
            
	  $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
	    $(this).attr('visible','false'); 
	  });

	  $(".results tbody tr:containsi('" + searchSplit + "')").each(function(e){
	    $(this).attr('visible','true');
	  });

	  // 검색 결과없을때 출력하는거
	  var jobCount = $('.results tbody tr[visible="true"]').length;
	    $('.counter').text(jobCount + ' item');

	  if(jobCount == '0') {$('.no-result').show();}
	    else {$('.no-result').hide();}
			  });
  
  
    
	 /* 위에랑 똑같은거.
	$(".detail").click(
			function() {
	var no =  .attr('id');
	console.log(no);

// 똑같음
	$.getJSON("data", {"no" : no}, function(data) {
		console.log(data);
	  	$('.modal-body').append(data.match.title);
	  	$('.modal-body').append(data.match.contents);
	});

	 var xhr = new XMLHttpRequest();
	  var no = $(".detail").attr('id');
	  xhr.onreadystatechange = () => {
	    if (xhr.readyState != 4 || xhr.status != 200) {
	      return;
	    } else {
	   	  var data = JSON.parse(xhr.responseText);
	   	  console.log(data);
	  	  $('.modal-body').append(data.match.title);4,
	    }4,
	  };
	  xhr.open("GET", "data?no=" + no, true);
	  xhr.send(); 
  
	});*/          
  
  
	});

function modalEvent(number) {
	var no;
	var nocom;
	$('.detail').each(function(index) {
		nocom = $('.detail')[index].id;
		if (nocom == number) {
			no = nocom;
		}
	})
	console.log(no);

	$.getJSON("data", {"no" : no}, function(data) {
		console.log(data);
	  	$('.modal-title').text(data.match.team.teamName);
      $('.modal-title').append("<h6>매치번호"+ data.match.no + " 　　　　　　　　　　　　　　　　조회수 " + data.match.viewCount + " </h6> ");
	  	$('.modal-body').append("<br>경기날짜 : "+data.match.playDate);
	  	$('.modal-body').text("제목 : "+data.match.title);
	  	$('.modal-body').append("<br>내용 : "+data.match.contents);
	    $('.modal-body').append("<br>종목 : "+data.match.teamTypeSports.teamSportsType);
	  	$('.modal-body').append("<br>지역 : "+data.match.location);
    	$('.modal-body').append("<br>경기장 : "+data.match.stadiumName);
      
	});
}







</script>

</body>

</html>