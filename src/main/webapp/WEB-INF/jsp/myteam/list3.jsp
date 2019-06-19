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

<!-- recruit_board_list.css -->
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board/recruit_board_list.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">

<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">

<!-- MDBootstrap Datatables  -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/addons/datatables.min.css" rel="stylesheet">
  
   <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet"> 
   
<link href="http://sweetalert2.github.io/styles/bootstrap4-buttons.css" rel="stylesheet">

<style>
.container {
  font-family: 'Jua', sans-serif;
}

.team_info {

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
</style>

</head>
<body>
  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />

  <div id="main-wrap" class="container">
   <div id="main-text">
    <h2>    
        <img src="${contextRootPath}/images/3dusersoccer.jpg">요청한 경기
      </h2>
    </div>
       <div id="cdcd" style="width:1080px;height: 50px;margin-top: 30px;">
             <div id="myTeamHeader" style="text-align: center; font-size: 20px;">
          <span style="margin : 50px;"><a href="${contextRootPath}/app/myteam"style="text-decoration:none; color:black"> 나의팀 </a> </span> 
        <span style="margin : 50px;border-bottom: 2px solid #51c321;"><a href="${contextRootPath}/app/myteam/list3/${tno}" style="text-decoration:none; color:black">요청한 경기</a></span > 
        <span style="margin : 50px"><a href="${contextRootPath}/app/myteam/list2/${tno}" style="text-decoration:none; color:black">요청받은 경기</a></span>
        <span style="margin : 50px"><a href="${contextRootPath}/app/myteam/list5/${tno}" style="text-decoration:none; color:black">성사된 나의 경기</a></span>
                </div>
          
    </div>
    <div >
      <div style="width: 1080px;">
        <div style="background: #949494; text-align: center; font-weight: bold; line-height: 40px;">
         요청 경기</div>      
        <div style="height: 700px; width: 1085px; overflow: scroll;">
          <table class="table table-bordered" style="margin: 0;">
            <c:if test="${fn:length(matchNos) == 0}">
             <tbody>  
              <tr style="height: 100px;">
                <td colspan="2" style="vertical-align: middle; width: 220px; padding-left: 30px; text-align : center;">
                             경기 신청 내역이 없습니다.
                </td>              
              </tr>
            </tbody>
          </c:if>
            <tbody>  
               <c:forEach items="${matchNos}" var="matchNos"> 
              <tr style="height: 100px;">
                <td colspan="1" style="vertical-align: middle; text-align: center; width: 150px; height:150px;"><img src="${matchNos.team.teamEmblemPhoto }"/></td>
                <td colspan="2" style="vertical-align: middle; width: 220px; padding-left: 30px;">
                <div class="team_info">&middot; 팀명 : ${matchNos.team.teamName } </div>
                <div class="team_info">&middot; 지역 : ${matchNos.match.location }</div>
                <div class="team_info">&middot; 구장 : ${matchNos.match.stadiumName }</div>
                <div class="team_info">&middot; 날짜 :${matchNos.match.playDate }</div>
                <div class="team_info">&middot; 비용 : ${matchNos.match.cost }</div>
                </td>              
                <td colspan="1" style="vertical-align: middle; width: 150px;">  
                  <a class="btn btn-outline-dark"   href="${contextRootPath}/app/myteam/list3/delete/${matchNos.match.no}/${tno}" style="width: 120px;">취소</a>
                </td>
              </tr>
               </c:forEach> 
            </tbody>
          </table>
        </div>
      </div>
    </div>   


  </div>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

<script src="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
<script>

</script>

</body>
</html>