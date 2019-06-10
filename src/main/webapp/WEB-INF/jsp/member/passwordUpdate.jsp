<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BATTLE MATCHING :: 상세정보입력</title>
<jsp:include page="../commonCss.jsp" />
<link rel="stylesheet" href="${contextRootPath}/css/member_additionalForm.css">


<style>
h2 {
	text-align: center;
	margin: 15px;
}
</style>

</head>
<body style="background: white">

  <div id="container">
    <div id="content">
      <h2>
        비밀번호를 <b>변경</b>할 수 있습니다.
      </h2>
      <%-- <div class="join_step">
      <img src="${contextRootPath}/images/logo.png" class="joinImg">
    </div> --%>
      <c:choose>
        <c:when test="${empty member}">
          <p>해당하는 회원이 없습니다.</p>
        </c:when>

        <c:otherwise>

          <div class="join_content">
            <form id="passwordUpdate_form" action="../checkPassword" method='POST'>
              <div class="join_form">
                <div class="join_form_input">

                  <input type="hidden" name="no" value="${member.no}">
                  <input type="hidden" name="id" value="${member.id}">

                  <!-- name -->
                  <div class="join_row">
                    <h3 class="join_title">
                      <label for="name">현재 비밀번호</label>
                    </h3>
                    <div class="int_mobile_area">
                      <span class="name ps_box int_pass" id="nameImg"> 
                      <input type="password" id="oldpwdCheck" class="int" maxlength="16">
                      </span>
                    </div>
                    <span class="error_next_box" id="tel" style="display: none" role="alert"></span> 
                  </div>
                  <!-- .join_row-->

                </div>
              </div>
         <div class="btn_area">
          <button class="btn btn_type btn-outline-secondary sunext" id="btnJoin" >확인</button>
        </div><!-- .btn_area --> 
        
            </form>
            <!-- #join_form-->

          </div>
          <!-- .join_content -->
        </c:otherwise>
      </c:choose>
    </div>
    <!-- .content -->
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />
  <script src="${contextRootPath}/node_modules/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
  <script src="${contextRootPath}/node_modules/blueimp-load-image/js/load-image.all.min.js"></script>
  <script src="${contextRootPath}/node_modules/blueimp-canvas-to-blob/js/canvas-to-blob.js"></script>
  <script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
  <script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload.js"></script>
  <script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload-process.js"></script>
  <script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload-image.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

  <script>
"use strict"


  </script>
</body>
</html>