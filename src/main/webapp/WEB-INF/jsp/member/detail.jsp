<%@page import="com.eomcs.lms.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>회원 상세조회</title>
  <!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- recruit_board_list.css -->
<link rel="stylesheet" href="${contextRootPath}/css/free/free.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">

<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">

<!-- MDBootstrap Datatables  -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/addons/datatables.min.css" rel="stylesheet">
     
</head>
<body>
 <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   
  <div class="container">
   <br><br>
    <h2>회원 정보를 <b>확인하고 수정</b>할 수 있습니다.</h2>
  <br><br>
    <c:choose>
      <c:when test="${empty member}">
        <meta http-equiv="Refresh" content="2;url=list">
        <p>해당하는 회원이 없습니다.</p>
      </c:when>
      
      <c:otherwise>
      
      <form action='update' method='post' enctype='multipart/form-data'> 
      
        <div class="row" style="margin-left: 100px;">  
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
          

          <div class="bit-pro col-7">
            <div class="form-group row" style="display:none;">
              <label for="no" class="col-sm-5 col-form-label">번호</label>
              <div class="col-sm-10">
                <input type="text" class="form-control-plaintext" name="no" id="no" value="${member.no}" readonly/>
              </div>
            </div>
          
            <div class="form-group row">
              <label for="name" class="col-sm-5 col-form-label">이름</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="name" id="name" value="${member.name}" readonly/>
              </div>
            </div>
            
             <div class="form-group row">
              <label for="birthday" class="col-sm-5 col-form-label">생년월일</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="birthday" id="birthday" value="${member.birthDay}" readonly/>
              </div>
            </div>

            <div class="form-group row">
              <label for="email" class="col-sm-5 col-form-label">이메일</label>
              <div class="col-sm-10">
                <input type="email" class="form-control" name="email" id="email" value='${member.email}'/>
              </div>
            </div>
            
              <div class="form-group row">
              <label for="id" class="col-sm-5 col-form-label">아이디</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="id" id="id" value='${member.id}' readonly/>
              </div>
            </div>

            <div class="form-group row">
              <label for="password" class="col-sm-5 col-form-label">비밀번호</label>
              <div class="col-sm-10">
                <button id="password-btn" type="button"> 비밀번호 변경</button>
                <div class="updatepwd" style="display:none;">
                <input type="password" class="newpwd form-control" id="newpwd" placeholder="변경할 비밀번호"/>
                <input type="password" class="pwdcheck form-control" name="password" id="pwdcheck" placeholder="비밀번호 확인" value='${member.password}'/>
                <div class="updatepwdbtn">
                  <button id="updatebtn">저장</button> 
                  <button type="button" id="cancelbtn">취소</button>
                </div>
                </div>
            </div>
            </div>

            <div class="form-group row">
              <label for="tel" class="col-sm-5 col-form-label">전화번호</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="tel" id="tel" value='${member.tel}'/>
              </div>
            </div>


            <div class="form-group row">
              <label for="baseAddress" class="col-sm-5 col-form-label">기본주소</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="baseAddress" name="baseAddress" value='${member.baseAddress}'/>
              </div>
            </div>
            
            <div class="form-group row"> 
              <label for="detailAddress" class="col-sm-5 col-form-label">상세주소</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="detailAddress" name="detailAddress" value='${member.detailAddress}'/>
              </div>
            </div>
            
             <div class="form-group row">
              <label for="createdDate" class="col-sm-5 col-form-label">자기소개</label>
              <div class="col-sm-10">
                <textarea class="form-control" id="selfIntroduce" name="selfIntroduce">${member.selfIntroduce}</textarea>
              </div>
            </div>

            <div class="form-group row">
              <div class="col-sm-10">
                <a class="btn btn-primary" href='../../'>메인화면</a>
                <button class="btn btn-primary">저장</button>
              </div>
            </div>    
            
          </div> <!-- .bit-pro -->
          
        </div> <!-- .row -->
    </form>
    
      </c:otherwise>
    </c:choose>
  
  </div> <!-- .container -->
  
      <!-- Modal -->
  <div class="modal fade bd-example-modal-xl" id="bit-photo-detail" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-body">
        
          <c:if test="${empty member.photo}">
            <img src='${contextRootPath}/images/default.jpg' class="img-thumbnail"><br>
          </c:if>
          
          <c:if test="${not empty member.photo}">
            <img src='${contextRootPath}/upload/member/${member.photo}' class="img-thumbnail"/>
          </c:if>
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <jsp:include page="../javascript.jsp" />
    
   <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp"/>
   
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp"/>
  
    <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp"/> 
 
  <script type="text/javascript">
   /* $('#password-btn').on('click', function () {
      var url = "form.jsp";  
      var winObj = window.open(url, "비밀번호변경", 'width=500px', 'height=300px');
      winObj.document.getElementById('cInput').value = document.getElementById('pInput').value; 
    }); */
    
    $('#password-btn').on('click', function() {
      $('.updatepwd').show();
      $(this).hide();
      $(this).prev().hide();
      $('#pwdcheck').val('');

    });
    
    $('#cancelbtn').on('click', function() {
      $('.updatepwd').hide();
      /* $('#password').show(); */
      $('#password-btn').show();
    })
    
     $('#updatebtn').on('click', function() {
    
    var newpwd = document.getElementById('newpwd').value;
    var pwdcheck = document.getElementById('pwdcheck').value;
    
    if (newpwd != pwdcheck) {
      alert("비밀번호가 일치하지 않습니다.");
      return false;
    } alert("비밀번호가 변경 되었습니다."); 
  }); 
    
  </script>
  
</body>
</html>
