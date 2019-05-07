<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/userinfor.css">
</head>
<body>
  <div class="container">
   
    <div id="userinfobg">
      <img src="${contextRootPath}/images/userinfo.jpg" class="img-fluid">
    </div>

    
    <div id="headerk">
      <nav class="navbar navbar-expand-lg justify-content-center">
        <a href="#"><img src="${contextRootPath}/images/logo.png" class="headerImg"></a>
      </nav>
      <ul class="nav justify-content-center">
        <li class="nav-item"><a class="nav-link" href="#">메인</a></li>
        <li class="nav-item"><a class="nav-link" href="#">매치</a></li>
        <li class="nav-item"><a class="nav-link" href="#">팀</a></li>
        <li class="nav-item"><a class="nav-link" href="#">커뮤니티</a></li>
        <li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
      </ul>
      <h2>
        <center>
          마이페이지>개인정보 <br> <br> <br>
          <h4>개인정보 나의질문내역</h4>
        </center>
        </h1>
    </div>
  </div>
<div id="info1">
  <center>
    <h3>
      회원 정보를<b> 확인하고 수정</b>할 수 있습니다.
    </h3>
  </center>
</div>

  <div class="container12">
    <form action='add' method='post'>
    
      <div class="container13">
        <div class="form-group">
          <label for="exampleFormControlFile1">사진</label> <input type="file"
            class="form-control-file" id="exampleFormControlFile1">
        </div>

        <div class="form-group row">
          <label for="inputEmail3" class="col-sm-2 col-form-label">이름</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="inputName" placeholder="Name">
          </div>
        </div>
        <hr>
        
        <div class="form-group row">
          <label for="inputEmail3" class="col-sm-2 col-form-label">생년월일</label>
          <div class="col-sm-10">
            <input type="date" class="form-control" id="inputbirth">
          </div>
        </div>
        <hr>
        
        <div class="form-group row">
          <label for="inputEmail3" class="col-sm-2 col-form-label">성별</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="inputGender">
          </div>
        </div>
        <hr>

        <div class="form-group row">
          <label for="inputEmail3" class="col-sm-2 col-form-label">이메일</label>
          <div class="col-sm-10">
            <input type="email" class="form-control" id="inputEmail" placeholder="Email">
          </div>
        </div>
        <hr>
        
        <div class="form-group row">
          <label for="inputEmail3" class="col-sm-2 col-form-label">아이디</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="inputId">
          </div>
        </div>
        <hr>
        
        <div class="form-group row">
          <label for="inputPassword3" class="col-sm-2 col-form-label">비밀번호</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
            <button type="submit" class="btn btn-primary mb-2">비빌번호변경</button>
          </div>
        </div>
        <hr>
        
        <div class="form-group row">
          <label for="inputPassword3" class="col-sm-2 col-form-label">휴대전화</label>
          <div class="col-sm-10">
            <input type="tel" name="tel" id="inputTell" placeholder="010-1234-1234"><input
              type="submit" value="휴대폰번호 인증"><br>
          </div>
        </div>
        <hr>
        
        <div class="form-group">
          <label for="exampleFormControlTextarea1">자기 소개</label><br>
          <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"
            placeholder="50자 이내"></textarea>
        </div>
      </div>
    </form>
  </div>
  <!-- .container -->
</body>
</html>