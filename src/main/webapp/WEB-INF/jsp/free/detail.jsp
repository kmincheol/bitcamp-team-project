<%@page import="com.eomcs.lms.domain.FreeFile"%>
<%@page import="com.eomcs.lms.domain.Free"%>
<%@page import="com.eomcs.lms.domain.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>자유게시판</title>
<jsp:include page="../commonCss.jsp" />
</head>
<body>

  <div class="container">


    <h1>자유게시판</h1>
    <hr>
    <br>
    <c:choose>
      <c:when test="${empty free}">
        <p>해당 사진을 찾을 수 없습니다.</p>
      </c:when>

      <c:otherwise>
        <form action='update' method='post'>
          <div class="form-group row">
            <label for="no" class="col-sm-2 col-form-label">번호</label>
            <div class="col-sm-10">
              <input type="text" class="form-control-plaintext" id="no" name='no' value='${free.no}'
                readonly>
            </div>
          </div>

          <div class="form-group row">
            <label for="name" class="col-sm-2 col-form-label">작성자</label>
            <div class="col-sm-10">
               <input type="text" class="form-control-plaintext" id="name" name='name' value="${free.member.name}" readonly>
            </div>
          </div>

          <div class="form-group row">
            <label for="title" class="col-sm-2 col-form-label">제목</label>
            <div class="col-sm-8">
              <textarea class="form-control" id="title" name='contents' rows='1' readonly>${free.title}</textarea>
            </div>
          </div>

          <div class="form-group row" contentEditable="true">
            <label for="contents" class="col-sm-2 col-form-label">내용</label>
            <div class="col-sm-8">
              <div>${free.contents}</div>
              <%--  <c:forEach items="${free.files}" var="file">
                <img src='${contextRootPath}/upload/free/${file.filePath}' style='width:500px'>
              </c:forEach> --%>
            </div>
          </div>


          <div class="form-group row">
            <label for="createdDate" class="col-sm-2 col-form-label">최근수정일</label>
            <div class="col-sm-10">
              <input type="text" readonly class="form-control-plaintext" id="createdDate"
                value="${free.modifierDate}">
            </div>
          </div>

          <div class="form-group row">
            <label for="viewCount" class="col-sm-2 col-form-label">조회수</label>
            <div class="col-sm-10">
              <input type="text" readonly class="form-control-plaintext" id="viewCount"
                value="${free.viewCount}">
            </div>
          </div>


          <div class="form-group row">
            <div class="col-sm-10">
              <a class="btn btn-primary" href='.'>목록</a>
              <c:if test="${sessionScope.loginUser.name eq free.member.name}">
                <a class="btn btn-primary" href='delete/${free.no}'>삭제</a>
                <a class="btn btn-primary" href='${contextRootPath}/app/free/update/${free.no}'
                  class="btn btn-primary btn-sm">변경</a>
              </c:if>
            </div>
          </div>

        </form>
      </c:otherwise>
    </c:choose>

  </div>

  <jsp:include page="../javascript.jsp" />
</body>
</html>






