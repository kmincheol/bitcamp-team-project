<%@page import="org.aspectj.weaver.patterns.TypePatternQuestions.Question"%>
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

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">

<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">

<!-- MDBootstrap Datatables  -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/addons/datatables.min.css"
  rel="stylesheet">
  
<link rel="stylesheet" href="${contextRootPath}/css/question_list.css">
</head>

<body>

<jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />

  <div class="container" id="main-wrap">
    <div id="main-text">
      <h2>
      <img src="${contextRootPath}/images/headset.png">답변해야 할 게시물
      </h2>
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

 <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

<script>
      var lang_kor = {
        "lengthMenu" : "_MENU_ 개씩 보기",
        "search" : "검색 : ",
        "zeroRecords" : "검색된 데이터가 없습니다.",
        "searchPlaceholder" : "검색어 입력",
        "paginate" : {
          "next" : "다음",
          "previous" : "이전"
        }
      };

      $(document).ready(function() {
        $('#dtBasicExample').DataTable({
          order : [ [ 0, "desc" ] ],
          "info" : false,
          "paging" : true,
          language : lang_kor
        });
        $('.dataTables_length').addClass('bs-select');
      });
    </script>

</body>
</html>