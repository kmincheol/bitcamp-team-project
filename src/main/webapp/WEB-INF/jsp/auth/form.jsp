<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<jsp:include page="../header.jsp" />
<!-- header.css -->
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
</head>
<body>
  <div class="container">
    <h1>로그인</h1>
    <form action='login' method='post'>
      <div class="form-group">
        <label for="id">아이디</label> <input type="text" class="form-control" id="id" name="id"
          aria-describedby="emailHelp" value='${cookie.id.value}' placeholder="아이디를 입력하세요.">
        <small id="idHelp" class="form-text text-muted">당신의 정보를 다른 사이트와 공유하지 않습니다.</small>
      </div>

      <div class="form-group">
        <label for="password">Password</label> <input type="password" class="form-control"
          id="password" name="password" placeholder="암호를 입력하세요.">
      </div>

      <div class="form-group form-check">
        <input type="checkbox" class="form-check-input" id="saveId" name="saveId"> <label
          class="saveId" for="exampleCheck1">아이디 저장</label>
      </div>

      <button type="submit" class="btn btn-primary">로그인</button>
    </form>

  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />
</body>
</html>
