<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <head>
        <title>매치보드</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link rel="stylesheet" href="${contextRootPath}/css/common.css" />
        <link rel="stylesheet" href="${contextRootPath}/node_modules/jplist-es6/dist/1.2.0/jplist.styles.css" />
        <link rel="stylesheet" href="${contextRootPath}/css/matchboardlist3.css" />
    </head>
    <body>
    <jsp:include page="../header.jsp"/>

    <div id="topComment">
      <h2>
        등록된 <b>매치 글</b>을 검색하여 찾거나
      </h2>
      <h2>직접 매치글을 등록할 수 있습니다.</h2>
      <p style="margin-bottom:50px;">
      </p>
    </div>
  <div class="container" id="main-wrap">
       <!-- hidden sort control -->
        <div
            style="display: none"
            data-jplist-control="hidden-sort"
            data-group="group1"
            
            data-path=".playDate"
            data-order="desc"
            data-type="text" >
        </div>
        
        
    <div class="content">
    <div id="searchArea">
    
        <!-- filter control -->
        <div>
        <button class="btn btn-dark" id="allbtn" style="margin-bottom: 6px;"
            data-jplist-control="buttons-text-filter"
            data-path="default"
            data-mode="radio"
            data-group="group1"
            name="sportsType"
            data-selected="true">
         모든종목
         </button><br>
        
        <a type="button" id="stype"
            data-jplist-control="buttons-text-filter"
            data-path=".sportsType"
            data-mode="radio"
            data-group="group1"
            name="sportsType"
            data-text="축구"
            >
        <img src="${contextRootPath}/images/football_list_min.png"> 
        </a>
        
        <a type="button" id="stype"
            data-jplist-control="buttons-text-filter"
            data-path=".sportsType"
            data-mode="radio"
            data-group="group1"
            name="sportsType"
            data-text="야구">
         <img src="${contextRootPath}/images/baseball_list_min.png">
        </a>
        
        <a type="button" id="stype"
            data-jplist-control="buttons-text-filter"
            data-path=".sportsType"
            data-mode="radio"
            data-group="group1"
            name="sportsType"
            data-text="농구">
         <img src="${contextRootPath}/images/basketball_list_min.png">
        </a>
        
        <a type="button" id="stype"
            data-jplist-control="buttons-text-filter"
            data-path=".sportsType"
            data-mode="radio"
            data-group="group1"
            name="sportsType"
            data-text="탁구">
         <img src="${contextRootPath}/images/pingpong_list_min.png">
        </a>
        
        <!-- 　　　　　　 --><!-- 여기에 왼쪽에 공백있음 -->
        <br><br>
        
         <!-- filter control -->
        <button class="btn btn-dark" id="allbtn"
            data-jplist-control="buttons-text-filter"
            data-path="default"
            data-mode="radio"
            data-group="group1"
            name="teamLevel"
            data-selected="true">
         모든레벨 <!-- 전체 -->
         </button>

        <button type="button" id="levelbtn" class="btn btn-dark" 
            data-jplist-control="buttons-text-filter"
            data-path=".teamLevel"
            data-mode="radio"
            data-group="group1"
            name="teamLevel"
            data-text="상"
            >
        상 
        </button>
        
        <button type="button" id="levelbtn" class="btn btn-dark" 
            data-jplist-control="buttons-text-filter"
            data-path=".teamLevel"
            data-mode="radio"
            data-group="group1"
            name="teamLevel"       
            data-text="중">
        중 
        </button>
        
        <button type="button" id="levelbtn" class="btn btn-dark"
            data-jplist-control="buttons-text-filter"
            data-path=".teamLevel"
            data-mode="radio"
            data-group="group1"
            name="teamLevel"
            data-text="하">
        하 
        </button>
        </div>
        <br>
                <!-- text filter control -->
        
        <div id="inputBox2">
                <input class="form-control-sm"
                data-jplist-control="textbox-filter"
                data-group="group1"
                data-name="my-filter-1"
                data-path=".title"
                type="text"
                value=""
                data-clear-btn-id="name-clear-btn"
                placeholder="글 제목을 입력하세요" />
                
                <br>
                
          <input class="form-control-sm" type="text" id="datepicker" placeholder="날짜를 입력하세요">
          
                <br>
          
            <button type="button" class="btn btn-dark" id="name-clear-btn" style="margin-top:10px;">
            검색 설정 초기화 <!-- 지우개버튼 -->
            </button>
            
            <button  type="button" class="btn btn-dark" id="matchform"
            onClick="location.href='${contextRootPath}/app/matchboard/form' " >
            매치등록하기</button>
    <div style="display: none;">
    <input 
         id="textbox-filter"
         data-jplist-control="textbox-filter"
         data-group="group1"
         data-name="my-filter-1"
         data-path=".playDate"
         name="playDate"
         type="text"
         value=""
         data-clear-btn-id="name-clear-btn"
         placeholder="날짜를 선택하세요" />
    </div>
        </div>
        </div>
        
        <!-- 페이지 컨트롤 부분 -->
    <div class="controls">
        <div
                data-jplist-control="pagination"
                data-group="group1"
                data-items-per-page="5"
                data-current-page="0"
                data-name="pagination1">
        
        <div id="control-box" class="form-group row">
            <button id="firstbtn" type="button" data-type="first">«</button>
            <button id="prebtn" type="button" data-type="prev">‹</button>
        
            <div class="jplist-holder" data-type="pages">
                <button id="selectbtn" type="button" data-type="page">{pageNumber}</button>
            </div>
            
            <button id="nextbtn" type="button" data-type="next">›</button>
            <button id="lastbtn" type="button" data-type="last">»</button>
        </div>
        
        </div>
     </div>
     
        <div id="listtitle">
          매치 목록
        </div>
     <div id="list">
          <!-- 매치글 출력 부분: 팀정보,매치글정보-->
            <div data-jplist-group="group1">

                <c:forEach items="${all}" var="match">
                 
                 <div data-jplist-item>
                 <table class="table table-bordered table-striped results" id="matchInfo">
                 <tr>
                 <td id="${match.team.teamId}" class="teamInfo sorting_asc" colspan="2"
                 data-toggle="modal" data-target="#exampleModalCenter2"
                  onClick="location.href='${contextRootPath}/app/team/${match.team.teamId}' " 
                  <%-- onClick="modalEvent2('${match.team.teamId}');" --%>
                  align="center" style="cursor: pointer;" >
                  
                  <div style="width:58px; height:58px;">${match.team.teamEmblemPhoto} 엠블럼 </div><!-- 엠블럼 들어갑니다. -->
                  <br> <br> <div class="teamName">${match.team.teamName}</div><br>
                </td>
                
                <td class="detail" id="${match.no}" colspan="5"
                style="cursor: pointer;" data-toggle="modal" data-target="#exampleModalCenter"
                onClick="modalEvent('${match.no}');"  
                onMouseOver="this.style.backgroundColor='#E6F0F4';"
                onMouseOut="this.style.backgroundColor='' ">
                
                    <div class="teamName" style="display:none">${match.team.teamName}</div>
                    <div class="title">제목 : ${match.title}</div>
                    <div class="playDate">경기날짜 : ${match.playDate}</div>
                    <div class="sportsType">종목 : ${match.teamTypeSports.teamSportsType}</div>
                    <div class="teamLevel">팀레벨 : ${match.teamLevel.teamLevel}</div>
                    <div class="teamAges">팀연령대 : ${match.teamAges.teamAges}</div>
                 </td>
                 </tr>
                </table>
                </div>
                <!-- 매치글 출력 끝 -->
                
                <!--경기정보 모달 시작. -->
           <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" 
           aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalCenterTitle">잠시만 기다려주세요</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
           </div>
           <div class="modal-body" style="cursor:pointer; overflow-y:scroll; height: 280px;" 
           onMouseOver="this.style.backgroundColor='#EAFFFC';"
           onMouseOut="this.style.backgroundColor='' ">
               잠시만 기다려주세요</div>
           <div class="modal-footer">
           
           
             <div id="mtaply" >
             <c:if test="${!empty sessionScope.loginUser}">
               <select name='teamId' class="form-control" id="selectBox">
                 <option value="" selected>소속팀(Leader) 선택</option>
                  <c:forEach items="${myteam}" var="myteam">
                    <option value='${myteam.team.teamId}'>${myteam.team.teamName}</option>
                  </c:forEach>
               </select>
                <button class="btn btn-danger" id="btnsub2">신청하기</button>
              </c:if>
              </div>
           </div>
                </div>
                </div>
            </div>
             <!--경기정보 모달 끝. -->
             
             
