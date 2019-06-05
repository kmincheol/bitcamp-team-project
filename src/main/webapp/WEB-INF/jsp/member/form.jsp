<%@ page language="java" 
         contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원정보입력</title>
  <jsp:include page="../commonCss.jsp"/>
  <link rel="stylesheet" href="${contextRootPath}/css/member_form.css">
  <!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.2/css/mdb.min.css" rel="stylesheet">
</head>
<body style="background:white">
 
 
<div id="container">
  <div id="content">
  <h1>스포츠 매칭 <strong>홈페이지</strong> 방문을 환영합니다.</h1>
            
    <div class="join_step">
      <img src="../../images/signUp2.png">
    </div>

  <hr class="hrblack"/>

    <div class="join_content">
      <form id="join_form" action="enter" method='POST'>
        <input type="hidden" id="birthday" name="birthDay" value="">
        <input type="hidden" id="photo" name="photo" value="">
        <input type="hidden" id="loginType" name="loginType" value="homepage"> 
        <input type="hidden" id="authType" name="authType" value="join"> 
      
        <div class="join_form">
          <div class="join_form_left">
            <!-- id, password -->
            <div class="row_group">
              <div class="join_row">
                <h3 class="join_title">
                  <label for="id">아이디</label>
                </h3>
                <span class="ps_box int_pass" id="idImg">
                     <input type="text" id="id" name="id" class="int" title="ID" maxlength="20" placeholder="ex)abcd102">
                </span>
                <span class="error_next_box" id="idMsg" style="display:none" role="alert"></span>
              </div>
              <div class="join_row">
                <h3 class="join_title">
                  <label for ="pswd1">비밀번호</label>
                </h3>
                <span class="ps_box int_pass" id="pswd1Img">
                  <input type="password" id="pswd1" name="password" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
                </span>
                <span class="error_next_box" id="pswd1Msg" style="display:none" role="alert">5~12자의 영문 소문자, 숫자와 특수기호(...)만 사용 가능합니다.</span>
                <h3 class="join_title">
                  <label for="pswd2">비밀번호 재확인</label>
                </h3>
                <span class="ps_box int_pass" id="pswd2Img">
                  <input type="password" id="pswd2" name="pswd2" class="int" title="비밀번호 재확인 입력" maxlength="20">
                </span>
                <span class="error_next_box" id="pswd2Msg" style="display:none" role="alert"></span>
              </div>
            </div><!-- .row_group -->
            <!-- name, birthday -->
            <div class="row_group">
              <div class="join_row">
                <h3 class="join_title">
                  <label for="name">이름</label>
                </h3>    
                <span class="ps_box int_pass"  id="nameImg">
                  <input type="text" id="name" name="name" title="이름" class="int" maxlength="40">
                </span>
                <span class="error_next_box" id="nameMsg" style="display:none" role="alert"></span>
              </div>
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

              <div class="join_row join_email">
                <h3 class="join_title">
                  <label for="email">이메일 인증</label>
                </h3>
                <span class="ps_box int_pass" id="joinCode">
                  <input type="text" id="email" name="email" placeholder="이메일을 입력해주세요."
                  maxlength="100" class="int">
                </span> 
                <input id="btnSend" type="button" value="인증번호받기" class="btn-sm emailBtn">
                <span class="error_next_box" id="emailMsg" style="display:none" role="alert"></span>
              </div>
              <div class="join_row join_email join_authNo_confirm">
                <span class="ps_box int_pass" id="authNoBox">
                  <input type="tel" id="authNo" placeholder="인증번호 입력하세요"  class="int" maxlength="6" disabled>
                </span>
                <input id="authSend" type="button" value="인증하기" class="btn-sm emailBtn">
                <span class="error_next_box" id="authNoMsg" style="display:none" role="alert"></span>
              </div>
            </div><!-- .row_group -->
            <!-- mobile -->
            <div class="join_row join_mobile">
              <h3 class="join_title">
                <label for="phoneNo">휴대전화</label>
              </h3>
              <div class="int_mobile_area">
                <span class="ps_box int_pass" id="telImg">
                  <input type="tel" id="phoneNo" name="tel" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" maxlength="16">          
                </span>
              </div>
              <span class="error_next_box" id="phoneNoMsg" style="display:none" role="alert"></span>
            </div><!-- .join_row .join_mobile-->
          </div><!-- .join_form_left -->

          <div class="join_form_right">
            <div class="row_group join_photo">
              <div class="join_row join_photo_title">
                <h3 class="join_title" id="photo_title">
                  <label for="fileupload">프로필 사진<span class="terms_choice">(선택)</span></label>
                  <div class="file_input">
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
                    <img id="images-div" src="../../images/profile.png">
                  </label>
                </span>
              </div>
            </div><!-- .join_photo -->
            <div class="row_group">
              <div class="join_row">
                <h3 class="join_title">
                  <label for="addressBtn">주소/상세주소</label>
                </h3>
                <div class="address_area">
                  <span class="ps_box" id="postBox">
                    <input class="int" placeholder="우편번호" name="post" id="addr1" type="text" readonly="readonly" maxlength="6">
                  </span>
                  <input id="addressBtn" type="button" class="btn-sm addressBtn" value="우편번호찾기"> 
                </div>
                <div>
                  <span class="ps_box" id="baseAddr">
                    <input class="int" placeholder="도로명 주소" name="baseAddress" id="addr2" type="text" readonly="readonly" />
                  </span>
                </div>
                <div>
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
            </div><!-- .row_group -->
          </div><!-- .join_form_right -->
        </div><!-- .join_form -->
        <div class="btn_area">
          <button class="btn btn_type btn-outline-secondary sunext" id="btnJoin" type="button">가입하기</button>
        </div><!-- .btn_area -->
      </form><!-- #join_form-->
    </div><!-- .join_content -->
  </div><!-- .content -->
