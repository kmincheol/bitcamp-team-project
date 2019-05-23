<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">
</head>
<jsp:include page="../header.jsp" />
<style>
#viewCount {
text-align: right;
}
#viewCnt {
text-align: right;
}
#locleb {
text-align: right;
}
#typlab{
text-align: right;
}
</style>

<body>

  <div class="container">
    <br><br><br>
    <div id="main-text">
      <h2>작성글 확인</h2>
    </div>

    <div>
      <form action='update' method='post' enctype='multipart/form-data'>
      
        <div class="form-group row">
          <label for="no" class="col-sm-2 col-form-label">번호</label>
          
          <div class="col-sm-3">
            <input type="text" class="form-control" name="matchNo" id="no"
              value="${match.no}" readonly />
          </div>
          
          <label for="viewCount" class="col-sm-2 col-form-label" id="viewCnt">조회수</label>
          <div class="col-sm-3">
            <input type="text" class="form-control" name="matchViewCount" id="viewCount"
              value="${match.viewCount}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="playdt" class="col-sm-2 col-form-label">경기날짜</label>
          <div class="col-sm-3">
            <input type="date" class="form-control" name="playDate"
              value="${match.playDate}" readonly/>
          </div>
          
          <label for="location" class="col-sm-2 col-form-label" id="locleb">지역</label>
          <div class="col-sm-3">
            <input type="text" class="form-control" name="teamArea" id="location"
              value="${match.location}" readonly />
          </div>
        </div>

<%--         <div class="form-group row">
          <label for="playdt" class="col-sm-2 col-form-label">연령대</label>
          <div class="col-sm-10">
            <input type="number" class="form-control" name="teamAges"
              value="${match.teamAges.teamAges}" readonly/>
          </div>
        </div> --%>

        <div class="form-group row">
          <label for="location" class="col-sm-2 col-form-label">경기장</label>
          <div class="col-sm-3">
            <input type="text" class="form-control" name="stadiumName" id="stadiumName"
              value="${match.stadiumName}" readonly />
          </div>
          <label for="sportsType" class="col-sm-2 col-form-label" id="typlab">종목</label>
          <div class="col-sm-3">
            <input type="text" class="form-control" name="teamSportsType" id="sportsType"
              value="${match.teamTypeSports.teamSportsType}" readonly />
          </div>
        </div>

        <div class="form-group row" >
          <label for="teamName" class="col-sm-2 col-form-label">팀</label>
          <div class="col-sm-3">
            <input type="text" class="form-control" name="teamName" id="teamName"
              value="${match.team.teamName}" readonly />
          </div>
        </div>

        <div class="form-group row">
          <label for="title" class="col-sm-2 col-form-label">제목</label>
          <div class="col-sm-3">
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
          <div class="col-sm-10">
            <a class="btn btn-primary" href='${contextRootPath}/app/matchboard'>목록</a> 

              
              <c:if test="${!empty sessionScope.loginUser}">
              <%-- <c:if test="${!sessionScope.loginUser.match.teamMember.teamLeader eq match.match.teamMember.teamLeader}"> --%>
              <a href='${contextRootPath}/app/matchboard' id="btnsub2"
               class="btn btn-primary" role="button" aria-disabled="true">신청하기</a>
            </c:if>
            <%-- </c:if> --%>
            <!-- 로그인 한 사용자와 글을 작성한 팀장과 같다면 버튼을 가림 -->


            <!-- 팀장이 매칭글을 적고 나서 수정, 삭제는 해당팀의 팀장만 가능하게 조건필요 -->
            <%-- <c:if test="${match.team.teamMember.team_leader == true}"> --%>
            <%-- <c:if test="${sessionScope.loginUser.team.teamName eq match.team.teamName}"> --%>
          <a id="delt" class="btn btn-primary" href='delete/${match.no}'>삭제</a>
          <a id="updt" class="btn btn-primary" href='${contextRootPath}/app/matchboard/update/${match.no}'>변경</a> 
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