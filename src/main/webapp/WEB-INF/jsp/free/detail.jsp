<%@page import="com.eomcs.lms.domain.FreeFile"%>
<%@page import="com.eomcs.lms.domain.Free"%>
<%@page import="com.eomcs.lms.domain.Member"%>
<%@page import="com.eomcs.lms.domain.Comment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>자유게시판</title>
<jsp:include page="../commonCss.jsp" />
<jsp:include page="../javascript.jsp" />
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
                <div id="title" style="font-size: 40px;">${free.title}</div>
              </div>

              <div style="margin-left: 600px">
                <span style="font-size: 12px">작성자 <b>${free.member.name}</b>
                </span> <span style="font-size: 12px">조회수 <b>${free.viewCount}</b>
                </span><br> <span style="font-size: 12px">최근수정일 <b>${free.modifierDate}</b>
                </span>
              </div>

              <br>
              <hr>
            </div>

            <div style="text-align: center;">
              <div>${free.contents}</div>
            </div>

            <hr><br>
            <div class="form-group row" style="text-align: center">
              <div style="position: absolute; left: 0; right: 0;">
                <a class="input-group-btn btn btn-dark" href='.'>목록</a>
                <c:if test="${sessionScope.loginUser.name eq free.member.name}">
                  <a class="input-group-btn btn btn-dark" href='delete/${free.no}'>삭제</a>
                  <a class="input-group-btn btn btn-dark"
                    href='${contextRootPath}/app/free/update/${free.no}'>변경</a>
                </c:if>
              </div>
            </div>

          </form>
          <br>
          <br>
          <hr>
          <br>
           <c:if test="${sessionScope.loginUser != null}">
          <jsp:include page="../comment/form.jsp" />
          </c:if>
        </c:otherwise>
      </c:choose>
  
  <form action="../comment/update">
      <div class="comment-list" style="text-align: left;">
    <table class="table table-hover" >
      <tbody style="left: 0px; position: absolute;">
        <c:forEach items="${list}" var="comment"> 
          <span style="font-size: 15px; margin-right: 10px;"><b>${comment.member.name}</b></span> 
          <span style="font-size: 12px;">${comment.modifierDate}</span><br> <br>
          <input type="text" id="cmtcontents" value="${comment.contents}" style="font-size: 20px; border:none;" readonly="readonly"><br><br>
           
          <c:if test="${sessionScope.loginUser.name eq comment.member.name}">
            <a class="input-group-btn btn btn-dark" href='${contextRootPath}/app/comment/delete/${comment.no}'>삭제</a>
            <button id="update-btn" type="button" class="input-group-btn btn btn-dark" onclick="mybtn()">변경</button>
            <div id="save-cancel" style="display: none; left:270px; bottom:110px; position:absolute;">
              <a id="save-btn" type="hidden" class="input-group-btn btn btn-dark" href='${contextRootPath}/app/comment/update/${comment.no}'>저장</a>
              <a id="cancel-btn" type="hidden" class="input-group-btn btn btn-dark" onclick="canbtn()" style="color:white;">취소</a>
             </div> 
          </c:if> 
          <hr>
           </c:forEach> 
      </tbody>
    </table>
  </div>
  </form>
  
    </div>
  </div>

<script type="text/javascript">
 function mybtn() {
   document.getElementById('cmtcontents').readOnly = false;
   
 };
</script>

<script type="text/javascript">
$(document).ready(function(){ 
  $('#update-btn').click(function(){
      var state = $('#save-cancel').css('display'); 
      if(state == 'none'){
          $('#save-cancel').show(); 
          $('#update-btn').hide();
      }
      
      var state = $('#cmtcontents').css('style'); 
      if(state != 'none'){
        document.getElementById('cmtcontents').setAttribute("style", "font-size: 20px; border:2px solid black;");  
      }
  });
});
</script>

<script type="text/javascript">
$(document).ready(function(){ 
  $('#cancel-btn').click(function(){
      var state = $('#update-btn').css('display'); 
      if(state == 'none') {
        $('#update-btn').show();
         
      } 
      
      var state = $('#save-cancel').css('display'); 
      if(state == 'none') {
        $('#save-cancel').hide();
      } else {
        $('#save-cancel').hide();
      }
      
      var state = $('#cmtcontents').css('style'); 
      if(state != 'none'){
        document.getElementById('cmtcontents').setAttribute("style", "font-size: 20px; border:none;");
      }
  });
});
</script>

<script type="text/javascript">
 function canbtn() {
   document.getElementById('cmtcontents').readOnly = true;
 };
</script>
  
  
</body>
</html>






