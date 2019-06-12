<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
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
              <form action='${contextRootPath}/app/auth/login' method='post'>
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
                </div>
                <button type="submit" class="login-btn">로그인</button>
                <div class="form-group form-check" style="margin-bottom: 0;">
                <a style="color: white; font-size: 10px; text-decoration: none;"
                    href="${contextRootPath}/app/member/findUserId">아이디찾기</a>
                 <lable style="color:white; font-size:10px;"> / </lable>
                <a style="color: white; font-size: 10px; text-decoration: none;"
                    href="${contextRootPath}/app/member/findPassword">비밀번호찾기</a>
                  <lable style="color:white; font-size:10px;"> / </lable>
                  <a style="color: white; font-size: 10px; text-decoration: none;"
                    href="${contextRootPath}/app/member/agreeTerms">회원가입</a>
                </div>
              <div class="snsLoginBtnBox" style="text-align: center;">         
                <span id="facebookBtn" class="snsLoginBtn"> 
                <img src="${contextRootPath}/images/facebook.png" class="snsBtn facebookBtn" style="width: 35px; border-radius: 5px; margin:5px; cursor: pointer;">
                </span> 
                <span id="naverBtn" class="snsLoginBtn"> 
                <img src="${contextRootPath}/images/naverLogin.png" class="snsBtn" style="width: 35px; border-radius: 5px; margin:5px; cursor: pointer;">
                </span> 
                <span id="kakaoBtn" class="snsLoginBtn"> 
                <img src="${contextRootPath}/images/kakaoIcon.png" class="snsBtn" style="width: 35px; border-radius: 5px; margin:5px; cursor: pointer;">
                </span>
                 <span id="googleBtn" class="snsLoginBtn"> 
                 <img src="${contextRootPath}/images/g-normal.png" class="snsBtn" style="width: 35px; border-radius: 5px; margin:5px; cursor: pointer;">
                </span>
              </div>
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
                  <li><a href="${contextRootPath}/app/matchboard/">매치보드 </a></li>
                  <li><a href="${contextRootPath}/app/matchboard/form.jsp">매치등록</a></li>
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
                  <li><a href="${contextRootPath}/app/myteam">나의 팀정보</a></li>
                </ul>
              </div></li>
          </ul>
        </div>
        <!-- sidebar-menu  -->
      </div>
      <!-- sidebar-content  -->
      <div class="sidebar-footer">
        <a href="#"> <i class="fa fa-bell"></i>
        </a> 
        <a href="#"> <i class="fa fa-envelope"></i>
        </a> 
        <a href="#"> <i class="fa fa-cog"></i>
        </a>
			<c:if test="${sessionScope.loginUser != null}">
				<a href="${contextRootPath}/app/auth/logout"> <i
					class="fa fa-power-off"></i>
				</a>
			</c:if>
		</div>
    </nav> 
    <!-- sidebar-wrapper  -->
    <!-- 본문 영역 -->
    <main class="page-content">