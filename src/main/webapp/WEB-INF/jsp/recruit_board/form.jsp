<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 등록</title>
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="${contextRootPath}/css/recruit_board_form.css">
</head>
<body>


  <div class="container">
  
    <h1>새 글</h1>
    <form action='add' method='post'>
      <div id="table">
        <table class="table table-bordered">
          <tbody>
              <th scope="row">지역</th>
            <td><select class="custom-select">
                <option selected>oo시</option>
                <option value="1">서울</option>
                <option value="2">부산</option>
                <option value="3">대전</option>
            </select> <select class="custom-select">
                <option selected>oo구</option>
                <option value="1">강동</option>
                <option value="2">강남</option>
                <option value="3">강서</option>
            </select></td>
            <tr>
              <th scope="row">경기유형</th>
                <td>
                <select class="custom-select">
                  <c:forEach items="${list2}" var="list">
                     <option value="1">${list.teamTypeSports.teamSportsType}</option>
                    </c:forEach>
               </select>
              </td>
            </tr>
            <tr>
              <th scope="row">소속팀</th>
               <td>
                <select class="custom-select">
                  <c:forEach items="${list2}" var="list">
                     <option value="1"> ${list.team.teamName}</option>
                    </c:forEach>
               </select>
              </td>
            <tr>
              <th scope="row">제목</th>
              <td>
               <div class="col-sm-2">
                 <input class="form-control" id="title" name='teamTitle'>${teamRecruit.teamTitle}</input>
               </div>
              </td>
            </tr>
            <tr>
              <th scope="row">내용</th>
              <td><div class="col-sm-8">
     <textarea class="form-control" id="contents" name='teamContents' rows='5'>${teamRecruit.teamContents}</textarea>
    </div>
  </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="form-group row">
    <div class="col-sm-10">
      <button class="btn btn-primary">등록</button>
      <a class="btn btn-primary" href='.'>목록</a> 
    </div>
  </div>
    </form>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />
</body>
</html>
