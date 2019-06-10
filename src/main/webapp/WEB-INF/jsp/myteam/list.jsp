<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp" />
<link href="${contextRootPath}/css/common.css" rel="stylesheet">
<link href="${contextRootPath}/node_modules/mdbootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Compiled and minified CSS -->
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

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
 </style>
</head>      
<body>

  <div id="main-wrap" class="container">
    <div style = "border: 1px solid black; margin-top:150px; width:1080px; height: 50px;">
    <span style="width: 100px">
      <button type="button" class="btn btn-outline-dark btn-sm" onclick="dd()">요청경기목록</button>
     </span>
    </div>
    <div id="teamInfo"
      style="border: 1px solid black; width: 1080px; height: 400px;">
      <div id="teamMark"
        style="width: 350px; height: 350px; margin: 22px; float: left; text-align: center; padding-top: 50px">
      </div>

      <div id="teamName"
        style="width: 600px; height: 100px; float: left; margin-top: 22px; font-size: 50px; text-align: left;">

        <div class="input-field col s12 m6" id="teamSelect">
          <select class="icons" id="cc" onchange="aa();">
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

      <div id="row1" style="width: 660px; height: 50px; float: left; margin-top: 20px;"></div>
      <div id="row2" style="width: 660px; height: 50px; float: left; margin-top: 5px;"></div>
      <div id="row3" style="width: 660px; height: 50px; float: left; margin-top: 5px;"></div>
      <div id="row4" style="width: 660px; height: 50px; float: left; margin-top: 5px;"></div>

    </div>

    <div id="aaaa" style="width: 1100px; height: 350px; float: left; margin-top: 22px;"></div>

  </div>
  <!-- containner -->

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

  <script type="text/javascript">
 
  window.onload= aa;

document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, options);
  });

  // Or with jQuery

  $(document).ready(function(){
    $('select').formSelect();
  });
        
function aa(){
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
   
	 var target = document.getElementById("cc");
	var a = String(target.options[target.selectedIndex].value).split(',');

 var teamMark = document.getElementById("teamMark");
	var teamName= document.getElementById("teamName");
	 var teamDetail = document.getElementById("teamdetail");

	 if (a.length > 11){
  teamMark.innerHTML ='<img src ="' + a[9] +',' +a[10] +'" width = "250px" height = "250px" >'
  row1.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">종 목</div></span> ' + 
  '<span style="display: inline-block;font-size:25px; ;width: 220px;"> <B><I><U>'+a[8]+'</U></I></B></span>' + 
  '<span style="display: inline-block;font-size:20px; width: 100px;">지 역</span> ' + 
  '<span style="display: inline-block;font-size:25px; width: 100px;"> <B><I><U>'+'서울'+'</U></I></B></span>' 
  
  
row2.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">창단일</span> ' + 
'<span style="display: inline-block;font-size:25px; ;width: 220px;"> <B><I><U>'+a[6]+'</U></I></B></span>' + 
'<span style="display: inline-block;font-size:20px; width: 100px;">평균연령</span> ' + 
'<span style="display: inline-block;font-size:25px; width: 100px;"> <B><I><U>'+a[3]+'</U></I></B></span>' 

row3.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">팀 유형</span> ' + 
'<span style="display: inline-block;font-size:25px; ;width: 220px;"> <B><I><U>'+a[4]+'</U></I></B></span>' + 
'<span style="display: inline-block;font-size:20px; width: 100px;">팀 실력</span> ' + 
'<span style="display: inline-block;font-size:25px; width: 100px;"> <B><I><U>'+a[5]+'</U></I></B></span>' 

row4.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">팀 소개</span> ' +   
'<span style="display: inline-block;font-size:25px; ;width: 220px;"> <B><I><U>'+a[7]+'</U></I></B></span>' 
	 }else {
		  teamMark.innerHTML ='<img src ="' + a[9] +  '" width = "250px" height = "250px" >'
		  row1.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">종 목</div></span> ' + 
		                       '<span style="display: inline-block;font-size:25px; ;width: 220px;"> <B><I><U>'+a[8]+'</U></I></B></span>' + 
		                       '<span style="display: inline-block;font-size:20px; width: 100px;">지 역</span> ' + 
		                       '<span style="display: inline-block;font-size:25px; width: 100px;"> <B><I><U>'+'서울'+'</U></I></B></span>' 
		                       
		                       
       row2.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">창단일</span> ' + 
       '<span style="display: inline-block;font-size:25px; ;width: 220px;"> <B><I><U>'+a[6]+'</U></I></B></span>' + 
       '<span style="display: inline-block;font-size:20px; width: 100px;">평균연령</span> ' + 
       '<span style="display: inline-block;font-size:25px; width: 100px;"> <B><I><U>'+a[3]+'</U></I></B></span>' 
       
       row3.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">팀 유형</span> ' + 
       '<span style="display: inline-block;font-size:25px; ;width: 220px;"> <B><I><U>'+a[4]+'</U></I></B></span>' + 
       '<span style="display: inline-block;font-size:20px; width: 100px;">팀 실력</span> ' + 
       '<span style="display: inline-block;font-size:25px; width: 100px;"> <B><I><U>'+a[5]+'</U></I></B></span>' 
       
       row4.innerHTML = '<span style="display: inline-block;font-size:20px; width: 100px;">팀 소개</span> ' + 
       '<span style="display: inline-block;font-size:25px; ;width: 220px;"> <B><I><U>'+a[7]+'</U></I></B></span>' 
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
	    if(arr[i] == parseInt(a[1])){
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
    
    for (var i = 0; i < arrc.length; i++) {
        //div 객체 생성
        var div = document.createElement("div");
        div.id = "abcd"
        div.innerHTML =
        	'<div class="flip-card"><a href="${contextRootPath}/app/myteam/' + arrr[i] +'/' + arrff[i] + '"> <div class="flip-card-inner"> <div class="flip-card-front">' +
         '<img src ="' + arrdd[i] +  '" width = "259px" height = "250px">' + 
         '<span style="display: inline-block;font-size:30px; width: 260px; height:49px; text-align:center; background-color: #262626; color: white">'+ 
          arrc[i] + '</span></div>' +
          '<div class="flip-card-back"><h3><br><br>' + arree[i] + '</h3> </div></div></a></div>'
        //css설정
        div.style.border= "1px solid black";
        div.style.margin= "5px";
        div.style.width= "261px";
        div.style.height= "300px";
        div.style.float= "left";
        document.getElementById('aaaa').appendChild(div);
    }
}

function dd(){
	var con = document.getElementById("teamInfo");
	var ee = document.getElementById("aaaa");
	  con.style.display = 'none'
		 ee.style.display = 'none'
	
	var button = document.createElement("button");		 
	  button.style.width= "100px";
	  button.style.height= "100px";  
	  document.getElementById('main-wrap').appendChild(button);

 var div = document.createElement("div");
	    div.style.border= "1px solid black";
      div.style.width= "1100x";
      div.style.height= "600px";     
    
      document.getElementById('main-wrap').appendChild(div);
}
</script>


</body>
</html>