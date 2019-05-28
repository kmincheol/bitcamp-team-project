<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>모집게시판_detail</title>
<!-- include header.jsp -->
<jsp:include page="../header.jsp" />
<!-- header.css -->
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_detail.css">
</head>

<body>

  <div class="container">

    <div id="main-text">
      <h2>게시글</h2>
    </div>

      <form action='update' method='post' name="remove" enctype='multipart/form-data'>
        <div id="title-wrap" class="form-group row">
          <div id="title-row" class="col-sm-12">
            <div id="title" name="teamTitle">${teamRecruit.teamTitle}</div>
          </div>
          <div id="teamName-row" class="col-sm-12">
            <span id="teamName" name="teamName">${teamRecruit.team.teamName}</span> 
            <span>|</span>
            <span id="createdDate" name="createdDate">${teamRecruit.teamCreatedDate}</span> 
            <span>|</span>
            <span id="viewCount" name="teamViewCount">${teamRecruit.teamViewCount}</span>
          </div>
        </div>
      <div id="contents-wrap">
        <div id="info-wrap">
          <table class="info-table">
            <tr>
              <th>

                <div>종목</div>
             
              </th>
              <td>
                <div id="sportsType" name="teamSportsType">${teamRecruit.teamTypeSports.teamSportsType}</div>
              </td>
              <th>
                <div>지역</div>
              </th>
              <td>
                <div id="location" name="teamArea">${teamRecruit.team.teamArea}</div>
              </td>
            </tr>
          </table>
        </div>

        <div id="contents-section">
          <div class="contents-section-head">
            <div>내용</div>
          </div>
          <div class="contents-section-body">
            <div class="contents">${teamRecruit.teamContents}</div>
          </div>
        </div>

        <div id="control-box" class="form-group row">
          <div class="col-sm-12 text-center">
            <a class="btn btn-dark" href='${contextRootPath}/app/recruit_board'>목록</a> 
          <c:forEach var="teamMember" items="${teamMember}">
            <c:if test = "${teamMember.memberNo eq sessionScope.loginUser.no && teamMember.teamLeader == 'true'}">
            <a class="btn btn-primary" onclick="return removeCheck()" href='delete/${teamRecruit.teamNo}'>삭제</a>
            <a class="btn btn-primary" href='${contextRootPath}/app/recruit_board/update/${teamRecruit.teamNo}'>변경</a>
              </c:if>
</c:forEach>
            <a class="btn btn-primary" href=''>가입신청</a>
          </div>
        </div>
      </div>
    </form>
  </div>
  <!-- .container -->
 <jsp:include page="../footer.jsp" />
  <jsp:include page="../javascript.jsp" />
  <script>
			function removeCheck() {
				if (confirm("정말 삭제하시겠습니까??") == true) { //확인
					document.remove.submit();
				alert('삭제되었습니다.');
				} else { //취소
					return false;
				}
			}
		</script>
</body>

</html>