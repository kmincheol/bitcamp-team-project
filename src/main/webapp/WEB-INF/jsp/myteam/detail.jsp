<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp" />
<jsp:include page="../commonCss.jsp" />
<head>

</head>
<body>
 <div class="container">



<div style="border: 15px solid #efefef;width: 1080px;height: 500px;margin-top:180px;">
     
      <div style="width: 600px;height: 450px; float:left;">
             <div  style="width: 450px;height: 450px; margin:auto; margin-top:25px" >
             <table class="table" style="border-top:4px solid;border-bottom:4px solid;height: 95%;">
  <tbody>
    <tr>
      <th scope="row">이름</th>
      <td>${teamMember.member.name}</td>
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
          <div>
            <a class="btn btn-dark" href='../delete/${teamMember.teamMemberNo}/${teamMember.memberNo}'>추방</a>
          </div>
</div> <!-- containner -->
</body>

</html>