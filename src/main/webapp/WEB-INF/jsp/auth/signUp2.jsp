<%@ page language="java" 
         contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입(정보기입)</title>
  <jsp:include page="../commonCss.jsp"/>
  <link rel="stylesheet" href="${contextRootPath}/css/signUp2.css">
</head>
<body>

<jsp:include page="../header.jsp"/>

<div id="container">
  <div id="content">
  <h1>스포츠 매칭 <strong>홈페이지</strong> 방문을 환영합니다.</h1>
            
    <div class="join_step"><!-- step단계표현 -->
      <img src="../../images/signUp2.png">
    </div>

  <hr class="hrblack"/>

    <div class="join_content">
      <form id="join_form" action=""> <!-- 만약 form부분에 key들을 js로 추가하고 싶다면 .container위로 올리고 그 사이에 넣을것. -->
        <!--
          <input type="hidden" id="token_sjoin" name="token_sjoin" value="QWozbUyMlxRp2eN3">
          <input type="hidden" id="encPswd" name="encPswd" value="">
          <input type="hidden" id="encKey" name="encKey" value="">
          <input type="hidden" id="joinMode" name="joinMode" value="unreal">
          <input type="hidden" id="pbirthday" name="pbirthday" value="">
          <input type="hidden" id="ipinFlag" name="ipinFlag" value="">
          <input type="hidden" id="nid_kb2" name="nid_kb2" value="">
        -->
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
                <span class="ps_box int_id">
                  <input type="text" id="id" name="id" class="int" title="ID" maxlength="20" placeholder="ex)abcd102">
                  <span class="error_next_box" id="idMsg" style="display:none" role="alert"></span>
                </span>
              </div>
              <div class="join_row">
                <h3 class="join_title">
                  <label for ="pswd1">비밀번호</label>
                </h3>
                <span class="ps_box int_pass" id="pswdImg">
                  <input type="password" id="pswd1" name="password" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
                  <span class ="lbl">
                    <span id="pswd1Span" class="step_txt">
                    </span>
                  </span>
                  <span class="error_next_box" id="pswd1Msg" style="display:none" role="alert">5~12자의 영문 소문자, 숫자와 특수기호(...)만 사용 가능합니다.
                  </span>
                </span>
                <h3 class="join_title">
                  <label for="pswd2">비밀번호 재확인</label>
                </h3>
                <span class="ps_box int_pass_check" id="pwd2Img">
                  <input type="password" id="pswd2" name="pswd2" class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind" maxlength="20">
                  <span id="pswd2Blind" class="wa_blind">설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.
                  </span>
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
                <span class="ps_box box_right_space">
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
                    <span class="ps_box">
                      <input type="text" id="yy" placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4">
                    </span>
                  </div>
                  <div class="bir_mm">
                    <span class="ps_box">
                      <select id="mm" class="sel" aria-label="월">
                        <option>월</option>
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
                    <span class="ps_box">
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
                <div class="ps_box gender_code">
                  <select id="gender" name="gender" class="sel" aria-label="성별">
                    <option value="" selected>성별</option>
                    <option value="0">남자</option>
                    <option value="1">여자</option>
                  </select>
                </div>
              </div>
              <span class="error_next_box" id="genderMsg" style="display:none" role="alert"></span>

              <div class="join_row join_email">
                <h3 class="join_title">
                  <label for="email">이메일 인증</label>
                </h3>
                <span class="ps_box int_email box_right_space" id="joinCode">
                  <input type="text" id="email" name="email" placeholder="이메일을 입력해주세요."
                  maxlength="100" class="int">
                </span> 
                <input id="btnSend" type="button" value="인증" class="btn btn-primary btn-sm">
              </div>
              <div class="ps_box_disable box_right_space" id="authNoBox">
                <input type="tel" id="authNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" aria-describedby="wa_verify" class="int" maxlength="6" disabled>
                <label id="wa_verify" for="authNo" class="lbl">
                  <span class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span>
                  <span class="input_code" id="authNoCode" style="display:none;"></span>
                </label>
                <input id="authSend" type="button" value="인증" class="btn btn-primary btn-sm">
              </div>
              <span class="error_next_box" id="authNoMsg" style="display:none" role="alert"></span>
              <span class="error_next_box" id="emailMsg" style="display:none" role="alert"></span>

            </div><!-- .row_group -->
            <!-- mobile -->
            <div class="join_row join_mobile">
              <h3 class="join_title">
                <label for="phoneNo">휴대전화</label>
              </h3>
              <div class="int_mobile_area">
                <span class="ps_box int_mobile">
                  <input type="tel" id="phoneNo" name="tel" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" maxlength="16">
                  <label for="phoneNo" class="lbl"></label>              
                </span>
                </a>
              </div>
              <span class="error_next_box" id="phoneNoMsg" style="display:none" role="alert"></span>
            </div><!-- .join_row .join_mobile-->
          </div><!-- .join_form_left -->

          <div  class="join_form_right">
            <div class="join_row join_photo">
              <div class="join_photo_title">
                <h3 class="join_title">
                  <label for="photo">프로필 사진<span class="terms_choice">(선택)</span></label>
                </h3>
                 <input id="fileupload" type="file" name="files" value="파일첨부"><br>
              </div>
              <div class="join_photo_view">
                <span class="photoView">
                  <label for="photo">
                    <!-- 파일 이미지 보이게하기 - 배우면 적용 -->
                    <img id="images-div" src="../../images/default.jpg" style="width:200px; height:200px;">
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
                  <span class="ps_box address_box">
                  <input class="form-control" style="display: inline;" placeholder="우편번호" name="post" id="addr1" type="text" readonly="readonly" maxlength="6">
                  </span>
                  <button id="addressBtn" type="button" class="btn btn-outline-secondary sunext addressBtn" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                  
                </div>
                <div class="ps_box">
                <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="baseAddress" id="addr2" type="text" readonly="readonly" />
                </div>
                <div class="ps_box">
                <input class="form-control" placeholder="상세주소" name="detailAddress" id="addr3" type="text"  />
                </div>
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
          <button class="btn btn_type btn-outline-secondary sunext" id="btnJoin"
                  type="button">가입하기</button>
        </div><!-- .btn_area -->
      </form>
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

