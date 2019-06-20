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

          <div class="join_form">
            <div class="join_form_left" style="height: 800px;">
              <!-- id, password -->
              <div class="row_group">
                <div class="join_row">
                  <h3 class="join_title">
                    <label for="id">팀명</label>
                  </h3>
                  <span class="ps_box int_pass" id="idImg"> 
                  <input type="text" id="teamName" name="teamName"  title="ID" maxlength="20"  value="${team.teamName}" readonly / >
                  </span>  <span class="error_next_box" id="idMsg" style="display: none" role="alert"></span> 
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
                 <input type="text" id="topLocation" name="topLocation"title="ID" maxlength="20"  value="${team.topLocation.topLocationName}" readonly / >
                  </span>
                  
                    <span class="ps_box" style="width:195px; display:inline-block;"> 
                       <input type="text" id="middleLocation" name="middleLocation"  title="ID" maxlength="20"  value="${team.middleLocation.middleLocationName}" readonly / >
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
                  <div class="ps_box" id="teamSportsIdBox">
               <input type="text" id="teamTypeSports" name="teamTypeSports"  title="ID" maxlength="20"  value="${team.teamTypeSports.teamSportsType}" readonly / >
                    </div>
                  <span class="error_next_box" id="teamSportsIdMsg" style="display: none"
                    role="alert"></span>
                </div>
        <form id='add_form' action='update' method='post'>
             <input type="hidden" name="teamId" value="${team.teamId}">
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
                      <label for="teamInfo">팀 소개<span class="terms_choice">(선택)</span></label>
                    </h3>
                    <div class="self_introduce_area">
                      <textarea class="ps_box self_introduce" id="teamInfo" name="teamInfo"
                        placeholder="${team.teamInfo}" rows="20" cols="30" style="height: 90px;"></textarea>
                        <span id="counter">0/150</span> 
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
            <button class="btn btn_type btn-outline-secondary sunext" id="btnCreate" >변경하기</button>
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
<script type="text/javascript">

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
</script>


</body>
</html>