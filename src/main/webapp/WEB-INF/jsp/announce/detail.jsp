<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<html>
<head>
<title>공지사항게시판</title>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/announce_detail.css">
</head>
<body>
  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />


  <div class="container" id="main-wrap">
    <div id="main-text">
      <h2>
        <img src="${contextRootPath}/images/speaker.png" style="width: 30px; height: 30px;">공지사항
      </h2>
    </div>
    <c:choose>
      <c:when test="${empty announce}">
        <p>해당 게시물을 찾을 수 없습니다.</p>
      </c:when>
      <c:otherwise>
        <form>
        <div id="title-wrap" class="form-group row">
          <div id="title-row" class="col-sm-12">
            <div id="title" name="teamTitle">${announce.title}</div>
          </div>
          <div id="teamName-row" class="col-sm-12">
          <div id="no" style="display: none">${announce.no}</div>
            <span id="teamName" name="teamName">${announce.member.name}</span> 
            <span>|</span>
            <span id="createdDate" name="createdDate">${announce.modifierDate}</span> 
            <span>|</span>
            <span id="viewCount" name="teamViewCount">${announce.viewCount}</span>
          </div>
        </div>
        
            <!-- 내용 전 -->
            <div id="contents-section">
              <div class="contents-section-head">
                <div>내용</div>
              </div>
              <div class="contents-section-body">
                <div class="contents">${announce.contents}</div>
              </div>
            </div>
            <div id="control-box" class="form-group row">
              <div class="col-sm-12 text-center">
                <a class="btn btn-outline-dark" href='.' style="width:80px;">목록</a>
                <c:if test="${!empty sessionScope.loginUser}">
                  <c:if test="${sessionScope.loginUser.manager}">
                    <a class="btn btn-outline-dark" href='delete/${announce.no}' style="width:80px;">삭제</a>
                    <a href='${contextRootPath}/app/announce/update/${announce.no}'
                      class="btn btn-outline-dark" style="width:80px;">변경</a>     
                  </c:if>
                </c:if>
              </div>
          </div>
        </form>
      </c:otherwise>
    </c:choose>
  </div>


  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

</body>
</html>






