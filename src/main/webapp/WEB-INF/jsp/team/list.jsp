<%@page import="com.eomcs.lms.domain.Team"%>
<%@page import="com.eomcs.lms.domain.Member"%>
<%@page import="com.eomcs.lms.domain.TeamMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>팀 조회</title>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- Bootstrap core CSS --> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">  

<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<link rel="stylesheet" href="${contextRootPath}/css/team.css">
 <link rel="stylesheet" href="${contextRootPath}/node_modules/jplist-es6/dist/1.2.0/jplist.styles.css" />
 <link href="${contextRootPath}/node_modules/mdbootstrap/css/mdb.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<style>
.footer {
	margin-top: 154px !important;
}
.page-wrapper .page-content{
overflow-x:unset!important;
height: 805px;
}      
</style>
</head>   
  
 
<body>       
<jsp:include page="../commonSideHeaderFooter/commonHeader.jsp"/> 
  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp"/>
            
  <div id="main-text">     
    <img src="${contextRootPath}/images/teamboard.png" style="width: 100%; height: 100%;">
     <h2>등록된 <b>팀의 정보</b>를 열람할 수 있습니다.</h2>
      <h5 >검색기능을 사용하여 원하는 종목의 <br> 팀을 찾아 조회 하세요.</h5> 
  </div>
  
  <div class="container" id="main-wrap" style="box-shadow: 0px 0px 10px 0px darkgrey; padding: 15px; margin-bottom: 100px;">   
 
      <div class="md-form">
       <input autocomplete=off type="text" id="inputIconEx2"
          class="form-control" aria-describedby="emailHelp" name='keyword' autocomplete=off> 
        <label for="inputIconEx2">키워드 검색</label> 
      </div>  
           
    <div class="team_list scrollbar scrollbar-primary">  
      <div class="force-overflow"> 
      <c:forEach items="${teams}" var="team">     
  
      <input type="hidden" id="userId" value="${member.id}">
  
        <ul class="team_ul">  
          <li style="display: none;" id='teamId'>${team.teamId}</li> 
          <li>
            <div class="hover01 column">
              <figure id="picture">
                <img src='${team.teamEmblemPhoto}'
                  onerror="this.src='${contextRootPath}/upload/emblem/vs.jpg'" class="photo">
              </figure>
            </div>
          </li>
          <li class="detailbtn">
          <b>${team.teamName}</b></li> 
          <li class="Type"> 
                ${team.teamTypeSports.teamSportsType} 
          </li> 
          <li>${team.topLocation.topLocationName} ${team.middleLocation.middleLocationName}</li>
          <li>${team.teamCreateDate}</li>
          <li class="Ages">${team.teamAges.teamAges}</li>
          <li>
          ${team.teamLevel.teamLevel}
          </li>
          <li>${team.teamInfo}</li>
          <li class="teamType">${team.teamType}</li>

          <c:forEach items="${teamMembers}" var="teamMember">
             <c:if test="${team.teamId eq teamMember.teamMemberNo}">
              <ul class="mbrlist">
              <li class="mbrNo" id="mbrNo">   
              ${teamMember.teamMemberNo}
              </li>
                <li class="mbrName" id="mbrName">
                ${teamMember.member.name} 
              
                </li>
                 <li class="mbrLeader"> <c:if test="${teamMember.teamLeader eq true}">
                    <span><img src="${contextRootPath}/images/crown.jpg" class="jpg"></span>
                    </c:if>
                <c:if test="${teamMember.teamLeader eq false}">
                    <span><img src="${contextRootPath}/images/player.png" class="png"></span>
                    </c:if></li>
                 <li class="mbrPosition">${teamMember.position}</li>
              </ul>
             </c:if>   
          </c:forEach>

        </ul>   
      </c:forEach> 
      </div>  
    </div>
    <div style="float:right; right: 228px; top: 274px; font-size: 40px; position: relative; color:gray;">팀을 선택해 주세요.</div>
    <div class="detailForm">       
    <div class="detail" id="triangle-topleft"></div> 
    <div class="detail" id="triangle-bottomright"></div>   
    <div class="detail">  
      
    <div class="suvdetail"><h1 class="detailText"><b>팀 상세 정보</b></h1></div> 
    <div class="col-lg-12" id="teamInfo"></div>
    <div class="col-lg-12" id="teamMemberInfo"> 
      <div class="infoText">  
        <div class="tmcategory">  
          <span><b>팀원</b></span>      
          <span><b>포지션</b></span><br>    
          <hr> 
        </div>  
      </div>
      <div id="finallist"></div>

    </div>
