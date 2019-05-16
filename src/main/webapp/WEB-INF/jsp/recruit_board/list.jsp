<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>모집게시판</title>
  <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextRootPath}/css/recruit_board_list.css">
</head>

<body>
  <div class="container">

    <div id="main-backgroundImg">
      <img src="${contextRootPath}/images/recurit_board.jpg" class="img-fluid">

      <div id="header-item">
        <a href="#">로그인/</a> <a href="#">회원가입/</a> <a href="#">고객센터</a>
      </div>
    </div>

    <div id="header">
      <nav class="navbar navbar-expand-lg justify-content-center">
        <a href="#"><img src="${contextRootPath}/images/logo.png" class="headerImg"></a>
      </nav>

      <div id="header-cate">
        <div>
          <ul class="nav justify-content-center">
            <div class="header-category">
              <li class="nav-item"><a class="nav-link" href="#">메인</a></li>
            </div>
            <div class="header-category">
              <li class="nav-item"><a class="nav-link" href="#">매치</a>
                <ul class="category">
                  <li class="nav-item"><a class="nav-link" href="#">매치보드</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">매치등록</a></li>
                </ul>
              </li>
            </div>
            <div class="header-category">
              <li class="nav-item"><a class="nav-link" href="#">팀</a>
                <ul class="category">
                  <li class="nav-item"><a class="nav-link" href="#">팀생성</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">팀정보</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">모집게시판</a></li>
                </ul>
              </li>
            </div>
            <div class="header-category">
              <li class="nav-item"><a class="nav-link" href="#">커뮤니티</a>
                <ul class="category">
                  <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
                </ul>
              </li>
            </div>
            <div class="header-category">
              <li class="nav-item"><a class="nav-link" href="#">마이페이지</a>
                <ul class="category">
                  <li class="nav-item"><a class="nav-link" href="#">개인정보</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">나의 팀 정보</a></li>
                </ul>
              </li>
            </div>
          </ul>
        </div>
      </div>
    </div>

    <div id="main-text">
      <h2>모집게시판</h2>
    </div>

    <div id="recruit-list-out">
      <div class="input-group mb-3">
        <select class="custom-select" id="inputGroupSelect01">
          <option selected>종목</option>
          <option value="1">축구</option>
          <option value="2">야구</option>
          <option value="3">농구</option>
        </select>
      </div>

      <form action='recruit_board/search'>
        <div class="form-group row">
          <div class="col-xs-4">
            <input id="searchwindow" name='keyword' class="form-control" type="search" placeholder="검색어 입력">
          </div>
          <div id="search-btn">
            <button id="searchbtn" class="input-group-btn btn btn-dark">검색</button>
          </div>
          <div id="write-btn" style="position: absolute; right: 0;">
            <button class="input-group-btn1 btn btn-dark">
              <a href="${contextRootPath}/app/recruit_board/form">글쓰기</a>
            </button>
          </div>
        </div>
      </form>

      <table class="table">
        <thead class="thead-light">
          <tr>
            <td colspan="8" class="search-result">검색 결과 총 : (3)건</td>
          </tr>
          <tr>
            <th scope="col">번호</th>
            <th scope="col">종목</th>
            <th scope="col">제목</th>
            <th scope="col">팀명</th>
            <th scope="col">지역</th>
            <th scope="col">상태</th>
            <th scope="col">작성일</th>
            <th scope="col">조회수</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${list}" var="list">
            <tr>
              <td>${list.teamNo}</td>
              <td>${list.teamTypeSports.teamSportsType}</td>
              <td><a href="${contextRootPath}/app/recruit_board/${list.teamNo}">${list.teamTitle}</a></td>
              <td>${list.team.teamName }</td>
              <td>${list.team.teamArea }</td>
              <td>
                <c:choose>
                  <c:when test="${list.teamRcrmStatus == 0}"> 모집중 </c:when>
                  <c:otherwise>모집마감</c:otherwise>
                </c:choose>
              </td>
              <td>${list.teamCreatedDate}</td>
              <td>${list.teamViewCount}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <div id="in">
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
              </a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
              </a></li>
          </ul>
        </nav>
      </div>
    </div>


  </div>

  <jsp:include page="../javascript.jsp" />

  <!-- <script>
    var search = document.getElementById("#searchbtn");
    var sw = document.getElementById("#searchwindow");
    search.onclick = function () {
      if (sw.value == "") {
        alert('검색어를 입력하세요');
      }
    }
  </script> -->


</body>
<!-- <footer>
        
  </footer> -->

</html>