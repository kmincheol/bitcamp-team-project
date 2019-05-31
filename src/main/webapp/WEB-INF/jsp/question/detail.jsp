<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="../commonCss.jsp" />
<jsp:include page="../header.jsp" />
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/question_detail.css">
</head>

<body>
 <div class="container">

    <div id="main-text">
      <h2>게시글</h2>
    </div>

      <form action='update' method='post' name="remove" enctype='multipart/form-data'>
        <div id="title-wrap" class="form-group row">
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
  </div>


    <div id ="aa" class="form-group row">
      <div class="col-sm-10">
        <a class="btn  btn-outline-dark" href='.'>목록</a> 

        <c:if test="${sessionScope.loginUser.no == 1  || sessionScope.loginUser.no == question.memberNo}">

        <a class="btn  btn-outline-dark" href='delete/${question.questionNo}'>삭제</a> 
        <a class="btn  btn-outline-dark" href='${contextRootPath}/app/question/update/${question.questionNo}'>변경</a>
        </c:if>
      </div>
       <c:if test="${sessionScope.loginUser.no == 1 }">
       <c:choose>
          <c:when test="${fn:length(answer.contents) == 0}"> <button id="answer_Btn" class="btn  btn-outline-dark" onclick="button1_click();">답변하기</button> </c:when>
          <c:otherwise> <button  class="btn  btn-outline-dark" id="answerModify_Btn" onclick="button2_click();">답변수정</button></c:otherwise>
        </c:choose>
      </c:if>
        
    </div> 
   <jsp:include page="alist.jsp"></jsp:include>

<!-- 답변달기 --> 
   <div id="answer_form"    style="display: none;" >
    <h1>답변하기</h1>
    <form id='add_form' action='add2' method='post' onsubmit="return add_check()">
    <div class="form-group row">
      <div class="col-sm-10" style="display: none;">
        <input type="text" class="form-control" name="questionNo" id="questionNo" value="${question.questionNo}" />
      </div>
      <label for="title" class="col-sm-2 col-form-label">내용</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="contents" id="anwerContents" value="${answer.contents}" />
      </div>
    </div>
      <div class="form-group row">
        <div class="col-sm-10">
          <button id="add_Answer_Btn" class="btn  btn-outline-dark" >등록</button>
          <a class="btn  btn-outline-dark" href='${contextRootPath}/app/question'>목록</a>
        </div>
      </div>
    </form>
  </div> 
  
  <!--  답변수정 -->
   <div id="modify_form"  style="display: none;">
    <h4>답변수정하기</h4>
    <form id='answer_modify_form' onsubmit="return add_Modify_check()" action='update2' method='post'>

    <div class="form-group row">
      <div class="col-sm-10" style="display: none;">
        <input type="text" class="form-control" name="answerNo" id="answerNo" value="${answer.answerNo}" />
      </div>
      <label for="title" class="col-sm-2 col-form-label">내용</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="contents" id="modify_contents" value="${answer.contents}" />
      </div>
    </div>
     
      <div class="form-group row">
        <div class="col-sm-10">
          <button id="modify_button" class="btn btn-dark" onclick="button3_click();">수정</button>
          <a class="btn btn-dark" href='delete2/${answer.answerNo}'>삭제</a> 
        </div>
      </div>
    </form>
  </div>   
 
  </div> <!-- .container -->
  
  <jsp:include page="../javascript.jsp" />
 
 
 <jsp:include page="../footer.jsp" />
 
<script>

function button1_click(){
$("#answer_form").css("display","block");
}

function button2_click(){
	$("#modify_form").css("display","block");
	}

function add_check(){
  	var theForm = $('#anwerContents').val();
	 if(theForm == ""){
		 alert("내용을 입력해주세요.") ;
		  return false;
	 }
}

function add_Modify_check(){
    var theForm = $('#modify_contents').val();
   if(theForm == ""){
     alert("내용을 입력해주세요.") ;
      return false;
   }
}

	
	



</script>




</body>

</html>