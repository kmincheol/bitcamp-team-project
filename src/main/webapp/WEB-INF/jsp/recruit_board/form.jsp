<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 등록</title>
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="${contextRootPath}/css/recruit_board_form.css">
  <link rel="stylesheet" href="${contextRootPath}/css/header.css">
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
            </select></td>
              <tr>
              <th scope="row">종목</th>
                <td>
                <select class="custom-select" id="select2">
               </select>
              </td>
                <tr>
              <th scope="row">소속팀</th>
                <td>
                <select class="custom-select" id="select1" onchange="itemChange()">
                  <c:forEach items="${team}" var="list">
                     <option value="1">${list.teamName}</option>
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
  <script>
  function itemChange(){
 
var keyboard = ["야구"];
var mouse = ["광마우스","유선마우스","비싼마우스","미키마우스"];
var monitor = ["17인치","22인치","24인치","26인치"];
 
var selectItem =   $("#selBox option:selected").text();

  
var changeItem;
  
if(selectItem == '연수농구단'){
  changeItem = keyboard;
}
else if(selectItem == "마우스"){
  changeItem = mouse;
}
else if(selectItem == "모니터"){
  changeItem =  monitor;
}
 
 
for(var count = 0; count < changeItem.size(); count++){                
                var option = $("<option>"+changeItem[count]+"</option>");
                $('#select2').append(option);
            }
 
}

  
  
  </script>
  
</body>
</html>
