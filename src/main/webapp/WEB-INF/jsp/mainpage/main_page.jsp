<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"
  id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>

<link rel="stylesheet" href="${contextRootPath}/css/mainpage3.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${contextRootPath}/css/mainpage2.css">
<meta name="description"
  content="Responsive sidebar template with sliding effect and dropdown menu based on bootstrap 3">
<title>Sidebar template</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
  integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
  crossorigin="anonymous">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>

<body>
	<div class="page-wrapper chiller-theme">
		<a id="show-sidebar" class="btn btn-lg"> 
		<i class="fas fa-bars"><img src="${contextRootPath}/images/logo.png" class="header-side-logo"></i>
		</a>
		<nav id="sidebar" class="sidebar-wrapper">
			<div class="sidebar-content">
				<div class="sidebar-brand">
					<img src="${contextRootPath}/images/logo.png" class="side-logo">
					<div id="close-sidebar">
						<i class="fas fa-times"></i>
					</div>
				</div>
				<div class="sidebar-header">
					<c:choose>
						<c:when test="${sessionScope.loginUser != null }">
							<div class="user-pic">
								<img class="img-responsive img-rounded"
									src="${sessionScope.loginUser.photo }">
							</div>
							<div class="user-info">
								<span class="user-name">${sessionScope.loginUser.name}</span> <span>
									<c:forEach items="${team}" var="team">
										<span class="user-team">${team.teamName}</span>
									</c:forEach>
								</span>
							</div>
						</c:when>

						<c:otherwise>
							<form action='auth/login' method='post'>
								<div class="form-group"
									style="line-height: 10px; margin-bottom: 10px;">
									<label for="id" style="font-size: 13px; color: white;">아이디</label>
									<input autocomplete=off
										style="background: #3a3f48; border: none; color: white; box-shadow: none;"
										type="text" class="form-control" id="id" name="id"
										aria-describedby="emailHelp" value='${cookie.id.value}'
										placeholder="아이디를 입력하세요.">
								</div>
								<div class="form-group"
									style="line-height: 10px; margin-bottom: 10px;">
									<label for="password" style="font-size: 13px; color: white;">패스워드</label>
									<input
										style="background: #3a3f48; border: none; color: white; box-shadow: none;"
										type="password" class="form-control" id="password"
										name="password" placeholder="암호를 입력하세요.">
								</div>
								<div class="form-group form-check" style="margin-bottom: 0;">
									<input type="checkbox" class="form-check-input" id="saveId"
										name="saveId"> <label
										style="color: white; font-size: 13px;" class="saveId"
										for="exampleCheck1">아이디 저장</label>
									<lable style="color:white; font-size:13px;"> / </lable>
									<a style="color: white; font-size: 13px; text-decoration: none;"
										href="${contextRootPath}/app/member/agreeTerms">회원가입</a>
								</div>
								<button style="display: block; width: 100%;" type="submit"
									class="btn btn-dark">로그인</button>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- sidebar-header  -->
				<div class="sidebar-menu" style="padding: 0px;">
					<ul>
						<li class="sidebar"><a href="${contextRootPath}/app/main">
								<i class="fa fa-home"></i> <span>Home</span>
						</a></li>
					</ul>
				</div>
				<!-- sidebar-search  -->
				<div class="sidebar-menu">
					<ul>
						<li class="header-menu"><span>Category</span></li>
						<li class="sidebar-dropdown"><a href="#"><i
								class="fab fa-maxcdn"></i> <span>매치</span> </a>
							<div class="sidebar-submenu">
								<ul>
									<li><a href="${contextRootPath}/app/matchboard">매치보드 </a></li>
									<li><a href="#">매치등록</a></li>
								</ul>
							</div></li>
						<li class="sidebar-dropdown"><a href="#"><i
								class="fas fa-users"></i> <span>팀</span> </a>
							<div class="sidebar-submenu">
								<ul>
									<li><a href="${contextRootPath}/app/team/form">팀생성 </a></li>
									<li><a href="${contextRootPath}/app/team">팀정보</a></li>
									<li><a href="${contextRootPath}/app/recruit_board">모집게시판</a></li>
								</ul>
							</div></li>
						<li class="sidebar-dropdown"><a href="#"> <i
								class="fas fa-comments"></i> <span>커뮤니티</span>
						</a>
							<div class="sidebar-submenu">
								<ul>
									<li><a href="${contextRootPath}/app/announce">공지사항</a></li>
									<li><a href="${contextRootPath}/app/free">자유게시판</a></li>
									<li><a href="${contextRootPath}/app/question">고객센터</a></li>
								</ul>
							</div></li>
						<li class="sidebar-dropdown"><a href="#"> <i
								class="fas fa-address-card"></i> <span>마이페이지</span>
						</a>
							<div class="sidebar-submenu">
								<ul>
									<li><a
										href="${contextRootPath}/app/member/${sessionScope.loginUser.no}">개인정보</a></li>
									<li><a href="#">나의 팀정보</a></li>
								</ul>
							</div></li>
					</ul>
				</div>
				<!-- sidebar-menu  -->
			</div>
			<!-- sidebar-content  -->
			<div class="sidebar-footer">
				<a href="#"> <i class="fa fa-bell"></i>
				</a> <a href="#"> <i class="fa fa-envelope"></i>
				</a> <a href="#"> <i class="fa fa-cog"></i>
				</a> <a href="${contextRootPath}/app/auth/logout"> <i
					class="fa fa-power-off"></i>
				</a>
			</div>
		</nav> 
		<!-- sidebar-wrapper  -->
		<!-- 본문 영역 -->
		<main class="page-content">
		<div class="container-fluid">
			<header>
				<nav class="header-nav">
					
					<div class="menu">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">About</a></li>
							<li><a href="#">Blog</a></li>
						</ul>
					</div>
				</nav>
			</header>
		</div>
	</div>
	</main>
	<!-- page-content" -->
  </div>


  <!-- page-wrapper -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>

  <script type="text/javascript">
			jQuery(function($) {
				$(".sidebar-dropdown > a").click(function() {
					$(".sidebar-submenu").slideUp(200);
					if ($(this).parent().hasClass("active")) {
						$(".sidebar-dropdown").removeClass("active");
						$(this).parent().removeClass("active");
					} else {
						$(".sidebar-dropdown").removeClass("active");
						$(this).next(".sidebar-submenu").slideDown(200);
						$(this).parent().addClass("active");
					}
				});
				$("#show-sidebar").click(function() {
			          $(".page-wrapper").addClass("toggled");
			        });
				$("#close-sidebar").click(function() {
					$(".page-wrapper").removeClass("toggled");
				});
				
			});

			$(document).ready(function() {
				$(".menu-icon").on("click", function() {
					$("nav ul").toggleClass("showing");
				});
			});

			// Scrolling Effect

			$(window).on("scroll", function() {
				if ($(window).scrollTop()) {
					$('nav').addClass('black');
				}

				else {
					$('nav').removeClass('black');
				}
			})
		</script>

</body>
</html>