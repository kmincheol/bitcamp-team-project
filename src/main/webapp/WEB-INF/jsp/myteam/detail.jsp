<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<style>


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
        팀원 정보
      </h1>
    </div>

 <div id="main-wrap" class="container">


<div style="border: 15px solid #efefef;width: 1080px;height: 400px;">
     
      <div style="width: 600px;height: 350px; float:left;">
             <div  style="width: 450px;height: 450px; margin:auto; margin-top:30px" >
             <table class="table" style="border-top:4px solid;border-bottom:4px solid; font-size:17px">
  <tbody>
    <tr>
      <th scope="row">이름</th>
      <td>${teamMember.member.name} 
      <c:choose>
        <c:when test="${teamMember.teamLeader == true}">
              (팀장)
        </c:when>
        <c:otherwise>
            (팀원)
        </c:otherwise>
      </c:choose>
      </td>
    </tr>
        <tr>
      <th scope="row">포지션</th>
      <td>${teamMember.position}</td>
    </tr>
       <tr>
      <th scope="row">생년월일</th>
      <td>${teamMember.member.birthDay}</td>
    </tr>
   
     <tr>
         <th scope="row">성별</th>
      <td>${teamMember.member.gender}</td>
    </tr>
    <tr>
         <th scope="row">이메일</th>
      <td>${teamMember.member.email}</td>
    </tr>
    <tr>
         <th scope="row">전화번호</th>
      <td>${teamMember.member.tel}</td>
    </tr>
    </tbody>
</table>                  
             </div>
             </div>
      <div style="width: 450px;height: 100%; float:left;">
          <img src="${teamMember.member.photo}" style="width:100%; height:100%">           
       </div>
          </div>
            <c:if test="${teamLeader.memberNo eq sessionScope.loginUser.no }">
          <div>
            <a class="btn btn-outline-dark" href='../delete/${teamMember.teamMemberNo}/${teamMember.memberNo}'>추방</a>
          </div>
          </c:if>
</div> <!-- containner -->
 <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

</body>

</html>