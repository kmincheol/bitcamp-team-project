<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BATTLE MATCHING :: 상세정보입력</title>
<jsp:include page="../commonCss.jsp" />
<link rel="stylesheet" href="${contextRootPath}/css/member_additionalForm.css">


<style>
h2 {
	text-align: center;
	margin: 15px;
}
</style>

</head>
<body style="background: white">

  <div id="container">
    <div id="content">
      <h2>
      현재 비밀번호 확인 후<br>
      비밀번호를 <b>변경</b>할 수 있습니다.
      </h2>
      <%-- <div class="join_step">
      <img src="${contextRootPath}/images/logo.png" class="joinImg">
    </div> --%>
      <c:choose>
        <c:when test="${empty member}">
          <p>해당하는 회원이 없습니다.</p>
        </c:when>

        <c:otherwise>

          <div class="join_content">
              <div class="join_form">
                <div class="join_form_input">

                  <input type="hidden" id="no" name="no" value="${member.no}">
                  <input type="hidden" id="id" name="id" value="${member.id}">

                  <!-- name -->
                  <div class="join_row oldPwd">
                    <h3 class="join_title">
                      <label id="oldMessage" for="name">현재 비밀번호</label><br>
                       <label id="newMessage" for="name" style="color:red; display:none;">비밀번호가 틀립니다. 다시 한번 확인해 주세요.</label> 
                    </h3>
                    <div class="int_mobile_area">
                      <span class="name ps_box int_pass" id="nameImg"> 
                      <input name="password" type="password" id="oldInput" class="int" maxlength="16" >
                      </span>
                    </div>
                    <span class="error_next_box" id="tel" style="display: none" role="alert"></span> 
                  </div>
                  <!-- .join_row-->
                  
         <form id="passwordUpdate_form" action="../updatePassword" method='POST'>
            <input type="hidden" id="no" name="no" value="${member.no}">
            <input type="hidden" id="id" name="id" value="${member.id}"> 
          <div class="row_group newPwd" style="display:none;">
              <div class="join_row">
                <h3 class="join_title">
                  <label for ="pswd1">새 비밀번호</label>
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
            </div>
        
        <div class="btn_area newBtn" style="display:none;">
          <button class="btn btn_type btn-outline-secondary sunext"  data-toggle="modal" data-target="#exampleModalCenter" type="button" >변경하기</button>
        </div><!-- .btn_area -->
    
            <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content"> 
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">비밀번호 변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        비밀번호를 변경하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary"  id="btnJoin">확인</button>
      </div>
    </div>
  </div>
</div>
    
    
            </form>
                  
         <div class="btn_area oldBtn">
          <button class="btn btn_type btn-outline-secondary sunext" type="button" id="btnJoin2" >확인</button> 
        </div><!-- .btn_area --> 
         </div>
              </div>
        

          </div>
          <!-- .join_content -->
        </c:otherwise>
      </c:choose>
    </div>
    <!-- .content -->
  </div>
  <!-- .container -->

  <jsp:include page="../javascript.jsp" />
  <script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>
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


$(document).ready(function() {
  $('#oldInput').focus();
  });

  $('#btnJoin2').on('click', function(){
   
   var id = $('#id').val();
   var password = $('#oldInput').val(); 
     
     $.post('../checkPassword', 
         {
       id: id,
       password: password 
         },
       function(obj) {
         if (obj.status == 'success') { 
           alert("확인되었습니다.")
           $('.oldPwd').hide();
           $('.newPwd').show();
           $('.newBtn').show(); 
           $('.oldBtn').hide();
         } else { 
           $('#newMessage').show();
           $('#oldInput').focus(); 
           $('#oldInput').val(''); 
         } 
       }); 
});
  
  
  var pwFlag = false;

  $(document).ready(function() {
    defaultScript();

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
      viewTerms();
    })
    
    $("#btnAgree").click(function(event) {
      submitAgree();
      return false;
    })

    $('#btnJoin').click(function(event) {
      submitClose();
     
      if (pwFlag) {
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
    if (pwFlag) {
      $('#passwordUpdate_form').submit();
      
    } else {
      submitOpen();
      return false;
    }
  };

  function submitClose() {
    $('#btnJoin').attr("disabled", true);
  };

  function submitOpen() {
    $('#btnJoin').attr("disabled", false);
  };

  function checkUnrealInput() {

    if (checkPswd1() &
        checkPswd2() 
        ) {
          return true;
        } else {
          return false;
        }
  };
   
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
  };

  function showSuccessMsg(obj, msg) {
    obj.attr("class", "error_next_box green");
    obj.html(msg);
    obj.show();
  };

  function showDefaultBox(oBox) {
    oBox.attr("class", "ps_box");
  };

  function showErrorBox(oBox) {
    oBox.attr("class", "ps_box discord");
  };

  function showDefaultBoxByPen(oBox) {
    oBox.attr("class", "ps_box int_pass");
  };

  function showSuccessBoxBySuccess(oBox) {
    oBox.attr("class", "ps_box int_pass_check accord");
  };

  function showErrorBoxByError(oBox) {
    oBox.attr("class", "ps_box int_pass_check2 discord");
  };

  function showDefaultBoxByOK(oBox) {
    oBox.attr("class", "ps_box int_pass_check");
  };

  function hideMsg(obj) {
    obj.hide();
  };


  function checkPswd1() {
    if (pwFlag) {
      return true;
    }

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
  };

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
    var oBox = $('#termsBox');
    var oMsg = $('#termsErrorMsg');

    if ($("#termsService").is(":checked") == false ||
        $("#termsPrivacy").is(":checked") == false ||
        $("#termsThirdParty").is(":checked") == false) {

      var arr = $('.input_chk');
      arr.each(function(index, item) {
        $(item).css('border-left', '0');
        $(item).css('border-right', '0');
      });
      $('.input_chk:first').css('border-top', '0');
      $('.input_chk:last').css('border-bottom', '0');
      oBox.css("border", "solid 1px red");
      oMsg.show();
      res = false;
    } else {
      oBox.css("border", "0");
      var arr = $('.input_chk');
      arr.each(function(index, item) {
        $(item).css('border-left', '1px solid rgb(218, 218, 218)');
        $(item).css('border-right', '1px solid rgb(218, 218, 218)');
      });
      $('.input_chk:first').css('border-top', '1px solid rgb(218, 218, 218)');
      $('.input_chk:last').css('border-bottom', '1px solid rgb(218, 218, 218)');
      oMsg.hide();
    }

    return res;
  }
  </script>
</body>
</html>