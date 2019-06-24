<%@ page language="java" 
         contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <title>BATTLE MATCHING :: 상세정보입력</title>
  <!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">

  <link rel="stylesheet" href="${contextRootPath}/css/member_additionalForm.css"> 
   
 
<style>
  h2 {
text-align: center;
margin: 15px;
}
</style>

</head>
<body style="background:white">

  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />

<div id="container">
  <div id="content">
            <h2>프로필 정보를 <b>확인하고 수정</b>할 수 있습니다.</h2>
    <%-- <div class="join_step">
      <img src="${contextRootPath}/images/logo.png" class="joinImg">
    </div> --%>
   <c:choose>
      <c:when test="${empty member}">
        <p>해당하는 회원이 없습니다.</p>
      </c:when>

      <c:otherwise>  
  
    <div class="join_content">
      <form id="profChange_form" action="update" method='POST' enctype='multipart/form-data'> 
        <input type="hidden" id="photo" name="photo" value="${member.photo}"> 
        <div class="join_form"> 
          <div class="join_form_input">
          
          <input type="hidden" name="no" value="${member.no}">
              
                <!-- name -->
              <div class="join_row">
                <h3 class="join_title">
                  <label for="name">이름</label>
                </h3>
                <div class="int_mobile_area">
                  <span class="name ps_box int_pass" id="nameImg">
                    <input type="tel" id="phoneNo" name="name"  class="int" maxlength="16" value='${member.name}'readonly>            
                  </span>  
                </div>
                <span class="error_next_box" id="tel" style="display:none" role="alert"></span>  
              </div><!-- .join_row-->
              
              
              <!-- mobile -->
              <div class="join_row">
                <h3 class="join_title">
                  <label for="phoneNo">휴대전화</label>
                </h3>
                <div class="int_mobile_area">
                  <span class="ps_box int_pass" id="telImg">
                    <input type="tel" id="phoneNo" name="tel" placeholder="전화번호를 입력하세요." aria-label="전화번호를 입력하세요." class="int" maxlength="16" value='${member.tel}'>          
                  </span>
                </div>
                <span class="error_next_box" id="phoneNoMsg" style="display:none" role="alert"></span>
              </div><!-- .join_row-->
              
              <div class="row_group join_photo">
              <div class="join_row join_photo_title">
                <h3 class="join_title" id="photo_title">
                  <label for="fileupload" style="cursor: pointer">프로필 사진<span class="terms_choice">(선택)</span></label>
                  <span class="file_input">
                    <input type="text" readonly="readonly" title="File Route" id="file_route" style="display:none;"> 
                    <label for="fileupload"> 
                       사진올리기  
                      <input type="file" id="fileupload" name="files"> 
                    </label>
                    <label for="uploadCancel">
                       취소하기
                      <input type="button" id="uploadCancel">
                    </label>
                  </span>
                </h3>
              </div>
              <div class="join_photo_view">
                <span class="photoView">
                  <label for="fileupload" style="cursor: pointer">
                    <img id="images-div" src="${member.photo}">
                  </label>
                </span>
              </div>
            </div><!-- .join_photo -->
            <div class="row_group">
             <%--  <div class="join_row">
                <h3 class="join_title">
                  <label for="addressBtn">주소/상세주소</label>
                </h3>
                <div class="address_area">
                  <span class="ps_box" id="postBox">
                    <input class="int" placeholder="우편번호" value="${member.post}" name="post" id="addr1" type="text" readonly="readonly" maxlength="5">${member.post} 
                  </span> 
                  <input id="addressBtn" type="button" class="btn-sm addressBtn" value="우편번호찾기">   
                </div>  
                <div> 
                  <span class="ps_box" id="baseAddr">
                    <input class="int" placeholder="도로명 주소" value="${member.baseAddress}"name="baseAddress" id="addr2" type="text" readonly="readonly" />
                  </span> 
                </div>
                <div> 
                  <span class="ps_box" id="detailAddr">
                    <input class="int" placeholder="상세주소" value="${member.detailAddress}" name="detailAddress" id="addr3" type="text"/>
                  </span>
                </div>
                <span class="error_next_box" id="addressMsg" style="display:none" role="alert"></span> 
              </div> --%>
              <div class="join_row"> 
                <h3 class="join_title">
                  <label for="self_introduce">자기소개<span class="terms_choice">(선택)</span></label>
                </h3>
                <div class="self_introduce_area">
                  <textarea class="ps_box self_introduce" id="self_introduce" name="selfIntroduce" placeholder="간단한 자기소개를 입력해주세요." rows="5" cols="30">${member.selfIntroduce}</textarea>
                </div>
              </div>
            </div><!-- .row_group -->
            
          </div><!-- .join_form_input -->
          
          
        </div><!-- .join_form -->
        <div class="btn_area">
          <button class="btn btn_type btn-outline-secondary sunext" data-toggle="modal" data-target="#exampleModalCenter" type="button">저장하기</button>
        </div><!-- .btn_area -->
        
        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">프로필 변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        프로필을 변경하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary"  id="btnJoin">확인</button>
      </div>
    </div>
  </div>
