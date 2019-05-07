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
                </span>
              </div>
              <div class="join_row">
                <h3 class="join_title">
                  <label for ="pswd1">비밀번호</label>
                </h3>
                <span class="ps_box int_pass" id="pswdImg">
                  <input type="password" id="pswd1" name="pswd1" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
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
                <span class="ps box int_pass_check" id="pwd2Img">
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
                  <label for="email">본인 확인 이메일</label>
                </h3>
                <span class="ps_box int_email box_right_space">
                  <input type="text" id="email" name="email" maxlength="100" placeholder="선택입력" aria-label="선택입력" class="int">
                </span>
              </div>
              <span class="error_next_box" id="emailMsg" style="display:none" role="alert"></span>
            </div><!-- .row_group -->
            <!-- mobile -->
            <div class="join_row join_mobile" id="modDiv">
              <h3 class="join_title">
                <label for="phoneNo">휴대전화</label>
              </h3>
              <div class="int_mobile_area">
                <span class="ps_box int_mobile">
                  <input type="tel" id="phoneNo" name="phoneNo" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" maxlength="16">
                  <label for="phoneNo" class="lbl"></label>              
                </span>
                <a href="#" class="btn_verify btn_primary" id="btnSend" role="button">
                  <span class="">인증번호 받기</span>
                </a>
              </div>
              <div class="ps_box disable box_right_space" id="authNoBox">
                <input type="tel" id="authNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" aria-describedby="wa_verify" class="int" disabled maxlength="4">
                <label id="wa_verify" for="authNo" class="lbl">
                  <span class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span>
                  <span class="input_code" id="authNoCode" style="display:none;"></span>
                </label>
              </div>
              <span class="error_next_box" id="phoneNoMsg" style="display:none" role="alert"></span>
              <span class="error_next_box" id="authNoMsg" style="display:none" role="alert"></span>
              <span class="error_next_box" id="joinMsg" style="display:none" role="alert"></span>
            </div><!-- .join_row .join_mobile-->
          </div><!-- .join_form_left -->
          <div  class="join_form_right">
            <div class="join_row join_photo">
              <div class="join_photo_title">
                <h3 class="join_title">
                  <label for="photo">프로필 사진<span class="terms_choice">(선택)</span></label>
                </h3>
                <button class="btn btn-outline-secondary sunext" id="btnPhoto"
                  type="button">파일 첨부</button>
              </div>
              <div class="join_photo_view">
                <span class="photoView">
                  <label for="photo">
                    <!-- 파일 이미지 보이게하기 - 배우면 적용 -->
                    <img src="../../images/default.jpg" style="width:200px; height:200px;">
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
                    <input type="text" id="addressNo" name="addressNo" maxlength="6" readonly>
                  </span>
                  <!-- 주소찾기버튼 -->
                  <a href="#" class="btn btn-outline-secondary sunext addressBtn" id="addressBtn" type="button">우편번호 찾기</a>
                </div>
                <div class="ps_box">
                  <input type="text" name="addressBase" id="addressBase" title="주소를 입력해주세요." placeholder="주소를 입력해주세요." readonly>
                </div>
                <div class="ps_box">
                  <input type="text" name="addressDetail" id="addressDetail" title="상세주소를 입력해주세요." placeholder="상세주소를 입력해주세요." readonly>
                </div>
              </div>
              <div class="join_row">
                <h3 class="join_title">
                  <label for="self_introduce">자기소개<span class="terms_choice">(선택)</span></label>
                </h3>
                <div class="self_introduce_area">
                  <textarea class="self_introduce" id="self_introduce" placeholder="간단한 자기소개를 입력해주세요." rows="5" cols="30"></textarea>
                </div>
              </div>
            </div><!-- .row_group -->
          </div><!-- .join_form_right -->
        </div><!-- .join_form -->
        <div class="btn_area">
          <button class="btn btn-outline-secondary sunext" id="btnJoin"
                  type="button">가입하기</button>
        </div><!-- .btn_area -->
      </form>
    </div><!-- .join_content -->
  </div><!-- .content -->
</div><!-- .container -->

<jsp:include page="../footer.jsp"/>
<jsp:include page="../javascript.jsp"/>
<script>
"use strict"
$(document).ready(function() {

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
  
  $("#termsEmail").click(function() {
    viewTerms();
  })
  
  $("#termsSms").click(function() {
    viewTerms();
  })

  $("#btnAgree").click(function(event) {
    submitAgree();
    return false;
  })
});

function setTerms() {
  if ($("#chk_all").is(":checked")) {
    $("#termsService").prop("checked",true);
    $("#termsPrivacy").prop("checked",true);
    $("#termsThirdParty").prop("checked",true);
    $("#termsMarketing").prop("checked",true);
    $("#termsEmail").prop("checked",true);
    $("#termsSms").prop("checked",true);
  } else {
    $("#termsService").prop("checked",false);
    $("#termsPrivacy").prop("checked",false);
    $("#termsThirdParty").prop("checked",false);
    $("#termsMarketing").prop("checked",false);
    $("#termsEmail").prop("checked",false);
    $("#termsSms").prop("checked",false);
  }

  return true;
}

function viewTerms() {

  if( !$("#termsService").is(":checked") ||
      !$("#termsPrivacy").is(":checked") ||
      !$("#termsThirdParty").is(":checked") ||
      !$("#termsMarketing").is(":checked") ||
      !$("#termsEmail").is(":checked") ||
      !$("#termsSms").is(":checked")) {
    
    $("#chk_all").prop("checked",false);
  }

  if( $("#termsService").is(":checked") &&
      $("#termsPrivacy").is(":checked") &&
      $("#termsThirdParty").is(":checked") &&
      $("#termsMarketing").is(":checked") &&
      $("#termsEmail").is(":checked") &&
      $("#termsSms").is(":checked")) {
    
    $("#chk_all").prop("checked",true);
  }

  return true;
}

function setMarketingTerms() {
  if ($("#termsMarketing").is(":checked")) {
    $("#termsEmail").prop("checked",true);
    $("#termsSms").prop("checked",true);
  } else {
    $("#termsEmail").prop("checked",false);
    $("#termsSms").prop("checked",false);
  }

  return true;
}


function checkTerms() {
  var res = true;

  if ($("#termsService").is(":checked") == false ||
      $("#termsPrivacy").is(":checked") == false ||
      $("#termsThirdParty").is(":checked") == false) {
    
    alert("서비스 이용약관과 개인정보 수집 및 이용, 개인정보 제3자 제공에 대하여 모두 동의해주세요 ");
    res = false;
  }

  return res;
}

function submitAgree() {
  if (checkTerms() != true) {
    return false;
  }

  $("#join_form").submit();
  return true;
}

</script>
</body>
</html>