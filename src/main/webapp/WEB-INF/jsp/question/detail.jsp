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
<link rel="stylesheet" href="${contextRootPath}/css/question_detail.css">
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
</head>

<body>
  <div class="container">
    <div class="form-group row">
      <label for="no" class="col-sm-2 col-form-label">번호</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="questionType" id="type" value="${question.questionNo}"
          readonly />
      </div>
    </div>

    <div class="form-group row">
      <label for="contents" class="col-sm-2 col-form-label">작성일</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="createdDate" id="createdDate"
          value="${question.createdDate}" readonly />
      </div>
    </div>
    <div class="form-group row">
      <label for="title" class="col-sm-2 col-form-label">작성자</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="member" id="member" value="${question.member.id}" readonly />
      </div>
    </div>


    <div class="form-group row">
      <label for="title" class="col-sm-2 col-form-label">제목</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="title" id="title" value="${question.title}" readonly />
      </div>
    </div>
       <div class="form-group row">
      <label for="contents" class="col-sm-2 col-form-label">내용</label>
      <div class="col-sm-10">
        <textarea class="form-control col-sm-13" name="contents" id="contents"
          readonly>${question.contents}</textarea> 
          
      </div>
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