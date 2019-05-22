<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>팀 생성</title>
<jsp:include page="../commonCss.jsp" />
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
</head>
<body>

  <div class="container">
    <h1>팀 생성</h1>
    <br>

    <section>
      <form id='add_form' action='add' method='post'>

    <!--   <div class="form-group row" style="display:none;">
          <label for="teamMember" class="col-sm-10 col-form-label">팀장</label>
          <div class="col-sm-10">
            <input class="form-control" id="teamMember" name='teamMember'>
          </div>
        </div> -->

        <div class="form-group row">
          <label for="teamName" class="col-sm-10 col-form-label">팀명</label>
          <div class="col-sm-10">
            <input class="form-control" id="teamName" name='teamName'>
          </div>
        </div>

        <div class="form-group row">
          <label for="area" class="col-sm-10 col-form-label">활동 지역</label>
          <div class="col-sm-10">
            <input class="form-control" id="area" name='teamArea'>
          </div>
        </div>

        <label for="typeSports" class="col-sm-2 col-form-label">경기 유형</label>
        <div class="col-sm-10">
          <select class="custom-select" name='teamSportsId'>
            <c:forEach items="${teamTypeSports}" var="typeSports">
              <option value="${typeSports.teamSportsTypeId}"
                ${team.teamSportsId == typeSports.teamSportsTypeId ? "selected" : ""}>${typeSports.teamSportsType}
              </option>
            </c:forEach>
          </select>
        </div>

        <label for="teamAges" class="col-sm-2 col-form-label">연령대</label>
        <div class="col-sm-10">
          <select class="custom-select" name='teamAgeId'>
            <c:forEach items="${teamAges}" var="teamAge">
              <option value="${teamAge.teamAgeId}"
                ${team.teamAgeId == teamAge.teamAgeId ? "selected" : ""}>${teamAge.teamAges}
              </option>
            </c:forEach>
          </select>
        </div>

        <label for="teamType" class="col-sm-2 col-form-label">팀유형</label>
        <div class="col-sm-10">
          <select class="custom-select" name='teamTypeId'>
            <c:forEach items="${teamTypes}" var="teamType">
              <option value="${teamType.teamTypeId}"
                ${team.teamTypeId == teamType.teamTypeId ? "selected" : ""}>${teamType.teamType}
              </option>
            </c:forEach>
          </select>
        </div>

        <hr>
       <p style="text-align: center; font-size: 18px;"> <b>상세 정보 입력란</b> </p>
        <hr>

        <label for="teamLevel" class="col-sm-2 col-form-label">팀실력</label>
        <div class="col-sm-10">
          <select class="custom-select" name='teamLevelId'>
            <c:forEach items="${teamLevels}" var="teamLevel">
              <option value="${teamLevel.teamLevelId}"
                ${team.teamLevelId == teamLevel.teamLevelId ? "selected" : ""}>${teamLevel.teamLevel}
              </option>
            </c:forEach>
          </select> 
        </div>
        <hr>
       
        <label for="photo" class="col-sm-5 col-form-label" style="font-size:30px;"><b>팀 앰블럼</b></label><br>
        <label for="photo" class="col-sm-10 col-form-label" style="font-size:22px;">지정하지 않으면 기본 사진이 들어갑니다.</label>
          <br><br> 
      
          <div class="emblem">
            <h3 class="join_title">
              <input type="hidden" id="photo1" name="teamEmblemPhoto" value="../../upload/emblem/vs.jpg">
            </h3>

            <input id="fileupload1" type="file" name="files" value="파일첨부"><br>
          <div class="join_photo_view">
            <span class="photoView"> 
            <label for="photo"> 
             <img id="images-div1" src="../../upload/emblem/vs.jpg" style="width: 200px; height: 200px;">
            </label>
            </span>
          </div>
          </div>
        <br>
        <br>
        <hr>
       
       <div class="uniformPhoto">
        <div class="custom-control custom-radio">
        <label for="photo" class="col-sm-5 col-form-label" style="font-size:30px;"><b>팀 유니폼</b></label>
          <br><br> 
          <input type="radio" class="uniformtrue custom-control-input" id="defaultUnchecked" name="teamUniform">
          <label class="custom-control-label" for="defaultUnchecked">있음</label>
        </div>
 
        <div class="custom-control custom-radio">
          <input type="radio" class="uniformfalse custom-control-input" id="defaultChecked" name="teamUniform"
            checked> <label class="custom-control-label" for="defaultChecked">없음</label>
        </div>
      <br><br>
        <div class="uniform" style="display:none;">
          <div class="join_photo_title">
            <h3 class="join_title">
              <label for="photo">유니폼 사진 등록<span class="terms_choice"></span></label> 
              <input type="hidden" id="photo2" name="teamUniformPhoto" value=" ">
            </h3>

            <input id="fileupload2" type="file" name="files" value="파일첨부"><br>
          </div>
          <div class="join_photo_view">
            <span class="photoView"> <label for="photo"> <!-- 파일 이미지 보이게하기 - 배우면 적용 -->
                <img id="images-div2" src="../../images/default.jpg"
                style="width: 200px; height: 200px;">
            </label>
            </span>
          </div>
        </div>
        </div>

        <hr>
        <div class="form-group row">
          <label for="teamInfo" class="col-sm-10 col-form-label">팀 소개</label>
          <div class="col-sm-10">
            <textarea class="form-control" name='teamInfo'> </textarea>
          </div>
        </div>

        <!-- 버튼과 관련된 영역 -->
        <div class="form-group row">
          <div class="col-sm-10">
            <a class="input-group-btn btn btn-dark" href='./'>목록</a>
            <button class="input-group-btn btn btn-dark" id="add">작성하기</button>
          </div>
        </div>
      </form>
    </section>
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />
  <script src="${contextRootPath}/node_modules/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
  <script src="${contextRootPath}/node_modules/blueimp-load-image/js/load-image.all.min.js"></script>
  <script src="${contextRootPath}/node_modules/blueimp-canvas-to-blob/js/canvas-to-blob.js"></script>
  <script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
  <script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload.js"></script>
  <script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload-process.js"></script>
  <script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload-image.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

  <script type="text/javascript">
  
  $('.uniformtrue').on('click', function(){
    $(this).parent().parent().children('.uniform').show();
  });
  $('.uniformfalse').on('click', function(){
    $(this).parent().parent().children('.uniform').hide();
  });
  
  
      $('#fileupload1').fileupload(
          {
            autoUpload : false, // 파일을 추가할 때 자동 업로딩 하지 않도록 설정.
            disableImageResize : /Android(?!.*Chrome)|Opera/
                .test(window.navigator && navigator.userAgent), // 안드로이드와 오페라 브라우저는 크기 조정 비활성 시키기
            previewMaxWidth : 400, // 미리보기 이미지 너비
            previewMaxHeight : 400, // 미리보기 이미지 높이 
            previewCrop : true, // 미리보기 이미지를 출력할 때 원본에서 지정된 크기로 자르기
            processalways : function(e, data) { //Callback for the end (done or fail) of an individual file processing queue.
              var photo;
              for (var i = 0; i < data.files.length; i++) {
                try {
                  if (data.files[i].preview.toDataURL) {
                    // Base64로 바이너리 데이터를 텍스트로 변환해서 추가
                    photo = data.files[i].preview.toDataURL();
                    $('#images-div1').attr('src',
                        data.files[i].preview.toDataURL()).css('width',
                        '200px', 'heigth', '200px');
                    $('#photo1').val(photo);
                  }
                } catch (err) {
                }
              }
            }
          });

      $('#fileupload2').fileupload(
          {
            autoUpload : false, // 파일을 추가할 때 자동 업로딩 하지 않도록 설정.
            disableImageResize : /Android(?!.*Chrome)|Opera/
                .test(window.navigator && navigator.userAgent), // 안드로이드와 오페라 브라우저는 크기 조정 비활성 시키기
            previewMaxWidth : 400, // 미리보기 이미지 너비
            previewMaxHeight : 400, // 미리보기 이미지 높이 
            previewCrop : true, // 미리보기 이미지를 출력할 때 원본에서 지정된 크기로 자르기
            processalways : function(e, data) { //Callback for the end (done or fail) of an individual file processing queue.
              var photo;
              for (var i = 0; i < data.files.length; i++) {
                try {
                  if (data.files[i].preview.toDataURL) {
                    // Base64로 바이너리 데이터를 텍스트로 변환해서 추가
                    photo = data.files[i].preview.toDataURL();
                    $('#images-div2').attr('src',
                        data.files[i].preview.toDataURL()).css('width',
                        '200px', 'heigth', '200px');
                    $('#photo2').val(photo);
                  }
                } catch (err) {
                }
              }
            }
          });
    </script>
</body>
</html>