<%@ page language="java" 
         contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>BATTLE MATCHING :: 회원가입</title>
  <jsp:include page="../commonCss.jsp"/>
  <link rel="stylesheet" href="${contextRootPath}/css/member_form.css">
  
</head>
<body style="background:white">
 
 
<div id="container">
  <div id="content">
            
    <div class="join_step">
      <img src="${contextRootPath}/images/logo.png" class="joinImg">
    </div>

    <div class="join_content">
      <form id="join_form" action="enter" method='POST'>
        <input type="hidden" id="loginType" name="loginType" value="homepage"> 
        <input type="hidden" id="authType" name="authType" value="join"> 
      
        <div class="join_form">
          <div class="join_form_input">
          
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
                  <input type="tel" id="authNo" placeholder="인증번호를 입력하세요"  class="int" maxlength="6" disabled>
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
                  <input type="tel" id="phoneNo" name="tel" placeholder="전화번호를 입력하세요." aria-label="전화번호를 입력하세요." class="int" maxlength="16">          
                </span>
              </div>
              <span class="error_next_box" id="phoneNoMsg" style="display:none" role="alert"></span>
            </div><!-- .join_row-->
          </div><!-- .join_form_input -->
          
          <div class="terms_p">
          
            <h3 class="join_title agree_title">약관 동의</h3>

            <ul class="terms_bx_list">
              <li class="terms_bx">
                  <span class="input_chk">
                    <input type="checkbox" id="chk_all" name="chk_all">
                    <label for="chk_all">
                      <span class="chk_all_txt"><strong style="color:#08a600;">모든 약관</strong>에 동의합니다.</span>
                    </label>
                  </span>
              </li>
            
              <li class="terms_bx">
               <span class="input_chk">
                  <input type="checkbox" id="termsService" name="termsService" class="chk">
                  <label for="termsService"><strong>서비스 이용약관</strong>에 동의합니다.
                    <span class="terms_necessary">(필수)</span>
                  </label>
                  <button type="button" class="btn btn-sm btn-outline-dark termsBtn" data-toggle="collapse" data-target="#dirService">상세보기</button>
                </span>
                <div class="terms_box collapse in" tabindex="0" id="dirService">
                  <!-- 서비스 이용약관 -->
                  <div class="article">
                    <h3 class="article_title">서비스 이용약관 제목입니다.</h3>
                    <p class="article_text">서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.</p>
                  </div>
                </div>
              </li>
              
              <li class="terms_bx">
                <span class="input_chk">
                  <input type="checkbox" id="termsPrivacy" name="termsPrivacy" class="chk">
                  <label for="termsPrivacy"><strong>개인정보 수집 및 이용</strong>에 동의합니다.
                    <span class="terms_necessary">(필수)</span>
                  </label>
                  <button type="button" class="btn btn-sm btn-outline-dark termsBtn" data-toggle="collapse" data-target="#dirPrivacy">상세보기</button>
                </span>
                <div class="terms_box collapse in" tabindex="0" id="dirPrivacy">
                  <!-- 개인정보 수집 및 이용 동의 -->
                  <div class="article">
                    <h3 class="article_title">개인정보 수집 제목입니다.</h3>
                    <p class="article_text">개인정보 수집 내용입니다.</p>
                  </div>
                </div>
              </li>
              
              <li class="terms_bx">
                <span class="input_chk">
                  <input type="checkbox" id="termsThirdParty" name="termsThirdParty" class="chk">
                  <label for="termsThirdParty"><strong>개인정보 제3자 제공</strong>에 동의합니다.
                    <span class="terms_necessary">(필수)</span>
                  </label>
                  <button type="button" class="btn btn-sm btn-outline-dark termsBtn" data-toggle="collapse" data-target="#dirThirdParty">상세보기</button>
                </span>
                <div class="terms_box collapse in" tabindex="0" id="dirThirdParty">
                  <!-- 개인정보 제3자 제공 동의 -->
                  <div class="article">
                    <h3 class="article_title">제목입니다.</h3>
                    <p class="article_text">내용입니다.</p>
                  </div>
                </div>
              </li>
              
              <li class="terms_bx">
                <span class="input_chk">
                  <input type="checkbox" id="termsMarketing" name="termsMarketing" class="chk">
                  <label for="termsMarketing">마케팅 및 광고에의 활용에 동의합니다.
                    <span class="terms_choice">(선택)</span>
                  </label>
                  <button type="button" class="btn btn-sm btn-outline-dark termsBtn" data-toggle="collapse" data-target="#dirMarketing">상세보기</button>
                </span>
                <div class="terms_box collapse in" tabindex="0" id="dirMarketing">
                  <!-- 마케팅 및 광고에의 활용 -->
                  <div class="article">
                    <h3 class="article_title">제목입니다.</h3>
                    <p class="article_text">내용입니다.</p>
                  </div>
                </div>
              </li>
            </ul>
            <span class="error" id="agreeMsg" style="display:none">이용약관, 개인정보 수집 및 이용, 개인정보 제3자 제공 동의에 모두 동의해주세요.</span>
          </div><!-- .terms_p -->
          
        </div><!-- .join_form -->
        <div class="btn_area">
          <button class="btn btn_type btn-outline-secondary sunext" id="btnJoin" type="button">가입하기</button>
        </div><!-- .btn_area -->
      </form><!-- #join_form-->
    </div><!-- .join_content -->
  </div><!-- .content -->
