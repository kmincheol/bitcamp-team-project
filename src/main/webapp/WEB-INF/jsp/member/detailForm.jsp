<%@page import="com.eomcs.lms.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>회원 상세조회</title>
  <jsp:include page="../commonCss.jsp"/>
  <jsp:include page="../header.jsp"/>
</head>
<style>
div.button
{
   margin: auto;
   width: 50%;
}


div.button input
{
  position: relative;
  top:80px;
   padding: 5px;
   width: 100%;
   font-size: 18px;
}

h2 {
text-align: center;
margin: 15px;
}

h4 {
text-align: center;
margin: 15px; 
}
</style>
<body>
   <c:choose>
      <c:when test="${empty member}">
        <p>해당하는 회원이 없습니다.</p>
      </c:when>

      <c:otherwise>  
  <%-- <jsp:include page="../header.jsp" /> --%> 
   
  <div class="container">
   <br><br>
    <h2>회원 정보를 <b>확인하고 수정</b>할 수 있습니다.</h2>
  <br><br>
  
    <div class="row">
    <div class="col button" style="border:1px solid black; height:300px;"> 
    <h2>개인프로필 변경</h2>
    <br>
    <h4>나의 프로필 정보를 변경할 수 있습니다.</h4> 
    <input class="prof_no" type="hidden" value="${member.no}">
    <input class="prof-btn input-group-btn btn btn-dark" type="button" value="변경하기">  
   </div>
   
    <div class="col button" style="border:1px solid black; height:300px;"> 
    <h2>비밀번호 변경</h2> 
    <br>
    <h4>비밀번호를 변경할 수 있습니다.</h4> 
    <input class="password-btn input-group-btn btn btn-dark" type="button"  value="변경하기">
    </div>
  </div>
   </div>
  </c:otherwise>
  </c:choose>
</body>
 
<script>

 
$('.prof-btn').on('click',function(){
  var no = $('.prof_no').val(); 
  location="profUpdate/" + no; 
});
 
$('.password-btn').on('click', function(){
  var no = $('.prof_no').val(); 
  location="passwordUpdate2/" + no;
}); 

</script>
</html>
