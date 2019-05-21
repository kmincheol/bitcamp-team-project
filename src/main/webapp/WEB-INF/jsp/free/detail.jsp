<%@page import="com.eomcs.lms.domain.Free"%>
<%@page import="com.eomcs.lms.domain.Member"%>
<%@page import="com.eomcs.lms.domain.Comment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>자유게시판</title>
<jsp:include page="../javascript.jsp" />
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<jsp:include page="../header.jsp" />
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
<link rel="stylesheet" href="${contextRootPath}/css/free.css">
</head>
<body>

  <div class="container">

    <div id="main-text">
    <br><br>
      <h2>자유게시판</h2>
    </div>
    <br>
    <div id="recruit-list-out">
      <c:choose>
        <c:when test="${empty free}">
          <p>해당 게시물을 찾을 수 없습니다.</p>
        </c:when>

        <c:otherwise>
          <form action='update' method='post'>
            <div class="free-header">
              <label for="no">게시물 번호</label> <label>${free.no}</label>
              <hr>
              <div class="title">
                <div id="title">${free.title}</div>
              </div>

              <div class="freeInfo">
                <span>작성자 <b>${free.member.name}</b>
                </span> <span>조회수 <b>${free.viewCount}</b>
                </span><br> <span>최근수정일 <b>${free.modifierDate}</b>
                </span>
              </div>

              <br>
              <hr>
            </div>

            <div>
              ${free.contents} 
            </div>

            <hr><br>
            <div class="btns form-group row">
              <div class="btns2">
                <a class="input-group-btn btn btn-dark" href='.'>목록</a>
                <c:if test="${sessionScope.loginUser.name eq free.member.name}">
                  <a class="input-group-btn btn btn-dark" href='delete/${free.no}'>삭제</a>
                  <a class="input-group-btn btn btn-dark"
                    href='${contextRootPath}/app/free/update/${free.no}'>변경</a>
                </c:if>
              </div>
            </div>

          </form>
          <br>
          <br>
          <hr>
          <br>
           <c:if test="${sessionScope.loginUser != null}">
          <jsp:include page="../comment/form.jsp" />
          </c:if>
          <jsp:include page="../comment/list.jsp" />
        </c:otherwise>
      </c:choose>
  </div>
  </div>
</body>
</html>






