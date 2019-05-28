<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<style>

</style>
<body>
	<div class="container">

      <!-- Main component for a primary marketing message or call to action -->
       <h1>Dropdown in Popup</h1>
		<div id="popover1" class="col-sm-12 col-xs-12 col-md-9">
		
		<a title="" class="btn btn-primary change-project" href="javascript:;"
		data-original-title="popover Test" >Popover Example</a>        
     
      <div class="hide" id="select-div">
            <div class="col-sm-2 "  style="width:250px;">
			<select class="form-control">
			<option>Test</option>
			<option>Test1</option>
			</select>
			</div>
			<div class="clearfix col-sm-10" style="margin:8px 0;">
			  <button type="button" class="btn btn-default btn-go">Go!</button>
			  <button type="button" class="btn btn-default btn-cancel-option">Cancel</button>
			</div>
	</div>
	</div>
	
	<c:if test="${!empty sessionScope.loginUser}">
						<div class="button3" style="padding-top: 40px;">
						<div class="form-group pos-relative" id="applybtn" style="top: 50px;">
						<a class="js-tooltip-trigger" id="ref" style="top: 40px;">
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
<%--  							<a class="btn btn-primary btn-sm" onclick="javascript:btn()" id="submitbtn"
							href='${contextRootPath}/app/matchboard/${match.no}/submit'role="button"> 
							&nbsp &nbsp &nbsp &nbsp &nbsp 신청하기 &nbsp &nbsp &nbsp &nbsp &nbsp </a>  --%>
									
									</div> <!-- js-tooltip 끝 -->
									</div> <!-- form-group pos-relative 끝 -->
									</div>
								</c:if>
	
       </div>
</body>


<script type="text/javascript">
$(window).bind('ChangeView', function(e, data){
		$('.change-project').popover({
            placement : 'Right',
            title : 'Change',
            trigger : 'click',
            html : true,
            content : function(){
                var content = '';
				content = $('#select-div').html();
				return content;
            } 
        }).on('shown.bs.popover', function(){
        });

		//이건 그냥 버튼누를때
        $(document).delegate('.btn-go','click', function(e){
            e.preventDefault();
            alert('Go Click');
        });
 
		//이것도 취소 버튼 누르면 팝오버 사이즈 닫음
        $(document).delegate('.btn-cancel-option', 'click', function(e){
            e.preventDefault();
            var element = $(this).parents('.popover');
            if(element.size()){
                $(element).removeClass('in').addClass('out');
            }
        });
	});
$(document).ready(function(){
$(window).trigger('ChangeView', {}); 
});

</script>


<script> // 팝오버 관련 소스
$(function () {
      $('.js-tooltip-trigger').each(function(ind, ele){
        
        var $ele = $(ele),
            $ttSpan = $ele.next('.js-tooltip'),
            ttHtml = $ttSpan.html(),
            $teamsel = $ele.next('#selectBox'),
            tsHtml = $teamsel.html(),
            rndID = 'ttid'+ String(Math.random()).substr(2)
            isVisible = false;
        
        $ttSpan.attr({'id': rndID}).html('');
        
        var hideAllPopovers = function() {
        	$('.popup-marker').each(function() {
        		$(this).popover('hide');
        	});
        };
        
        $ele.popover({
              html: true,
            trigger: 'click', 
            placement: 'right',
            container: '#'+rndID, 
            content: ttHtml,tsHtml
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



















</html>
