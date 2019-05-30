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
<link href="${contextRootPath}/node_modules/mdbootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextRootPath}/node_modules/mdbootstrap/css/mdb.min.css" rel="stylesheet">
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">

<jsp:include page="../header.jsp" />
<style>
body {
  padding: 20px 20px;
}
.results tr[visible='false'], .no-result {
  display: none;
}
.results tr[visible='true'] {
  display: table-row;
}
.counter {
  padding: 8px;
  color: #ccc;
}
.odd {
  colspan: 3;
}
</style>

</head>
<body>
	<div class="container">
		<br>
		<br>
		<br>
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
			<jsp:include page="sideBar.jsp" />

			<br>
			<c:if test="${!empty sessionScope.loginUser}">
			<c:if test="${!match.team.teamMember.team_leader}">
				<div style="text-align: center;">
					<a href='${contextRootPath}/app/matchboard/form.jsp' id="newmat"
						class="btn btn-primary" tabindex="-1" role="button"
						aria-disabled="true" style="width: 300px;"> 매치 등록하기 </a>
				</div>
			</c:if>
			</c:if>
			<br>
				<!-- 테이블 시작지점 -->
			<table id="dt" class="table table-striped table-bordered" cellspacing="0" width="100%">
				<thead>
				</thead>
				
				<c:forEach items="${matches}" var="match">
					<tbody>
						<tr>
							<td id="teaminfo" class="th-sm sorting_asc" rowspan="1"
								align="center" style="cursor: pointer;"
								onClick="location.href='${contextRootPath}/app/matchboard/team/${match.team.teamId}'"
								onMouseOver="this.style.backgroundColor='#f2fffd';"
								onMouseOut="this.style.backgroundColor='' ">
								${match.team.teamEmblemPhoto} 엠블럼자리 <!-- 엠블럼 들어갑니다. --> <br>
								<br> <br> <br> ${match.team.teamName} <br>
								아직 팀 페이지가 없습니다.
							</td>



							<td id="info" style="cursor: pointer;"
								onClick="location.href='${contextRootPath}/app/matchboard/${match.no}'"
								onMouseOver="this.style.backgroundColor='#f2fffd';"
								onMouseOut="this.style.backgroundColor='' ">
								<br> 종목:
								${match.teamTypeSports.teamSportsType} <br>
								<br> 위치:
							 	${match.location} <br> 	
							 	<br> 경기장:
								${match.stadiumName} <br>
								<br> 경기날짜: 
								${match.playDate}<br>
								<br></td>
								
 						<td>
 						<c:if test="${!empty sessionScope.loginUser}">
						<!-- <div class="button3" style="padding-top: 40px;"> -->
						<div class="form-group pos-relative" id="applybtn" style="top: 50px;">
						
<!-- 						<a class="js-tooltip-trigger" id="ref" style="top: 40px;">
						<button id="btnsub" class="btn btn-primary btn-sm" 
						data-toggle="popover" aria-disabled="true">신청하기</button>
						</a>  
						<div class="js-tooltip" >
							<strong>제목:${match.title} </strong><br>
						<strong>내용:${match.contents}</strong><br> 
						<strong>연락처:${match.telephone} </strong><br> 
										
				<form action='${match.no}/submit'>
							<select name='teamId' class="form-control" id="selectBox">
								<option selected>소속팀 선택</option>
									<c:forEach items="${myteam}" var="myteam">
										<c:if test="${!myteam.team.teamMember.team_leader}">
									<option value='${myteam.team.teamId}'>${myteam.team.teamName}</option>
										</c:if>
									</c:forEach>
							</select>
								<button class="btn btn-primary btn-sm">&nbsp &nbsp &nbsp &nbsp 신청하기 &nbsp &nbsp &nbsp &nbsp</button> 
				</form> 
									</div> <!-- js-tooltip 끝 --> 
									
				<form action='${contextRootPath}/app/matchboard/${match.no}/submit' id="mtaply" method='post'>
							<select name='teamId' class="form-control" id="selectBox">
								<option selected>소속팀 선택</option>
									<c:forEach items="${myteam}" var="myteam">
										<c:if test="${!myteam.team.teamMember.team_leader}">
									<option value='${myteam.team.teamId}'>${myteam.team.teamName}</option>
										</c:if>
									</c:forEach>
							</select>
								<button id="smtBtn" class="btn btn-primary btn-sm">&nbsp &nbsp &nbsp &nbsp 신청하기 &nbsp &nbsp &nbsp &nbsp</button> 
				</form>
				
				