<!--            <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" 
           aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header2">
                 <h5 class="modal-title2" id="exampleModalCenterTitle">잠시만 기다려주세요</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
           </div>
               <div class="modal-body2" id="modalbody" style="text-align:left; width:200px; height:1200px; padding-left:-400px;">잠시만 기다려주세요</div>
             <div class="modal-footer2"></div>
             </div>
             </div>
             </div> -->
             
                </c:forEach>
                    <!-- no results control -->               
                <div data-jplist-control="no-results" data-group="group1" data-name="no-results">검색 결과가 없습니다.</div>
      </div>
                　　　　　　　　　　　　　　　　　　　　<!-- 칸 일그러짐 방지 -->　　　　　　　　　　　　　　　　　　　　　　　
      </div>
    </div><!-- .content -->
  </div><!-- .container -->

<jsp:include page="../javascript.jsp"/>
<script src="${contextRootPath}/jquery-ui-1.12.1.datepicker/jquery-ui.min.js"></script>
<script src="${contextRootPath}/jquery-ui-1.12.1.datepicker/datepicker-ko.js"></script>
<script src="${contextRootPath}/node_modules/jplist-es6/dist/1.2.0/jplist.min.js"></script>


        <script>
            jplist.init();
            
            var no = 0; //매치번호
            var nocom; //no 배열관련
            var choiceTeamValue; //신청팀번호
            var number; // 매치번호선택값 들어옴
            var matchTeamNo;// 매치글의 팀번호 들어옴
            var sizesize = $("input[id='loginUserTeamNumbers']").length; // 신청자의 팀 배열 길이.
            var teamnocom = sizesize;
            
          $(function() {
        	  $( "#datepicker" ).datepicker({
                  onSelect: function(value, props) {
                         var tb = document.getElementById('textbox-filter');
                         tb.value = value;
                         let keyupEvent = new Event('keyup');
                         tb.dispatchEvent(keyupEvent);
                       },
                       defaultDate: +7
                       //selectWeek: true,
                       //inline: true,
                       //startDate: '01/01/2000',
                       //firstDay: 1
               });          
        	  
        	  
        	  
        	  
        	  $('#btnsub2').click(function() {
                  var choiceTeamValue = $("#selectBox option:selected").val();

                 //console.log(typeof choiceTeamValue);
                 console.log(no +"-> 매치번호"); // 매치번호
                 console.log(choiceTeamValue+"-> 신청팀번호"); //신청팀번호
               
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
               	    	}
               	    })
               	 });
          })
          
            //매치정보 모달창
            function modalEvent(number) {
             
              $('.detail').each(function(index) {
                nocom = $('.detail')[index].id;
                if (nocom == number) {
                  no = nocom;
                }
              })
              
              $.getJSON("data", {"no" : no}, function(data) {
                console.log(data);
                  $('.modal-title').text(data.match.team.teamName);
                  $('.modal-title').append("<div ><h6>매치번호"+ data.match.no + " 　　　　　　　　　　　　　　　　조회수 " + data.match.viewCount + " </h6> ");
                  $('.modal-body').append("<br>경기날짜 : "+data.match.playDate);
                  $('.modal-body').text("제목 : "+data.match.title);
                  $('.modal-body').append("<br>종목 : "+data.match.teamTypeSports.teamSportsType);
                  $('.modal-body').append("<br>지역 : "+data.match.location);
                  $('.modal-body').append("<br>경기장 : "+data.match.stadiumName);
                  $('.modal-body').append("<br>비용 : "+data.match.cost);
                  $('.modal-body').append("<br>내용 : "+data.match.contents);
                  matchTeamNo = data.match.team.teamId;
                  console.log(matchTeamNo+"-> 매치글작성한 팀번호");
					 console.log(no+"-> 매치글번호");
					 
                  });
              }
              
          $('#name-clear-btn').click(function() {
        	  $('#datepicker').val('');
          });
          
           $('.modal-body').click(function() {
        	  location.href = no;
          });
          
             
        </script>
        
    </body>
</html>




