<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 비밀번호 발급</title>
<jsp:include page="../commonCss.jsp" />
<link rel="stylesheet" href="${contextRootPath}/css/findPassword.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

</head>
<body>

  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />

  <div class="container" id="container">
    <div id="content">
      <input type="hidden" id="authType" name="authType" value="password">

      <h1 style="margin-bottom: 20px;">임시 비밀번호 발급</h1>

      <hr class="hrblack" />

      <div id="findPwdBox">
        <div id="findPwdContent">
          <div id="findPwdComment">
            <p>
              <strong>임시 비밀번호</strong>를 발급받으실 수 있습니다.
            </p>
          </div>
          <div id="findPwdImgBox">
            <label for="findPwdAuthBtn">
              <img id="findPwdImg" src="../../images/email.png">
            </label>
          </div>
          <div id="findPwdAuthComment">
            <p>
                       가입하신 <strong>이메일</strong>로 인증해주세요.
            </p>
          </div>
        </div><!-- #findPwdContent -->
        <hr class="hrSlim">
      </div><!-- #findPwdBox -->

      <div id="findPwdAuth">
        <div id="findPwdAuthBox">
          <button class="btn btn-lg btn-outline-dark" id="findPwdAuthBtn" type="button">이메일 인증</button>
        </div>


        <div id="findPwdDiv">
          <div id="emailAuth" style="display: none">
            <div class="join_row join_email">
              <h3 class="join_title">
                <label for="email">이메일 인증</label>
              </h3>
              <span class="ps_box int_pass" id="joinCode"> <input type="text" id="email"
                  name="email" placeholder="이메일을 입력해주세요." maxlength="100" class="int"
                  autocomplete=off>
              </span> 
              <input id="btnSend" type="button" value="인증번호받기" class="btn btn-sm btn-outline-dark emailBtn"> 
              <span class="error_next_box" id="emailMsg" style="display: none" role="alert"></span>
            </div>
            <div class="join_row join_email join_authNo_confirm">
              <span class="ps_box int_pass" id="authNoBox"> <input type="tel" id="authNo"
                  placeholder="인증번호 입력하세요" class="int" maxlength="6" disabled>
              </span> 
              <input id="authSend" type="button" value="인증하기" class="btn btn-sm btn-outline-dark emailBtn"> 
              <span class="error_next_box" id="authNoMsg" style="display: none" role="alert"></span>
            </div>
          </div>
          <div class="btn_area" id="findPwdBtnBox" style="display: none">
            <button class="btn btn-outline-dark btn-lg" id="btnJoin" type="button">임시 비밀번호 발송</button>
          </div>
          <div class="btn_area" id="AfterBtnBox" style="display: none">
            <p>
              <strong>임시 비밀번호</strong>를 인증하신 이메일로 발송했습니다. <br>임시 비밀번호로 로그인 하신 후, <br>마이페이지에서 비밀번호를 변경해 주시기 바랍니다.
            </p>
            <button class="btn btn-outline-dark btn-lg" id="mainBtn" type="button" onclick="location.href='../main'">메인화면</button> 
            <button class="btn btn-outline-dark btn-lg" id="loginBtn" type="button" onclick="location.href='../auth/form'">로그인하기</button>
          </div>
        </div>
      </div><!-- #findPwdAuth -->
    </div><!-- #content -->
  </div><!-- #container -->
  
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />  
  <jsp:include page="../javascript.jsp" />
  <script>
			"use strict"

			var authFlag = false;
			var emailFlag = false;

			$(document).ready(function() {
				defaultScript();

				$('#findPwdAuthBtn').click(function() {  
					$('#emailAuth').show();
					$('#findPwdAuthBtn').hide();
					return false;
				});

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

				$('#btnJoin').click(function(event) {
					submitClose();

					if (authFlag) {
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
				if (authFlag) {
					pwdSend();
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
				if (checkEmailText($('#email').val()) & checkAuthNo()) {
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
				oMsg.hide();
				showDefaultBoxByPen(oImg);
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

			function sendEmail() {
				var emailAuth = $('#email').val();
				var typeAuth = $('#authType').val();
				var oMsg = $('#emailMsg');
				var oBox = $('#joinCode');
				var authNoBox = $('#authNoBox');
				var authNoMsg = $('#authNoMsg');

				if (!emailFlag) {
					showErrorBoxByError(oBox);
					showErrorMsg(oMsg, "이메일 주소를 확인하시고 다시 입력해주세요.");
					return false;
				}

				$
						.ajax({
							type : "POST",
							url : '../member/sendEmail',
							contentType : 'application/json',
							dataType : "text",
							data : JSON.stringify({
								email : emailAuth,
								type : typeAuth
							}),
							success : function(data) {

								showSuccessMsg(oMsg,
										"인증메일을 발송했습니다.<br>인증메일이 오지 않으면 입력하신 정보가 정확한지 확인해 주세요.");
								$("#authNo").attr("disabled", false);
								showDefaultBoxByOK(oBox);
								showDefaultBoxByPen(authNoBox);
								authNoMsg.hide();
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
					type : "POST",
					url : "checkAuthNo",
					contentType : 'application/json',
					dataType : "text",
					data : JSON.stringify({
						authKey : authNo,
						email : emailAuth,
						type : typeAuth
					}),
					success : function(data) {
						var result = data.substr(4);
						if (result == "0") {
							showSuccessMsg(oMsg,
									"이메일 인증에 성공했습니다. <br>임시 비밀번호 발송 버튼을 눌러주세요.");
							showSuccessBoxBySuccess(oBox);
							$("#findPwdBtnBox").show();
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

			function pwdSend() {
				var email = $('#email').val();
				var oMsg = $('#authNoMsg');

				$
						.ajax({
							type : "GET",
							url : "sendPwdEmail?email=" + email,
							success : function(data) {
								var result = data.substr(7);
								if (result == "1") {
									$("#authNo").attr("disabled", false);
									$('#emailAuth').hide();
									$('#findPwdBtnBox').hide();
									$('#AfterBtnBox').show();
									return true;
								} else if (result == "0") {
									showErrorMsg(oMsg,
											"임시비밀번호 발급 중에 오류가 발생했습니다.<br>다시 한번 임시 비밀번호 발송 버튼을 눌러주세요.");
									return false;
									
								} else if (result == "4") {
								  showErrorMsg(oMsg,
                  "이 이메일로 가입한 계정은 소셜로그인으로 가입된 계정입니다.<br>소셜로그인으로 가입하신 계정은 임시 비밀번호를 받으실 수 없습니다.");
								  return false;
								} else {
									showErrorMsg(oMsg,
											"임시 비밀번호를 전달할 메일 발송에 실패했습니다.<br>정상적인 이메일 계정이 아니거나 <br>이 이메일로 가입된 아이디가 존재하지 않습니다.");
									return false;
								}
							}
						});

				return false;
			}
		</script>

</body>
</html>