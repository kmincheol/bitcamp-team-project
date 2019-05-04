<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>팀 구합니다 글쓰기</title>
 <!--  <jsp:include page="../commonCss.jsp"/> -->
   <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextRootPath}/css/recruit_form.css">
</head>
<body>

<jsp:include page="../header.jsp"/>

<div class="container">
  
  <h2><b>팀 가입을</b> 원하는 글을 간편하게 </h2>
   <h2> 등록할 수 있습니다. </h2>
   
   <h6>글 등록 후 팀의 가입 권유를 받아 팀에 가입해 보세요.</h6>
  
  	<hr color="black" width=90% >
    <form action='add' method='post'>
      
        <div class="form-group row">
          <label for="location" class="col-sm-2 col-form-label"><b>지역</b></label>
           <div class="col-sm-2">
              <div class="input-group mb-2">
                <select name='loc1' class="custom-select" id="inputGroupSelect01">
					<option selected>Choose...</option>
    				<option value="1">One</option>
    				<option value="2">Two</option>
    				<option value="3">Three</option>
                </select>
              </div>
            </div>
            
              <div class="col-sm-2">
              <div class="input-group mb-2">
                <select name='loc1' class="custom-select" id="inputGroupSelect01">
					<option selected>Choose...</option>
    				<option value="1">One</option>
    				<option value="2">Two</option>
    				<option value="3">Three</option>
                </select>
              </div>
            </div>
            
               <div class="col-sm-2">
              <div class="input-group mb-2">
                <select name='loc1' class="custom-select" id="inputGroupSelect01">
					<option selected>Choose...</option>
    				<option value="1">One</option>
    				<option value="2">Two</option>
    				<option value="3">Three</option>
                </select>
              </div>
            </div>
          </div>
        
        <div class="form-group row">
          <label for="playtype" class="col-sm-2 col-form-label"><b>경기유형</b></label>
               <div class="col-sm-2">
              <div class="input-group mb-2">
                <select name='loc1' class="custom-select" id="inputGroupSelect01">
					<option selected>Choose...</option>
    				<option value="1">One</option>
    				<option value="2">Two</option>
    				<option value="3">Three</option>
                </select>
              </div>
            </div>
        </div>
         
         
        <div class="form-group row">
          <label for="title" class="col-sm-2 col-form-label"><b>제목</b></label>
          <div class="col-sm-8">
            <input type="text" class="form-control" name="title" id="title"/>
          </div>
        </div>

        <div class="form-group row">
    <label for="contents" class="col-sm-2 col-form-label"><b>내용</b></label>
    	<div class="col-sm-8">
      	<textarea class="form-control" id="contents" name='contents' rows='5'></textarea>
    	</div>
  		</div>

        <div class="button">
          <div class="col-sm-10">
            <button class="btn btn-primary">글등록</button>
          </div>
        </div>
    
    </form>
    
  </div> <!-- .container -->

<jsp:include page="../javascript.jsp"/>
</body>
</html>
