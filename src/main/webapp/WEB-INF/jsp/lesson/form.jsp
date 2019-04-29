<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<title>새 수업</title>
<link rel="stylesheet"
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
  crossorigin="anonymous">
<link rel="stylesheet" href="${contextRootPath}/css/common.css">
</head>
<body>

  <jsp:include page="../header.jsp" />

  <div class="container">
    <h1>새 수업</h1>
    <form action='add' method='post'>
      <div class="form-group row">
        <label for="title" class="col-sm-2 col-form-label">수업</label>
        <div class="col-sm-6">
          <input type="text" class="form-control" id="title" name='title'>${lesson.title}
        </div>
      </div>

      <div class="form-group row">
        <label for="contents" class="col-sm-2 col-form-label">내용</label>
        <div class="col-sm-6">
          <textarea class="form-control" id="contents" name='contents' rows='5'>${lesson.contents}</textarea>
        </div>
      </div>

      <div class="form-group row">
        <label for="startDate" class="col-sm-2 col-form-label">시작일</label>
        <div class="col-sm-6">
          <input type="date" class="form-control" id="startDate">${lesson.startDate}
        </div>
      </div>

      <div class="form-group row">
        <label for="endDate" class="col-sm-2 col-form-label">종료일</label>
        <div class="col-sm-6">
          <input type="date" class="form-control" id="endDate">${lesson.endDate}
        </div>
      </div>

      <div class="form-group row">
        <label for="totalHours" class="col-sm-2 col-form-label">총 교육시간</label>
        <div class="col-sm-6">
          <input type="number" class="form-control" id="totalHours" name='totalHours'>${lesson.totalHours}
        </div>
      </div>

      <div class="form-group row">
        <label for="dayHours" class="col-sm-2 col-form-label">일 교육시간</label>
        <div class="col-sm-6">
          <input type="number" class="form-control" id="dayHours" name='dayHours'>${lesson.dayHours}
        </div>
      </div>

      <div class="form-group row">
        <div class="col-sm-6">
          <button class="btn btn-primary">등록</button>
          <a class="btn btn-primary" href='.'>목록</a>
        </div>
      </div>
    </form>
  </div>
</body>
</html>
