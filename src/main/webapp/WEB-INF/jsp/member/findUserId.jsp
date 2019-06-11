<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<jsp:include page="../commonCss.jsp"/>
<link rel="stylesheet" href="${contextRootPath}/css/findUserId.css">
</head>
<body>

<div id="container" style="width:1080px;">   
  <div id="content"> 
    <input type="hidden" id="authType" name="authType" value="email"> 
    
    <h1 style="margin-bottom: 20px;">아이디 찾기</h1>
    
    <hr class="hrblack"/>
  
    <div id="findIdBox">
      <div id="findIdContent">
        <div id="findIdComment">
          <p style="font-size: 0.7em;">이름과 이메일로 <strong>아이디</strong>를 찾을 수 있습니다.</p>
        </div>
        <div id="findIdImgBox">
          <img src="../../images/search.png">
        </div>
        <div id="findIdAuthComment">
          <p>회원가입하실 때 등록하신 <strong>이름, 이메일</strong> 정보가 필요합니다.</p>
        </div>
        <hr class="hrSlim">
      </div><!-- #findIdContent -->
      <div id="findIdAuth">
        <div id="findIdAuthBox">
          <button class="btn btn-primary btn-lg" id="findIdAuthBtn" type="button">아이디 찾기</button>
        </div>    
        <div id="findIdDiv">
          <div id="emailAuth" style="display:none">
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
                <label for="email">이메일</label>
              </h3>
              <span class="ps_box int_pass" id="joinCode">
                <input type="text" id="email" name="email" placeholder="이메일을 입력해주세요."
                      maxlength="100" class="int">
              </span> 
              <span class="error_next_box" id="emailMsg" style="display:none" role="alert"></span>
            </div>
          </div>
          <div class="btn_area" id="findIdBtnBox" style="display:none">
            <button class="btn btn-primary btn-lg" id="btnJoin" type="button">아이디 찾기</button>
          </div>
          <div class="btn_area" id="userIdBox" style="display:none">
            <h3 class="join_title">
              <label for="id">아이디</label>
            </h3>
            <span class="ps_box" id="idImg">
              <input type="text" id="id" name="id" class="int" title="ID" maxlength="20" readonly>
            </span>
          </div>
          <div class="btn_area" id="AfterBtnBox" style="display:none">
            <a href="../auth/form" class="btn btn-primary btn-lg" id="loginBtn" type="button">로그인 하기</a>
            <a href="findPassword" class="btn btn-primary btn-lg" id="findPwdBtn" type="button">비밀번호 찾기</a>
          </div>
        </div>


        
      </div><!-- #findIdAuth -->
    </div><!-- #findIdBox -->
  </div><!-- #content -->
</div><!-- #container -->

<jsp:include page="../javascript.jsp"/>
<script>
"use strict"

var emailFlag = false;
var nameFlag = false;

$(document).ready(function() {
  defaultScript();
  
  $('#findIdAuthBtn').click(function() {
    $('#findIdAuthBtn').hide();
    $('#emailAuth').show();
    $('#findIdBtnBox').show();
    return false;
  });

  $('#name').keyup(debounce(function() {
    checkName();
  }, 500));
  
  $('#email').keyup(debounce(function() {
    checkEmail();
  }, 500));

  $('#btnJoin').click(function(event) {
    submitClose();
   
    if (nameFlag && emailFlag) {
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
  if (nameFlag && emailFlag) {
    findId();
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
if (checkName() & checkEmailText($('#email').val())) {
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

function showErrorBoxByError(oBox) {
  oBox.attr("class", "ps_box int_pass_check2 discord");
}

function showDefaultBoxByOK(oBox) {
  oBox.attr("class", "ps_box int_pass_check");
}

function hideMsg(obj) {
  obj.hide();
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
  nameFlag = true;
  return true;
}

function checkEmail() {
  var emailAuth = $("#email").val();
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

  oMsg.hide();
  showDefaultBoxByOK(oImg);
  emailFlag = true;
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

function findId() {
  var name = $('#name').val();
  var email = $('#email').val();
  var oMsg = $('#emailMsg');
  var oBox = $('#joinCode');
 
  $.ajax({
    type: "GET",
    url: "findId?email=" + email + "&name=" + name,
    success : function(data) {
      var result = data.substr(6, 1);
      var userId;
      if (data.length > 8) {
        userId = data.substring(7, data.length);
      }

      if (result == "0") {
        $('#id').val(userId);
        $('#findIdBtnBox').hide();
        $('#emailAuth').hide();
        $('#userIdBox').show();
        $('#AfterBtnBox').show();
        return true;
      } else {
        showErrorMsg(oMsg, "아이디 찾기에 실패했습니다. <br>이름과 이메일을 확인하시고 다시 시도해주세요.");
        return false;
      }
    }
  });
  
  return false;
}

</script>

</body>
</html>