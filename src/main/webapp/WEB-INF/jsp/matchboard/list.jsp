<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>매치보드</title>
<jsp:include page="../commonCss.jsp" />
<link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">
</head>
<body>

<jsp:include page="../header.jsp" />

  <div class="container">
    <div id="match_content">
      <div>
        <h2 class="match_content_title">
          등록된 <b>매치 글</b>을 검색하여 찾거나
        </h2>
        <h2>직접 매치글을 등록할 수 있습니다.</h2>
        <br>
        <p>
          원하는 <b>검색 결과에 맞춰</b> 경기를 매칭시키거나
        </p>
        <p>
          <b>추천 매칭</b>을 통하여 경기를 매칭시켜보세요.
        </p>

      <!-- 사이드바 인클루드하기 -->
      
       <input class="search" placeholder="Search" />
  <button class="sort" data-sort="name">
    Sort by name
  </button>

        <c:if test="${!empty sessionScope.loginUser}">
        <c:if test="${!match.team.teamMember.team_leader}">
          <div style="text-align: center;">
            <a href='${contextRootPath}/app/matchboard/form.jsp' id="formBtn"
              class="btn btn-primary" tabindex="-1" role="button"
              aria-disabled="true" style="width: 300px;"> 매치 등록하기 </a>
          </div>
        </c:if>
        </c:if>
      </div>
        <!-- 테이블 시작지점 -->
      <table id="dt" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
        </thead>
        
        <c:forEach items="${matches}" var="match">
        
      
        
        <tbody>
          <tr>
            <td id="teaminfo" class="th-sm sorting_asc" rowspan="1"
                align="center" style="cursor: pointer;"
                onClick="location.href='${contextRootPath}/app/matchboard/team/${match.team.teamId}'"
                onMouseOver="this.style.backgroundColor='#f2fffd';"
                onMouseOut="this.style.backgroundColor='' ">
                <img src='${match.team.teamEmblemPhoto}'>
            <p>${match.team.teamName}</p>
            아직 팀 페이지가 없습니다.
            </td>
            <td id="info" style="cursor: pointer;"
                onClick="location.href='${contextRootPath}/app/matchboard/${match.no}'"
                onMouseOver="this.style.backgroundColor='#f2fffd';"
                onMouseOut="this.style.backgroundColor='' ">
                <br> 종목:
                ${match.teamTypeSports.teamSportsType} <br>
                <br> 위치:
                ${match.location} <br>  
                <br> 경기장:
                ${match.stadiumName} <br>
                <br> 경기날짜: 
                ${match.playDate}<br>
                <br></td>
                
            <td>
            <c:if test="${!empty sessionScope.loginUser}">
            <!-- <div class="button3" style="padding-top: 40px;"> -->
            <div class="form-group pos-relative" id="applybtn" style="top: 50px;">
            <div class="popoverContainer">



              
              
            <a tabindex="0" role="button" class="btn btn-lg btn-danger matchPopover" title="" data-original-title="popover Test">팝오버버튼</a>

            <div class="js-tooltip select-div" >
                <strong>제목:${match.title} </strong><br>
                <strong>내용:${match.contents}</strong><br> 
                <strong>연락처:${match.telephone} </strong><br> 
                <form action='${match.no}/submit'>
                  <select name='teamId' id="selectBox">
                    <option selected>소속팀 선택</option>
                    <c:forEach items="${myteam}" var="myteam">
                      <c:if test="${!myteam.team.teamMember.team_leader}">
                        <option value='${myteam.team.teamId}'>${myteam.team.teamName}</option>
                      </c:if>
                    </c:forEach>
                  </select>
                  <button class="btn btn-primary btn-sm">신청하기3</button> 
                  <a class="btn btn-primary btn-sm submitbtn" onclick="javascript:btn()"
              href='${contextRootPath}/app/matchboard/${match.no}/submit'role="button"> 
              &nbsp &nbsp &nbsp &nbsp &nbsp 신청하기 &nbsp &nbsp &nbsp &nbsp &nbsp </a>
                </form> 
              </div>  



            </div>
            
          
                  </div> <!-- js-tooltip 끝 --> 
                  


                  
                  </div> <!-- form-group pos-relative 끝 -->
                  </div>
              
            </c:if>
            </td>
            </tr>
          </tbody>
        </c:forEach>
        </table>
      <nav aria-label="목록 페이지 이동" id="listnum">
  <ul class="pagination justify-content-center">
  
    <li class="page-item ${pageNo <= 1 ? 'disabled' : ''}">
    <a class="page-link" href="?pageNo=${pageNo -  1}&pageSize=${pageSize}">이전</a></li>
    
    <li class="page-item ${pageNo <= 1 ? 'disabled' : ''}">
    <a class="page-link" href="?pageNo=${pageNo - 1}&pageSize=${pageSize}">${pageNo <= 1 ? "-" : pageNo - 1}</a></li>
    
    <li class="page-item active"><span class="page-link">${pageNo}</span></li>
    
    <li class="page-item ${pageNo >= totalPage ? 'disabled' : ''}">
    <a class="page-link" href="?pageNo=${pageNo + 1}&pageSize=${pageSize}">${pageNo >= totalPage ? "-" : pageNo + 1}</a></li>
    
    <li class="page-item ${pageNo >= totalPage ? 'disabled' : ''}">
      <a class="page-link" href="?pageNo=${pageNo + 1}&pageSize=${pageSize}">다음</a></li>
  </ul>
    </nav>
    
  </div>
  </div>
  <!-- .container -->

<jsp:include page="../javascript.jsp" />
<script src="//cdnjs.cloudflare.com/ajax/libs/list.js/1.5.0/list.min.js"></script>
  
 <script>

$(document).ready(function () {
  $('.matchPopover').popover({
    html: true,
    content : $('.select-div')
})
});

var options = {
    valueNames: [ 'name', 'born' ]
  };

  var userList = new List('users', options);

</script>




<!-- <script>
$("#mtaply").bind('ajax:complete', function() {
  $(document).ready(function() {
    $.ajax({
            "url" : "list.jsp",
            "type" : "get",
            "dataType": "json",
            data:{
                name: $('#name1').val(), 
                age: $('#age1').val(), 
            },
            "success" : function(data){
                alert("가져온 데이터 입니다 . "+data);
                var str = "<select id='mainTableList'>";
                str +="<tr>";
                $.each(data,function(i,v){
                    //데이터 인풋
                  str +="<td>"+ v.mem_id+"</td>;  
          });

                str +="</tr>";
                $("#tableList").html(str);
                
               },
            "error" : function(info, xhr){
                if(info.readyState == '4'){
                 alert('문제가 발생했습니다.\n상태코드 : ' + info.status+ '\n\n' + info.responseText);
                } else {
                 alert('문제가 발생했습니다.\n잠시후 다시 시도해 주세요.\n 상태코드 : ' +info.status);
                }
               }
        }); 
  }); 
});
</script> -->



<!--  <script>
function btn(){
  document.getElementById("selectBox");
  var selectTeam = options[target.selectedIndex].value
  
  
  document.querySelector("#submitbtn").onclick = () => {
      console.log(JSON.stringify(selectTeam));  // stringify 메소드는 json 객체를 String 객체로 변환
      var xhr = new XMLHttpRequest();
      xhr.onreadystatechange = () => {

      xhr.open("GET", "", true);
      xhr.setRequestHeader("Content-Type", "application/json");
      xhr.send(JSON.stringify(board));
    };
  }
}
</script> -->
</body>
</html>
