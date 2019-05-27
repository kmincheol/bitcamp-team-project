<%@page import="com.eomcs.lms.domain.Team"%>
<%@page import="com.eomcs.lms.domain.Member"%>
<%@page import="com.eomcs.lms.domain.TeamMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>팀 상세조회</title>
<jsp:include page="../commonCss.jsp" />
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/team.css">
</head>
<body>

  <%-- <jsp:include page="../header.jsp" /> --%>

  <div class="container">
    <br>
    <br>
   <%--   <c:choose>
      <c:when test="${empty teamMembers}">
        <p>해당하는 팀이 없습니다.</p>
      </c:when>

      <c:otherwise>  --%>

        
       <%--  <div class="row" style="border:2px solid gray; width: 400px; padding: 15px;">
          <div class="bit-pro col-7">
            <div class="form-group row" style="display:none;">
              <label for="no" class="col-sm-3 col-form-label">번호</label>
              <div class="col-sm-10">
                <input type="number" class="form-control-plaintext" name="teamId" id="no" value="${team.teamId}" readonly/>
              </div>
            </div>
            
            <div> <img src="${team.teamEmblemPhoto}" style="width:300px; height: 300px;"></div>
          
            <div class="form-group row">
              <label for="teamName" class="col-sm-5 col-form-label">팀명</label>
              <div class="col-sm-10">
                <input type="text" class="form-control-plaintext" name="teamName" id="teamName" value="${team.teamName}" readonly/>
              </div>
            </div>
            
             <div class="form-group row">
              <label for="teamTypeSports" class="col-sm-5 col-form-label">팀 종목</label>
              <div class="col-sm-10">
                <input type="text" class="form-control-plaintext" name="teamTypeSports" id="teamTypeSports" value="${team.teamTypeSports.teamSportsType}" readonly/>
              </div>
            </div>

            <div class="form-group row">
              <label for="teamArea" class="col-sm-5 col-form-label">지역</label>
              <div class="col-sm-10">
                <input type="text" class="form-control-plaintext" name="teamArea" id="teamArea" value='${team.teamArea}'/>
              </div>
            </div>
            
              <div class="form-group row">
              <label for="teamCreateDate" class="col-sm-5 col-form-label">창단일</label>
              <div class="col-sm-10">
                <input type="text" class="form-control-plaintext" name="teamCreateDate" id="teamCreateDate" value='${team.teamCreateDate}' readonly/>
              </div>
            </div>
            
             <div class="form-group row">
              <label for="teamAges" class="col-sm-7 col-form-label">평균 연령</label>
              <div class="col-sm-10">
                <input type="text" class="form-control-plaintext" name="teamAges" id="teamAges" value='${team.teamAges.teamAges}' readonly/>
              </div>
            </div>
            
             <div class="form-group row">
              <label for="teamInfo" class="col-sm-5 col-form-label">팀 소개</label>
              <div class="col-sm-10">
                <input type="text" class="form-control-plaintext" name="teamInfo" id="teamInfo" value='${team.teamInfo}' readonly/>
              </div> 
              </div>
  </div>
  </div>  --%>
  <div class="teamMember">
  <table border="1" id="list_table">
  <colgroup>
    <!-- column 의 설정을 할수 있다. -->
    <col style="width:70px;">
    <col style="width:200px;">
    <col style="width:300px;">
    <col style="width:200px;">
  </colgroup>

  <thead>
    <tr>
      <th>번호</th>
      <th>이름</th>
      <th>포지션</th>
      <th>리더</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${teamMembers}" var="teamMember"> 

    <tr>
    <%-- <td><%=no%></td> --%>
      <td>${teamMember.teamMemberNo}</td>
      <td>${teamMember.member.name}</td>
      <td>${teamMember.position}</td>
      <td>${teamMember.teamLeader}</td>
    </tr>
        </c:forEach>
  </tbody>
</table>
</div>
  
  
      <!-- style="width:1000px; left:500px; bottom:500px; position: relative;" -->
      <%--   <div class="tmb">
        
         <input type="text" name="teamMemberNo"  value='${teamMember.teamMemberNo}' style="display:none; border:none;"readonly/>
          <input type="text" name="name" id="teamAges" value='${teamMember.member.name}' style="border:none;" readonly/>
          <input type="text" name="position" id="teamAges" value='${teamMember.position}'style="border:none;" readonly/>
          <input type="text" name="teamLeader" id="teamAges" value='${teamMember.teamLeader}' style="border:none;" readonly/>
        </div> --%>
      
        
     <%-- </c:otherwise>
    </c:choose>  --%>
  </div>




  <jsp:include page="../javascript.jsp" />

</body>
</html>
