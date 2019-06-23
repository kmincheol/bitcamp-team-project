<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">


<link href="${contextRootPath}/css/common.css" rel="stylesheet">
<link href="${contextRootPath}/node_modules/mdbootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<script src="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
<link href="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet"> 

<style>
.select-wrapper input.select-dropdown {
  height: 2em;
  font-size: 40px;
}


body {

/*   font-family: Arial, Helvetica, sans-serif; */
}

.flip-card {
  background-color: transparent;
  width: 250px;
  height: 250px;
  perspective: 1000px;
}

.flip-card-inner {
  position: relative;
  width: 250px;
  height: 250px;
  text-align: center;
  transition: transform 0.6s;
  transform-style: preserve-3d;
}

.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}

.flip-card-front, .flip-card-back {
  position: absolute;
  width: 256px;
  height: 250px;
  backface-visibility: hidden;
}

.flip-card-front {
 /*  background-color: #bbb;
  color: black; */
}

.flip-card-back {
 /*  background-color: #2980b9;
  color: white;
  */
  transform: rotateY(180deg);
}


#main-text h2 {
  position: absolute;
  text-align: left;
  bottom: 0;
}

#main-text h2 img {
  margin-bottom: 25px;
  margin-right: 5px;
  width:80px;
  height:80px;
}
.flip-card-back > h3{
    margin-top: 120px;
    margin-left: 20px;
    font-size: 50px;

}

#main-text {
  position: relative;
  text-align: center;
  width: 100%;
  height: 230px;
  border-bottom: 2px solid black;
  margin-bottom: 40px;
}     
    
#main-text h1 {
  position: relative;
    top: -60%;
    color: white;
}

#main-text h1 img {
  width: 30px;
  height: 30px;
  margin-bottom: 25px;
  margin-right: 5px;
}

 </style>
</head>      
<body>
  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />

   

    <div id="main-text">
    <img src="${contextRootPath}/images/국대.jpg" style="width:100%; height:100%;">
  <h1>    
  <input id="loginUserNo" type="hidden"  value ="${sessionScope.loginUser.no}"/>
        나의 팀정보
      </h1>
    </div>
  <div id="main-wrap" class="container">
    <div id="cdcd" style="width:1080px;height: 50px;margin-top: 30px;">
                           
    </div>
   
    <div id="teamInfo"
      style="width: 1080px; height: 400px; box-shadow: 0px 0px 10px 0px darkgray;">
    <div id="teamModify" style="width: 200px;height: 13px;border 1px solid;position: absolute;margin-left: 28px;/* background-color: white; */margin-top: 20px;">
    </div>
      <div id="teamMark"
        style="width: 350px; height: 350px; margin: 22px; float: left; text-align: center; padding-top: 50px">
      </div>

      <div id="teamName"
        style="width: 600px; height: 100px; float: left; margin-top: 22px; font-size: 50px; text-align: left;">

        <div class="input-field col s12 m6" id="teamSelect" style="margin-top: 33px; padding-left:0px">
        <select class="browser-default custom-select custom-select-lg mb-3"  id="select_k" onchange="select_onchange();">
            <c:forEach items="${team}" var="team">
              <option
                value="
                       ${team.teamName},
                         ${team.teamId},
                       ${team.topLocation.topLocationName},
              ${team.teamAges.teamAges},
              ${team.teamType.teamType},
            ${team.teamLevel.teamLevel},
                 ${team.teamCreateDate},
                       ${team.teamInfo},
  ${team.teamTypeSports.teamSportsType},
                ${team.teamEmblemPhoto},
               ${team.teamUniformPhoto}"
                data-icon="${team.teamEmblemPhoto}" >${team.teamName}</option>
            </c:forEach>
          </select>
        </div>
      </div>
 <div>
      <div id="row1" style="width: 660px; height: 50px; float: left; margin-text-align: center;top: 20px;"></div>
      <div id="row2" style="width: 660px; height: 50px; float: left; margin-top: 5px;"></div>
      <div id="row3" style="width: 660px; height: 50px; float: left; margin-top: 5px;"></div>
      <div id="row4" style="width: 660px; height: 50px; float: left; margin-top: 5px;"></div>
