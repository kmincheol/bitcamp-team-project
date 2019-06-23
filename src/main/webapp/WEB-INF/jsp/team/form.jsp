<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 생성</title>

<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />
<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" /> 
<link rel="stylesheet" href="${contextRootPath}/css/common.css"> 
<!-- footer.css --> 
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">
<link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
  integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
  crossorigin="anonymous">
<link rel="stylesheet"  
  href="${contextRootPath}/node_modules/jplist-es6/dist/1.2.0/jplist.styles.css" />
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet"
  href="${contextRootPath}/node_modules/jplist-es6/dist/1.2.0/jplist.styles.css" />
<link rel="stylesheet" href="${contextRootPath}/css/team_form.css">
<jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

<jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />

<style>
.page-wrapper{
height: auto;
}
</style> 
</head>
<body>   

  <div id="container">
    <div id="content">
      <h1>
        팀을 <strong>생성</strong>할 수 있습니다.
      </h1>
      <br>
      <h5>팀을 생성하면 다른팀과 경기를 진행할 수 있습니다.</h5>

      <br>
      <hr class="hrblack" />
      <div class="join_content">
      <%-- <c:forEach items="${member}" var="member">
      <input id="userId" type="hidden" value="${member.id}">
      </c:forEach> --%>
        <form id='add_form' action='add' method='post'>
          <div class="join_form">
            <div class="join_form_left" style="height: 800px;">
              <!-- id, password -->
              <div class="row_group">
                <div class="join_row">
                  <h3 class="join_title">
                    <label for="id">팀명</label>
                  </h3>
                  <span class="ps_box int_pass" id="idImg"> 
                  <input type="text" id="teamName" name="teamName" class="int" title="ID" maxlength="20" placeholder="ex)FC비트캠프">
                  </span> <span class="error_next_box" id="idMsg" style="display: none" role="alert"></span> 
                </div>

              </div>
              <!-- .row_group -->
              <!-- name, birthday -->
              <div class="row_group">
                <div class="join_row">
                  <h3 class="join_title">
                    <label for="teamArea">활동 지역</label>
                  </h3>
                  <!-- <input type="hidden" name="teamArea" id=teamArea value=""> -->
                  <div class="locationDiv">
                   <span class="ps_box" style="width:195px; display:inline-block;"> 
                  <select id="topLocation" class="sel" aria-label="시"> 
                      <option value="" selected>시 선택</option>
                      <c:forEach items="${topLocations}" var="topLocation">
                        <option value="${topLocation.topLocationNo}"
                          ${team.topLocation.topLocationId == topLocation.topLocationId ? "selected" : ""}>${topLocation.topLocationName}
                        </option>
                      </c:forEach>
                    </select>
                  </span>
                  
                    <span class="ps_box" style="width:195px; display:inline-block;"> 
                   <select id="middleLocation"  class="sel" aria-label="구"> 
                      <option value="" selected>구 선택</option> 
                    </select>
                  </span>
                  
                  </div>
                  <input type="hidden" name="teamArea" id="area" value="">
                </div>

              </div>
              <!-- .row_group -->
              <!-- name, birthday -->
              <div class="row_group">
                <div class="join_row join_sex">
                  <h3 class="join_title">
                    <label for="teamSportsId">종목</label>
                  </h3>
                  <div class="ps_box" id="teamSportsIdBox" style="z-index:10;">
                    <select id="teamSportsId" name="teamSportsId" class="sel" aria-label="종목">
                      <option value="" selected>종목 선택</option>
                      <c:forEach items="${teamTypeSports}" var="typeSports">
                            <option value="${typeSports.teamSportsTypeId}"
                              ${team.teamSportsId == typeSports.teamSportsTypeId ? "selected" : ""}>${typeSports.teamSportsType}
                            </option>  
                      </c:forEach> 
                    </select>
                  </div>
                  <span class="error_next_box" id="teamSportsIdMsg" style="display: none"
                    role="alert"></span>
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
                  <span class="error_next_box" id="teamAgeIdMsg" style="display: none" role="alert"></span>
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
                  <span class="error_next_box" id="teamTypeIdMsg" style="display: none" role="alert"></span>
                </div>

                <div class="join_row join_sex">
                  <h3 class="join_title">
                    <label for="teamLevel">팀실력</label>
                  </h3>
                  <div class="ps_box" id="teamLevelIdBox">
                    <select id="teamLevelId" name="teamLevelId" class="sel" aria-label="팀실력">
                      <option value="" selected>팀실력 선택</option>
                      <c:forEach items="${teamLevels}" var="teamLevel">
                            <option value="${teamLevel.teamLevelId}"
                              ${team.teamLevelId == teamLevel.teamLevelId ? "selected" : ""}>${teamLevel.teamLevel} 
                            </option>
                      </c:forEach>
                    </select>
                  </div>
                  <span class="error_next_box" id="teamLevelIdMsg" style="display: none"
                    role="alert"></span>
                </div>

              </div>
              <!-- .row_group -->
              <!-- mobile -->

            </div>
            <!-- .join_form_left -->

            <div class="join_form_right" style="height:800px;">

              <div class="row_group join_photo">
                <div class="join_row join_photo_title">
                  <h3 class="join_title" id="photo_title">
                    <label for="fileupload">앰블럼 사진<div class="terms_choice">(선택하지
                        않으면 기본사진이 들어갑니다.)</div></label>
                    <div class="file_input">
                      <input type="hidden" id="photo1" name="teamEmblemPhoto"
                        value="${contextRootPath}/upload/emblem/vs.jpg"> <input type="hidden"
                        readonly="readonly" title="File Route" id="file_route"> <label>
                        사진올리기 <input type="file" id="fileupload" name="files">
                      </label>
                    </div>
                  </h3>
                </div>
                <div class="join_photo_view">
                  <span class="photoView"> <label for="photo"> <img id="images-div1"
                      src="${contextRootPath}/upload/emblem/vs.jpg"
                      style="width: 200px; height: 200px;">
                  </label>
                  </span>
                </div>
              </div>
              <!-- .join_photo -->
              <br>
              <br>

                <div class="row_group">
                  <div class="join_row">
                    <h3 class="join_title">
                      <label for="teamInfo">팀 소개<div class="terms_choice">(선택)</div></label>
                    </h3>    
                    <div class="self_introduce_area">
                      <textarea class="ps_box self_introduce" id="teamInfo" name="teamInfo"
                        placeholder="간단한 팀소개를 입력해주세요." rows="20" cols="30" style="height: 135px;"></textarea>     
                        <span id="counter">0/20</span> 
                    </div> 
                  </div>
                </div> 
                <!-- .row_group -->
              </div>
              <!-- .join_form_right -->
            </div>
            <!-- .join_form -->
          </div>
          <div class="btn_area">
            <button class="btn btn_type btn-outline-secondary sunext" id="btnCreate" type="button">생성하기</button>
          </div>
          <!-- .btn_area -->
        </form>
        <!-- #join_form-->
      </div>
      <!-- .join_content -->
    </div>
    <!-- .content -->
  </div>
  <!-- .container -->
 <!-- JQuery -->
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp"/>
    <!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.2/js/mdb.min.js"></script>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" /> 
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
        $(document).ready(function(){
       $('#teamInfo').on('keydown', function() {
          if($(this).val().length > 20) {
              $(this).val($(this).val().substring(0, 20));
          }
          
          var content = $(this).val();
          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
          $('#counter').html(content.length + '/20');
      }); 
      $('#teamInfo').keyup(); 
        });
      
 $('#topLocation').change(function() {
   var no = $(this).val(); 
   console.log(no) 
    
    $.getJSON('./AddressCheck', 
         {
       no: no 
         },
       function(obj) {
         if (obj.status == 'success') { 
           var location = new Array;
           var subLocation = obj.middleLocations 
           var length = subLocation.length; 
             $('#middleLocation').html('');
             
             for (var i = 0; i < length; i++) {
               var option = $(
                   "<option value='" + subLocation[i].middleLocationId+ "'>" + subLocation[i].middleLocationName + "</option>"); 
                
               $(option).appendTo($('#middleLocation'));
             }
             var top = $('#topLocation').val(); 
             var mid = $('#middleLocation').val(); 
            
             console.log(top)
             console.log(mid)
             
            $('#area').val(top + mid) 
            console.log($('#area').val())
             
           } 
           }); 
 });
 
 $('#middleLocation').on('click', function(){
   
     var top = $('#topLocation').val(); 
     var mid = $('#middleLocation').val(); 
    
     console.log(top)
     console.log(mid)
     
    $('#area').val(top + mid) 
    console.log($('#area').val())
   });
   
      $('#fileupload').fileupload(
          {
            autoUpload : false,
            disableImageResize : /Android(?!.*Chrome)|Opera/
                .test(window.navigator && navigator.userAgent),
            previewMaxWidth : 200,
            previewMaxHeight : 200,
            previewCrop : false,
            processalways : function(e, data) {
              var photo;
              for (var i = 0; i < data.files.length; i++) {
                try {
                  if (data.files[i].preview.toDataURL) {
                    photo = data.files[i].preview.toDataURL();
                    $('#images-div1').attr('src',
                        data.files[i].preview.toDataURL())
                    $('#photo1').val(photo);
                  }
                } catch (err) {
                }
              }
            }
          });

      $('.uniformtrue').on('click', function() {
        $(this).parent().parent().parent().children('.uniform').show();
      });
      $('.uniformfalse').on('click', function() {
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

      function logOut() {
        $.ajax({
          url     : '${ContextRootPath}/app/team/reLogout',
          type    : 'GET',
          sendDataType : 'json',
          async   : false
        })
        .done(function(json) {
          sessionStorage.clear();
        });
      }

      function logIn() {
        var id = $('#userId').val();
        $.ajax({
          url     : '${ContextRootPath}/app/team/reLogin?id=' + id,
          type    : 'GET',
          sendDataType : 'json',
          async   : false
        })
      }
      
      
      
      
      function submitClose() {
        $('#btnJoin').attr("disabled", true);
      }

      function submitOpen() {
        $('#btnJoin').attr("disabled", false);
      }

      function checkUnrealInput() {

        if (checkId() & checkteamSportsId() & checkteamAgeId()
            & checkteamTypeId() & checkteamLevelId()) {
          return true;
        } else {
          return false;
        }
      }

      $('#teamName').keyup(debounce(function() {
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

        var id = $('#teamName').val();
        var oMsg = $('#idMsg');
        var oImg = $('#idImg');

        if (id == "") {
          showErrorMsg(oMsg, "팀명을 입력해주세요.");
          showErrorBoxByError(oImg);
          return false;
        }

        var isId = /^[a-zA-Z0-9가-힣][a-zA-Z0-9가-힣]{3,14}$/; // 15자까지
        if (!isId.test(id)) {
          showErrorMsg(oMsg, "한글과 알파벳 대 소문자를 사용하세요.<br>특수기호와 공백은 사용할 수 없습니다.");
          showErrorBoxByError(oImg);
          return false;
        }

        idFlag = false;

        $.ajax({
          type : "GET",
          url : "checkId?teamName=" + id,
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
            if (!immediate)
              func.apply(context, args);
          };

          var callNow = immediate && !timeout;

          clearTimeout(timeout);

          timeout = setTimeout(later, wait);

          if (callNow)
            func.apply(context, args);
        };
      };
    </script>
</body>
</html>