<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
</head>

<body>
  <div class="container">


    <div id="main-text">
      <h2>질문게시판</h2>
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
             <td><a href="${contextRootPath}/app/question/${question.questionNo}">${question.title}</a></td>
            <td>${question.member.name}</td>
            <td>${question.createdDate}</td>
             <td><c:choose>
                <c:when test="${question.questionStatus == false}"> 대기 </c:when>
                <c:otherwise>완료</c:otherwise>
              </c:choose>
          </tr>
        </c:forEach>
      </tbody>
   
    </table>
    
    <div>
        <a class="btn btn-warning" href="${contextRootPath}/app/question/form" >글쓰기</a>
    </div>
  </div>


  </div>

</body>
</html>