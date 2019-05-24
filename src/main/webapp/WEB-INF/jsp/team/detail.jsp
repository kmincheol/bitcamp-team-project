<%@page import="com.eomcs.lms.domain.Team"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>팀 상세조회</title>
  <jsp:include page="../commonCss.jsp"/>
  <link rel="stylesheet" href="${contextRootPath}/css/team.css">
</head>
<body>

  <%-- <jsp:include page="../header.jsp" /> --%> 
   
  <div class="container">
   <br><br>
    <c:choose>
      <c:when test="${empty team}">
        <p>해당하는 팀이 없습니다.</p>
      </c:when>
      
      <c:otherwise>
      
      
        <div class="row" style="border:2px solid gray; width: 400px; padding: 15px;">
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
            
             <div class="form-group row">
              <label for="name" class="col-sm-5 col-form-label">팀원</label>
              <div class="col-sm-10">
                <input type="text" class="form-control-plaintext" name="name" id="name" value='${team.member.name}' readonly/>
              </div>
            </div>
            
             <div class="form-group row">
              <label for="position" class="col-sm-5 col-form-label">포지션</label>
              <div class="col-sm-10">
                <input type="text" class="form-control-plaintext" name="position" id="position" value='${team.teamMember.position}' readonly/>
              </div>
            </div>
            
             <div class="form-group row">
              <label for="teamLeader" class="col-sm-5 col-form-label">리더</label>
              <div class="col-sm-10">
                <input type="text" class="form-control-plaintext" name="teamLeader" id="teamLeader" value='${team.teamMember.teamLeader}' readonly/>
              </div>
            </div>
            <!--  멤버 이름 못받는 상태 ${} 다시 확인하기 -->
          </div> <!-- .bit-pro -->
          
        </div> <!-- .row -->
    
      </c:otherwise>
    </c:choose>
  
  </div> <!-- .container -->
  
  <jsp:include page="../javascript.jsp"/> 
  
</body>
</html>
