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

</head>
<body>


<div id="main-wrap" class="container">

<div id="teamSelect">
<select id="cc" onchange="aa();">
<option>나의 팀을 고르세요</option>
<c:forEach items="${team}" var="team">

<option value=
"${team.teamName},
${team.teamId},
${team.teamArea},
${team.teamAges.teamAges},
${team.teamType.teamType},
${team.teamLevel.teamLevel},
${team.teamCreateDate},
${team.teamInfo},
${team.teamTypeSports.teamSportsType},
${team.teamEmblemPhoto},
${team.teamUniformPhoto}
"
>${team.teamName}</option>

 
 </c:forEach>

 <c:forEach items="${tm}" var="teamMember" >
        <input id = "teamNo" type ="hidden" value=" ${teamMember.teamMemberNo}">
        <input id = "teamm" type ="hidden" value=" ${teamMember.member.name}">

</c:forEach>




</select>
</div>
<div>
</div>

<div id ="teamInfo" style="border:1px solid black; width:1080px; height:400px; ">

<div id ="teamMark" style="border:1px solid black; width:350px; height:350px; margin:22px; float:left; ">
</div>

<div id ="teamName" style="border:1px solid black; width:200px; height:50px; float:left;margin-top:22px">
</div>
<div id ="teamtype" style="border:1px solid black; width:400px; height:50px;float:left; margin-top:80px; margin-left:-200px">
</div>
<div id ="teamarea" style="border:1px solid black; width:400px; height:50px;float:left;  margin-top:5px; ">
</div>



</div>

<div id ="aaaa"  style="width:1100px; height:350px;float:left;margin-top:22px; ">
</div>

</div> <!-- containner -->

<jsp:include page="../footer.jsp" />
<script type="text/javascript">
function aa(){
   var arr = new Array();  //${teamMember.teamMemberNo}
   var arrb = new Array(); //${teamMember.member.name}
   var arrc = new Array(); 
   var arrd = new Array(); //${teamMember.member.photo}
   var arre = new Array(); //${teamMember.position}
   var arrdd = new Array();
	 var target1 = $('#teamm').val();
	 
	 
	 var target = document.getElementById("cc");
	var a = String(target.options[target.selectedIndex].value).split(',');

 var teamMark = document.getElementById("teamMark");
	var teamName= document.getElementById("teamName");
	 var teamDetail = document.getElementById("teamdetail");
	if (a.length > 11){
  teamMark.innerHTML ='<img src ="' + a[9] +',' + a[10] + '" width = "340px" height = "340px">'
	teamName.innerHTML = '<h3>'+ a[0] + '</h3>';
	teamDetail.innerHTML = '종목 : ' + a[8] + '<br>' + 
		                        '지역 : ' + a[2] + '<br>' + 
	                          '창단일 : ' + a[6] + '<br>' +
	                          '평균 연령 : ' +a[3] + '<br>' +
	                          '팀 유형 : ' +a[4] + '<br>' +
	                          '팀 실력 : ' +a[5] + '<br>' +
	                          '팀 소개 : ' +a[7] + '<br>';
teamUniform.innerHTML ='<img src ="' + a[11] +',' + a[12] + '">'
	 }else {
		  teamMark.innerHTML ='<img src ="' + a[9] +  '" width = "340px" height = "340px" >'
		  teamName.innerHTML = '<h3>'+ a[0] + '</h3>';
		  teamtype.innerHTML = '종목 ' +a[8]+ '<br> ' 
		  teamarea.innerHTML = '지역  ' +a[2]+ '<br> ' /* teamarea
		                            '창단일 : ' + a[6] + '<br>' +
		                            '평균 연령 : ' +a[3] + '<br>' +
		                            '팀 유형 : ' +a[4] + '<br>' +
		                            '팀 실력 : ' +a[5] + '<br>' +
		                            '팀 소개 : ' +a[7] + '<br>';
 */	 }
 
	  
	<c:forEach items="${tm}" var="teamMember">
	 arr.push("${teamMember.teamMemberNo}");
	 arrb.push("${teamMember.member.name}");
	 arrd.push("${teamMember.member.photo}");
	 arre.push("${teamMember.position}");
	 </c:forEach>
	for (var i = 0; i < arr.length; i++) {
	    if(arr[i] == parseInt(a[1])){
	    	 arrc.push(arrb[i])
	    	 arrdd.push(arrd[i])
	    }
	}
	
        for(var j=0; j< 30; j++){
        	$("#abcd").remove()
        }      
    
    for (var i = 0; i < arrc.length; i++) {
        //div 객체 생성
        var div = document.createElement("div");
        div.id = "abcd"
        div.innerHTML ='<img src ="' + arrdd[i] +  '" width = "256px" height = "250px" style = "float :right">' + 
        arre[i] + arrc[i]
        //css설정
        div.style.border= "1px solid black";
        div.style.margin= "5px";
        div.style.width= "260px";
        div.style.height= "300px";
        div.style.float= "left";
        document.getElementById('aaaa').appendChild(div);
    }
}

</script>


</body>
</html>