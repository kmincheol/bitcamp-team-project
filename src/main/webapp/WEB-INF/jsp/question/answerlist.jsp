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
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
<link rel="stylesheet" href="${contextRootPath}/css/question_list.css">
</head>

<body>
  <div class="container">
    <div id="main-text">
      <h2>답변해야 할 게시물</h2>
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
               <c:if test="${question.questionStatus == 'false'}">
          <tr>
            <td>${question.questionNo}</td>
             <td><a href="${contextRootPath}/app/question/${question.questionNo}">${question.title}</a></td>
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
              </c:if>
        </c:forEach>
      </tbody>
    </table>
    <div>
          <a class="btn btn-outline-dark" id="btnbtn" href="${contextRootPath}/app/question">목록 이동</a>
    </div>
  </div>

 <jsp:include page="../footer.jsp" />


</body>
</html>