<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>팀원 구함 리스트</title>
  <!--<jsp:include page="../commonCss.jsp"/> -->
   <link rel="stylesheet"href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet"href="${contextRootPath}/css/recruit_list.css">
</head>
<body>

  <jsp:include page="../header.jsp" />
  
  <div class="container">
    <h2>마음에 드는 팀에 가입신청 해보세요.</h2>
		<hr color="black" width=90%>
		
		<table class="table">
		<thead>
		<tr id="bar">
    		<th>
    		<form id="searchbox" action='search' class="form-inline my-2 my-lg-0 justify-content">
       	<input id="searchbox" class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요.">
			<button class="btn btn-outline-success my-2 my-sm-0">검색</button>
    		</form>
    		</th>
    		
    		<th>
	 		 	<div align="right" id="writebtn">
      		 	<a href='form' class="btn btn-primary btn-sm">글쓰기</a>
			 	</div>
			</th>
			 	</tr>
			</thead>
			</table>
			 
			 	
		<table class="table table-hover">
      <thead class="bar">
        <tr id="bar">
          <th id="result" scope="row">검색결과 수</th>
       <th id="selectbox" scope="col">
       	<select name='loc1' class="custom-select" id="inputGroupSelect01">
				<option selected>Choose...</option>
    			<option value="1">One</option>
    			<option value="2">Two</option>
    			<option value="3">Three</option>
       	</select>
			</th>
        </tr>
       </thead>
    </table>
		
		<!--  -->
    
    <table class="table table-striped table-dark table-hover">
      <thead class="thead-dark">
        <tr>
          <th scope="col">번호</th>
          <th scope="col">제목</th>
          <th scope="col">지역</th>
          <th scope="col">종목</th>
          <th scope="col">작성자</th>
          <th scope="col">작성일</th>
          <th scope="col">상태</th>
          <th scope="col">조회수</th>
        </tr>
       </thead>
       <tbody>
           <tr>
             <td>12</td>
             <td><a href='#' class="alert-link">안녕하세요~~~~~~~</a></td>
             <td>서울시 강북구 수유동 </td>
             <td>배드민턴</td>
             <td>longlonglong</td>
             <td>2019-12-12</td>
             <td>모집완료</td>
             <td>300</td>
           </tr>
       </tbody>
    </table>
    
    
    
  </div> <!-- .container -->  
  
  <jsp:include page="../javascript.jsp"/>
</body>
</html>