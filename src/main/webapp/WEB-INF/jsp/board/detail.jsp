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

  <!--<jsp:include page="../header.jsp" />-->

  <div class="container">
    <h1>자유게시판</h1>
    <c:choose>
      <c:when test="${empty boardNo}">
        <p>해당 게시물이 없습니다</p>
      </c:when>
      <c:otherwise>
        <form action='update' method='post'>
          <div class="form-group row">
            <label for="no" class="col-sm-2 col-form-label">번호</label>
            <div class="col-sm-10">
              <input type="text" class="form-control-plaintext" id="no" name='no'
                value='${boardNo.no}' readonly>
            </div>
          </div>

          <div class="form-group row">
            <label for="title" class="col-sm-2 col-form-label">제목</label>
            <div class="col-sm-8">
              <textarea class="form-control" id="title" name='contents' rows='5'>${boardNo.title}</textarea>
            </div>
          </div>

          <div class="form-group row">
            <label for="contents" class="col-sm-2 col-form-label">내용</label>
            <div class="col-sm-8">
              <textarea class="form-control" id="contents" name='contents' rows='5'>${boardNo.contents}</textarea>
            </div>
          </div>


          <div class="form-group row">
            <label for="createdDate" class="col-sm-2 col-form-label">최근수정일</label>
            <div class="col-sm-10">
              <input type="text" readonly class="form-control-plaintext" id="createdDate"
                value="${boardNo.modifierDate}">
            </div>
          </div>

          <div class="form-group row">
            <label for="viewCount" class="col-sm-2 col-form-label">조회수</label>
            <div class="col-sm-10">
              <input type="text" readonly class="form-control-plaintext" id="viewCount"
                value="${boardNo.viewCount}">
            </div>
          </div>
          
             <div class="form-group row">
            <label for="tagName" class="col-sm-2 col-form-label">태그</label>
            <div class="col-sm-10">
              <c:forEach items="${tags}" var="tag">
                  <p>${tag.tagName}<p>
              </c:forEach>
            </div>
          </div> 

          <label for="tagsearch" class="col-sm-2 col-form-label" id="head"><b>태그검색</b></label>
          <form id="searchbox" action='search' class="form-inline my-2 my-lg-0 justify-content">
            <input id="searchbox" class="form-control mr-sm-2" type="search"
              placeholder="검색어할 태그를 입력해주세요">
            <button class="btn btn-outline-success my-2 my-sm-0">검색</button>
          </form>

          <div class="form-group row">
            <div class="col-sm-10">
              <a class="btn btn-primary" href='.'>목록</a> <a class="btn btn-primary"
                href='delete/${boardNo.no}'>삭제</a>
              <button class="btn btn-primary">변경</button>
            </div>
          </div>

        </form>
      </c:otherwise>
    </c:choose>

  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />
</body>
</html>






