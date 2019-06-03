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
<body>
  <div class="container"> 
    <br>
    <br>

    <div id="main-text" style="margin-bottom: 30px;">
      <h3 style="text-align: center;">등록된 <b>팀의 정보</b>를 열람할 수 있습니다.</h3><br>
      <h5 style="text-align: center;">검색기능을 사용하여 원하는 종목의 <br> 팀을 찾아 조회 하세요.</h5>
    </div> 

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
      <input type='search' class="rounded" id="keyword" name='keyword' style="height:50px; width: 198px; right:304px; border:1px solid silver; text-align: center; position: relative; top:25px;"placeholder="팀명을 입력하세요" autocomplete=off>
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
                  style="width: 20px; height: 20px;  left:20px; position: relative;">
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
             
                </li>
                 <li class="mbrLeader" style="display:none;"> <c:if test="${teamMember.teamLeader eq true}">
                    <span><img src="${contextRootPath}/images/crown.jpg" class="jpg" style="width:40px; height:30px;"></span>
                    </c:if>
                <c:if test="${teamMember.teamLeader eq false}">
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
    <div class="detail" style="left:130px; width:750px; bottom:130px; position:relative; display:none; border-left: 1px solid; border-right:1px solid; border-bottom:1px solid; height:900px;"> 
    <div style="width:750px; height:50px; background:black; color:white;"><h1 style="position:relative; width:500px;">팀 상세 정보</h1></div> 
    <div class="col-lg-12" id="teamInfo"  
      style="font-size: 20px; bottom:50px; width: 300px; padding: 80px; padding-left: 45px; display: none; right: 200px; float:left; position: relative;"></div>
    <div class="col-lg-12" id="teamMemberInfo" 
      style="left: 295px; bottom: 1080px; font-size: 20px; width: 450px; height: 677px;  margin: 30px; display: none;">
      <div style="top: 25px; position: relative;"> 
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
    
     str +=  " <div style='display:none;'> <b>팀번호</b> "+ no + "</div>" +
     "<div class='contents'>" + 
        "<div class='shiny' style='width:300px; height:280px; right:40px; position:relative;'> <img src=" + teamEmblemPhoto + " style='width:250px; height:250px; right:20px; bottom:10px; position:relative;'><div class='show-off' /> </div>" + 
        "<hr style='position:relative; right:30px; width:250px;'><br>" +   
        "</div>" +
        "<div style='position:relative; right:30px; bottom:10px;'>" +  
        "<div style='margin:10px;'> <b style='font-size:30px;'>팀명</b><br>" + teamName + "</div>" + 
        "<div style='margin:10px;'> <b style='font-size:30px;'>지역</b><br>" + teamArea + "</div>" +    
        "<div style='margin:10px;'> <b  style='font-size:30px;'>팀실력 </b><br>" + teamLev + "</div>" +  
        "</div>" +   
        "<div style='position:relative; left:120px; bottom:267px;'>" +   
        "<div style='margin:10px;'> <b  style='font-size:30px;'>종목</b><br>" + teamSprotsType + "</div>" + 
        "<div style='margin:10px;'> <b  style='font-size:30px;'>연령대</b><br>" + teamAges + "</div>" + 
        "<div style='margin:10px;'> <b  style='font-size:30px;'>창단일</b><br> " + teamCreateDate + "</div>" +  
        "</div>" +    
        "<div style='position:relative; margin:10px; right:30px; bottom: 260px;'> <b  style='font-size:30px;'>팀소개 </b><br>" + teamInfo + "</div>";  
         
    $("#teamInfo").html(str);  
    $('#finallist').html(str2); 
  });
  </script>
</body>
</html>







