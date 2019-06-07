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
  <link rel="stylesheet" href="${contextRootPath}/css/team_form.css">
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
      
        <div class="join_form" style="height:1500px;">
          <div class="join_form_left"style="height:1150px;"> 
            <!-- id, password --> 
            <div class="row_group"> 
              <div class="join_row"> 
                <h3 class="join_title"> 
                  <label for="id">팀명</label>
                </h3>
                <span class="ps_box int_pass" id="idImg">
                  <input type="text" id="id" name="teamName" class="int" title="ID" maxlength="20" placeholder="ex)FC비트캠프">
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
                <div class="ps_box" id="teamSportsIdBox">
                  <select id="teamSportsId" name="teamSportsId" class="sel" aria-label="종목">
                    <option value="" selected>종목 선택</option>
                    <c:forEach items="${teamTypeSports}" var="typeSports">
                    
                <c:choose>
                <c:when test="${typeSports.teamSportsType eq 'soccer'}">
                   <option value="${typeSports.teamSportsTypeId}"
                      ${team.teamSportsId == typeSports.teamSportsTypeId ? "selected" : ""}>축구
                    </option>
                </c:when>
                <c:when test="${typeSports.teamSportsType eq 'basketball'}">
                  <option value="${typeSports.teamSportsTypeId}"
                      ${team.teamSportsId == typeSports.teamSportsTypeId ? "selected" : ""}>농구
                    </option>
                </c:when> 
                <c:when test="${typeSports.teamSportsType eq 'baseball'}">
                 <option value="${typeSports.teamSportsTypeId}"
                      ${team.teamSportsId == typeSports.teamSportsTypeId ? "selected" : ""}>야구
                    </option>
                </c:when>
                <c:when test="${typeSports.teamSportsType eq 'pingpong'}">
                  <option value="${typeSports.teamSportsTypeId}"
                      ${team.teamSportsId == typeSports.teamSportsTypeId ? "selected" : ""}>탁구
                    </option>
                </c:when>
              </c:choose> 
                    
                    
                    </c:forEach>
                  </select>
                </div>
                <span class="error_next_box" id="teamSportsIdMsg" style="display:none" role="alert"></span>
              </div>
              
               <div class="join_row join_sex">
                <h3 class="join_title">
                  <label for="teamAgeId">연령대</label>
                </h3>
                <div class="ps_box" id="teamAgeIdBox">
                  <select id="teamAgeId" name="teamAgeId" class="sel" aria-label="연령대">
                    <option value="" selected>연령대 선택</option>
                    <c:forEach items="${teamAges}" var="teamAge">
              <option value="${teamAge.teamAgeId}"
                ${team.teamAgeId == teamAge.teamAgeId ? "selected" : ""}>${teamAge.teamAges}
              </option>
            </c:forEach>
                  </select>
                </div>
                <span class="error_next_box" id="teamAgeIdMsg" style="display:none" role="alert"></span>
              </div>
              
               <div class="join_row join_sex">
                <h3 class="join_title">
                  <label for="teamType">팀유형</label>
                </h3>
                <div class="ps_box" id="teamTypeIdBox">
                  <select id="teamTypeId" name="teamTypeId" class="sel" aria-label="팀유형">
                    <option value="" selected>유형 선택</option>
                   <c:forEach items="${teamTypes}" var="teamType">
              <option value="${teamType.teamTypeId}"
                ${team.teamTypeId == teamType.teamTypeId ? "selected" : ""}>${teamType.teamType}
              </option>
            </c:forEach>
                  </select>
                </div>
                <span class="error_next_box" id="teamTypeIdMsg" style="display:none" role="alert"></span>
              </div>
              
               <div class="join_row join_sex"> 
                <h3 class="join_title"> 
                  <label for="teamLevel">팀실력</label>
                </h3>
                <div class="ps_box" id="teamLevelIdBox">
                  <select id="teamLevelId" name="teamLevelId" class="sel" aria-label="팀실력">
                    <option value="" selected>팀실력 선택</option>
                  <c:forEach items="${teamLevels}" var="teamLevel">
                  
                <c:choose>
                <c:when test="${teamLevel.teamLevel eq 'high'}">
                   <option value="${teamLevel.teamLevelId}"
                ${team.teamLevelId == teamLevel.teamLevelId ? "selected" : ""}>상
              </option>
                </c:when>
                
                   <c:when test="${teamLevel.teamLevel eq 'mid'}">
                   <option value="${teamLevel.teamLevelId}"
                ${team.teamLevelId == teamLevel.teamLevelId ? "selected" : ""}>중
              </option>
                </c:when>
                
                   <c:when test="${teamLevel.teamLevel eq 'low'}">
                   <option value="${teamLevel.teamLevelId}"
                ${team.teamLevelId == teamLevel.teamLevelId ? "selected" : ""}>하
              </option>
                </c:when>
               
              </c:choose> 
            </c:forEach>
                  </select>
                </div>
                <span class="error_next_box" id="teamLevelIdMsg" style="display:none" role="alert"></span>
              </div>

            </div><!-- .row_group -->
            <!-- mobile -->
            
          </div><!-- .join_form_left --> 
 
          <div class="join_form_right">
             
             <div class="row_group join_photo">
              <div class="join_row join_photo_title">
                <h3 class="join_title" id="photo_title"> 
                  <label for="fileupload">앰블럼 사진<span class="terms_choice">(선택하지 않으면 기본사진이 들어갑니다.)</span></label>
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
       <br><br> 
       
        <div class="uniformPhoto">
        <label for="photo" class="col-sm-5 col-form-label"><b>팀 유니폼</b></label>
          <br><br> 
          <div class="radiobtn" style="position:relative; left:170px;">
        <span class="custom-control custom-radio" style="position:relative; right:50px; width:60px;">
          <input type="radio" class="uniformtrue custom-control-input" id="defaultUnchecked" name="teamUniform">
          <label class="custom-control-label" for="defaultUnchecked">있음</label> 
        </span>
 
        <span class="custom-control custom-radio" style="position:relative; left:40px; bottom:24px; width:60px;"> 
          <input type="radio" class="uniformfalse custom-control-input" id="defaultChecked" name="teamUniform"
            checked> <label class="custom-control-label" for="defaultChecked">없음</label>
        </span>
        </div>
      <br><br> 
        
        
          <div class="uniform" style="display:none;">
              <div class="join_row join_photo_title">
                <h3 class="join_title" id="photo_title"> 
                  <label for="fileupload2">유니폼 사진 등록<span class="terms_choice"></span></label>
                  <div class="file_input">
                  <input type="hidden" id="photo2" name="teamUniformPhoto" value="">
                    <input type="text" readonly="readonly" title="File Route" id="file_route">
                    <label> 
                       사진올리기
                      <input type="file" id="fileupload2" name="files"> 
                    </label>
                  </div> 
                </h3>
              </div>
              <div class="join_photo_view">
                <span class="photoView"> 
                  <label for="photo"> 
                    <img id="images-div2" src="../../images/default.jpg"
                style="width: 150px; height: 150px;">
                  </label>
                </span>
              </div>
            </div><!-- .join_photo -->
        
            <div class="row_group">
              <div class="join_row">
                <h3 class="join_title">
                  <label for="teamInfo">팀 소개<span class="terms_choice">(선택)</span></label>
                </h3>
                <div class="self_introduce_area">
                  <textarea class="ps_box self_introduce" id="teamInfo" name="teamInfo" placeholder="간단한 팀소개를 입력해주세요." rows="20" cols="30" style="height:90px;"></textarea>
                </div> 
              </div>  
            </div><!-- .row_group -->  
          </div><!-- .join_form_right -->   
        </div><!-- .join_form -->
        </div>
           <div class="btn_area" style="position:relative; bottom: 390px;">
          <button class="btn btn_type btn-outline-secondary sunext" id="btnCreate" type="button">생성하기</button>
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

 $('.uniformtrue').on('click', function(){
  $(this).parent().parent().parent().children('.uniform').show();
});
$('.uniformfalse').on('click', function(){
  $(this).parent().parent().parent().children('.uniform').hide();
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
    
    
var idFlag = false;
var pwFlag = false;

$(document).ready(function() {
  defaultScript();

  
  $('#teamSportsId').change(function() {
    checkteamSportsId();
  });
  
  $('#teamAgeId').change(function() {
    checkteamAgeId();
  });
  
  $('#teamTypeId').change(function() {
    checkteamTypeId();
  });
  
  $('#teamLevelId').change(function() {
    checkteamLevelId();
  });
  
  $('#btnCreate').click(function(event) {
    submitClose();
   
    if (idFlag) {
      mainSubmit();
    } else {
      setTimeout(function() {
      mainSubmit();
      }, 700);
    }
  });
});
  
  function mainSubmit() { 
    if (!checkUnrealInput()) {
      submitOpen();
      return false;
    }
    if (idFlag) {
      $('#add_form').submit();
    } else {
      submitOpen();
      return false;
    }
  }
  
  function submitClose() {
    $('#btnJoin').attr("disabled", true);
  }
  
  function submitOpen() {
    $('#btnJoin').attr("disabled", false);
  }
  
  
  function checkUnrealInput() {

    if (checkId() &
        checkteamSportsId() &
        checkteamAgeId() &
        checkteamTypeId() &
        checkteamLevelId()
        ) {
          return true;
        } else {
          return false;
        }
  }
  

  $('#id').keyup(debounce(function() {
   idFlag = false;
   checkId("first");
  }, 500));


function defaultScript() {
  $('.ps_box').click(function() {
    $(this).children('input').focus();
    $(this).addClass('focus');
  }).focusout(function() {
    var welInputText = $('.ps_box');
    welInputText.removeClass('focus');
  });
};

function showErrorMsg(obj, msg) {
  obj.attr("class", "error_next_box");
  obj.html(msg);
  obj.show();
}

function showSuccessMsg(obj, msg) {
  obj.attr("class", "error_next_box green");
  obj.html(msg);
  obj.show();
}

function showDefaultBox(oBox) {
  oBox.attr("class", "ps_box");
}

function showErrorBox(oBox) {
  oBox.attr("class", "ps_box discord");
}

function showDefaultBoxByPen(oBox) {
  oBox.attr("class", "ps_box int_pass");
}

function showSuccessBoxBySuccess(oBox) {
  oBox.attr("class", "ps_box int_pass_check accord");
}

function showErrorBoxByError(oBox) {
  oBox.attr("class", "ps_box int_pass_check2 discord");
}

function showDefaultBoxByOK(oBox) {
  oBox.attr("class", "ps_box int_pass_check");
}

function hideMsg(obj) {
  obj.hide();
}


// 팀이름 체크
function checkId(event) {
  if (idFlag) {
    return true;
  }

  var id = $('#id').val();
  var oMsg = $('#idMsg');
  var oImg = $('#idImg');

  if (id == "") {
    showErrorMsg(oMsg, "팀명을 입력해주세요.");
    showErrorBoxByError(oImg);
    return false;
  }
  
  var isId =   /^[a-zA-Z0-9가-힣][a-zA-Z0-9가-힣]{3,14}$/; // 15자까지
  if (!isId.test(id)) {
    showErrorMsg(oMsg, "한글과 알파벳 대 소문자를 사용하세요.<br>특수기호와 공백은 사용할 수 없습니다.");
    showErrorBoxByError(oImg);
    return false; 
  }
 
  idFlag = false;
  
  $.ajax({
    type: "GET",
    url: "checkId?teamName=" + id,
    success : function(data) {
      var result = data.substr(7);

      if (result == "1") {
        if (event == "first") {
          showSuccessMsg(oMsg, "사용가능한 팀명 입니다!");
          showDefaultBoxByOK(oImg);
        } else {
          showDefaultBoxByOK(oImg);
          hideMsg(oMsg);
        }
        idFlag = true;
      } else {
        showErrorMsg(oMsg, "이미 사용중인 팀명 입니다.");
        showErrorBoxByError(oImg);
      }
    }
  });
  
  return true;
}

// 종목 체크
function checkteamSportsId() {
  var sports = $('#teamSportsId').val();
  var oMsg = $('#teamSportsIdMsg');
  var oBox = $('#teamSportsIdBox');

  if (sports == "") {
    showErrorMsg(oMsg, "종목을 선택해주세요.");
    showErrorBox(oBox);
    return false;
  }
  showDefaultBox(oBox);
  hideMsg(oMsg);
  return true;
}

// 연령대 체크
function checkteamAgeId() {
  var ages = $('#teamAgeId').val();
  var oMsg = $('#teamAgeIdMsg');
  var oBox = $('#teamAgeIdBox');

  if (ages == "") {
    showErrorMsg(oMsg, "연령대를 선택해주세요.");
    showErrorBox(oBox);
    return false;
  }
  showDefaultBox(oBox);
  hideMsg(oMsg);
  return true;
}

// 팀유형 체크
function checkteamTypeId() {
  var type = $('#teamTypeId').val();
  var oMsg = $('#teamTypeIdMsg');
  var oBox = $('#teamTypeIdBox');

  if (type == "") {
    showErrorMsg(oMsg, "팀유형을 선택해주세요.");
    showErrorBox(oBox);
    return false;
  }
  showDefaultBox(oBox);
  hideMsg(oMsg);
  return true;
}

// 팀 실력 체크
function checkteamLevelId() {
  var level = $('#teamLevelId').val();
  var oMsg = $('#teamLevelIdMsg');
  var oBox = $('#teamLevelIdBox');

  if (level == "") {
    showErrorMsg(oMsg, "팀실력을 선택해주세요.");
    showErrorBox(oBox);
    return false;
  }
  showDefaultBox(oBox);
  hideMsg(oMsg);
  return true;
}



function debounce(func, wait, immediate) {
  var timeout;

  return function executedFunction() {
    var context = this;
    var args = arguments;
      
    var later = function() {
      timeout = null;
      if (!immediate) func.apply(context, args);
    };

    var callNow = immediate && !timeout;
  
    clearTimeout(timeout);

    timeout = setTimeout(later, wait);
  
    if (callNow) func.apply(context, args);
  };
};



</script>
</body>
</html>