function execPostCode() {
  
  daum.postcode.load(function(){
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=post]").val(data.zonecode);
                $("[name=baseAddress]").val(fullRoadAddr);
                
            }
         }).open();
  });
     }

$('#fileupload').fileupload({
  autoUpload: false,        // 파일을 추가할 때 자동 업로딩 하지 않도록 설정.
  disableImageResize: /Android(?!.*Chrome)|Opera/
        .test(window.navigator && navigator.userAgent), // 안드로이드와 오페라 브라우저는 크기 조정 비활성 시키기
  previewMaxWidth: 200,   // 미리보기 이미지 너비
  previewMaxHeight: 200,  // 미리보기 이미지 높이 
  previewCrop: true,      // 미리보기 이미지를 출력할 때 원본에서 지정된 크기로 자르기
  processalways: function(e, data) { //Callback for the end (done or fail) of an individual file processing queue.
      var photo;
      for (var i = 0; i < data.files.length; i++) {
        try {
          if (data.files[i].preview.toDataURL) {
            // Base64로 바이너리 데이터를 텍스트로 변환해서 추가
            photo = data.files[i].preview.toDataURL();
            $('#images-div')
            .attr('src', data.files[i]
              .preview.toDataURL())
              .css('width', '100px');
            $('#photo').val(photo);
          }
        } catch (err) {
        }
      }
  }
});

// id, pw, auth check Boolean
var idFlag = false;
var pwFlag = false;
var authFlag = false;