</div>

    </div>

    <div id="aaaa" style="width: 1100px;  float: left; margin-top: 22px; margin-bottom: 50px; position: relative; left: -2px;"></div>
  </div>
  <!-- containner -->

 <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

 
 <!-- ------------------------------- 스크립트 시작  -->
  <script type="text/javascript">
  var loginUserNo = $('#loginUserNo').val();
  window.onload= select_onchange;
 
  // 셀렉문 
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('select');
  /*   var instances = M.FormSelect.init(elems, options); */
  });

/*   $(document).ready(function(){
    $('select').formSelect();
  }); */
//셀렉문 

// 셀렉문 onchange
function select_onchange(){
   var arr = new Array();  //${teamMember.teamMemberNo}
   var arrr = new Array();  
   var arrb = new Array(); //${teamMember.member.name}
   var arrc = new Array(); 
   var arrd = new Array(); //${teamMember.member.photo}
   var arre = new Array(); //${teamMember.position}
   var arree = new Array(); 
   var arrdd = new Array();
   var arrf = new Array();//${teamMember.member.no}
   var arrff = new Array();
   var arrg = new Array(); //${teamMember.member.birthDay}
   var arrgg = new Array();
   
   
   var target = document.getElementById("select_k");
   var bbb = String(target.options[target.selectedIndex].value).split(',');
  var teamMark = document.getElementById("teamMark");
  var teamName= document.getElementById("teamName");
   var teamDetail = document.getElementById("teamdetail");
 /* 종목변환 */
 if(bbb[8]="soccer"){
	   bbb[8]="축구"
 }else if(bbb[8]="baseball"){
	 bbb[8]="야구"
 }else if(bbb[8]="basketball"){
   bbb[8]="농구"
 }else if(bbb[8]="pingpong"){
   bbb[8]="탁구"
 }
 
 /*  레벨 변환 */
 if(bbb[5]="high"){
     bbb[5]="상"
 }else if(bbb[5]="mid"){
   bbb[5]="중"
 }else if(bbb[5]="low"){
   bbb[5]="하"
 }
   if (bbb.length > 11){
  teamMark.innerHTML ='<img src ="' + bbb[9] +',' +bbb[10] +'" width = "250px" height = "250px" >'
  row1.innerHTML = '<span style="display: inline-block;font-size:30px; color: darkred; width: 100px;">종 목</div></span> ' + 
  '<span style="display: inline-block;font-size:30px; ;width: 300px;"> <U>'+bbb[8]+ '</U></span>' + 
  '<span style="display: inline-block;font-size:30px; color: darkred; width: 100px;">지 역</span> ' + 
  '<span style="display: inline-block;font-size:30px; width: 100px;"> <U>'+bbb[2]+'</U></span>' 
  
  
row2.innerHTML = '<span style="display: inline-block;font-size:30px; color: darkred; width: 100px;">창단일</span> ' + 
'<span style="display: inline-block;font-size:30px; ;width: 300px;"> <U>'+bbb[6]+'</U></span>' + 
'<span style="display: inline-block;font-size:30px; color: darkred;width: 100px;">연령대</span> ' + 
'<span style="display: inline-block;font-size:30px; width: 100px;"><U>'+bbb[3]+'</U></span>'     

row3.innerHTML = '<span style="display: inline-block;font-size:30px; color: darkred; width: 100px;">팀 유형</span> ' + 
'<span style="display: inline-block;font-size:30px; ;width: 300px;"><U>'+bbb[4]+'</U></span>' + 
'<span style="display: inline-block;font-size:30px; color: darkred; width: 100px;">팀 실력</span> ' + 
'<span style="display: inline-block;font-size:30px; width: 100px;"><U>'+bbb[5]+'</U></span>' 

row4.innerHTML = '<span style="display: inline-block;font-size:30px; color: darkred; width: 100px;">팀 소개</span> ' +   
'<span style="display: inline-block;font-size:30px; ;width: 300px;"> <U>'+bbb[7]+'</U></span>' 
   }else {
      teamMark.innerHTML ='<img src ="' + bbb[9] +  '" width = "250px" height = "250px" >'
      row1.innerHTML = '<span style="display: inline-block;font-size:30px; color: darkred; width: 100px;">종 목</div></span> ' + 
                           '<span style="display: inline-block;font-size:30px; ;width: 300px;"> <U>'+bbb[8]+'</U></span>' + 
                           '<span style="display: inline-block;font-size:30px; color: darkred; width: 100px;">지 역</span> ' + 
                           '<span style="display: inline-block;font-size:30px; width: 100px;"><U>'+bbb[2]+'</U></span>' 
                           
                           
       row2.innerHTML = '<span style="display: inline-block;font-size:30px; color: darkred;width: 100px;">창단일</span> ' + 
       '<span style="display: inline-block;font-size:30px; ;width: 300px;"> <U>'+bbb[6]+'</U></span>' + 
       '<span style="display: inline-block;font-size:30px; color: darkred;width: 100px;">연령대</span> ' + 
       '<span style="display: inline-block;font-size:30px; width: 100px;"><U>'+bbb[3]+'</U></span>' 
       
       row3.innerHTML = '<span style="display: inline-block;font-size:30px; color: darkred; width: 100px;">팀 유형</span> ' + 
       '<span style="display: inline-block;font-size:30px; ;width: 300px;"> <U>'+bbb[4]+'</U></span>' + 
       '<span style="display: inline-block;font-size:30px; color: darkred;width: 100px;">팀 실력</span> ' + 
       '<span style="display: inline-block;font-size:30px; width: 100px;"><U>'+bbb[5]+'</U></span>' 
       
       row4.innerHTML = '<span style="display: inline-block;font-size:30px; color: darkred;width: 100px;">팀 소개</span> ' + 
       '<span style="display: inline-block;font-size:30px; ;width: 556px;"><U>'+bbb[7]+'</U></span>' 
   }
   
        
    
  <c:forEach items="${tm}" var="teamMember">
   arr.push("${teamMember.teamMemberNo}");
   arrb.push("${teamMember.member.name}");
   arrd.push("${teamMember.member.photo}");
   arre.push("${teamMember.position}");
   arrf.push("${teamMember.member.no}");
   arrg.push("${teamMember.member.birthDay}");
   </c:forEach>

   for (var i = 0; i < arr.length; i++) {
      if(arr[i] == parseInt(bbb[1])){
         arrc.push(arrb[i])
         arrdd.push(arrd[i])
         arrff.push(arrf[i])
         arrr.push(arr[i])
         arree.push(arre[i])
      }
  }
  
       //append div 삭제
        for(var j=0; j< 30; j++){
          $("#abcd").remove()
        }      
    
   // div append for문 (팀원들)
    for (var i = 0; i < arrc.length; i++) { 
        var div = document.createElement("div");
        div.id = "abcd"
        div.innerHTML =
          '<div class="flip-card"><a href="${contextRootPath}/app/myteam/' + arrr[i] +'/' + arrff[i] + '"> <div class="flip-card-inner"> <div class="flip-card-front">' +
         '<img src ="' + arrdd[i] +  '"width = "261px" height = "250px">' + 
         '<span style="display: inline-block;font-size:30px; width: 261px; text-align:center; background-color: indigo; color: white">'+ 
          arrc[i] + '</span></div>' +
          '<div class="flip-card-back"><h3 >' + arree[i] + '</h3></div></div></a></div>'
        div.style.margin= "5px";
        div.style.width= "261px";
        div.style.height= "295px";
        div.style.boxShadow = "0px 0px 10px 0px darkgray";      
        div.style.float= "left";
        document.getElementById('aaaa').appendChild(div);
      
    } // div append (팀원들)

     // 신청한 사람들 목록
        <c:forEach items="${tr}" var="tr">
      if(${tr.teamId} == bbb[1]){
            /* alert('${tr.member.name}') */
             var div = document.createElement("div");
            div.id = "abcd"
            div.innerHTML =
              '<div class="flip-card"><a href="${contextRootPath}/app/myteam/apply/${tr.member.no}/' + bbb[1] + '/' + ${tr.teamNo} + '"> <div class="flip-card-inner"> <div class="flip-card-front">' +
             '<img src ="${tr.member.photo}" width = "259px" height = "250px">' + 
             '<span style="display: inline-block;font-size:30px; width: 260px;  text-align:center; background-color: red; color: white">'+ 
             '${tr.member.name}' + '</span></div>' +
              '<div class="flip-card-back" ><h3> 대기 명단 </h3></div></div></a></div>'
            div.style.border= "1px solid black";
            div.style.margin= "5px";
            div.style.width= "261px";
            div.style.height= "295px";
            div.style.float= "left";
            
            document.getElementById('aaaa').appendChild(div);
      }  
        </c:forEach>
        document.getElementById("cdcd").innerHTML=
        '	<div id="myTeamHeader" style="text-align: center; font-size: 20px;">'+
        	' <span style="margin : 50px;border-bottom: 2px solid #51c321;"><a href="#"style="text-decoration:none; color:black"> 나의팀 </a> </span> '+
        '<span style="margin : 50px"><a href="${contextRootPath}/app/myteam/list3/'+bbb[1]+ '"style="text-decoration:none; color:black">요청한 경기</a></span > ' +
        '<span style="margin : 50px"><a href="${contextRootPath}/app/myteam/list2/'+bbb[1]+ '"style="text-decoration:none; color:black">요청받은 경기</a></span>'   +
       ' <span style="margin : 50px"><a href="${contextRootPath}/app/myteam/list5/'+bbb[1]+ '"style="text-decoration:none; color:black">성사된 나의 경기</a></span>'+
       ' </div>'
        
       document.getElementById("teamModify").innerHTML= 
    	   '<span ><button class=" teamInfoModify btn btn-outline-dark" type="button" >팀 정보 변경</button></span > ' +
    	   '<span ><button class ="mainTeam btn btn-outline-dark" type="button" >대표팀 설정</button> </span > '

    	   /* <input type="hidden" id="teamMemberNo" value="${teamMember.teamMemberNo}">  
        <input type="hidden" id="memberNo" value="${teamMember.memberNo}">   */
        
    	 /*   <a href="${contextRootPath}/app/myteam/update/mainTeam/' + loginUserNo +'/'+ bbb[1] + '"style="text-decoration:none; color:black">대표팀 설정</a> */
        
        
    	   $('.mainTeam').on('click', function(){
    		   Swal.fire({
    		       title: bbb[0] + ' (을)를<br>대표팀으로 설정 하시겠습니까?',
    		       type: 'question',
    		       showCancelButton: true,
    		       confirmButtonColor: '#3085d6',
    		       cancelButtonColor: '#d33',
    		       confirmButtonText: '예! 설정하겠습니다.',
    		       cancelButtonText: '아니오'
    		     }).then((result) => {
    		       if (result.value) {
    		         Swal.fire(
    		         bbb[0] + ' (이)가 <br> 대표팀이 되었습니다.'
    		         )  
    		         location.href='${contextRootPath}/app/myteam/update/mainTeam/' + loginUserNo + '/' + bbb[1]
    		       }
    		     })
    		   });

        
        $('.teamInfoModify').on('click', function(){
          Swal.fire({
              title: bbb[0] + ' 의 <br> 정보를 변경 하시겠습니까?',
              type: 'question',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: '예! 변경하겠습니다.',
              cancelButtonText: '아니오'
            }).then((result) => {
              if (result.value) {
                location.href='${contextRootPath}/app/myteam/form/'+   bbb[1]
              }
            })
          });


       
       
        
        
        
        
        
        
        
        
        
  }//셀렉문 onchange

</script>


</body>
</html>