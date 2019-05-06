<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<h2>
			<center>
				회원 정보를<b> 확인하고 수정</b>할 수 있습니다.
			</center>
			</h1>


			<hr color="black" width=90%>
			<form action='add' method='post'>

<div class="form-group">
    <label for="exampleFormControlFile1">사진</label>
    <input type="file" class="form-control-file" id="exampleFormControlFile1">
  </div>



<div class="form-group row">
          <label for="inputEmail3" class="col-sm-2 col-form-label">이름</label>
          <div class="col-sm-10">
            <input type="email" class="form-control" id="inputEmail3"
              placeholder="Name">
          </div>
        </div>

<div class="form-group row">
          <label for="inputEmail3" class="col-sm-2 col-form-label">생년월일</label>
          <div class="col-sm-10">
            <input type="date" class="form-control" id="inputbirth">
          </div>
        </div>

<div class="form-group row">
          <label for="inputEmail3" class="col-sm-2 col-form-label">성별</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="inputGender">
          </div>
        </div>


				<div class="form-group row">
					<label for="inputEmail3" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail3"
							placeholder="Email">
					</div>
				</div>
				
				<div class="form-group row">
          <label for="inputEmail3" class="col-sm-2 col-form-label">아이디</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="inputId">
          </div>
        </div>
				
				
				
				<div class="form-group row">
					<label for="inputPassword3" class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword3"
							placeholder="Password">
							  <button type="submit" class="btn btn-primary mb-2">비빌번호변경</button>
					</div>
				</div>
				
				  <div class="form-group row">
          <label for="inputPassword3" class="col-sm-2 col-form-label">휴대전화</label>
          <div class="col-sm-10">
            <input type="tel" name="tel" id="inputTell" 
            placeholder="010-xxxx-xxxx"><input type="submit" value="휴대폰번호 인증"><br>
          </div>
        </div>
				
				

  <div class="form-group">
    <label for="exampleFormControlTextarea1">자기 소개</label><br>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  </div>

	</form>

	</div>
	<!-- .container -->

</body>
</html>