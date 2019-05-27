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
<jsp:include page="../header.jsp" />
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
<link rel="stylesheet" href="${contextRootPath}/css/team.css">
</head>
<body>

  <div class="container">
<br><br>

    <div id="main-text" style="left:150px; position: relative;">
      <h1>팀 조회</h1>
    </div>

      <c:if test="${sessionScope.loginUser != null}">
        <p>
          <a href='${contextRootPath}/app/team/form' class="input-group-btn1 btn btn-dark" style="left:800px; position: relative;">팀 생성</a>
        </p> 
      </c:if> 
      <br><br>
      <form action='search' style="left:600px; position: relative;">   
      <input type='search' name='keyword' placeholder="팀명을 입력하세요"> 
      <button type='submit' class="input-group-btn btn btn-dark">검색</button> 
      </form>
    
      <br>
      <div class="team-list" style="border: 2px solid black; padding:20px; margin:20px; overflow:auto; 
      box-sizing: border-box; width: 890px; height: 479px; position:relative;" >   
            <c:forEach items="${teams}" var="team"> 
            
            <ul class="team_ul">
              <li style="display:none;" id='teamId'>${team.teamId}</li>   
               <li> 
               <div class="hover01 column"> 
                <figure id="picture"><img src = '${team.teamEmblemPhoto}' onerror="this.src='${contextRootPath}/upload/emblem/vs.jpg'"
                class="detailbtn" style="width:100px; height:100px;"></figure>
                </div>
                </li>
                  <li style="text-align: center; margin: 5px;" > ${team.teamName} </li>    
                <li style="display:none;">${team.teamTypeSports.teamSportsType}</li> 
                <li style="display:none;">${team.teamArea}</li> 
                <li style="display:none;">${team.teamCreateDate}</li>  
                <li style="display:none;">${team.teamAges.teamAges}</li> 
                <li style="display:none;">${team.teamLevel.teamLevel}</li> 
                <li style="display:none;">${team.teamInfo}</li>
                
            <c:forEach items="${teamMembers}" var="teamMember">
            <c:if test="${teamMember.teamMemberNo eq team.teamId}"> 
            <ul class="mbrlist">
                <li class="mbrName" id="mbrName" style="display:none;">${teamMember.member.name}</li>    
                <li  class="mbrPosition" style="display:none;" >${teamMember.position}</li>
                <li  class="mbrLeader" style="display:none;">${teamMember.teamLeader}</li>  
              </ul>
                </c:if>
               </c:forEach>
                
             </ul>   
                </c:forEach>
            </div>
    <div class="col-lg-12" id="teamInfo" style="font-size: 20px; border:1px solid gray; width:400px; padding:30px; padding-left:45px; display:none; left:36px; top:740px; position: absolute;" ></div>
    <div class="col-lg-12" id="teamMemberInfo" style="left:430px; bottom:600px; font-size: 25px; top:0px; width:450px; height:675px; border:1px solid gray; margin:30px; display:none;">
    <div style="text-align:center; top:25px; position:relative;"> <h2> 팀원 정보 </h2></div>
       <div id="finallist"></div> 
    </div>  
    
     
      <br><br><br><br>
 </div> 

  <jsp:include page="../javascript.jsp" />  
  
  <script type="text/javascript">
 
  $(".detailbtn").click(function(){ 
    
    $("#teamInfo").show();
    $("#teamMemberInfo").show();
    
    var str = ""
    var str2 = ""  
    
    var liArr = new Array();  
    var liArrLength = liArr.length;
    
    var detailbtn = $(this);
    
    var ul = detailbtn.parent().parent().parent().parent();
    var li = ul.children();
    
    var photo = $(this).attr('src');
    
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
    var size = $('.mbrlist').length;
    for (var i = 9; i < size; i++){
    var mbrName = li.eq(i).children('.mbrName').text();
    var mbrPosition = li.eq(i).children('.mbrPosition').text();
    var mbrLeader = li.eq(i).children('.mbrLeader').text(); 
    
    li.each(function(i){   
      liArr.push(li.eq(i).text());
    });
   
    
    /* $('.list').append(
        $('<p>').append(mbr1)); */
    
        
           
  /*      str2 +=      
         "<table border='1' id='list_table'>" +
       "<colgroup>"+
         "<col style='width:70px;'>"+ 
         "<col style='width:200px;'>" +
         "<col style='width:300px;'>" +
         "<col style='width:200px;'>" +
       "</colgroup>"  +
       "<thead>" +
         "<tr>"+
           "<th>팀번호</th>"+
           "<th>이름</th>"+
           "<th>포지션</th>"+
           "<th>리더</th>"+
         "</tr>"+
       "</thead>"+
         "<tbody>"+
         "<tr>"+
           "<td>" + tmNo + "</td>"+
           "<td>" + name + "</td>"+
           "<td>" + position + "</td>"+
           "<td>" + leader + "</td>"+
         "</tr>"+  
       "</tbody>"+  
     "</table>" ;  */
     
     str2 +=  "<div class='list' style='top:50px; position:relative; text-align:center;'> <div style='display:none;'>" +
     "<b>팀번호</b> : "+ no + "</div>" +
     /* "<p>팀원    &nbsp;  포지션   &nbsp;    리더</p>" +   */
     "<span style='margin:30px; text-align:center;'>" + mbrName + "</span>" +
     "<span style='margin:30px; text-align:center;'>" + mbrPosition + "</span>" +
     "<span style='margin:30px; text-align:center;'>" + mbrLeader + "</span></div>"; 
/*      "<div style='margin:5px;'>" + mbr2 + "&nbsp;&nbsp;</div>"+
     "<div style='margin:5px;'>" + mbr3 + "&nbsp;&nbsp;</div>" +
     "<div style='margin:5px;'>" + mbr4 + "&nbsp;&nbsp;</div>" ; */
    };
    /*  $(document).ready(function() {
       $('#list_table').append(
        $('<tr>').append(
          $('<td>').append(no),
          $('<td>').append(name),
          $('<td>').append(position),
          $('<td>').append(leader)
        )
      ); 
       });       */ 
     str +=  " <div style='display:none;'> <b>팀번호</b> : "+ no + "</div>" +
        "<div><img src=" + teamEmblemPhoto + " style='width:300px; height:300px;'></div>" + 
        "<hr><br>" +  
        "<div style='margin:5px;'> <b>팀명</b> :" + teamName + "</div>" + 
        "<div style='margin:5px;'> <b>종목</b> :" + teamSprotsType + "</div>" +
        "<div style='margin:5px;'> <b>지역</b> :" + teamArea + "</div>" +
        "<div style='margin:5px;'> <b>창단일</b> :" + teamCreateDate + "</div>" +
        "<div style='margin:5px;'> <b>연령대</b> :" + teamAges + "</div>" +
        "<div style='margin:5px;'> <b>팀실력 </b> :" + teamLev + "</div>" +  
        "<div style='margin:5px;'> <b>팀소개 </b> :" + teamInfo + "</div>" ; 
        
    $("#teamInfo").html(str);  
    $('#finallist').html(str2); 
  });
  </script>
</body>
</html>







