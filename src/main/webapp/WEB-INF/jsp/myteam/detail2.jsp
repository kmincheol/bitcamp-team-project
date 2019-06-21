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

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">

<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<style type="text/css">


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
        대기자 정보
      </h1>
    </div>
 <div id="main-wrap" class="container">
 


<div style="border: 15px solid #efefef;width: 1080px;height: 400px;">
     
      <div style="width: 600px;height: 350px; float:left;">
             <div  style="width: 450px;height: 450px; margin:auto; margin-top:30px" >
             <table class="table" style="border-top:4px solid;border-bottom:4px solid; font-size:17px">
  <tbody>
    <tr>
      <th  scope="row">이름</th>
      <td >${memberInfo.name}</td> 
    </tr>
      <tr>
      <th scope="row">포지션</th>
      <td></td>
    </tr>
     <tr>
      <th  scope="row">생년월일</th>
      <td >${memberInfo.birthDay}</td>
    </tr> 
   
     <tr>
         <th scope="row">성별</th>
      <td >${memberInfo.gender}</td> 
    </tr>
    <tr>
         <th scope="row">이메일</th>
      <td >${memberInfo.email}</td>
    </tr>
    <tr>
         <th  scope="row">전화번호</th>
      <td>${memberInfo.tel}</td>
    </tr>
    </tbody>
</table>                  
             </div>
             </div>
      <div style="width: 450px;height: 100%; float:left;">
          <img src="${memberInfo.photo}" style="width:100%; height:100%">           
       </div>
          </div>
          <div style="width: 100%;text-align: center;">
            <a class="btn btn-outline-dark" href='${contextRootPath}/app/myteam/applyadd/${tno}/${memberInfo.no}/${rermId}'>수락</a>
            <a class="btn btn-outline-dark" href='${contextRootPath}/app/myteam/applydelete/${tno}/${memberInfo.no}/${rermId}'>거절</a>
          </div>
</div> <!-- containner -->

 <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

</body>

</html>