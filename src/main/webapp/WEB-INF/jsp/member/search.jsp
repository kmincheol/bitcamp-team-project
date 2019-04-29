<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 검색</title>
<link rel="stylesheet"
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
  crossorigin="anonymous">
<link rel="stylesheet" href="${contextRootPath}/css/common.css">
</head>
<body>
  <jsp:include page="../header.jsp" />
  <div class="container">
    <h1>회원 검색</h1>
    <div class="bit-list">
      <table class="table table-hover">
        <thead>
          <tr>
            <th>번호</th>
            <th>이름</th>
            <th>이메일</th>
            <th>전화</th>
            <th>가입일</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${list}" var="member">
            <tr>
              <th scope="row">${member.no}</th>
              <td><a href='detail?no=${member.no}'>${member.name}</a></td>
              <td>${member.email}</td>
              <td>${member.tel}</td>
              <td>${member.registeredDate}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <div class="form-group row">
      <div class="col-sm-6">
        <a class="btn btn-primary" href='.'>목록</a>
      </div>
    </div>
  </div>
</body>
</html>
