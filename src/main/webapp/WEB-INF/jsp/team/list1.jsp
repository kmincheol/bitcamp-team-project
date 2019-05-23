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
      box-sizing: border-box; width: 890px; height: 490px; position:relative;" >  
            <c:forEach items="${teams}" var="team"> 
            <ul class="team_ul">
              <li style="display:none;"> ${team.teamId}</li>  
               <li>
               <div class="hover01 column">
                <figure id="picture"><img src = '${team.teamEmblemPhoto}' class="detailbtn" style="width:100px; height:100px;"></figure>
                </div>
                </li>
                  <li style="text-align: center; margin: 5px;" > ${team.teamName} </li>    
                <li style="display:none;">${team.teamTypeSports.teamSportsType}</li> 
                <li style="display:none;">${team.teamArea}</li> 
                <li style="display:none;">${team.teamCreateDate}</li>  
                <li style="display:none;">${team.teamAges.teamAges}</li> 
                <li style="display:none;">${team.teamInfo}</li> 
                <li style="display:none;">${team.teamLevel.teamLevel}</li> 
             </ul>
             <ul class="tmb" style="display:none;">
                  <li>${team.teamMember.teamMemberNo}</li>
                  <li>${teamMember.member.name}</li>
                  <li>${team.teamMember.position}</li>
                  <li>${team.teamMember.teamLeader}</li>
                     <!--  멤버 이름 못받는 상태 ${} 다시 확인하기 -->
             </ul> 
            </c:forEach>
            </div>
    <div class="col-lg-12" id="teamInfo" style="font-size: 20px; border:1px solid gray; width:400px; padding:30px; padding-left:45px; display:none; left:20px;"></div>
    <div class="col-lg-12" id="teamMemberInfo" style="left:500px; bottom:600px; font-size: 20px;"></div> 
      <br><br><br><br>
</div>

  <jsp:include page="../javascript.jsp" />  
  
  <script type="text/javascript">
 
  $(".detailbtn").click(function(){ 
    $("#teamInfo").show();
    var str = ""
    var str2 = ""
    var divArr = new Array();
    var liArr = new Array();  
    //var mbrArr = new Array(); // 팀 멤버 배열 
    var detailbtn = $(this);
    
    var div = $(".tmb");
    var divli = div.children();
    
    var ul = detailbtn.parent().parent().parent().parent();
    var li = ul.children();
    
    //var mbrdiv = detailbtn.
    
    var photo = $(this).attr('src');
    
    /* console.log("클릭한 Row의 모든 데이터 : "+ul.text()); */
    console.log("팀원 : "+div.text());
    
    var tmbNo = divli.eq(0).text();
    var name = divli.eq(1).text();
    var position = divli.eq(2).text();
    var leader = divli.eq(3).text();
    
    var no = li.eq(0).text();
    var teamEmblemPhoto = photo;
    var teamName = li.eq(2).text();
    var teamSprotsType = li.eq(3).text();
    var teamArea = li.eq(4).text();
    var teamCreateDate = li.eq(5).text();
    var teamAges = li.eq(6).text();
    var teamInfo = li.eq(7).text();
    // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
    li.each(function(i){   
      liArr.push(li.eq(i).text());
    });
    
    divli.each(function(i){   
      divArr.push(divli.eq(i).text());
    });
    
    str2 += "<div style='margin:5px;'> <b>팀원번호 </b> :" + tmbNo + "</div>" +
            "<div style='margin:5px;'> <b>팀원이름 </b> :" + name + "</div>" +
            "<div style='margin:5px;'> <b>포지션 </b> :" + position + "</div>" +
            "<div style='margin:5px;'> <b>리더 </b> :" + leader + "</div>" ;  
    
    str +=  " <div style='display:none;'> <b>팀번호</b> : "+ no + "</div>" +
        "<div><img src=" + teamEmblemPhoto + " style='width:300px; height:300px;'></div>" + 
        "<hr><br>" +  
        "<div style='margin:5px;'> <b>팀명</b> :" + teamName + "</div>" + 
        "<div style='margin:5px;'> <b>종목</b> :" + teamSprotsType + "</div>" +
        "<div style='margin:5px;'> <b>지역</b> :" + teamArea + "</div>" +
        "<div style='margin:5px;'> <b>창단일</b> :" + teamCreateDate + "</div>" +
        "<div style='margin:5px;'> <b>연령대</b> :" + teamAges + "</div>" +
        "<div style='margin:5px;'> <b>팀소개 </b> :" + teamInfo + "</div>";   
    
    $("#teamInfo").html(str);  
    $('#teamMemberInfo').html(str2);
  });
  </script>
</body>
</html>







