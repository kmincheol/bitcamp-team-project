<%@page import="org.aspectj.weaver.patterns.TypePatternQuestions.Question"%>
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
<link rel="stylesheet" href="${contextRootPath}/css/question_list.css">
</head>

<body>
  <div class="container">
    <div id="main-text">
        <br>
        <br>
        <br>
       <a class="btn btn-danger" href="${contextRootPath}/app/question/mylist/${member.no}" > 1:1 문의하기</a>
        <a class="btn btn-danger" href="${contextRootPath}/app/question/mylist/${member.no}" > 1:1 문의내역</a>
    </div>


    <table class="table">
      <thead class="thead-light">
         <tr>
          <th scope="col">번호</th>
          <th scope="col">제목</th>
          <th scope="col">작성자</th>
          <th scope="col">작성일</th>
          <th scope="col">답변상태</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${question}" var="question">
          <tr>
            <td>${question.questionNo}</td>
           <td > 
            <c:choose>
                <c:when test="${member.no == question.memberNo || member.no == 1}">
                   <a href="${contextRootPath}/app/question/${question.questionNo}">${question.title}</a>
                    <c:if test="${question.password == 'true' }">
                      <img src="${contextRootPath}/images/lock.png" style = "width:20px">
                   </c:if> 
                </c:when>
               <c:otherwise>  
                 <c:choose>
                      <c:when test="${question.password == true }">
                      <a href="${contextRootPath}/app/question/${question.questionNo}" onclick="return aa()">${question.title}</a>
                              <img src="${contextRootPath}/images/lock.png" style = "width:20px">
                    </c:when>
                      <c:otherwise>
                   <a href="${contextRootPath}/app/question/${question.questionNo}">${question.title}</a>
                      </c:otherwise>
                      </c:choose>  
               </c:otherwise>
               
               
               
                  </c:choose>                  
            <td>${question.member.id}</td>
            <td>${question.createdDate}</td>
            
             <td>
              <c:choose>
                <c:when test="${(question.questionStatus) == 'false'}"> <img src="${contextRootPath}/images/idea.png" 
                style = "width:30px"> </c:when>
                <c:otherwise><img src="${contextRootPath}/images/idea2.png" 
                style = "width:30px"></c:otherwise>
              </c:choose>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    
    <nav aria-label="목록 페이지 이동">
      <ul class="pagination justify-content-center">
        <li class="page-item ${pageNo <= 1 ? 'disabled' : ''}"><a class="page-link"
          href="?pageNo=${pageNo - 1}&pageSize=${pageSize}">이전</a></li> 
        <li class="page-item active"><span class="page-link">${pageNo}</span></li> 
        <li class="page-item ${pageNo >= totalPage ? 'disabled' : ''}"><a class="page-link" 
          href="?pageNo=${pageNo + 1}&pageSize=${pageSize}">다음</a></li> 
      </ul>
    </nav>
    
    <c:if test="${sessionScope.loginUser.no == 1}">      
    <a class="btn btn-dark" href="${contextRootPath}/app/question/answerlist" >답변하세요</a>
   </c:if>
    <div id="btnbtn">
     <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.no != 1}">      
        <a class="btn btn-dark" href="${contextRootPath}/app/question/form" >글쓰기</a>
   </c:if>
     </div>
    
  </div>
  
    <jsp:include page="../javascript.jsp" />
<script>
function aa(){
	 alert('작성자만 확인할 수 있습니다');
	  return false;
}


</script>


</body>
</html>