$(document).ready(function() {
 defaultScript();

 if ($('#yy').val() != "") {
   checkBirthday();
 }

 $('#id').blur(function() {
  idFlag = false;
  checkId("first");
 });

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

 $('#name').blur(function() {
   checkName();
 });

 $('#yy').blur(function() {
   checkBirthday();
 });

 $('#mm').change(function() {
   checkBirthday();
 });

 $('#dd').blur(function() {
  checkBirthday();
 });

 $('#gender').change(function() {
   checkGender();
 });

 $('#email').blur(function() {
   checkEmail();
 });

 $('#phoneNo').blur(function() {
   checkPhoneNo();
 });

 $('#btnSend').click(function() {
   sendEmail();
   return false;
 });

 $('#authNo').blur(function() {
   checkAuthNo();
 });

 $('#authSend').click(function() {
   authFlag = false;
   checkAuthnoByAjax();
   return false;
 });

 $('#btnJoin').click(function(event) {
   clickcr(this, 'sup.signup', '', '', event);
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
      checkEmail() &
      checkPhoneNo() & 
      checkAuthNo()
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

function checkBirthday() {
  var birthday;
  var yy = $('#yy').val();
  var mm = $('#mm').val();
  var dd = $('#dd').val();
  var oMsg = $('#birthdayMsg');
  var lang = "ko_KR";

  if (yy == "" && mm == "" && dd == "") {
    showErrorMsg(oMsg, "출생년도 4자리를 정확하게 입력하세요.");
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
    return false;
  }
  if (yy.length != 4 || yy.indexOf('e') != -1 || yy.indexOf('E') != -1 ) {
    showErrorMsg(oMsg, "출생년도 4자리를 정확하게 입력하세요.");
    return false;
  }
  if (mm == "") {
    //alert(mm);
    showErrorMsg(oMsg, "태어난 월을 선택하세요.");
    return false;
  }
  if (dd == "") {
    showErrorMsg(oMsg, "태어난 일(날짜) 2자리를 정확하게 입력하세요.");
    return false;
  }
  if (dd.length != 2 || dd.indexOf('e') != -1 || dd.indexOf('E') != -1) {
    showErrorMsg(oMsg, "태어난 일(날짜) 2자리를 정확하게 입력하세요.");
    return false;
  }

  birthday = yy + mm + dd;
  if (!isValidDate(birthday)) {
    showErrorMsg(oMsg, "생년월일을 다시 확인해주세요.");
    return false;
  }
  $("#birthday").val(birthday);
  console.log($("#birthday"));

  var age = calcAge(birthday);
  if (age < 0) {
    showErrorMsg(oMsg, "생년월일을 다시 확인해주세요.");
    return false;
  } else if (age >= 100) {
    showErrorMsh(oMsg, "생년월일을 다시 확인해주세요.");
    return false;
  } else if (age < 14) {
    showErrorMsg(oMsg, "14세미만 회원에게는 서비스를 제공하지 않습니다.");
    return false;
  } else {
    hideMsg(oMsg);
    return true;
  }
  return true;
}

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

function showAuthSuccessBox(oBox, oCode, msg) {
  oBox.attr("class", "ps_box accord");
  oCode.html(msg);
  oCode.show();
}

function showAuthErrorBox(oBox, oCode, msg) {
  oBox.attr("class", "ps_box discord");
  oCode.html(msg);
  oCode.show();
}

function showAuthDefaultBox(oBox, oCode) {
  oBox.attr("class", "ps_box");
  oCode.html("");
  oCode.hide();
}

function hideMsg(obj) {
  obj.hide();
}

function isValidDate(param) {
  try {
    param = param.replace(/-/g, '');

    if (isNaN(param) || param.length != 8) {
      return false;
    }

    var year = Number(param.subString(0, 4));
    var month = Number(param.subString(4, 6));
    var day = Number(param.subString(6, 8));

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
  var birthdaymd = birth.substr(4, 4); //?
  console.log(birthdaymd);
  
  var age = monthDay < birthdaymd ? year -birthdayy - 1 : year - birthdayy;
  return age;
}

function checkId(event) {
  if (idFlag) {
    return true;
  }

  var id = $('#id').val();
  var oMsg = $('#idMsg');

  if (id == "") {
    showErrorMsg(oMsg, "아이디를 입력해주세요.");
    return false;
  }
  
  var isId = /^[a-z0-9][a-z0-9_\-]{4,14}$/; // 15자까지
  // regex 패턴확인
  if (!isId.test(id)) {
    showErrorMsg(oMsg, "5~15자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용할 수 있습니다.");
    return false;
  }

  idFlag = false;
  /*
  $.ajax({
    type: "GET",
    url: 아이디확인할url
    success : function(data) {
      var result = data.substr(4);

      if (result == "Y") {
        if (event == "first") {
          showSuccessMsg(oMsg, "멋진 아이디네요!");
        } else {
          hideMsg(oMsg);
        }
        idFlag = true;
      } else {
        showErrorMsg(oMsg, "이미 사용중인 아이디입니다.");
      }
    }
  });
  */
  return true;
}

function checkPswd1() {
  if (pwFlag) {
    return true;
  }

  var id = $('#id').val();
  var pw = $('#pswd1').val();
  var oMsg = $('#pswd1Msg');

  if (pw == "") {
    showErrorMsg(oMsg, "패스워드를 입력해주세요.");
    return false;
  }

  if (isValidPasswd(pw) != true) {
    showErrorMsg(oMsg, "8~16자 영문 대 소문자, 숫자 특수문자를 사용하세요.");
    return false;
  }

  pwFlag = false;
  /*
  $.ajax({
    type:"GET",
    url: 패스워드확인url
    success: function(data) {
      var result = data.substr(4); 5번째 문자로 result 결과 판단
      if (result == 1) {
        showErrorMsg(oMsg, "8~16자 영문 대 소문자, 숫자 특수문자를 사용하세요.");
        return false;
      } else {
        oMsg.hide();
      }
      pwFlag = true;      
    }
  });
    */
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
    console.log("str.charAt에서 걸림");
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
  var oBlind = $('#pswd2Blind');

  if (pswd2.val() == "") {
    showErrorMsg(oMsg, "비밀번호 재확인칸을 입력해주세요.");
    oBlind.html("설정하려는 비밀번호가 맞는지 확인하고 다시 입력해주세요.");
    return false;
  }

  if (pswd1.val() != pswd2.val()) {
    showErrorMsg(oMsg, "비밀번호가 일치하지 않습니다.");
    oBlind.html("설정하려는 비밀번호가 맞는지 확인하고 다시 입력해주세요.");
    pswd2.val("");
    return false;
  } else {
    oBlind.html("비밀번호가 일치합니다.");
    hideMsg(oMsg);
    return true;
  }

  return true;
}

function checkName() {
  var oMsg = $('#nameMsg');
  var nonchar = /[^가-힣a-zA-Z0-9]/gi;

  var name = $('#name').val();
  if (name == "") {
    showErrorMsg(oMsg, "이름을 입력해주세요.");
    return false
  }
  if (name != "" && nonchar.test(name)) {
    showErrorMsg(oMsg, "한글과 알파벳 대 소문자를 사용하세요. 특수기호와 공백은 사용할 수 없습니다.");
    return false;
  }

  hideMsg(oMsg);
  return true;
}

function checkGender() {
  var gender = $('#gender').val();
  var oMsg = $('#genderMsg');

  if (gender == "") {
    showErrorMsg(oMsg, "성별을 선택해주세요.");
    return false;
  }
  hideMsg(oMsg);
  return true;
}

function checkEmailText(email) {
  var oMsg = $('#emailMsg');
  var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  var isHan = /[ㄱ-ㅎ가-힣]/g;

  if (!isEmail.test(email) || isHan.test(email)) {
    showErrorMsg(oMsg, "이메일 주소를 확인하시고 다시 입력해주세요.");
    return false;
  }

  hideMsg(oMsg);
  return true;
}

function checkPhoneNo() {
  var phoneNo = $('#phoneNo').val();
  var oMsg = $('#phoneNoMsg');

  if (phoneNo == "") {
    showErrorMsg(oMsg, "전화번호를 입력해주세요.");
    return false;
  }
  
  if (!isCellPhone(phoneNo)) {
    showErrorMsg(oMsg, "형식에 맞지 않는 번호입니다.");
    return false;
  }

  phoneNo = phoneNo.replace(/ /gi, "").replace(/-/gi, "");
  $("#phoneNo").val(phoneNo);

  hideMsg(oMsg);
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

  if (emailAuth == "") {
    showErrorMsg(oMsg, "이메일을 입력해주세요.");
    return false;
  }

  if (!checkEmailText(emailAuth)) {
    return false;
  }

  $("#authNoMsg").hide();

  $.ajax({
    type:"POST",
    url:'../member/checkEmail',
    contentType: 'application/json',
    dataType: "text",
    data:JSON.stringify({
      email: emailAuth,
      type: typeAuth
    }),
    success : function(data) {
      var result = data.substr(5);
      if (result == "1") {
        $('#joinCode').css('display', 'none');
        showSuccessMsg(oMsg, "")
      } else if (result == "0") {
        $('#joinCode').css('display', "");
        showErrorMsg(oMsg, "이 이메일로 가입된 아이디가 있습니다.");
      } else {
        $('#joinCode').css('display', "");
        showErrorMsg(oMsg, "잘못된 접근입니다.");
      }
    }
  });

  return true;
};

function sendEmail() {
  var emailAuth = $("#email").val();
  var typeAuth = $('#authType').val();
  var oMsg = $('#emailMsg');

  $.ajax({
    type:"POST",
    url:'../member/sendEmail',
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
        var oBox = $("#authNoBox");
        var oCode = $("#authNoCode");
        showAuthDefaultBox(oBox, oCode);
      } else if (result == "0") {
        showErrorMsg(oMsg, "인증 중에 오류가 발생했습니다. 다시 인증 버튼을 눌러주세요.");
      } else {
        showErrorMsg(oMsg, "인증메일 발송에 실패했습니다. 이메일을 확인해주세요.");
      }
    }
  });

  return false;
};



function checkAuthNo() {
  var authNo = $('#authNo').val();
  var oMsg = $('#authNoMsg');
  var oBox = $('#authNoBox');
  var oCode= $('#authNoCode');

  if (authNo == "") {
    showErrorMsg(oMsg, "인증이 필요합니다.");
    return false;
  }

  if (authFlag) {
    showSuccessMsg(oMsg, "인증이 성공했습니다.");
    showAuthSuccessBox(oBox, oCode, "일치");
    $('#emailMsg').hide();
    return true;
  } else {
    showErrorMsg(oMsg, "인증이 필요합니다.");
    return false;
  }
}

function checkAuthnoByAjax() {
  var authNo = $('#authNo').val();
  var emailAuth = $("#email").val();
  var typeAuth = $('#authType').val();
  var oMsg = $('#authNoMsg');
  var oBox = $('#authNoBox');
  var oCode = $('#authNoCode');

  $.ajax({
    type: "POST",
    url: "../member/checkAuthNo",
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
        showSuccessMsg(oMsg, "인증이 성공했습니다.");
        showAuthSuccessBox(oBox, oCode, "일치");
        $("#emailMsg").hide();
        $('#btnSend').css('display', 'none');
        $('#authNoBox').css('display', 'none');
        authFlag = true;
      } else {
        showErrorMsg(oMsg, "인증번호를 다시 확인해주세요.");
        showAuthErrorBox(oBox, oCode, "불일치");
      }
    }
  });
  return false;
}


</script>
</body>
</html>