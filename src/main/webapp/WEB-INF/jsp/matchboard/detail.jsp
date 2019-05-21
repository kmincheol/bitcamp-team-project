<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
</head>

<body>

  <div class="container">
    
    <div id="main-text">
      <h2>매치보드 작성글</h2>
    </div>

    <div>
      <form action='update' method='post' enctype='multipart/form-data'>
      
        <div class="form-group row">
          <label for="no" class="col-sm-2 col-form-label">번호</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="matchNo" id="no"
              value="${match.no}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="playdt" class="col-sm-2 col-form-label">경기날짜</label>
          <div class="col-sm-10">
            <input type="date" class="form-control" name="playDate"
              value="${match.playDate}" readonly/>
          </div>
        </div>


        <div class="form-group row">
          <label for="location" class="col-sm-2 col-form-label">지역</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="teamArea" id="location"
              value="${match.location}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="sportsType" class="col-sm-2 col-form-label">종목</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="teamSportsType" id="sportsType"
              value="${match.team.teamSportsId}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="teamName" class="col-sm-2 col-form-label">팀명</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="teamName" id="teamName"
              value="${match.team.teamName}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="title" class="col-sm-2 col-form-label">제목</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="teamTitle" id="title"
              value="${match.title}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="contents" class="col-sm-2 col-form-label">내용</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="teamContents" id="contents"
              value="${match.contents}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="viewCount" class="col-sm-2 col-form-label">조회수</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="matchViewCount" id="viewCount"
              value="${match.viewCount}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <div class="col-sm-10">
            <a class="btn btn-primary" href='${contextRootPath}/app/matchboard'>목록</a> 
              
              <c:if test="${!empty sessionScope.loginUser}">
              <a href='${contextRootPath}/app/matchboard' id="btnsub"
               class="btn btn-primary" role="button" aria-disabled="true">신청하기</a>
            </c:if>
            <!-- 해당 팀의 팀장이 자기가 쓴 매칭글에서는 신청하기 버튼이 보이지 않아야함. 혹은 신청할수 없게 막아야함 -->


            <!-- 팀장이 매칭글을 적고 나서 수정, 삭제는 해당팀의 팀장만 가능하게 조건필요 -->
            <%-- <c:if test="${match.team.teamMember.team_leader == true}"> --%>
            <%-- <c:if test="${sessionScope.loginUser.team.teamName eq match.team.teamName}"> --%>
          <a class="btn btn-primary" href='delete/${match.no}'>삭제</a>
          <a class="btn btn-primary" href='${contextRootPath}/app/matchboard/update/${match.no}'>변경</a> 
<%--             </c:if>
            </c:if> --%>
          </div>
        </div>
      </form>
    </div>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />

</body>

</html>