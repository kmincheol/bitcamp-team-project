<%@ page language="java" 
         contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>팀 생성</title>
  <jsp:include page="../commonCss.jsp"/>
  <link rel="stylesheet" href="${contextRootPath}/css/member_form.css">
</head>
<body>

<jsp:include page="../header.jsp"/>

<div id="container">
  <div id="content">
  <h1>팀을 <strong>생성</strong>할 수 있습니다.</h1><br>
  <h5>팀을 생성하면 다른팀과 경기를 진행할 수 있습니다.</h5>
            
<br>
  <hr class="hrblack"/>
    <div class="join_content">
<form id='add_form' action='add' method='post'>
      
        <div class="join_form" style="height:850px;">
          <div class="join_form_left" style="height:750px;">
            <!-- id, password -->
            <div class="row_group">
              <div class="join_row">
                <h3 class="join_title">
                  <label for="id">팀명</label>
                </h3>
                <span class="ps_box int_pass" id="idImg">
                  <input type="text" id="teamName" name="teamName" class="int" title="ID" maxlength="20" placeholder="ex)abcd102">
                </span>
                <span class="error_next_box" id="idMsg" style="display:none" role="alert"></span>
              </div>
             
            </div><!-- .row_group -->
            <!-- name, birthday -->
            <div class="row_group"> 
              <div class="join_row">
                <h3 class="join_title">
                  <label for="teamArea">활동 지역</label>
                </h3>
                 <span class="ps_box int_pass"  id="nameImg">
                  <input type="text" id="teamArea" name="teamArea" title="활동 지역" class="int" maxlength="40">
                </span> 
              </div>
              
               </div><!-- .row_group -->
            <!-- name, birthday -->
            <div class="row_group"> 
              <div class="join_row join_sex">
                <h3 class="join_title">
                  <label for="teamSportsId">종목</label>
                </h3>
                <div class="ps_box" id="genderBox">
                  <select id="teamSportsId" name="teamSportsId" class="sel" aria-label="종목">
                    <option value="" selected>종목 선택</option>
                    <c:forEach items="${teamTypeSports}" var="typeSports">
                   <option value="${typeSports.teamSportsTypeId}"
                      ${team.teamSportsId == typeSports.teamSportsTypeId ? "selected" : ""}>${typeSports.teamSportsType}
                    </option>
                    </c:forEach>
                  </select>
                </div>
                <span class="error_next_box" id="genderMsg" style="display:none" role="alert"></span>
              </div>
              
               <div class="join_row join_sex">
                <h3 class="join_title">
                  <label for="teamAgeId">연령대</label>
                </h3>
                <div class="ps_box" id="genderBox">
                  <select id="teamAgeId" name="teamAgeId" class="sel" aria-label="연령대">
                    <option value="" selected>연령대 선택</option>
                    <c:forEach items="${teamAges}" var="teamAge">
              <option value="${teamAge.teamAgeId}"
                ${team.teamAgeId == teamAge.teamAgeId ? "selected" : ""}>${teamAge.teamAges}
              </option>
            </c:forEach>
                  </select>
                </div>
                <span class="error_next_box" id="genderMsg" style="display:none" role="alert"></span>
              </div>
              
               <div class="join_row join_sex">
                <h3 class="join_title">
                  <label for="teamType">팀유형</label>
                </h3>
                <div class="ps_box" id="genderBox">
                  <select id="teamTypeId" name="teamTypeId" class="sel" aria-label="팀유형">
                    <option value="" selected>유형 선택</option>
                   <c:forEach items="${teamTypes}" var="teamType">
              <option value="${teamType.teamTypeId}"
                ${team.teamTypeId == teamType.teamTypeId ? "selected" : ""}>${teamType.teamType}
              </option>
            </c:forEach>
                  </select>
                </div>
                <span class="error_next_box" id="genderMsg" style="display:none" role="alert"></span>
              </div>
              
               <div class="join_row join_sex"> 
                <h3 class="join_title"> 
                  <label for="teamLevel">팀실력</label>
                </h3>
                <div class="ps_box" id="genderBox">
                  <select id="teamLevelId" name="teamLevelId" class="sel" aria-label="팀실력">
                    <option value="" selected>팀실력 선택</option>
                  <c:forEach items="${teamLevels}" var="teamLevel">
              <option value="${teamLevel.teamLevelId}"
                ${team.teamLevelId == teamLevel.teamLevelId ? "selected" : ""}>${teamLevel.teamLevel}
              </option>
            </c:forEach>
                  </select>
                </div>
                <span class="error_next_box" id="genderMsg" style="display:none" role="alert"></span>
              </div>

            </div><!-- .row_group -->
            <!-- mobile -->
            
          </div><!-- .join_form_left -->

          <div class="join_form_right" style="height:750px;">
           
             <div class="row_group join_photo">
              <div class="join_row join_photo_title">
                <h3 class="join_title" id="photo_title">
                  <label for="fileupload">앰블럼 사진<span class="terms_choice">(선택)</span></label>
                  <div class="file_input">
                  <input type="hidden" id="photo1" name="teamEmblemPhoto" value="${contextRootPath}/upload/emblem/vs.jpg">
                    <input type="text" readonly="readonly" title="File Route" id="file_route">
                    <label>
                       사진올리기
                      <input type="file" id="fileupload" name="files">
                    </label>
                  </div>
                </h3>
              </div>
              <div class="join_photo_view">
                <span class="photoView">
                  <label for="photo">
                    <img id="images-div1" src="${contextRootPath}/upload/emblem/vs.jpg" style="width: 200px; height: 200px;">
                  </label>
                </span>
              </div>
            </div><!-- .join_photo -->
       
       
       <!-- <div class="uniformPhoto">
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
            <span class="photoView"> <label for="photo"> 파일 이미지 보이게하기 - 배우면 적용
                <img id="images-div2" src="../../images/default.jpg"
                style="width: 200px; height: 200px;">
            </label>
            </span>
          </div>
        </div>
        </div> -->
      
                      
            <div class="row_group">
              
             
              <div class="join_row">
                <h3 class="join_title">
                  <label for="teamInfo">팀 소개<span class="terms_choice">(선택)</span></label>
                </h3>
                <div class="self_introduce_area">
                  <textarea class="ps_box self_introduce" id="teamInfo" name="teamInfo" placeholder="간단한 팀소개를 입력해주세요." rows="20" cols="30" style="height:180px;"></textarea>
                </div>
              </div> 
            </div><!-- .row_group -->  
          </div><!-- .join_form_right -->  
        </div><!-- .join_form -->
        <div class="btn_area">
                 <!-- 버튼과 관련된 영역 --> 
        <div class="form-group row" style="position:relative; left:330px; bottom:180px;">
          <div class="col-sm-10">
            <button class="input-group-btn btn btn-dark" id="add" style="width:300px;">생성하기</button>
            <a class="input-group-btn btn btn-dark" href='./'>취소</a>
          </div>
        </div> 
        </div><!-- .btn_area -->
      </form><!-- #join_form--> 
    </div><!-- .join_content -->
  </div><!-- .content -->
</div><!-- .container -->

<jsp:include page="../javascript.jsp"/>
<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-load-image/js/load-image.all.min.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-canvas-to-blob/js/canvas-to-blob.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload-process.js"></script> 
<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload-image.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

<script>
"use strict"

$('#fileupload').fileupload({
  autoUpload: false,
  disableImageResize: /Android(?!.*Chrome)|Opera/
        .test(window.navigator && navigator.userAgent),
  previewMaxWidth: 200,
  previewMaxHeight: 200,
  previewCrop: false,
  processalways: function(e, data) {
    var photo;
    for (var i = 0; i < data.files.length; i++) {
      try {
        if (data.files[i].preview.toDataURL) {
          photo = data.files[i].preview.toDataURL();
          $('#images-div1')
          .attr('src', data.files[i]
          .preview.toDataURL())
          $('#photo1').val(photo);
        }
      } catch (err) {
      }
    }
  }
});

/* $('.uniformtrue').on('click', function(){
  $(this).parent().parent().children('.uniform').show();
});
$('.uniformfalse').on('click', function(){
  $(this).parent().parent().children('.uniform').hide();
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
    }); */


</script>
</body>
</html>