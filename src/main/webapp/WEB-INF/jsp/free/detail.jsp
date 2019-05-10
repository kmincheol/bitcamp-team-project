<%@page import="com.eomcs.lms.domain.FreeFile"%>
<%@page import="com.eomcs.lms.domain.Free"%>
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
            <label for="title" class="col-sm-2 col-form-label">제목</label>
            <div class="col-sm-8">
              <textarea class="form-control" id="title" name='contents' rows='1' readonly>${free.title}</textarea>
            </div>
          </div>

          <div class="form-group row">
            <label for="contents" class="col-sm-2 col-form-label">내용</label>
            <div class="col-sm-8">
              <textarea class="form-control" id="contents" name='contents' rows='5' readonly>${free.contents}</textarea>
            </div>
          </div>

          <div class="form-group row">
            <label for="free-list" class="col-sm-2 col-form-label">사진</label>
            <div class="col-sm-10" id="free-list">
              <c:forEach items="${files}" var="file">
                <img class="bit-photo" src='${contextRootPath}/upload/free/3def77c1-0430-47f7-9ae9-69cf4634bba8'
                  class="img-thumbnail" />
            
              </c:forEach>
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
              <a class="btn btn-primary" href='.'>목록</a> <a class="btn btn-primary"
                href='delete/${free.no}'>삭제</a> <a
                href='${contextRootPath}/app/free/update/${free.no}' class="btn btn-primary btn-sm">변경</a>
            </div>
          </div>

        </form>
      </c:otherwise>
    </c:choose>

  </div>

  <jsp:include page="../javascript.jsp" />
</body>
</html>






