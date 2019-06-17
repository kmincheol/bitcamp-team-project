<%@ page language="java" 
         contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>BATTLE MATCHING :: 상세정보입력</title>
  <jsp:include page="../commonCss.jsp"/>
    <!-- header -->
  <jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />
  <!-- commonSidebar css -->
  <jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />
  <!-- footer.css -->
  <link rel="stylesheet" href="${contextRootPath}/css/footer.css">
  <link rel="stylesheet" href="${contextRootPath}/css/member_additionalForm.css">
  <script src="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
  <link href="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet"> 
</head>
<body style="background:white">
<jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />
<jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />
 
<div id="container">
  <div id="content">
            
    <div class="join_step">
      <img src="${contextRootPath}/images/logo.png" class="joinImg">
    </div>

    <div class="join_content">
      <form id="join_form" action="option-update" method='POST'>
        <input type="hidden" id="birthday" name="birthDay" value="">
        <input type="hidden" id="photo" name="photo" value="">
      
        <div class="join_form">
          <div class="join_form_input">
          
            <div class="join_row join_birthday">
                <h3 class="join_title">
                  <label for="yy">생년월일</label>
                </h3>
                <div class="bir_wrap">
                  <div class="bir_yy">
                    <span class="ps_box" id="biryy">
                      <input type="text" id="yy" placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4">
                    </span>
                  </div>
                  <div class="bir_mm">
                    <span class="ps_box" id="birmm">
                      <select id="mm" class="sel" aria-label="월">
                        <option value="month">월</option>
                          <option value="01">1</option>
                          <option value="02">2</option>
                          <option value="03">3</option>
                          <option value="04">4</option>
                          <option value="05">5</option>
                          <option value="06">6</option>
                          <option value="07">7</option>
                          <option value="08">8</option>
                          <option value="09">9</option>
                          <option value="10">10</option>
                          <option value="11">11</option>
                          <option value="12">12</option>
                      </select>
                    </span>
                  </div>
                  <div class="bir_dd">
                    <span class="ps_box" id="birdd">
                      <input type="text" id="dd" placeholder="일" aria-label="일" class="int" maxlength="2">
                      <label for="dd" class="lbl"></label>
                    </span>
                  </div>
                </div>
                <span class="error_next_box" id="birthdayMsg" style="display:none" role="alert"></span>
              </div>
              
              <div class="join_row join_sex">
                <h3 class="join_title">
                  <label for="gender">성별</label>
                </h3>
                <div class="ps_box" id="genderBox">
                  <select id="gender" name="gender" class="sel" aria-label="성별">
                    <option value="" selected>성별</option>
                    <option value="남자">남자</option>
                    <option value="여자">여자</option>
                  </select>
                </div>
                <span class="error_next_box" id="genderMsg" style="display:none" role="alert"></span>
              </div>
              
                   
              <!-- mobile -->
              <div class="join_row">
                <h3 class="join_title">
                  <label for="phoneNo">휴대전화</label>
                </h3>
                  <span class="ps_box int_pass" id="telBox">
                    <input type="tel" id="phoneNo" name="tel" placeholder="전화번호를 입력하세요." aria-label="전화번호를 입력하세요." class="int" maxlength="16">          
                  </span>
                 <input id="btnSend" type="button" value="인증번호받기" class="btn btn-sm btn-outline-dark emailBtn">
                <span class="error_next_box" id="phoneNoMsg" style="display:none" role="alert"></span>
              </div><!-- .join_row-->
              
              <div class="join_row join_email join_authNo_confirm">
                <span class="ps_box int_pass" id="authNoBox">
                  <input type="tel" id="authNo" placeholder="인증번호를 입력하세요"  class="int" maxlength="6" disabled>
                </span>
                <input id="authSend" type="button" value="인증하기" class="btn btn-sm btn-outline-dark emailBtn">
                <span class="error_next_box" id="authNoMsg" style="display:none" role="alert"></span>
              </div>
              
              <div class="join_photo">
              <div class="join_row join_photo_title">
                <h3 class="join_title" id="photo_title">
                  <label for="fileupload" style="cursor: pointer">프로필 사진<span class="terms_choice">(선택)</span></label>
                </h3>
                  <span class="ps_box" id="profileBox">
                    <input type="text" readonly="readonly" title="File Route" id="file_route">
                  </span>
                  <button type="button" id="fileupload1" class="btn btn-sm btn-outline-dark emailBtn">사진올리기</button>
                  <input type="file" id="fileupload" name="files" style="display:none">
                  <button type="button" id="uploadCancel" class="btn btn-sm btn-outline-dark emailBtn">취소하기</button>
              </div>
              <div class="join_photo_view">
                <span class="photoView">
                  <label for="fileupload" style="cursor: pointer">
                    <img id="images-div" src="../../images/profile.png">
                  </label>
                </span>
              </div>
            </div><!-- .join_photo -->
            <div class="row_addr">
              <div class="join_row">
                <h3 class="join_title">
                  <label for="addressBtn">주소/상세주소</label>
                </h3>
                <div class="address_area">
                  <span class="ps_box" id="postBox">
                    <input class="int" placeholder="우편번호" name="post" id="addr1" type="text" readonly="readonly" maxlength="5">
                  </span>
                  <input id="addressBtn" type="button" class="btn btn-sm btn-outline-dark addressBtn" value="우편번호찾기"> 
                </div>
                <div class="addressInputBox">
                  <span class="ps_box" id="baseAddr">
                    <input class="int" placeholder="도로명 주소" name="baseAddress" id="addr2" type="text" readonly="readonly" />
                  </span>
                </div>
                <div class="addressInputBox">
                  <span class="ps_box" id="detailAddr">
                    <input class="int" placeholder="상세주소" name="detailAddress" id="addr3" type="text"/>
                  </span>
                </div>
                <span class="error_next_box" id="addressMsg" style="display:none" role="alert"></span>
              </div>
              <div class="join_row">
                <h3 class="join_title">
                  <label for="self_introduce">자기소개<span class="terms_choice">(선택)</span></label>
                </h3>
                <div class="self_introduce_area">
                  <textarea class="ps_box self_introduce" id="self_introduce" name="selfIntroduce" placeholder="간단한 자기소개를 입력해주세요." rows="5" cols="30"></textarea>
                </div>
              </div>
            </div><!-- .row_addr -->
            
          </div><!-- .join_form_input -->
          
          
        </div><!-- .join_form -->
        <div class="btn_area">
          <button class="btn btn_type btn-outline-dark" id="btnJoin" type="button">저장하기</button>
        </div><!-- .btn_area -->
      </form><!-- #join_form-->
    </div><!-- .join_content -->
  </div><!-- .content -->
