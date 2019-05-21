<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>메인페이지</title>
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<jsp:include page="../header.jsp" />
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
<link rel="stylesheet" href="${contextRootPath}/css/mainpage.css">
</head>

<body>

  <div class="container-fluid">

    <div id="main-backgroundImg">
      <img src="${contextRootPath}/images/mainpage.jpg" class="img-fluid">
    </div>
    
    <div id="main-text">
      <h1>S P O R T S - M A T C H I N G</h1>
    </div>

    <div class="search-form">
      <div class="cell option">
        <img src="${contextRootPath}/images/list.png" class="list-img"> 
        <select name="item"
          id="sport-select">
          <option selected>종목</option>
          <option value="1">축구</option>
          <option value="2">농구</option>
          <option value="3">탁구</option>
        </select>
      </div>
      <div class="cell option">
        <select name="item" id="location">
          <option value="1">지역</option>
        </select>
      </div>
      <div class="cell option">
        <select name="item" id="date">
          <option value="1">날짜</option>
        </select>
      </div>
      <div class="cell option">
        <select name="item" id="search">
          <option value="1">검색</option>
        </select>
      </div>
    </div>

    <div id="service">
      <img src="${contextRootPath}/images/main-how.png" class="how-img">
    </div>

    <footer>
      <div id="footer"></div>
    </footer>

  </div>
  <!-- .container -->


  <jsp:include page="../javascript.jsp" />
</body>

</html>