<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>

<html>
<head>
  <title>매치보드</title>
   <jsp:include page="../commonCss.jsp"/>
   <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">
</head>
<body>

  <jsp:include page="../header.jsp" />

  <div class="container">
  
    <h2>등록된 <b>매치 글</b>을 검색하여 찾거나</h2>
    <h2>직접 매치글을 등록할 수 있습니다.</h2>
    <br>
    <p>원하는 <b>검색 결과에 맞춰</b> 경기를 매칭시키거나</p>
    <p><b>추천 매칭</b>을 통하여 경기를 매칭시켜보세요.</p>
    
    <table class="table table-bordered">
  <thead>
    <tr>
    <th scope="row">날짜 선택</th>
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
      <th scope="row">연령대</th>
      <td>
        <div class="form-group row">
           <div class="col-sm">
              <div class="input-group mb-2">
                <select name='loc1' class="custom-select" id="inputGroupSelect01">
          <option selected>연령대선택</option>
            <option value="1">10대</option>
            <option value="2">20대</option>
            <option value="3">30대</option>
            <option value="4">40대</option>
            <option value="5">50대 이상</option>
                </select>
              </div>
            </div>
            </div>
      </td>
    </tr>
    <tr>
      <th scope="row">실력</th>
      <td>
        <div class="form-group row">
           <div class="col-sm">
              <div class="input-group mb-2">
                <select name='loc1' class="custom-select" id="inputGroupSelect01">
          <option selected>실력선택</option>
            <option value="1">상</option>
            <option value="2">중상</option>
            <option value="3">중</option>
            <option value="4">중하</option>
            <option value="5">하</option>
                </select>
              </div>
            </div>
            </div>
      </td>
    </tr>
    <tr>
      <th scope="row">키워드</th>
      <td></td>
    </tr>
  </tbody>
</table>
    
    <div class="button">
      <a href="#" class="btn btn-secondary btn-lg disabled" tabindex="-1" role="button" aria-disabled="true">검색</a>
      <a href="#" class="btn btn-secondary btn-lg disabled" tabindex="-1" role="button" aria-disabled="true">등록</a>
    </div>
  </div> <!-- .container -->
  
  
  
</body>
</html>