<%-- 						<a class="btn btn-primary btn-sm" onclick="javascript:btn()" id="submitbtn"
							href='${contextRootPath}/app/matchboard/${match.no}/submit'role="button"> 
							&nbsp &nbsp &nbsp &nbsp &nbsp 신청하기 &nbsp &nbsp &nbsp &nbsp &nbsp </a>  --%>
							
									
									</div> <!-- form-group pos-relative 끝 -->
									</div>
							
						</c:if>
						</td>
						</tr>
					</tbody>
				</c:forEach>
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
	<!-- .container -->
	<jsp:include page="../javascript.jsp" />
	<!-- SCRIPTS -->
	
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<!-- JQuery -->
	<script type="text/javascript" src="${contextRootPath}/node_modules/mdbootstrap/js/jquery-3.4.0.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="${contextRootPath}/node_modules/mdbootstrap/js/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="${contextRootPath}/node_modules/mdbootstrap/js/bootstrap.min.js"></script>
	<!-- MDBootstrap Datatables  -->
	<script type="text/javascript" src="${contextRootPath}/node_modules/mdbootstrap/js/addons/datatables.min.js"></script>

</body>




 <script> // 팝오버 관련 소스
$(function () {
      $('.js-tooltip-trigger').each(function(ind, ele){
        
        var $ele = $(ele),
            $ttDiv = $ele.next('.js-tooltip'),
            ttHtml = $ttDiv.html(),
            rndID = 'ttid'+ String(Math.random()).substr(2)
            isVisible = false;
        
        $ttDiv.attr({'id': rndID}).html('');
        
        var hideAllPopovers = function() {
        	$('.popup-marker').each(function() {
        		$(this).popover('hide');
        	});
        };
        
        $ele.popover({
              html: true,
            trigger: 'focus',
            /* trigger: 'click',  */
            placement: 'right',
            container: '#'+rndID,
            content: ttHtml
          }).on('click', function(e) {
        	  if(isVisible) {
        		  hideAllPopovers();
        	  }
        	  
        	  $(this).popover('show');
        	  
        	  $('.popover').off('click').on('click', function(e) {
        		  e.stopPropagation();
        	  });
        	  
        	  isVisible = true;
        	  e.stopPropagation();
          });
        
        $(document).on('click', function(e) {
            hideAllPopovers();
            isVisible = false;
        });
        
      });
    });
</script>


<script>

$(function() {
	var save_bt = $('#smtBtn'); // 저장할 버튼을 변수에 선언
	save_bt.click(function(e) {
		e.preventDefault();
		var text = $('#selectBox').html(); // 전송할 내용이 있는 요소
		var mtch = document.location.href.split("matchboard/");
		console.log(mtch[1]);


		$.ajax({
			url: mtch[1], // 서버에 전달할 파일명
			dataType: 'text',
			type: 'post',
			data: JSON.parse({
				'teamId': teamId,
			}),
			dataType: "json",
			success: function(data) {
			      alert('Success'); // 성공시 코드
			},
			error : function(xhr) {
                if(xhr.status == 200){
                 alert('문제가 발생했습니다.\n상태코드 : ' + info.status+ '\n\n' + info.responseText);
                }
                if(xhr.status == 500){
                     alert('이미 신청한 팀입니다.');
                } else {
                 alert('문제가 발생했습니다.\n잠시후 다시 시도해 주세요.\n 상태코드 : ' +info.status);
                };
			}
		});
	});
});

</script>




<!-- <script>
$("#mtaply").bind('ajax:complete', function() {
	$(document).ready(function() {
		$.ajax({
            "url" : "list.jsp",
            "type" : "get",
            "dataType": "json",
            data:{
                name: $('#name1').val(), 
                age: $('#age1').val(), 
         		},
            "success" : function(data){
                alert("가져온 데이터 입니다 . "+data);
                var str = "<select id='mainTableList'>";
                str +="<tr>";
                $.each(data,function(i,v){
                    //데이터 인풋
                  str +="<td>"+ v.mem_id+"</td>;  
					});

                str +="</tr>";
                $("#tableList").html(str);
                
               },
            "error" : function(info, xhr){
                if(info.readyState == '4'){
                 alert('문제가 발생했습니다.\n상태코드 : ' + info.status+ '\n\n' + info.responseText);
                } else {
                 alert('문제가 발생했습니다.\n잠시후 다시 시도해 주세요.\n 상태코드 : ' +info.status);
                }
               }
        }); 
	}); 
});
</script> -->



<!--  <script>
function btn(){
	document.getElementById("selectBox");
	var selectTeam = options[target.selectedIndex].value
	
	
	document.querySelector("#submitbtn").onclick = () => {
		  console.log(JSON.stringify(selectTeam));  // stringify 메소드는 json 객체를 String 객체로 변환
		  var xhr = new XMLHttpRequest();
		  xhr.onreadystatechange = () => {

		  xhr.open("GET", "", true);
		  xhr.setRequestHeader("Content-Type", "application/json");
		  xhr.send(JSON.stringify(board));
		};
	}
}
</script> -->

</html>