</div><!-- .container -->

<jsp:include page="../javascript.jsp"/>
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.2/js/mdb.min.js"></script>
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

$('.file_input input[type=file]').change(function() {
  var filename = $(this).val().replace(/c:\\fakepath\\/i, '');
  $('.file_input input[type=text]').val(filename);
});

var idFlag = false;
var pwFlag = false;
var authFlag = false;
var emailFlag = false;

$(document).ready(function() {
  defaultScript();

  if ($('#yy').val() != "") {
    checkBirthday();
  }

  $('#id').keyup(debounce(function() {
   idFlag = false;
   checkId("first");
  }, 500));

  $('#pswd1').blur(function() {
    pwFlag = false;
    checkPswd1();
  }).keyup(function(event) {
    checkShiftUp(event);
  }).keypress(function(event) {
    checkCapslock(event);
  }).keydown(function(event) {
    checkShiftDown(event);
  });

  $('#pswd2').blur(function() {
    checkPswd2();
  }).keyup(function(event) {
    checkShiftUp(event);
  }).keypress(function(evnet) {
    checkCapslock2(event);
  }).keydown(function(event) {
    checkShiftDown(event);  
  });

  $('#name').keyup(debounce(function() {
    checkName();
  }, 500));

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

/*   $('#email').keyup(debounce(function() {
    checkEmail();
  }, 500));
 */
  $('#btnSend').click(function() {
    sendEmail();
    return false;
  });

  $('#authNo').keyup(debounce(function() {
   checkAuthNo();
  }, 500));

  $('#authSend').click(function() {
    authFlag = false;
    checkAuthnoByAjax();
    return false;
  });

  $('#phoneNo').keyup(debounce(function() {
    checkPhoneNo();
  }, 500));

  $('#addressBtn').click(function() {
   execPostCode();
   return false;
  });

  $('#btnJoin').click(function(event) {
    submitClose();
   
    if (idFlag && pwFlag && authFlag) {
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
  if (idFlag && pwFlag && authFlag) {
    $('#join_form').submit();
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

  if (checkId('join') &
      checkPswd1() &
      checkPswd2() &
      checkName() &
      checkBirthday() &
      checkGender() &
   /*    checkEmailText($('#email').val()) & */
      checkPhoneNo() & 
      checkAuthNo() &
      checkAddress()
      ) {
        return true;
      } else {
        return false;
      }
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

function checkId(event) {
  if (idFlag) {
    return true;
  }

  var id = $('#id').val();
  var oMsg = $('#idMsg');
  var oImg = $('#idImg');

  if (id == "") {
    showErrorMsg(oMsg, "아이디를 입력해주세요.");
    showErrorBoxByError(oImg);
    return false;
  }
  
  var isId = /^[a-z0-9][a-z0-9_\-]{4,14}$/; // 15자까지
  if (!isId.test(id)) {
    showErrorMsg(oMsg, "5~15자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용할 수 있습니다.");
    showErrorBoxByError(oImg);
    return false;
  }

  idFlag = false;
  
  $.ajax({
    type: "GET",
    url: "checkId?userId=" + id,
    success : function(data) {
      var result = data.substr(7);

      if (result == "1") {
        if (event == "first") {
          showSuccessMsg(oMsg, "가입 가능한 아이디입니다!");
          showDefaultBoxByOK(oImg);
        } else {
          showDefaultBoxByOK(oImg);
          hideMsg(oMsg);
        }
        idFlag = true;
      } else {
        showErrorMsg(oMsg, "이미 사용중인 아이디입니다.");
        showErrorBoxByError(oImg);
      }
    }
  });
  
  return true;
}

function checkPswd1() {
  if (pwFlag) {
    return true;
  }

  var id = $('#id').val();
  var pw = $('#pswd1').val();
  var oImg = $('#pswd1Img');
  var oMsg = $('#pswd1Msg');

  if (pw == "") {
    showErrorMsg(oMsg, "패스워드를 입력해주세요.");
    showErrorBoxByError(oImg);
    return false;
  }

  if (isValidPasswd(pw) != true) {
    showErrorMsg(oMsg, "8~16자 영문 대 소문자, 숫자 특수문자를 사용하세요.");
    showErrorBoxByError(oImg);
    return false;
  }
  
  showDefaultBoxByOK(oImg);
  pwFlag = false;
  return true;
}

function isValidPasswd(str) {
  var cnt = 0;
  if (str == "") {
    return false;
  }

  // 패스워드에 공백이 있는지 확인
  var retVal = checkSpace(str);
  if (retVal) {
    return false;
  }
  if (str.length < 8) {
    return false;
  }
  for (var i = 0; i < str.length; ++i) {
    if (str.charAt(0) == str.substring(i, i + 1)) {
      ++cnt;
    }
  }
  if (cnt == str.length) {
    return false;
  }

  var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
  if (!isPW.test(str)) {
    return false;
  }

  return true;
}

function checkSpace(str) {
  if (str.search(/\s/) != -1) {
    return true;
  } else {
    return false;
  }
}

var isShift = false;
function checkShiftUp(e) {
  if (e.which && e.which == 16) {
    isShift = false;
  }
}

function checkShiftDown(e) {
  if (e.which && e.which == 16) {
    isShift == true;
  }
}

function checkCapslock(e) {
  var myKeyCode = 0;
  var myShiftKey = false;
  if (window.event) { // IE
    myKeyCode = e.keyCode;
    myShiftKey = e.shiftKey;
  } else if (e.which) { // netscape ff opera
    myKeyCode = e.which;
    myShiftKey = isShift;
  }

  var oMsg = $('#pswd1Msg');
  if ((myKeyCode >= 65 && myKeyCode <= 90) && !myShiftKey) {
    showErrorMsg(oMsg, "Caps Lock이 켜져 있습니다.");
  } else if ((myKeyCode >= 97 && myKeyCode <= 122) && myShiftKey) {
    showErrorMsg(oMsg, "Caps Lock이 켜져 있습니다.");
  } else {
    hideMsg(oMsg);
  }
}

function checkCapslock2(e) {
  var myKeyCode = 0;
  var myShiftKey = false;
  if (window.event) { // IE
    myKeyCode = e.keyCode;
    myShiftKey = e.shiftKey;
  } else if (e.which) { // netscape ff opera
    myKeyCode = e.which;
    myShiftKey = isShift;
  }

  var oMsg = $("#pswd2Msg");
  if ((myKeyCode >= 65 && myKeyCode <= 90) && !myShiftKey) {
    showErrorMsg(oMsg,"Caps Lock이 켜져 있습니다.");
  } else if ((myKeyCode >= 97 && myKeyCode <= 122) && myShiftKey) {
    showErrorMsg(oMsg,"Caps Lock이 켜져 있습니다.");
  } else {
    hideMsg(oMsg);
  }
}

function checkPswd2() {
  var pswd1 = $('#pswd1');
  var pswd2 = $('#pswd2');
  var oMsg = $('#pswd2Msg');
  var oImg = $('#pswd2Img');

  if (pswd2.val() == "") {
    showErrorMsg(oMsg, "비밀번호 재확인칸을 입력해주세요.");
    showErrorBoxByError(oImg);
    return false;
  }

  if (pswd1.val() != pswd2.val()) {
    showErrorMsg(oMsg, "비밀번호가 일치하지 않습니다.");
    showErrorBoxByError(oImg);
    pswd2.val("");
    return false;
  } else {
    showDefaultBoxByOK(oImg);
    hideMsg(oMsg);
    pwFlag = true;
    return true;
  }
}

function checkName() {
  var oMsg = $('#nameMsg');
  var nonchar = /[^가-힣a-zA-Z0-9]/gi;
  var oImg = $('#nameImg');
  var name = $('#name').val();

  if (name == "") {
    showErrorMsg(oMsg, "이름을 입력해주세요.");
    showErrorBoxByError(oImg);
    return false
  }
  if (name != "" && nonchar.test(name)) {
    showErrorMsg(oMsg, "한글과 알파벳 대 소문자를 사용하세요.<br>특수기호와 공백은 사용할 수 없습니다.");
    showErrorBoxByError(oImg);
    return false;
  }

  showDefaultBoxByOK(oImg);
  hideMsg(oMsg);
  return true;
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
  var oImg = $('#telImg');

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
  return true;
}

function isCellPhone(p) {
  var regPhone = /^((01[1|6|7|8|9])[1-9][0-9]{6,7})$|(010[1-9][0-9]{7})$/;
  return regPhone.test(p);
}

function checkEmail() {
  var emailAuth = $("#email").val();
  var typeAuth = $('#authType').val();
  var oMsg = $('#emailMsg');
  var oImg = $('#joinCode');

  if (emailAuth == "") {
    showErrorMsg(oMsg, "이메일을 입력해주세요.");
    showErrorBoxByError(oImg);
    return false;
  }

  if (!checkEmailText(emailAuth)) {
    return false;
  }

  $("#authNoMsg").hide();

  $.ajax({
    type:"POST",
    url:'checkEmail',
    contentType: 'application/json',
    dataType: "text",
    data:JSON.stringify({
      email: emailAuth,
      type: typeAuth
    }),
    success : function(data) {
      var result = data.substr(5);
      if (result == "1") {
        showSuccessMsg(oMsg, "이 이메일로 가입하실 수 있습니다. 인증을 진행해주세요.");
        showDefaultBoxByOK(oImg);
        emailFlag = true;
        return true;
      } else if (result == "0") {
        showErrorMsg(oMsg, "이 이메일로 가입한 아이디가 있습니다.");
        showErrorBoxByError(oImg);
        return false;
      } else {
        showErrorMsg(oMsg, "잘못된 접근입니다.");
        showErrorBoxByError(oImg);
        return false;
      }
    }
  });

  return false;
};

function checkEmailText(email) {
  var oMsg = $('#emailMsg');
  var oImg = $('#joinCode');
  var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  var isHan = /[ㄱ-ㅎ가-힣]/g;

  if (!isEmail.test(email) || isHan.test(email)) {
    showErrorMsg(oMsg, "이메일 주소를 확인하시고 다시 입력해주세요.");
    showErrorBoxByError(oImg);
    return false;
  }

  hideMsg(oMsg);
  return true;
}

function sendEmail() {
  var emailAuth = $('#email').val();
  var typeAuth = $('#authType').val();
  var oMsg = $('#emailMsg');
  var oBox = $('#joinCode');
  var authNoBox = $('#authNoBox');
  var authNoMsg = $('#authNoMsg');

  if (!emailFlag) {
    showErrorBoxByError(oBox);
    return false;
  }

  $.ajax({
    type:"POST",
    url:'sendEmail',
    contentType: 'application/json',
    dataType: "text",
    data:JSON.stringify({
      email: emailAuth,
      type: typeAuth
    }),
    success : function(data) {
      var result = data.substr(4);
      if (result == "1") {
        showSuccessMsg(oMsg,"인증메일을 발송했습니다.<br>인증메일이 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요.<br>");
        $("#authNo").attr("disabled", false);
        showDefaultBoxByOK(oBox);
        showDefaultBoxByPen(authNoBox);
        authNoMsg.hide();
      } else if (result == "0") {
        showErrorMsg(oMsg, "인증 중에 오류가 발생했습니다. 다시 인증 버튼을 눌러주세요.");
        showErrorBoxByError(oBox);
      } else {
        showErrorMsg(oMsg, "인증메일 발송에 실패했습니다. 이메일을 확인해주세요.");
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

/*   if (authNo == "") {
    showErrorMsg(oMsg, "인증번호를 입력해주세요.");
    showErrorBoxByError(oBox);
    return false;
  }
   */
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
    showSuccessMsg(oMsg, "이메일 인증에 성공했습니다.");
    showSuccessBoxBySuccess(oBox);
    $('#emailMsg').hide();
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
  var emailAuth = $("#email").val();
  var typeAuth = $('#authType').val();
  var oMsg = $('#authNoMsg');
  var oBox = $('#authNoBox');

  $.ajax({
    type: "POST",
    url: "checkAuthNo",
    contentType: 'application/json',
    dataType: "text",
    data: JSON.stringify({
      authKey: authNo,
      email: emailAuth,
      type: typeAuth
    }),
    success: function(data) {
      var result = data.substr(4);
      if (result == "0") {
        showSuccessMsg(oMsg, "이메일 인증에 성공했습니다.");
        showSuccessBoxBySuccess(oBox);
        $("#emailMsg").hide();
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