</div>
  </div>
  </div>
  <!-- JQuery -->
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp"/> 
  
  <!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.2/js/mdb.min.js"></script>
 
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />
         

  <script type="text/javascript">
  
  
  function changeItem(){
    // 종목 선택시 콘솔 출력 
    var ItemTypeSelect = document.getElementById('teamSportsId');
    var ItemId = ItemTypeSelect.options[ItemTypeSelect.selectedIndex].value;
    console.log("ItemId." + ItemId);
    var ItemName = ItemTypeSelect.options[ItemTypeSelect.selectedIndex].text;
    console.log("ItemName." + ItemName);
    
    // 종목 선택시 팀정보 가림
    $('.team_ul').hide();
    var TypeSize = $('.Type').length;
    // 배열로 팀의 종목을 출력 
    for (var i = 0; i < TypeSize; i++ ){
    var Type = $('.Type').eq(i).text();
    console.log("타입." + Type);

    // 선택된 값과 팀의 종목이 맞을 시 해당 팀 출력
    if(ItemName == Type) {
      $('.Type').eq(i).parent().show(); 
      }   
     else if (ItemName == "전체") {
        $('.team_ul').show();
      }  
    }
  }
  
  
 /*  function changeItem3(){
    // 종목 선택시 콘솔 출력 
    var ItemTypeSelect = document.getElementById('teamAgeId');
    var ItemId = ItemTypeSelect.options[ItemTypeSelect.selectedIndex].value;
    console.log("ItemId." + ItemId);
    var ItemName = ItemTypeSelect.options[ItemTypeSelect.selectedIndex].text;
    console.log("ItemName." + ItemName);
    
    // 종목 선택시 팀정보 가림 
    $('.team_ul').hide();
    var TypeSize = $('.Ages').length; 
    // 배열로 팀의 종목을 출력 
    for (var i = 0; i < TypeSize; i++ ){
    var Type = $('.Ages').eq(i).text();
    console.log("타입." + Type);

    // 선택된 값과 팀의 종목이 맞을 시 해당 팀 출력
    if(ItemName == Type) {
      $('.Ages').eq(i).parent().show();
      } 
     else if (ItemName == "전체") {
        $('.team_ul').show();
      }  
    }
  } */
  
  $("#inputIconEx2").on("keyup", function() {
    var value = $(this).val().toLowerCase(); 
    $(".team_ul").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
  
  
  $(".detailbtn").click(function(){ 
    
    
    $("#teamInfo").show();
    $("#teamMemberInfo").show();
    $('.detail').show();
    var str = ""
    var str2 = ""  
    
    var liArr = new Array();  
    
    var detailbtn = $(this);
     
    var ul = detailbtn.parent();
    var li = ul.children();
     
    var photo = $(this).prev().children().children().children().attr('src');
    
    var no = li.eq(0).text();
    var teamEmblemPhoto = photo;
    var teamName = li.eq(2).text();
    var teamSprotsType = li.eq(3).text();
    var teamArea = li.eq(4).text();
    var teamCreateDate = li.eq(5).text();
    var teamAges = li.eq(6).text();
    var teamLev = li.eq(7).text();
    var teamInfo = li.eq(8).text();
    var tmNo = no;
    var size = $('.mbrlist').children('.mbrName').length;
    console.log(size);
    
    for (var i = 9; i < size; i++){
    var mbrName = li.eq(i).children('.mbrName').text();
    var leader = li.eq(i).children('.mbrLeader').html();
    var mbrPosition = li.eq(i).children('.mbrPosition').text(); 
    
    li.each(function(i){   
      liArr.push(li.eq(i).text()); 
    });
     
     if (typeof leader !== "undefined") {   
     str2 +=    
     "<span style='padding:10px; display:inline-block; height:50px;'>" + 
     leader +  
     "</span>" + 
     "<span style='padding:10px; display:inline-block; width:100px; margin-right:20px; height:50px;'>" + mbrName + "</span>" + 
     "<span style='padding:10px; display:inline-block; width:170px; height:50px; text-align:center;'>" + mbrPosition + "</span><br>";   
     };
    };
    
     str +=  " <div style='display:none;'> <b>팀번호</b> "+ no + "</div>" +
     "<div class='contents' style='height:230px;'>" + 
        "<div class='shiny' style='width:250px; height:250px; bottom: 30px; right:20px; position:relative;'> <img src=" + teamEmblemPhoto + " style='width:200px; height:200px; right:11px; bottom:10px; position:relative;'><div class='show-off' /> </div>" + 
        "<hr style='position:relative; bottom:70px; right:30px; width:250px;'>" +   
        "</div>" +
        "<div style='position:relative; right:30px; bottom:10px;'>" +   
        "<div style='margin:10px;'> <b style='font-size:30px; color:darkred;'>팀명</b><br>" + teamName + "</div>" + 
        "<div class='area' style='margin:10px;'> <b style='font-size:30px; color:darkred;'>지역</b><br>" + teamArea + "</div>" +    
        "<div class='lev' style='margin:10px;'> <b  style='font-size:30px; color:darkred'>팀실력 </b><br>" + teamLev + "</div>" +  
        "</div>" +   
        "<div style='position:relative; left:120px; bottom:265px;'>" +   
        "<div class='sportsTypes' style='margin:10px;'> <b  style='font-size:30px; color:darkred'>종목</b><br>" + teamSprotsType + "</div>" + 
        "<div style='margin:10px;'> <b  style='font-size:30px; color:darkred'>연령대</b><br>" + teamAges + "</div>" + 
        "<div style='margin:10px;'> <b  style='font-size:30px; color:darkred'>창단일</b><br> " + teamCreateDate + "</div>" +  
        "</div>" +    
        "<div style='position:relative; margin:10px; right:30px; bottom: 260px; width:300px; overflow:auto;'> <b  style='font-size:30px; color:darkred'>팀소개 </b><br>" + teamInfo + "</div>";  
           
    $("#teamInfo").html(str);  
    $('#finallist').html(str2); 
  });
  </script>
</body>
</html>