</div><!-- .container -->

<jsp:include page="../javascript.jsp"/>
<jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />
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

$('#fileupload').change(function() {
  var filename = $(this).val().replace(/c:\\fakepath\\/i, '');
  $('#file_route').val(filename);
});

var authFlag = false;
var telFlag = false;

$(document).ready(function() {
  defaultScript();

  if ($('#yy').val() != "") {
    checkBirthday();
  }

  $('#yy').keyup(debounce(function() {
    checkBirthday();
  }, 500));

  $('#mm').change(function() {
    checkBirthday();
  });

  $('#dd').keyup(debounce(function() {
   checkBirthday();
  }, 500));

  $('#gender').change(function() {
    checkGender();
  });
  
  $('#phoneNo').keyup(debounce(function() {
    checkPhoneNo();
  }, 500));
  
  $('#authNo').keyup(debounce(function() {
    checkAuthNo();
   }, 500));
  
  $('#btnSend').click(function() {
    sendSms();
    return false;
  });
  
  $('#authSend').click(function() {
    authFlag = false;
    checkAuthnoByAjax();
    return false;
  });

  $('#addressBtn').click(function() {
   execPostCode();
   return false;
  });
  
  $('#fileupload1').click(function (e) {
    e.preventDefault();
    $('#fileupload').click();
    });
  
  $('#uploadCancel').click(function() {
    $('#images-div').attr('src', "../../images/profile.png");
    $('#photo').val('');
    console.log($('#photo').val());
    $('.file_input input[type=text]').val('');
    return false;
  });

  $('#btnJoin').click(function(event) {
    submitClose();
    if (telFlag && authFlag) {
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
  if (telFlag && authFlag) {
    redirect();
  } else {
    submitOpen();
    return false;
  }
}

function redirect() {
  var message = "추가정보입력이 완료되었습니다! <br>다시 로그인 해주시기 바랍니다!";
  if ('' != '') {
      message = '${message}'; 
  }
  Swal.fire({
    type: 'success',
    title: message
  }).then(function(result) {
    if (result.value) {
      $('#join_form').submit();
      location.href = "http://localhost:8080/bitcamp-team-project/app/auth/form";
    }
  })
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

  if (checkBirthday() &
      checkGender() &
      checkPhoneNo() & 
      checkAuthNo() &
      checkAddress()
      ) {
        return true;
      } else {
        return false;
      }
}

function showErrorMsg(obj, msg) {
  obj.attr("class", "error_next_box");
  obj.html(msg);
  obj.show();
}

function showDefaultBoxByPen(oBox) {
  oBox.attr("class", "ps_box int_pass");
}

function showDefaultBox(oBox) {
  oBox.attr("class", "ps_box");
}

function showDefaultBoxByOK(oBox) {
  oBox.attr("class", "ps_box int_pass_check");
}

function showDefaultBoxByPen(oBox) {
  oBox.attr("class", "ps_box int_pass");
}

function showSuccessBoxBySuccess(oBox) {
  oBox.attr("class", "ps_box int_pass_check accord");
}

function showErrorBox(oBox) {
  oBox.attr("class", "ps_box discord");
}

function showErrorBoxByError(oBox) {
  oBox.attr("class", "ps_box int_pass_check2 discord");
}

function showSuccessMsg(obj, msg) {
  obj.attr("class", "error_next_box green");
  obj.html(msg);
  obj.show();
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

function checkAddress() {
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
}

function checkBirthday() {
  var birthday;
  var birthdaySave;
  var yy = $('#yy').val();
  var mm = $('#mm').val();
  var dd = $('#dd').val();
  var oMsg = $('#birthdayMsg');
  var lang = "ko_KR";
  var biryy = $('#biryy');
  var birmm = $('#birmm');
  var birdd = $('#birdd');

  showDefaultBox(biryy);
  showDefaultBox(birmm);
  showDefaultBox(birdd);

  if (yy == "" && mm == "month" && dd == "") {
    showErrorMsg(oMsg, "생년월일을 정확하게 입력하세요.");
    showErrorBox(biryy);
    showErrorBox(birmm);
    showErrorBox(birdd);
    return false;
  }

  if (mm.length == 1) {
    mm = "0" + mm;
  }

  if (dd.length == 1) {
    dd = "0" + dd;
  }

  if (yy == "") {
    showErrorMsg(oMsg, "출생년도 4자리를 정확하게 입력하세요.");
    showErrorBox(biryy);
    return false;
  }
  if (yy.length != 4 || yy.indexOf('e') != -1 || yy.indexOf('E') != -1 ) {
    showErrorMsg(oMsg, "출생년도 4자리를 정확하게 입력하세요.");
    showErrorBox(biryy);
    return false;
  }
  if (mm == "month") {
    showErrorMsg(oMsg, "태어난 월을 선택하세요.");
    showErrorBox(birmm);
    return false;
  }
  if (dd == "") {
    showErrorMsg(oMsg, "태어난 일(날짜) 2자리를 정확하게 입력하세요.");
    showErrorBox(birdd);
    return false;
  }
  if (dd.length != 2 || dd.indexOf('e') != -1 || dd.indexOf('E') != -1) {
    showErrorMsg(oMsg, "태어난 일(날짜) 2자리를 정확하게 입력하세요.");
    showErrorBox(birdd);
    return false;
  }

  birthday = yy + mm + dd;
  if (!isValidDate(birthday)) {
    showErrorMsg(oMsg, "생년월일을 다시 확인해주세요.");
    showErrorBox(biryy);
    showErrorBox(birmm);
    showErrorBox(birdd);
    return false;
  }
  birthdaySave = yy + "-" + mm + "-" + dd;
  $("#birthday").val(birthdaySave);

  var age = calcAge(birthday);
  if (age < 0) {
    showErrorMsg(oMsg, "생년월일을 다시 확인해주세요.");
    showErrorBox(biryy);
    showErrorBox(birmm);
    showErrorBox(birdd);
    return false;
  } else if (age >= 100) {
    showErrorMsg(oMsg, "생년월일을 다시 확인해주세요.");
    showErrorBox(biryy);
    showErrorBox(birmm);
    showErrorBox(birdd);
    return false;
  } else if (age < 14) {
    showErrorMsg(oMsg, "14세미만 회원에게는 서비스를 제공하지 않습니다.");
    showErrorBox(biryy);
    showErrorBox(birmm);
    showErrorBox(birdd);
    return false;
  } else {
    showDefaultBox(biryy);
    showDefaultBox(birmm);
    showDefaultBox(birdd);
    hideMsg(oMsg);
    return true;
  }
  return true;
}

function isValidDate(param) {
  try {
    param = param.replace(/-/g, '');

    if (isNaN(param) || param.length != 8) {
      return false;
    }

    var year = Number(param.substring(0, 4));
    var month = Number(param.substring(4, 6));
    var day = Number(param.substring(6, 8));

    if (month < 1 || month > 12) {
      return false;
    }

    var maxDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    var maxDay = maxDaysInMonth[month - 1];

    // 윤년 체크
    if (month == 2 && (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {
      maxDay = 29;
    }
    
    if (day <= 0 || day > maxDay) {
      return false;
    }

    return true;
  } catch (err) {
    return false;
  }
}

function calcAge(birth) {
  var date = new Date();
  var year = date.getFullYear();
  var month = (date.getMonth() + 1);
  var day = date.getDate();
  if (month < 10) {
    month = '0' + month;
  }
  if (day < 10) {
    day = '0' + day;
  }
  var monthDay = month + '' + day;

  birth = birth.replace('-', '').replace('-', '');

  var birthdayy = birth.substr(0, 4);
  var birthdaymd = birth.substr(4, 8);
  var age = monthDay < birthdaymd ? year -birthdayy - 1 : year - birthdayy;
  return age;
}

function checkGender() {
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
}

function checkPhoneNo() {
  var phoneNo = $('#phoneNo').val();
  var oMsg = $('#phoneNoMsg');
  var oImg = $('#telBox');

  if (phoneNo == "") {
    showErrorMsg(oMsg, "전화번호를 입력해주세요.");
    showErrorBoxByError(oImg);
    return false;
  }

  phoneNo = phoneNo.replace(/ /gi, "").replace(/-/gi, "");
  
  if (!isCellPhone(phoneNo)) {
    showErrorMsg(oMsg, "형식에 맞지 않는 번호입니다.");
    showErrorBoxByError(oImg);
    return false;
  }

  hideMsg(oMsg);
  showDefaultBoxByOK(oImg);
  telFlag = true;
  return true;
}

function isCellPhone(p) {
  var regPhone = /^((01[1|6|7|8|9])[1-9][0-9]{6,7})$|(010[1-9][0-9]{7})$/;
  return regPhone.test(p);
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


function sendSms() {
  var telAuth = $('#phoneNo').val();
  var oMsg = $('#phoneNoMsg');
  var oBox = $('#joinCode');
  var authNoBox = $('#authNoBox');
  var authNoMsg = $('#authNoMsg');
  
  if (!telFlag) {
    showErrorBoxByError(oBox);
    return false;
  }

  $.ajax({
    type:"POST",
    url:'smsSend',
    contentType: 'application/json',
    dataType: "text",
    data:JSON.stringify({
      tel: telAuth
    }),
    success : function(data) {
      var result = data.substr(3);
      if (result == "1") {
        showSuccessMsg(oMsg,"인증 SMS를 발송했습니다.<br>인증 SMS가 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요.<br>");
        $("#authNo").attr("disabled", false);
        showDefaultBoxByOK(oBox);
        showDefaultBoxByPen(authNoBox);
        authNoMsg.hide();
        // 타이머 박스 생각해볼것
      } else if (result == "0") {
        showErrorMsg(oMsg, "인증 중에 오류가 발생했습니다. 다시 인증 버튼을 눌러주세요.");
        showErrorBoxByError(oBox);
      } else {
        showErrorMsg(oMsg, "인증 SMS 발송에 실패했습니다. 전화번호를 확인해주세요.");
        showErrorBoxByError(oBox);
      }
    }
  });

  return false;
};

function checkAuthNo() {
  var authNo = $('#authNo').val();
  var oMsg = $('#authNoMsg');
  var oBox = $('#authNoBox');
  var isNum = /^[0-9]+$/;

  if (authNo == "") {
    showErrorMsg(oMsg, "인증번호를 입력해주세요.");
    showErrorBoxByError(oBox);
    return false;
  }
  
  if (!isNum.test(authNo)) {
    showErrorMsg(oMsg, "숫자만 입력할 수 있습니다.");
    showErrorBoxByError(oBox);
    return false;
  }

  if (authNo.length < 6) {
    showErrorMsg(oMsg, "인증번호 6자리를 모두 입력해주세요.");
    showErrorBoxByError(oBox);
    return false;
  }

  if (authFlag) {
    showSuccessMsg(oMsg, "SMS 인증에 성공했습니다.");
    showSuccessBoxBySuccess(oBox);
    $('#phoneNoMsg').hide();
    $("#authNo").attr("disabled", true);
    return true;
  } else {
    showSuccessMsg(oMsg, "인증버튼을 눌러 인증을 진행해주세요.");
    showDefaultBoxByPen(oBox);
    return false;
  }
}


function checkAuthnoByAjax() {
  var authNo = $('#authNo').val();
  var telAuth = $("#phoneNo").val();
  var typeAuth = $('#authType').val();
  var oMsg = $('#authNoMsg');
  var oBox = $('#authNoBox');

  $.ajax({
    type: "POST",
    url: "checkSmsNo",
    contentType: 'application/json',
    dataType: "text",
    data: JSON.stringify({
      smsKey: authNo,
      tel: telAuth
    }),
    success: function(data) {
      var result = data.substr(4);
      if (result == "0") {
        showSuccessMsg(oMsg, "SMS 인증에 성공했습니다.");
        showSuccessBoxBySuccess(oBox);
        $("#smsMsg").hide();
        $("#authNo").attr("disabled", true);
        authFlag = true;
      } else {
        showErrorMsg(oMsg, "인증번호를 다시 확인해주세요.");
        showErrorBoxByError(oBox);
      }
    }
  });
  return false;
}


</script>
</body>
</html>