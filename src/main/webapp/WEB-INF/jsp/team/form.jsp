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
        <form id='add_form' action='add' method='post'>

          <div class="join_form" style="height: 1300px;">
            <div class="join_form_left" style="height: 800px;">
              <!-- id, password -->
              <div class="row_group">
                <div class="join_row">
                  <h3 class="join_title">
                    <label for="id">팀명</label>
                  </h3>
                  <span class="ps_box int_pass" id="idImg"> <input type="text" id="id"
                    name="teamName" class="int" title="ID" maxlength="20" placeholder="ex)FC비트캠프">
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
                  <input type="hidden" name="teamArea" id=teamArea value="">
                   <select name="teamArea1" onChange="cat1_change(this.value,teamArea2)" id="area_select"
                    class="custom-select" style="box-shadow: 0 0 0px 0px;">
                    <option>-선택-</option>
                    <option value='1'>서울</option>
                    <option value='2'>부산</option> 
                    <option value='3'>대구</option>
                    <option value='4'>인천</option>
                    <option value='5'>광주</option>
                    <option value='6'>대전</option>
                    <option value='7'>울산</option>
                    <option value='8'>강원</option>
                    <option value='9'>경기</option>
                    <option value='10'>경남</option>
                    <option value='11'>경북</option>
                    <option value='12'>전남</option>
                    <option value='13'>전북</option>
                    <option value='14'>제주</option>
                    <option value='15'>충남</option>
                    <option value='16'>충북</option>
                  </select>  
                  <select name="teamArea2" id="local_select" class="custom-select"
                    style="box-shadow: 0 0 0px 0px;">
                    <option>-선택-</option>
                  </select>
                </div>

              </div>
              <!-- .row_group -->
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
                    <label for="fileupload">앰블럼 사진<span class="terms_choice">(선택하지
                        않으면 기본사진이 들어갑니다.)</span></label>
                    <div class="file_input">
                      <input type="hidden" id="photo1" name="teamEmblemPhoto"
                        value="${contextRootPath}/upload/emblem/vs.jpg"> <input type="text"
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

              <div class="uniformPhoto">
                <br>

                <div class="uniform" style="display: none;">
                  <div class="join_row join_photo_title">
                    <h3 class="join_title" id="photo_title">
                      <label for="fileupload2">유니폼 사진 등록<span class="terms_choice"></span></label>
                      <div class="file_input">
                        <input type="hidden" id="photo2" name="teamUniformPhoto" value=""> <input
                          type="text" readonly="readonly" title="File Route" id="file_route">
                        <label> 사진올리기 <input type="file" id="fileupload2" name="files">
                        </label>
                      </div>
                    </h3>
                  </div>
                  <div class="join_photo_view">
                    <span class="photoView"> <label for="photo"> <img
                        id="images-div2" src="../../images/default.jpg"
                        style="width: 150px; height: 150px;">
                    </label>
                    </span>
                  </div>
                </div>
                <!-- .join_photo -->

                <div class="row_group">
                  <div class="join_row">
                    <h3 class="join_title">
                      <label for="teamInfo">팀 소개<span class="terms_choice">(선택)</span></label>
                    </h3>
                    <div class="self_introduce_area">
                      <textarea class="ps_box self_introduce" id="teamInfo" name="teamInfo"
                        placeholder="간단한 팀소개를 입력해주세요." rows="20" cols="30" style="height: 90px;"></textarea>
                    </div>
                  </div>
                </div>
                <!-- .row_group -->
              </div>
              <!-- .join_form_right -->
            </div>
            <!-- .join_form -->
          </div>
          <div class="btn_area" style="position: relative; bottom: 500px;">
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

 var cat1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16); 
 var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북');
 var cat2_num = new Array(); 
 var cat2_name = new Array();
 cat2_num[1] = new Array(17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41);
 cat2_name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
 cat2_num[2] = new Array(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57);
 cat2_name[2] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
 cat2_num[3] = new Array(58,59,60,61,62,63,64,65);
 cat2_name[3] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');
 cat2_num[4] = new Array(66,67,68,69,70,71,72,73,74,75);
 cat2_name[4] = new Array('계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
 cat2_num[5] = new Array(76,77,78,79,80);
 cat2_name[5] = new Array('광산구','남구','동구','북구','서구');
 cat2_num[6] = new Array(81,82,83,84,85);
 cat2_name[6] = new Array('대덕구','동구','서구','유성구','중구');
 cat2_num[7] = new Array(86,87,88,89,90);
 cat2_name[7] = new Array('남구','동구','북구','중구','울주군');
 cat2_num[8] = new Array(91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108);
 cat2_name[8] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');
 cat2_num[9] = new Array(109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148);
 cat2_name[9] = new Array('고양시 덕양구','고양시 일산구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','하남시','화성시','가평군','양주군','양평군','여주군','연천군','포천군');
 cat2_num[10] = new Array(149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168);
 cat2_name[10] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');
 cat2_num[11] = new Array(169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192);
 cat2_name[11] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
 cat2_num[12] = new Array(193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214);
 cat2_name[12] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
 cat2_num[13] = new Array(215,216,217,218,219,220,221,222,223,224,225,226,227,228,229);
 cat2_name[13] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
 cat2_num[14] = new Array(230,231,232,233);
 cat2_name[14] = new Array('서귀포시','제주시','남제주군','북제주군');
 cat2_num[15] = new Array(234,235,236,237,238,239,240,241,242,243,244,245,246,247,248);
 cat2_name[15] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
 cat2_num[16] = new Array(249,250,251,252,253,254,255,256,257,258,259,260);
 cat2_name[16] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');

function cat1_change(key,sel){
 if(key == '') return;
 var name = cat2_name[key];
 var val = cat2_num[key];
 for(i=sel.length-1; i>=0; i--)
  sel.options[i] = null;
 sel.options[0] = new Option('-선택-','', '', 'true');
 for(i=0; i<name.length; i++){
  sel.options[i+1] = new Option(name[i],val[i]);
 }

}

$('#local_select').on('click', function (){
  var area = $('#area_select').val(); 
  var area2 = $('#local_select').val(); 
 
  console.log(area)
  console.log(area2)
  
 $('#teamArea').val(area + area2)
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