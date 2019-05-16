<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>게시글 등록</title>
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board_list.css">
<link rel="stylesheet" href="${contextRootPath}/css/header.css">
</head>

<body>
  <div class="container">

    <jsp:include page="../header.jsp"></jsp:include>

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
              <th scope="row">소속팀</th>
              <td><select class="custom-select" id="select2" name='team.teamId'
                onchange="setValues();">
                  <option>기본</option>
                  <c:forEach items="${team}" var="team">
                    <option value=${team.teamId} >${team.teamName}</option>
                  </c:forEach>
              </select></td>
            </tr>
            <td>
            <th scope="row">제목</th>
            </td>
            <td>
              <div class="col-sm-2">
                <input class="form-control" id="title" name='teamTitle'>${teamRecruit.teamTitle}</input>
              </div>
            </td>
            <tr>
              <th scope="row">내용</th>
              <td><div class="col-sm-8">
                  <textarea class="form-control" id="contents" name='teamContents' rows='5'>${teamRecruit.teamContents}</textarea>
                </div></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="form-group row">
        <div class="col-sm-10">
          <button class="btn btn-primary">등록</button>
          <a class="btn btn-primary" href='${contextRootPath}/app/recruit_board'>목록</a>
        </div>
      </div>
    </form>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />


  <script>
	/*  	function setValues() {
				var sh = document.getElementById("select1");
				var sh2 = document.getElementById("select2");
				var tt = document.getElementById("textTime");
<<<<<<< HEAD
				tt.value = sh.options[sh.selectedIndex].value;
				sh2.value = sh.options[sh.selectedIndex].text;

			}
=======
			    var tt2 = document.getElementById("textTime2");
				tt.value = sh2.options[sh2.selectedIndex].value;
				
			}  */
>>>>>>> branch 'master' of https://github.com/kmincheol/bitcamp-team-project.git
		</script>


</body>
</html>
