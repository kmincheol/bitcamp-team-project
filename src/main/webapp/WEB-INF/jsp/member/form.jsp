<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경</title>
<jsp:include page="../commonCss.jsp" />
</head>
<body>

  <div class="container">

    <h1>비밀번호 변경</h1>

    <form action='updatePassword' method='post'>

      <div class="form-group row">
        <label for="no" class="col-sm-5 col-form-label">번호</label>
          <input type="text" name="no" id="cInput"readonly />
      </div>

      <div class="row">
        <div class="bit-pro col-7">
          <div class="form-group row">
            <label for="password" class="col-sm-4 col-form-label">비밀번호</label>
            <div class="col-sm-10">
              <input type="password" class="form-control" name="password" id="pwd" />
            </div>
          </div>

          <div class="form-group row">
            <label for="password" class="col-sm-4 col-form-label">비밀번호 확인</label>
            <div class="col-sm-10">
              <input type="password" class="form-control" name="pwdcheck" id="pwdcheck" />
            </div>
          </div>

          <div class="form-group row">
            <div class="col-sm-10">
              <button id="check" class="btn btn-primary">확인</button>
            </div>
          </div>

        </div>
      </div>
    </form>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />

  <script type="text/javascript">
  
  $('#check').on('click', function() {
    
    var pwd = document.getElementById('pwd').value;
    var pwdcheck = document.getElementById('pwdcheck').value;
    
    if (pwd != pwdcheck) {
      alert("비밀번호가 일치하지 않습니다.");
      return false;
    } alert("비밀번호가 변경되었습니다.");
    window.close();
  }); 


  </script>
</body>
</html>