</div>
        
      </form><!-- #join_form-->
          
    </div><!-- .join_content -->
    </c:otherwise>
    </c:choose>
  </div><!-- .content -->
</div><!-- .container -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-load-image/js/load-image.all.min.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-canvas-to-blob/js/canvas-to-blob.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload-process.js"></script> 
<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload-image.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />


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
          $('#images-div')
          .attr('src', data.files[i]
          .preview.toDataURL())
          $('#photo').val(photo);
        }
      } catch (err) {
      }
    }
  }
});

/* $('.file_input input[type=file]').change(function() {
  var filename = $(this).val().replace(/c:\\fakepath\\/i, '');
  $('.file_input input[type=text]').val(filename);
}); */

$(document).ready(function() {
  defaultScript();
  
/* 
  $('#gender').change(function() {
    checkGender();
  }); */

  $('#addressBtn').click(function() {
   execPostCode();
   return false;
  });
  
  $('#uploadCancel').click(function() {
    $('#images-div').attr('src', "../../images/profile.png");
    $('#photo').val('');
    console.log($('#photo').val());
    $('.file_input input[type=text]').val('');
    return false;
  });

  $('#btnJoin').click(function(event) {
    /* submitClose(); */
    mainSubmit();

  });
  
});


function mainSubmit() {
  $('#profChange_form').submit();
  
/*     submitOpen();  
    return false; 
 */
 }

function submitClose() {
  $('#btnJoin').attr("disabled", true);
}

function submitOpen() {
  $('#btnJoin').attr("disabled", false);
}

function defaultScript() {
  $('.ps_box').click(function() {
    $(this).children('input').focus();
    $(this).addClass('focus');
  }).focusout(function() {
    var welInputText = $('.ps_box');
    welInputText.removeClass('focus');
  });
};

function checkUnrealInput() {
 
/*   if (
      checkAddress()  
      ) { 
        return true;
      } else { 
        return false; 
      }
 */}

function showErrorMsg(obj, msg) {
  obj.attr("class", "error_next_box");
  obj.html(msg);
  obj.show();
}


function showDefaultBox(oBox) {
  oBox.attr("class", "ps_box");
}

function showErrorBox(oBox) {
  oBox.attr("class", "ps_box discord");
}

function hideMsg(obj) {
  obj.hide();
}

function execPostCode() {
  
  daum.postcode.load(function(){
    new daum.Postcode({
      oncomplete: function(data) {

        var fullRoadAddr = data.roadAddress;
        var extraRoadAddr = ''; 

        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
          extraRoadAddr += data.bname;
        }
                
        if(data.buildingName !== '' && data.apartment === 'Y'){
          extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
                
        if(extraRoadAddr !== ''){
          extraRoadAddr = ' (' + extraRoadAddr + ')';
        }
                
        if(fullRoadAddr !== ''){
          fullRoadAddr += extraRoadAddr;
        }
                
        $("[name=post]").val(data.zonecode);
        $("[name=baseAddress]").val(fullRoadAddr);
                
        checkAddress();
      }
    }).open();
  });
}

/* function checkAddress() {
  var post = $('#addr1').val();
  var postBox = $('#postBox');
  var baseAddrBox = $('#baseAddr');
  var detailAddrBox = $('#detailAddr');
  var oMsg = $('#addressMsg');
  
  if (post == "") {
    showErrorMsg(oMsg, "우편번호찾기를 눌러 주소를 검색하신 후 입력해주세요.");
    showErrorBox(postBox);
    showErrorBox(baseAddrBox); 
    showErrorBox(detailAddrBox);
    return false;
  }

  showDefaultBox(postBox);
  showDefaultBox(baseAddrBox);
  showDefaultBox(detailAddrBox);
  hideMsg(oMsg);
  return true;
} */

/* function checkGender() {
  var gender = $('#gender').val();
  var oMsg = $('#genderMsg');
  var oBox = $('#genderBox');

  if (gender == "") {
    showErrorMsg(oMsg, "성별을 선택해주세요.");
    showErrorBox(oBox);
    return false;
  }
  showDefaultBox(oBox);
  hideMsg(oMsg);
  return true;
} */


</script>
</body>
</html>