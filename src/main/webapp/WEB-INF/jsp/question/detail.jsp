<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<link rel="stylesheet" href="${contextRootPath}/css/question_detail.css">

<!-- summernote -->
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
</head>

<body>
<jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />
  
 <div id="main-wrap" class="container">

   <div id="main-text">
      <h2><img src="${contextRootPath}/images/open-book.png">게시글</h2>
    </div>

      <form action='update' method='post' name="remove" enctype='multipart/form-data'>
        <div id="title-wrap" class="form-group">
          <div id="title-row" class="col-sm-12">
            <div id="title" name="title">${question.title}</div>
          </div>
          <div id="teamName-row" class="col-sm-12">   
            <span id="teamName" name="member">${question.member.id}</span> 
            <span>|</span>
            <span id="createdDate" name="createdDate">${question.createdDate}</span> 
          </div>
        </div>
        
      <div id="contents-wrap">
        <div id="info-wrap">    
          <table class="info-table">
            <tr>
          </table>
        </div>

        <div id="contents-section">
          <div class="contents-section-head">
            <div>내용</div>
          </div>
          <div class="contents-section-body">
            <div class="contents">${question.contents}</div>
          </div>
        </div>
    
      </div>
    </form>
  

   <jsp:include page="alist.jsp"></jsp:include>
    <div style="width: 100%; text-align: center; margin-top: 30px; margin-bottom: 30px;">
      <div style="display: inline-block;">
        <a class="btn  btn-outline-dark" href='.' style="width:80px">목록</a> 
        <c:if test="${sessionScope.loginUser.no == 1  || sessionScope.loginUser.no == question.memberNo}">
        <a class="btn  btn-outline-dark" href='delete/${question.questionNo}' style="width:80px">삭제</a> 
        <c:if test="${fn:length(answer.contents) == 0}">
        <a class="btn  btn-outline-dark" href='${contextRootPath}/app/question/update/${question.questionNo}' style="width:80px">변경</a>
        </c:if>     
        </c:if>
      </div>       
       <c:if test="${sessionScope.loginUser.no == 1 }">
       <c:choose>
          <c:when test="${fn:length(answer.contents) == 0}"> <button id="answer_Btn" class="btn  btn-outline-dark" onclick="button1_click();">답변하기</button> </c:when>
          <c:otherwise> <button  class="btn  btn-outline-dark" id="answerModify_Btn" onclick="button2_click();">답변수정</button></c:otherwise>
        </c:choose>
      </c:if>
    </div>     

<!-- 답변달기 --> 
   <div id="answer_form" style="display: none;" >
    <h1>답변하기</h1>
    <form id='add_form' action='add2' method='post' onsubmit="return add_check()">
    <div class="form-group">
      <div class="col-sm-10" style="display: none;">   
        <input type="text" class="form-control" name="questionNo" id="questionNo" value="${question.questionNo}" />
      </div>
      <label for="title" class="col-sm-2 col-form-label">내용</label>
      <div class="col-sm-10">
      <textarea class="form-control col-sm-13 anwerContents summernote" rows="5" name="contents">${answer.contents}</textarea>
      </div>
    </div>
    <div class="form-group">
        <div class="col-sm-10">
          <button id="add_Answer_Btn" class="btn  btn-outline-dark" >등록</button>
          <a class="btn  btn-outline-dark" href='${contextRootPath}/app/question'>목록</a>
        </div>
      </div>
    </form>
  </div> 
  
  <!--  답변수정 -->
   <div id="modify_form"  style="display: none;">
    <div style="font-size: 20px; margin-bottom: 10px;">※ 답변 수정 내용</div>
    <form id='answer_modify_form' onsubmit="return add_Modify_check()" action='update2' method='post'>

    <div class="form-group row">    
      <div class="col-sm-10" style="display: none;">
        <input type="text" class="form-control" name="answerNo" id="answerNo" value="${answer.answerNo}" />
      </div>
      <div class="col-sm-12">
      <textarea class="form-control col-sm-12 modify_contents summernote" rows="5" name="contents">${answer.contents}</textarea>
      </div>
    </div>   
     
      <div class="form-group">
        <div class="col-sm-10">
          <button id="modify_button" class="btn btn-dark" onclick="button3_click();">수정</button>
          <a class="btn btn-dark" href='delete2/${answer.answerNo}'>삭제</a> 
        </div>
      </div>
      
    </form>
  </div>   
 </div>
 <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />
 
   <script src="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.js"></script>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" /> 
<script>                                      
$(document).ready(function() {
    $('.summernote').summernote({
    	width:1080,
      height: 300,
      maxWidth:1000,
      minWidth: 900,
      minHeight: null,
      maxHeight: null,
      focus: true
    });
       
    $('#add').click((e) =>{
      submitAgree();
      return false;
    })
  });    
 

function button1_click(){
$("#answer_form").css("display","block");
}

function button2_click(){
	$("#modify_form").css("display","block");
	}

function add_check(){
  	var theForm = $('.anwerContents').val();
	 if(theForm == ""){
		 alert("내용을 입력해주세요.") ;
		  return false;
	 }
}

function add_Modify_check(){
    var theForm = $('.modify_contents').val();
   if(theForm == ""){
     alert("내용을 입력해주세요.") ;
      return false;
   }
}

</script>

</body>

</html>