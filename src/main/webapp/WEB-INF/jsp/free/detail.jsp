<%-- <%@page import="com.eomcs.lms.domain.Free"%> --%>
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
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">

<!-- detail css -->
<link rel="stylesheet" href="${contextRootPath}/css/free/free_detail.css">

<!-- comment css -->
<link rel="stylesheet" href="${contextRootPath}/css/comment.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> 
<link href="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.css">  
</head>

<body>
  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />

  <div id="main-text" style="margin-bottom: 40px;">
    <img src="${contextRootPath}/images/freeboard.png" style="width: 100%; height: 100%;">
    <h1>자유 게시판</h1>
  </div>   

  <div id="main-wrap" class="container" style="box-shadow: 0px 0px 10px 0px darkgrey; padding: 15px; margin-bottom: 40px;">
    <div class="freeList">
      <c:choose>
        <c:when test="${empty free}">
          <p>해당 게시물을 찾을 수 없습니다.</p>
        </c:when>

        <c:otherwise>
          <form action='update' method='post'>
            <label for="no" style="display: none;">게시물 번호</label> <label style="display: none;">${free.no}</label>

            <div id="title-wrap" class="form-group row">
              <div id="title-row" class="col-sm-12">
                <div id="title">${free.title}</div>
              </div>
              <div class="col-sm-12">
                <span>${free.member.name}</span> <span>|</span> <span>${free.modifierDate}</span>
                <span>|</span> <span>${free.viewCount}</span>
              </div>
            </div>

            <div id="contents-section">
              <div class="contents-section-head">
                <div>내용</div>
              </div>
              <div class="contents-section-body" style="word-break: break-word;">
                <div class="contents">${free.contents}</div>
              </div>
            </div>

            <div id="control-box" class="form-group row">
              <div class="col-sm-12 text-center">
                <div class="btns2" style="margin-bottom: 50px;">
                  <a class="btn btn-outline-dark" href='.'>목록</a>
                  <c:if test="${sessionScope.loginUser.name eq free.member.name}">
                    <a class="btn btn-outline-dark" href='delete/${free.no}'>삭제</a>
                    <a class="btn btn-outline-dark"
                      href='${contextRootPath}/app/free/update/${free.no}'>변경</a>
                  </c:if>
                </div>
              </div>
            </div>

          </form>
        </c:otherwise>
      </c:choose>
    </div>


    <c:if test="${sessionScope.loginUser != null}">
      <form action='../comment/add' method="post" id="form-update">
        <div id="comment">
          <div class="form-group">
            <div class="col-sm-12" style="padding:0px; margin-bottom: 30px;">
              <textarea class="form-control comment-form"
                placeholder="댓글을 작성하세요." autocomplete=off rows="2" style="width: 960px; float:left; margin-bottom: 5px;"></textarea>
              <button class="btn btn-outline-dark sunext" type="button" id="cmt-submit" style="position: absolute; right: 0; width: 75px; height: 62px;">작성</button>
              <div id="counter">0/150</div>         
            </div>        
          </div>   
        </div>
      </form>   
      <br>     
      <%-- <jsp:include page="../comment/form.jsp" />  --%>
    </c:if>
    <jsp:include page="../comment/list.jsp" />

  </div>
  <jsp:include page="../javascript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />    

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

</body>

<script>
  $(document).ready(function() {

    $('.comment-form').on('keydown', function() {
      if ($(this).val().length > 150) {
        $(this).val($(this).val().substring(0, 150));
      }

      var content = $(this).val();
      $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
      $('#counter').html(content.length + '/150');
    });
    $('.comment-form').keyup();
 
    
    $('#cmt-submit').on('click', function() {
      var conts = $('.comment-form').val();  
      if (conts == '') {
        Swal.fire({
          type: 'error',
          title: '댓글을 입력하세요!',
          showConfirmButton: false,
          timer: 1500
        })
      } else {
      $.post('../comment/add',  
          {  
        contents: conts  
          },
        function(obj) {
          if (obj.status == 'success') {  
            
         document.location.reload(true);
          }
    }) };
  });
  });
</script>
</html>