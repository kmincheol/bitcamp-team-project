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
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<jsp:include page="../header.jsp" />
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
<link rel="stylesheet" href="${contextRootPath}/css/team.css">
</head>
<style>
 
.scrollbar {
margin-left: 30px;
float: left;
height: 300px;
width: 65px;
background: #fff;
overflow-y: scroll;
margin-bottom: 25px;
}
.force-overflow {
min-height: 450px;
}
 
.scrollbar-primary::-webkit-scrollbar {
width: 6px; 
background-color: #F5F5F5; }

.scrollbar-primary::-webkit-scrollbar-thumb {
border-radius: 2px;
-webkit-box-shadow: inset 0 0 2px rgba(0, 0, 0, 0.1); 
background-color: black; }

.contents {
  width: 100%;
  position: relative;
  text-align: center;
}

h1 {
  text-align: center;
  margin: 2em 0;
}

.shiny {
  margin: 30px auto;
  background-color: #ffffff;
  border-radius: 15px;
  width: 640px;
  height: 400px;
  padding: 15px;
  overflow:hidden;
}

.show-off {
  width: 405px;
  height: 605px;
  position: relative;
  top: -556px;
  left: -550px;
  transition: 1s;
  transform: rotate(30deg);
  background: linear-gradient(90deg, rgba(255,255,255, 0)50%, rgba(255,255,255,0.7)100%);
}

.shiny:hover .show-off {
  transform: rotate(0);
  left: 560px;
  top: -445px;
}

</style> 
<body>
  <div class="container"> 
    <br>
    <br>

    <div id="main-text">
      <h3 style="text-align: center;">등록된 <b>팀의 정보</b>를 열람할 수 있습니다.</h3><br>
      <h5 style="text-align: center;">검색기능을 사용하여 원하는 종목의 <br> 팀을 찾아 조회 하세요.</h5>
    </div> 

    <c:if test="${sessionScope.loginUser != null}">
      <p>
        <a href='${contextRootPath}/app/team/form' class="input-group-btn1 btn btn-dark"
          style="left:700px; width:200px; position:absolute;">팀 생성</a>
      </p>
    </c:if>
    <br>
    <br>
     <span class="category1">
     <select class="custom-select" id="teamSportsId" name='teamSportsId' onchange="changeItem()" style=" height:50px; width:200px; position: relative; right:80px;"> 
          <option>전체</option>
      <c:forEach items="${teamTypeSports}" var="typeSports">
           <option value="${typeSports.teamSportsTypeId}"
            ${team.teamSportsId == typeSports.teamSportsTypeId ? "selected" : ""}>${typeSports.teamSportsType}
          </option>
      </c:forEach>
    </select>
     </span>
     <form action='${contextRootPath}/app/team/search' style="left: 230px; margin:10px; top:208px; position:absolute;">
      <input type='search' class="rounded" id="keyword" name='keyword' style="height:50px; width: 198px; right:304px; top:50px; border:1px solid silver; text-align: center; position: relative; "placeholder="팀명을 입력하세요">
      <!-- <span><button type='submit' class="searchbtn input-group-btn btn btn-dark" style="right:70px; width: 70px; height:50px; bottom:3px; float:right; position: relative;">검색</button></span> -->
    </form> 
    <br>
    
    <div class="team-list rounded scrollbar scrollbar-primary"
      style="border: 1px solid black; margin: 20px; top:40px;  box-sizing: border-box; width: 200px; right:100px; height: 500px; position: relative;">
      <div class="force-overflow">
      <c:forEach items="${teams}" var="team">   
 
        <ul class="team_ul" style="width:180px; height:30px;">  
          <li style="display: none;" id='teamId'>${team.teamId}</li> 
          <li>
            <div class="hover01 column">
              <figure id="picture">
                <img src='${team.teamEmblemPhoto}'
                  onerror="this.src='${contextRootPath}/upload/emblem/vs.jpg'" class="photo"
                  style="width: 20px; height: 20px;  right:70px; position: relative;">
              </figure>
            </div>
          </li>
          <li class="detailbtn" style="cursor:pointer; text-align: center; margin: 5px; float: left; left:50px; bottom:42px; position: relative;">
          <b>${team.teamName}</b></li> 
          <li class="Type" style="display: none;" >${team.teamTypeSports.teamSportsType}</li>
          <li style="display: none;">${team.teamArea}</li>
          <li style="display: none;">${team.teamCreateDate}</li>
          <li style="display: none;">${team.teamAges.teamAges}</li>
          <li style="display: none;">${team.teamLevel.teamLevel}</li>
          <li style="display: none;">${team.teamInfo}</li>

          <c:forEach items="${teamMembers}" var="teamMember">
             <c:if test="${team.teamId eq teamMember.teamMemberNo}">
              <ul class="mbrlist">
              <li class="mbrNo" id="mbrNo" style="display:none;">
              ${teamMember.teamMemberNo}
              </li>
                <li class="mbrName" id="mbrName" style="display: none;">
                ${teamMember.member.name} 
                <%-- ( <c:if test="${teamMember.teamLeader eq true}">
                    <span> ${contextRootPath}/images/팀장.jpg </span></c:if>
                <c:if test="${teamMember.teamLeader eq false}">
                    <span>팀원</span></c:if>) --%>
                </li>
                 <li class="mbrLeader" style="display:none;"> <c:if test="${teamMember.teamLeader eq true}">
                    <%-- <span>${contextRootPath}/images/crown.jpg</span> --%>
                    <span><img src="${contextRootPath}/images/crown.jpg" class="jpg" style="width:40px; height:30px;"></span>
                    </c:if>
                <c:if test="${teamMember.teamLeader eq false}">
                    <%-- <span>${contextRootPath}/images/player.png</span> --%>
                    <span><img src="${contextRootPath}/images/player.png" class="png" style="width:40px; height:30px;"></span>
                    </c:if></li>
                 <li class="mbrPosition" style="display: none;">${teamMember.position}</li>
              </ul>
             </c:if>   
          </c:forEach>

        </ul>  
      </c:forEach> 
      </div>
    </div>
    <div class="detail rounded" style="left:130px; width:750px; bottom:50px; position:relative; border:1px solid; display:none;"> 
    <div class="col-lg-12" id="teamInfo"  
      style="font-size: 20px; bottom:50px; width: 300px; padding: 80px; padding-left: 45px; display: none; right: 200px; float:left; position: relative;"></div>
    <div class="col-lg-12" id="teamMemberInfo" 
      style="left: 295px; bottom: 770px; font-size: 20px; width: 450px; height: 677px;  margin: 30px; display: none;">
      <div style="top: 25px; position: relative;"> 
        <!-- <h2 style="text-align: center;">팀원 정보</h2>      -->
        <div class="category" style="text-align: center; margin: 20px; position: relative;">  
          <span style='margin: 60px; text-align: center;'><b>팀원</b></span>      
          <span style='margin: 60px; text-align: center;'><b>포지션</b></span><br>    
          <hr> 
        </div>  
      </div>
      <div id="finallist" style="margin:30px;"></div>
    </div>
</div>
  </div>

  <jsp:include page="../javascript.jsp" />

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
  
  $("#keyword").on("keyup", function() {
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
    
     str +=  " <div style='display:none;'> <b>팀번호</b> : "+ no + "</div>" +
     "<div class='contents'>" + 
        "<div class='shiny' style='width:300px; height:280px; right:40px; position:relative;'> <img src=" + teamEmblemPhoto + " style='width:250px; height:250px; right:20px; bottom:10px; position:relative;'><div class='show-off' /> </div>" + 
        "<hr><br>" +   
        "</div>" +  
        "<div style='margin:5px;'> <b>팀명</b> :" + teamName + "</div>" + 
        "<div style='margin:5px;'> <b>종목</b> :" + teamSprotsType + "</div>" + 
        "<div style='margin:5px;'> <b>지역</b> :" + teamArea + "</div>" +  
        "<div style='margin:5px;'> <b>창단일</b> :<br> " + teamCreateDate + "</div>" +
        "<div style='margin:5px;'> <b>연령대</b> :" + teamAges + "</div>" +
        "<div style='margin:5px;'> <b>팀실력 </b> :" + teamLev + "</div>" +  
        "<div style='margin:5px;'> <b>팀소개 </b> :" + teamInfo + "</div>"; 
        
    $("#teamInfo").html(str);  
    $('#finallist').html(str2); 
  });
  </script>
</body>
</html>







