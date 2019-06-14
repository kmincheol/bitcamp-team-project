<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>모집게시판_detail</title>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- detail css -->
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board/recruit_board_detail.css">
              
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp"/>
  
  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp"/>
  
  <div id="main-wrap" class="container">
    <div id="main-text">
      <h2><img src="${contextRootPath}/images/open-book.png">게시글</h2>
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
              <c:if test="${teamMember.memberNo eq sessionScope.loginUser.no && teamMember.teamLeader == 'true'}">
                <a class="btn btn-dark" onclick="return removeCheck()" href='delete/${teamRecruit.teamNo}'>삭제</a>
                <a class="btn btn-dark" href='${contextRootPath}/app/recruit_board/update/${teamRecruit.teamNo}'>변경</a>
              </c:if>
               
            <c:choose>
              <c:when test="${teamMember.memberNo eq sessionScope.loginUser.no && teamMember.teamLeader == 'true'}">
                <a class="btn btn-primary" >모집마감</a>
              </c:when>     
              <c:when test="${teamMember.teamLeader == 'true'}">
              <a onclick="return joinCheck()" href='${contextRootPath}/app/recruit_board/${teamRecruit.teamNo}/${sessionScope.loginUser.no}' id="join" class="btn btn-primary">가입신청</A>
              </c:when>
            </c:choose>
            </c:forEach>
          </div>
        </div>
      </div>
    </form>
  </div>
  <!-- .container -->
  
  <jsp:include page="../javascript.jsp" />
    
   <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp"/>
  
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp"/>
  
    <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp"/>

  <script>
			function removeCheck() {
				if (confirm("정말 삭제하시겠습니까??") == true) { //확인
					document.remove.submit();
					alert('삭제되었습니다.');
				} else { //취소
					return false;
				}
			}
			
			function joinCheck() {
		        if (confirm("가입신청 하시겠습니까?") == true) { //확인
		          document.remove.submit();
		          alert('가입신청되었습니다.');
		        } else { //취소
		          return false;
		        }
		      }
		</script>


</body>

</html>