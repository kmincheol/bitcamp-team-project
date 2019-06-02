<%@page import="org.aspectj.weaver.patterns.TypePatternQuestions.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp" />
<link href="${contextRootPath}/node_modules/mdbootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>


<div class="container">

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
${team.teamEmblemPhoto},
${team.teamUniformPhoto},
${team.teamCreateDate},
${team.teamInfo},
${team.teamTypeSports.teamSportsType}
"
>${team.teamName}</option>

</c:forEach> 
</select>
</div>

<div id ="teamInfo" style="border:1px solid black; width:1080px; height:400px; ">

<div id ="teamMark" style="border:1px solid black; width:350px; height:350px; margin:22px; float:left; ">
</div>

<div id ="teamName" style="border:1px solid black; width:200px; height:50px; float:left;margin-top:22px">
</div>
<div id ="teamdetail" style="border:1px solid black; width:400px; height:290px;float:left; margin-top:80px; margin-left:-200px">
</div>

<div id ="teamUniform" style="border:1px solid black; width:250px; height:350px;float:left;margin-top:22px; margin-left:17px;">
</div>

</div>

</div> <!-- containner -->

<%-- <jsp:include page="../footer.jsp" /> --%>

<script type="text/javascript">
function aa(){
	
	var target = document.getElementById("cc");
	var a = String(target.options[target.selectedIndex].value).split(',');
 
	var teamMark = document.getElementById("teamMark");
	var teamName= document.getElementById("teamName");
	 var teamDetail = document.getElementById("teamdetail");
	 var teamUniform = document.getElementById("teamUniform");
	 teamMark.innerHTML = '<img src="data:image/png;base64,' + a[6] + '" alt="Bule Circle"/>';
	teamName.innerHTML = '<h3>'+ a[0] + '</h3>';
	teamDetail.innerHTML = ' <div> 종목 : ' +     a[10] + '</div><br>' + 
		                        '지역 : ' +      a[2] + '<br>' + 
	                          '창단일 : ' + a[9] + '<br>' +
	                          '평균 연령 : ' +a[3] + '<br>' +
	                          '팀 유형 : ' +a[4] + '<br>' +
	                          '팀 실력 : ' +a[5] + '<br>' +
	                          '팀 소개 : ' +a[10] + '<br>';
teamUniform.innerHTML 


}


</script>

</body>
</html>