<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>모집게시판</title>
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
</head>

<body>
  <div class="container">

    <div id="main-backgroundImg">
      <img src="${contextRootPath}/images/recurit_board.jpg" class="img-fluid">
    </div>

    <div id="header">
      <nav class="navbar navbar-expand-lg justify-content-center">
        <a href="#"><img src="${contextRootPath}/images/logo.png" class="headerImg"></a>
      </nav>

      <div id="header-cate">
        <div>
          <ul class="nav justify-content-center">
            <div class="header-category"> 
              <li class="nav-item"><a class="nav-link" href="#">메인</a></li>
            </div>
            <div class="header-category">
              <li class="nav-item"><a class="nav-link" href="#">매치</a>
                <ul class="category">
                  <li class="nav-item"><a class="nav-link" href="#">매치보드</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">매치등록</a></li>
                </ul></li>
            </div>
            <div class="header-category">
              <li class="nav-item"><a class="nav-link" href="#">팀</a>
                <ul class="category">
                  <li class="nav-item"><a class="nav-link" href="#">팀생성</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">팀정보</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">모집게시판</a></li>
                </ul></li>
            </div>
            <div class="header-category">
              <li class="nav-item"><a class="nav-link" href="#">커뮤니티</a>
                <ul class="category">
                  <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
                </ul></li>
            </div>
            <div class="header-category">
              <li class="nav-item"><a class="nav-link" href="#">마이페이지</a>
                <ul class="category">
                  <li class="nav-item"><a class="nav-link" href="#">개인정보</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">나의 팀 정보</a></li>
                </ul></li>
            </div>
          </ul>
        </div>
      </div>
      <div id="header-item">
        <a href="#">로그인</a>/<a href="#">회원가입</a>/<a href="#">고객센터</a>
      </div>
    </div>
  </div>

  <jsp:include page="javascript.jsp" />

</body>
<!-- <footer>
        
  </footer> -->

</html>