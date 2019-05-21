<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>회원 목록</title>
  <jsp:include page="../commonCss.jsp"/>
</head>
<body>
  
  <div class="container">
  
    <h1><b>회원정보를</b> 관리하는 페이지 입니다.</h1>
    
    <p>
      <a href='${contextRootPath}/app/member/form' class="btn btn-primary btn-sm">회원가입</a>
    </p>
    
    <table class="table table-hover">
      <thead class="thead-dark">
        <tr>
          <th scope="col">회원번호</th>
          <th scope="col">관리자여부</th>
          <th scope="col">아이디</th>
          <th scope="col">이름</th>
          <th scope="col">이메일</th>
          <th scope="col">전화번호</th>
          <th scope="col">생성일</th>
          <!-- <th scope="col">최근접속일</th> -->
          
        </tr>
      </thead>
      <c:forEach items="${list}" var="member">
      <tr>
        <th scope="row">${member.no}</th>
        <td>${member.manager}</td>
        <td>${member.id}</td>
        <td><a href='${member.no}' class="alert-link">${member.name}</a></td>
        <td>${member.email}</td>
        <td>${member.tel}</td>
        <td>${member.createdDate}</td>
        <%-- <td>${member.lastDate}</td> --%>
      </tr>
      </c:forEach>
    </table>
  
    <form action='search' class="form-inline my-2 my-lg-0 justify-content-center">
      <input name='search' class="form-control mr-sm-2" type="search" placeholder="검색" aria-label="검색">
      <button class="btn btn-outline-success my-2 my-sm-0">검색</button>
    </form>

  </div> <!-- .container -->
  <jsp:include page="../javascript.jsp"/>
</body>

</html>