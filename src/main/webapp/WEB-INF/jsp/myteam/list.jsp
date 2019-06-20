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
 </style>
</head>      
<body>
  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />


<div id="main-text">
    <img src="${contextRootPath}/images/국대.jpg" style="width:100%; height:100%;"> 
  <h2>     
      나의 팀정보
      </h2>
    </div>
  <div id="main-wrap" class="container">
    </div>
    <div id="cdcd" style="width:1080px;height: 50px;margin-top: 30px;">
                           
    </div>
   
    <div id="teamInfo"
      style="border: 1px solid black; width: 1080px; height: 400px; box-shadow: 7px 7px 7px darkgray;">
    <div id="teamModify" style="width: 188px;height: 13px;border 1px solid;/* border: 1px solid black; */position: absolute;margin-left: 28px;/* background-color: white; */margin-top: 20px;">
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
                       ${team.teamArea},
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
 <div style="margin-top:150px">
      <div id="row1" style="width: 660px; height: 50px; float: left; margin-text-align: center;top: 20px;"></div>
      <div id="row2" style="width: 660px; height: 50px; float: left; margin-top: 5px;"></div>
      <div id="row3" style="width: 660px; height: 50px; float: left; margin-top: 5px;"></div>
      <div id="row4" style="width: 660px; height: 50px; float: left; margin-top: 5px;"></div>
</div>

    </div>

    <div id="aaaa" style="width: 1100px;  float: left; margin-top: 22px;"></div>
  </div>
  <!-- containner -->

 <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

 
 <!-- ------------------------------- 스크립트 시작  -->
  <script type="text/javascript">
 
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
  row1.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">종 목</div></span> ' + 
  '<span style="display: inline-block;font-size:25px; ;width: 300px;"> <I><U>'+bbb[8]+ '</U></I></span>' + 
  '<span style="display: inline-block;font-size:20px; width: 100px;">지 역</span> ' + 
  '<span style="display: inline-block;font-size:25px; width: 100px;"> <I><U>'+'서울'+'</U></I></span>' 
  
  
row2.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">창단일</span> ' + 
'<span style="display: inline-block;font-size:25px; ;width: 300px;"> <I><U>'+bbb[6]+'</U></I></span>' + 
'<span style="display: inline-block;font-size:20px; width: 100px;">평균연령</span> ' + 
'<span style="display: inline-block;font-size:25px; width: 100px;"><I><U>'+bbb[3]+'</U></I></span>' 

row3.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">팀 유형</span> ' + 
'<span style="display: inline-block;font-size:25px; ;width: 300px;"><I><U>'+bbb[4]+'</U></I></span>' + 
'<span style="display: inline-block;font-size:20px; width: 100px;">팀 실력</span> ' + 
'<span style="display: inline-block;font-size:25px; width: 100px;"><I><U>'+bbb[5]+'</U></I></span>' 

row4.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">팀 소개</span> ' +   
'<span style="display: inline-block;font-size:25px; ;width: 300px;"> <I><U>'+bbb[7]+'</U></I></span>' 
   }else {
      teamMark.innerHTML ='<img src ="' + bbb[9] +  '" width = "250px" height = "250px" >'
      row1.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">종 목</div></span> ' + 
                           '<span style="display: inline-block;font-size:25px; ;width: 300px;"> <I><U>'+bbb[8]+'</U></I></span>' + 
                           '<span style="display: inline-block;font-size:20px; width: 100px;">지 역</span> ' + 
                           '<span style="display: inline-block;font-size:25px; width: 100px;"><I><U>'+'서울'+'</U></I></span>' 
                           
                           
       row2.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">창단일</span> ' + 
       '<span style="display: inline-block;font-size:25px; ;width: 300px;"> <I><U>'+bbb[6]+'</U></I></span>' + 
       '<span style="display: inline-block;font-size:20px; width: 100px;">평균연령</span> ' + 
       '<span style="display: inline-block;font-size:25px; width: 100px;"><I><U>'+bbb[3]+'</U></I></span>' 
       
       row3.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">팀 유형</span> ' + 
       '<span style="display: inline-block;font-size:25px; ;width: 300px;"> <I><U>'+bbb[4]+'</U></I></span>' + 
       '<span style="display: inline-block;font-size:20px; width: 100px;">팀 실력</span> ' + 
       '<span style="display: inline-block;font-size:25px; width: 100px;"><I><U>'+bbb[5]+'</U></I></span>' 
       
       row4.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">팀 소개</span> ' + 
       '<span style="display: inline-block;font-size:25px; ;width: 300px;"><I><U>'+bbb[7]+'</U></I></span>' 
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
         '<img src ="' + arrdd[i] +  '"width = "259px" height = "250px">' + 
         '<span style="display: inline-block;font-size:30px; width: 260px; height:49px; text-align:center; background-color: #262626; color: white">'+ 
          arrc[i] + '</span></div>' +
          '<div class="flip-card-back"><h3 >' + arree[i] + '</h3></div></div></a></div>'
        div.style.border= "1px solid black";
        div.style.margin= "5px";
        div.style.width= "261px";
        div.style.height= "300px";
        div.style.boxShadow = "5px 5px 5px darkgray";      
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
             '<img src ="' + arrdd[i] +  '"width = "259px" height = "250px">' + 
             '<span style="display: inline-block;font-size:30px; width: 260px; height:49px; text-align:center; background-color: yellow; color: white">'+ 
             '${tr.member.name}' + '</span></div>' +
              '<div class="flip-card-back" style="margin-top : 150px"><h3>' + arree[i] + '</h3></div></div></a></div>'
            div.style.border= "1px solid black";
            div.style.margin= "5px";
            div.style.width= "261px";
            div.style.height= "300px";
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
    	   '<span style="margin : 50px"><a href="${contextRootPath}/app/myteam/form/'+bbb[1]+ '"style="text-decoration:none; color:black">팀 정보 변경</a></span > '
}//셀렉문 onchange


</script>


</body>
</html>