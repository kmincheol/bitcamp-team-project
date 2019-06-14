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
<link href="${contextRootPath}/node_modules/mdbootstrap/css/addons/datatables.min.css"
  rel="stylesheet">

<style>
.team_info {

}
</style>

</head>
<body>
  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />

  <div id="main-wrap" class="container">
    <div style="margin-top: 50px;">
      <div style="width: 1080px;">
        <div style="background: #949494; text-align: center; font-weight: bold; line-height: 40px;">
          신청받은경기</div>      
        <div style="height: 700px; width: 1085px; overflow: scroll;">
          <table class="table table-bordered" style="margin: 0;">
            <tbody>        
              <%-- <c:forEach items=""> --%>
              <tr style="height: 100px;">
                <td colspan="1" style="vertical-align: middle; text-align: center; width: 150px; height:150px;">팀엠블럼</td>
                <td colspan="2" style="vertical-align: middle; width: 220px;">
                <div class="team_info">&middot; 팀명 : </div>
                <div class="team_info">&middot; 지역 : </div>
                <div class="team_info">&middot; 구장 : </div>
                <div class="team_info">&middot; 날짜 : </div>
                <div class="team_info">&middot; 비용 : </div>
                </td>
                <td colspan="1" style="vertical-align: middle; width: 100px;">  
                  <button style="width: 100%; margin-bottom: 2px;">수락</button> <br>
                  <button style="width: 100%;">취소</button>
                </td>
              </tr>
              <%-- </c:forEach> --%>
            </tbody>
          </table>
        </div>
      </div>
    </div>   


  </div>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />



</body>
</html>