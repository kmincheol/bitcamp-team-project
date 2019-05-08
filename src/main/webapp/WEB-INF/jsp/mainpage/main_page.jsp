<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <title>메인페이지</title>
    <!--  <jsp:include page="../commonCss.jsp"/> -->
    <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextRootPath}/css/mainpage.css">
</head>

<body>

    <div class="container">
        <div id="main-backgroundImg">
            <img src="${contextRootPath}/images/mainpage.jpg" class="img-fluid">
        </div>

        <div id="header">
            <nav class="navbar navbar-expand-lg justify-content-center">
                <a href="#"><img src="${contextRootPath}/images/logo.png" class="headerImg"></a>
                <div id="header-aa">
                    <a href="#" class="header-a">로그인/</a>
                    <a href="#" class="header-a">회원가입/</a>
                    <a href="#" class="header-a">고객센터</a>
                </div>
            </nav>
            <div>
                <ul class="nav justify-content-center">
                    <li class="nav-item">
                        <a class="nav-link" href="#">메인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">매치</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#">팀</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">커뮤니티</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
                </ul>
            </div>
        </div>

        <div id="main-text">
            <h1>S P O R T S - M A T C H I N G</h1>
        </div>

        <div class="search-form">
            <div class="cell option">
                <img src="${contextRootPath}/images/list.png" class="list-img">
                <select name="item" id="sport-select">
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
            <div id="footer">

            </div>
        </footer>

    </div>
    <!-- .container -->


    <jsp:include page="../javascript.jsp" />
</body>

</html>