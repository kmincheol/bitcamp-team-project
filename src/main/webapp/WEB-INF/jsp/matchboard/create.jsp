<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>

<html>
<head>
  <title>매치보드</title>
   <jsp:include page="../header.jsp"/>
   <jsp:include page="../commonCss.jsp"/>
   <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">
</head>
<body>

  

  <div class="container">
    <h2><b>매치 글</b>을 <b>등록</b>할 수 있습니다.</h2>
    <br>
    <p><b>매치</b> 글을 등록한 후</p>
    <p>다른 팀의<b>대결 신청을 받아</b>경기를 진행해 보세요.</p>
   
    <table id="match_table" class="table table-bordered">
  <thead>
    <tr>
    <th scope="row">경기일</th>
      <td>
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">지역</th>
      <td>
       <div class="form-group row">
           <div class="col-sm">
              <div class="input-group mb-2">
                <select name='loc1' class="custom-select" id="inputGroupSelect01">
          <option selected>지역선택</option>
            <option value="1">서울</option>
            <option value="2">경기</option>
            <option value="3">충청</option>
            <option value="4">전라</option>
            <option value="5">충청</option>
            <option value="6">경상</option>
            <option value="7">제주</option>
                </select>
              </div>
            </div>
            </div>
      </td>
    </tr>
    <tr>
      <th scope="row">경기유형</th>
      <td>
        <div class="form-group row">
           <div class="col-sm">
              <div class="input-group mb-2">
                <select name='loc1' class="custom-select" id="inputGroupSelect01">
          <option selected>종목선택</option>
            <option value="1">축구</option>
            <option value="2">농구</option>
            <option value="3">야구</option>
            <option value="4">배구</option>
            <option value="5">탁구</option>
            <option value="6">족구</option>
            <option value="7">E-Sports</option>
                </select>
              </div>
            </div>
            </div>
      </td>
    </tr>
     <tr>
      <th scope="row">소속팀</th>
      <td>
        <div class="form-group row">
           <div class="col-sm">
              <div class="input-group mb-2">
                <select name='loc1' class="custom-select" id="inputGroupSelect01">
          <option selected>소속팀 선택</option>
            <option value="1">FC북한</option>
                </select>
              </div>
            </div>
            </div>
      </td>
    </tr>
    <tr>
      <th scope="row">비용</th>
      <td>
        <input type="number">
      </td>
    </tr>
    <tr>
      <th scope="row">내용</th>
      <td>
       <textarea rows="10" cols="50"></textarea>
      </td>
    </tr>
    <tr>
      <th scope="row">태그</th>
      <td>
      	<input type="text">
      </td>
    </tr>
  </tbody>
     <jsp:include page="createSideBar.jsp"/> 
</table>
    <div class="button">
      <a href="#" class="btn btn-secondary btn-lg disabled" tabindex="-1" role="button" aria-disabled="true">미리보기</a>
      <a href="#" class="btn btn-secondary btn-lg disabled" tabindex="-1" role="button" aria-disabled="true">글등록</a>
	</div>
	
	<br><br><br><br><br>
	
  </div> <!-- .container -->

</body>
</html>
