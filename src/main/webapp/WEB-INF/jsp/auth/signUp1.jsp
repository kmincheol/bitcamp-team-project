<%@ page language="java" 
         contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입(약관동의)</title>
  <jsp:include page="../commonCss.jsp"/>
  <link rel="stylesheet" href="${contextRootPath}/css/signUp1.css">
</head>
<body>

<jsp:include page="../header.jsp"/>

<div id="container">
  <div id="content">
  <h1>스포츠 매칭 <strong>홈페이지</strong> 방문을 환영합니다.</h1>
            
    <div class="join_step"><!-- step단계표현 -->
      <img src="../../images/signUp1.png">
    </div>

  <hr class="hrblack"/>

    <div class="join_content">
      <div class="join_form">
        <form id="join_form" action="">
          <div class="terms_p">
            <p class="terms_chk_all">
              <span class="input_chk">
                <input type="checkbox" id="chk_all" name="chk_all">
                <label for="chk_all">
                  <span class="chk_all_txt">서비스 이용약관, 개인정보 수집 및 이용, 개인정보 제3자 제공,<br>마케팅 및 광고에의 활용(선택) 등 모든 약관에 동의합니다.
                  </span>
                </label>
              </span>
            </p>
            <ul class="terms_bx_list">
              <li class="terms_bx">
                <h2 class="terms_bx_header">서비스 이용약관</h2>
                <div class="terms_box" tabindex="0" id="dirService">
                  <!-- 서비스 이용약관 -->
                  <div class="article">
                    <h3 class="article_title">서비스 이용약관 제목입니다.</h3>
                    <p class="article_text">서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.서비스 이용약관 내용입니다.</p>
                  </div>
                </div>
                <span class="input_chk">
                  <input type="checkbox" id="termsService" name="termsService" class="chk">
                  <label for="termsService">서비스 이용약관에 동의합니다.
                    <span class="terms_necessary">(필수)</span>
                  </label>
                </span>
              </li>
              
              <li class="terms_bx">
                <h2 class="terms_bx_header">개인정보 수집 및 이용 동의</h2>
                <div class="terms_box" tabindex="0" id="dirPrivacy">
                  <!-- 개인정보 수집 및 이용 동의 -->
                  <div class="article">
                    <h3 class="article_title">개인정보 수집 제목입니다.</h3>
                    <p class="article_text">개인정보 수집 내용입니다.</p>
                  </div>
                </div>
                <span class="input_chk">
                  <input type="checkbox" id="termsPrivacy" name="termsPrivacy" class="chk">
                  <label for="termsPrivacy">개인정보 수집 및 이용에 동의합니다.
                    <span class="terms_necessary">(필수)</span>
                  </label>
                </span>
              </li>
              
              <li class="terms_bx">
                <h2 class="terms_bx_header">개인정보 제3자 제공 동의</h2>
                <div class="terms_box" tabindex="0" id="dirThirdParty">
                  <!-- 개인정보 제3자 제공 동의 -->
                  <div class="article">
                    <h3 class="article_title">제목입니다.</h3>
                    <p class="article_text">내용입니다.</p>
                  </div>
                </div>
                <span class="input_chk">
                  <input type="checkbox" id="termsThirdParty" name="termsThirdParty" class="chk">
                  <label for="termsThirdParty">개인정보 제3자 제공에 동의합니다.
                    <span class="terms_necessary">(필수)</span>
                  </label>
                </span>
              </li>
              
              <li class="terms_bx">
                <h2 class="terms_bx_header">마케팅 및 광고에의 활용</h2>
                <div class="terms_box" tabindex="0" id="dirMarketing">
                  <!-- 마케팅 및 광고에의 활용 -->
                  <div class="article">
                    <h3 class="article_title">제목입니다.</h3>
                    <p class="article_text">내용입니다.</p>
                  </div>
                </div>
                <span class="input_chk">
                  <input type="checkbox" id="termsMarketing" name="termsMarketing" class="chk">
                  <label for="termsMarketing">마케팅 및 광고에의 활용에 동의합니다.
                    <span class="terms_choice">(선택-체크하지 않을 경우 동의 안함으로 간주합니다.)</span>
                  </label><br>
                </span>
                <span class="input_chk">
                  <input type="checkbox" id="termsEmail" name="termsEmail" class="chk">
                  <label for="termsEmail">마케팅 정보 이메일 수신동의
                    <span class="terms_choice">(선택)</span>
                  </label>
                  <input type="checkbox" id="termsSms" name="termsSms" class="chk">
                  <label for="termsSms">마케팅 정보 SMS 수신동의
                    <span class="terms_choice">(선택)</span>
                  </label>
                </span>
              </li>
            </ul>
          </div><!-- .terms_p -->
            <div class="btn_area">
              <a class="btn btn-outline-secondary sunext" id="btnAgree"
                 type="button" href="#">다음</a>
            </div><!-- .btn_area -->
        </form>
      </div><!-- .join_form -->
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