<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>모집게시판</title>
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_list.css">
</head>

<body>
  <div class="container">


    <div id="main-text">
      <h2>모집게시판</h2>
    </div>


    <table class="table">
      <thead class="thead-light">
         <tr>
          <th scope="col">유형</th>
          <th scope="col">제목</th>
          <th scope="col">작성자</th>
          <th scope="col">작성일</th>
          <th scope="col">답변상태</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${question}" var="question">
          <tr>
            <td>${question.questionType}</td>
             <td><a href="${contextRootPath}/app/question/${question.questionNo}">${question.title}</a></td>
            <td>${question.member.name}</td>
            <td>${question.createdDate}</td>
             <td><c:choose>
                <c:when test="${question.questionStatus == false}"> 답변대기 </c:when>
                <c:otherwise>답변완료</c:otherwise>
              </c:choose>
         
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <div id="in">
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span
              aria-hidden="true">&laquo;</span>
          </a></li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span
              aria-hidden="true">&raquo;</span>
          </a></li>
        </ul>
      </nav>
    </div>
  </div>


  </div>

  <jsp:include page="../javascript.jsp" />

  <!-- <script>
    var search = document.getElementById("#searchbtn");
    var sw = document.getElementById("#searchwindow");
    search.onclick = function () {
      if (sw.value == "") {
        alert('검색어를 입력하세요');
      }
    }
  </script> -->


</body>
<!-- <footer>
        
  </footer> -->

</html>