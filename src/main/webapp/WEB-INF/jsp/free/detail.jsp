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
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/free.css">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_list.css">
</head>
<body>

  <div class="container">

    <div id="main-backgroundImg">
      <img src="${contextRootPath}/images/match-header.jpg" class="img-fluid">

      <div id="header-item">
        <a href="#">로그인/</a> <a href="#">회원가입/</a> <a href="#">고객센터</a>
      </div>
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
    </div>

    <div id="main-text">
      <h2>자유게시판</h2>
    </div>
    <br>
    <div id="recruit-list-out">
    <c:choose>
      <c:when test="${empty free}">
        <p>해당 게시물을 찾을 수 없습니다.</p>
      </c:when>

      <c:otherwise>
        <form action='update' method='post'>
          <div class="free-header">
            <label for="no">게시물 번호</label> <label>${free.no}</label>
            <hr>
            <div class="title">
              <div id="title" style="font-size: 40px; ">${free.title}</div>
            </div>

            <div style="margin-left: 600px">
              <span style="font-size: 12px">작성자 <b>${free.member.name}</b> </span> 
              <span style="font-size: 12px">조회수 <b>${free.viewCount}</b> </span><br>
              <span style="font-size: 12px">최근수정일 <b>${free.modifierDate}</b> </span>
            </div>
            
            <br>
            <hr>
          </div>

            <div style="text-align: center;">
              <div>${free.contents}</div>
            </div>

  <div id="disqus_thread"></div>
<script>

/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
/*
var disqus_config = function () {
this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};
*/
(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = 'https://bit-2.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                            
        <br><hr>
          <div class="form-group row" style="text-align: center">
            <div style="position:absolute; left:0; right:0;">
              <a class="input-group-btn btn btn-dark" href='.'>목록</a>
              <c:if test="${sessionScope.loginUser.name eq free.member.name}">
                <a class="input-group-btn btn btn-dark" href='delete/${free.no}'>삭제</a>
                <a class="input-group-btn btn btn-dark" href='${contextRootPath}/app/free/update/${free.no}'>변경</a>
              </c:if>
            </div>
          </div>

        </form>
      </c:otherwise>
    </c:choose>

  </div>
</div>
  <jsp:include page="../javascript.jsp" />
</body>
</html>






