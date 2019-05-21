<%@page import="com.eomcs.lms.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 상세조회</title>
<jsp:include page="../commonCss.jsp" />
</head>
<body>

  <%-- <jsp:include page="../header.jsp" /> --%>

  <div class="container">

    <h1>회원가입(임시 무조건 임시임 이거 아님 오해 ㄴㄴ)</h1>

    <form action='enter' method='post' enctype='multipart/form-data'>

      <div class="row">
        <%-- <div class="col-3 bit-photo">
          
            <c:if test="${empty member.photo}">
              <img src='${contextRootPath}/images/default.jpg' class="bit-photo img-fluid rounded-circle mx-auto d-block" alt="Responsive image"><br>
            </c:if>
            
            <c:if test="${not empty member.photo}">
              <a href='${contextRootPath}/upload/member/${member.photo}'  data-toggle="modal" data-target="#bit-photo-detail">
              <img src='${contextRootPath}/upload/member/${member.photo}' class="bit-photo img-fluid rounded-circle mx-auto d-block" alt="Responsive image"><br></a>
            </c:if>
            
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupFileAddon01">사진</span>
              </div>
              <div class="custom-file">
                <input type="file" name='photoFile' class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
                <label class="custom-file-label" for="inputGroupFile01">사진 선택</label>
              </div>
            </div>
            
          </div> <!-- .bit-photo --> --%>

        <div class="form-group row">
          <label for="id" class="col-sm-5 col-form-label">아이디</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="id" id="id" value='${member.id}' />
          </div>
        </div>

        <div class="form-group row">
          <label for="password" class="col-sm-5 col-form-label">비밀번호</label>
          <div class="col-sm-10">
            <input type="password" class="pwd form-control" name="password" id="password"
              value='${member.password}' />
          </div>
        </div>

        <div class="form-group row">
          <label for="name" class="col-sm-5 col-form-label">이름</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="name" id="name" value="${member.name}" />
          </div>
        </div>

        <div class="form-group row">
          <label for="birthDay" class="col-sm-5 col-form-label">생년월일</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="birthDay" id="birthDay"
              value="${member.birthDay}" />
          </div>
        </div>
    
     <div class="form-group row">
          <label for="email" class="col-sm-5 col-form-label">성별</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="gender" id="gender" value='${member.gender}' />
          </div>
        </div>


        <div class="form-group row">
          <label for="email" class="col-sm-5 col-form-label">이메일</label>
          <div class="col-sm-10">
            <input type="email" class="form-control" name="email" id="email" value='${member.email}' />
          </div>
        </div>



        <div class="form-group row">
          <label for="tel" class="col-sm-5 col-form-label">전화번호</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="tel" id="tel" value='${member.tel}' />
          </div>
        </div>


        <div class="form-group row">
          <label for="baseAddress" class="col-sm-5 col-form-label">기본주소</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="baseAddress" name="baseAddress"
              value='${member.baseAddress}'/>
          </div>
        </div>

        <div class="form-group row">
          <label for="detailAddress" class="col-sm-5 col-form-label">상세주소</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="detailAddress" name="detailAddress"
              value='${member.detailAddress}'/>
          </div>
        </div>

        <div class="form-group row">
          <label for="createdDate" class="col-sm-5 col-form-label">자기소개</label>
          <div class="col-sm-10">
            <textarea class="form-control" id="selfIntroduce" name="selfIntroduce">
            ${member.selfIntroduce}</textarea>
          </div>
        </div>
        
        <input type="hidden" value="카카오" name="loginType">

        <div class="form-group row">
          <div class="col-sm-10">
            <a class="btn btn-primary" href='../'>회원목록</a>
            <button class="btn btn-primary">저장</button>
          </div>
        </div>

      </div>
      <!-- .bit-pro -->
  </form>
  </div>
  <!-- .row -->


  <jsp:include page="../javascript.jsp" />

</body>
</html>