</div><!-- .container -->

<jsp:include page="../javascript.jsp"/>

<script>
"use strict"

var idFlag = false;
var pwFlag = false;
var authFlag = false;
var emailFlag = false;

$(document).ready(function() {
  defaultScript();

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

  $('#email').keyup(debounce(function() {
    checkEmail();
  }, 500));

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
  
  $("#chk_all").prop("checked",false);
  setTerms();
  
  $("#chk_all").click(function() {
    setTerms();
    location.hash = '#btnAgree';
  })
  
  $("#termsService").click(function() {
    viewTerms();
  })
  
  $("#termsPrivacy").click(function() {
    viewTerms();
  })
  
  $("#termsThirdParty").click(function() {
    viewTerms();
  })
  
  $("#termsMarketing").click(function() {
    setMarketingTerms();
    viewTerms();
  })
  
  $("#btnAgree").click(function(event) {
    submitAgree();
    return false;
  })

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
    
    if (checkTerms() != true) {
      submitOpen();
      return false;
    }
    
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
      checkEmailText($('#email').val()) & 
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
  var nonchar = /[^가-힣a-zA-Z]/gi;
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



function setTerms() {
  if ($("#chk_all").is(":checked")) {
    $("#termsService").prop("checked",true);
    $("#termsPrivacy").prop("checked",true);
    $("#termsThirdParty").prop("checked",true);
    $("#termsMarketing").prop("checked",true);
  } else {
    $("#termsService").prop("checked",false);
    $("#termsPrivacy").prop("checked",false);
    $("#termsThirdParty").prop("checked",false);
    $("#termsMarketing").prop("checked",false);
  }

  return true;
}

function viewTerms() {

  if( !$("#termsService").is(":checked") ||
      !$("#termsPrivacy").is(":checked") ||
      !$("#termsThirdParty").is(":checked") ||
      !$("#termsMarketing").is(":checked")) {
    
    $("#chk_all").prop("checked",false);
  }

  if( $("#termsService").is(":checked") &&
      $("#termsPrivacy").is(":checked") &&
      $("#termsThirdParty").is(":checked") &&
      $("#termsMarketing").is(":checked")) {
    
    $("#chk_all").prop("checked",true);
  }

  return true;
}

function checkTerms() {
  var res = true;

  if ($("#termsService").is(":checked") == false ||
      $("#termsPrivacy").is(":checked") == false ||
      $("#termsThirdParty").is(":checked") == false) {
    
    $('#agreeMsg').show();
    res = false;
  } else {
    $('#agreeMsg').hide();
  }

  return res;
}



</script>
</body>
</html>