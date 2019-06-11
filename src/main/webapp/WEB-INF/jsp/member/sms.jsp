<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sms test</title>
<jsp:include page="../commonCss.jsp"/>
<link rel="stylesheet" href="${contextRootPath}/css/member_form.css">
</head>
<body>
              <div class="join_row join_email">
                <h3 class="join_title">
                  <label for="tel">Sms 인증</label>
                </h3>
                <span class="ps_box int_pass" id="joinCode">
                  <input type="tel" id="tel" name="tel" placeholder="전화번호를 입력해주세요."
                  maxlength="100" class="int">
                </span> 
                <input id="btnSend" type="button" value="인증번호받기" class="btn-sm emailBtn">
                <span class="error_next_box" id="telMsg" style="display:none" role="alert"></span>
              </div>
              
              <div class="join_row join_email join_authNo_confirm">
                <span class="ps_box int_pass" id="authNoBox">
                  <input type="tel" id="authNo" placeholder="인증번호를 입력하세요"  class="int" maxlength="6" readonly>
                </span>
                <input id="authSend" type="button" value="인증하기" class="btn-sm emailBtn">
                <span class="error_next_box" id="authNoMsg" style="display:none" role="alert"></span>
              </div>

<jsp:include page="../javascript.jsp"/>

<script>

$(document).ready(function() {

  $('#btnSend').click(function() {
    sendSms();
    return false;
  });
  
  $('#authSend').click(function() {
    checkAuthnoByAjax();
    return false;
  });
  
});


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


function sendSms() {
  var telAuth = $('#tel').val();
  var oMsg = $('#telMsg');
  var oBox = $('#joinCode');
  var authNoBox = $('#authNoBox');
  var authNoMsg = $('#authNoMsg');

  /*
  telFlag와 유효성확인으로 대체할것
  if (!emailFlag) {
    showErrorBoxByError(oBox);
    return false;
  }
  */

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
    showSuccessMsg(oMsg, "SMS 인증에 성공했습니다.");
    showSuccessBoxBySuccess(oBox);
    $('#telMsg').hide();
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
  var telAuth = $("#tel").val();
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