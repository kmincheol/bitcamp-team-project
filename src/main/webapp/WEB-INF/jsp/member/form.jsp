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
  <!-- header -->
  <jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />
  <!-- commonSidebar css -->
  <jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />
  <!-- footer.css -->
  <link rel="stylesheet" href="${contextRootPath}/css/footer.css">
  <link rel="stylesheet" href="${contextRootPath}/css/member_form.css">
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  
</head>
<body style="background:white">
<jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />
<jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />
 
<div class="container" id="container">
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
                     <input type="text" id="userId" name="id" class="int" title="ID" maxlength="20" placeholder="ex)abcd102">
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
                <input id="btnSend" type="button" value="인증번호받기" class="btn btn-sm btn-outline-dark emailBtn">
                <span class="error_next_box" id="emailMsg" style="display:none" role="alert"></span>
              </div>
              <div class="join_row join_email join_authNo_confirm">
                <span class="ps_box int_pass" id="authNoBox">
                  <input type="tel" id="authNo" placeholder="인증번호를 입력하세요"  class="int" maxlength="6" disabled>
                </span>
                <input id="authSend" type="button" value="인증하기" class="btn btn-sm btn-outline-dark emailBtn">
                <span class="error_next_box" id="authNoMsg" style="display:none" role="alert"></span>
              </div>
            </div><!-- .row_group -->
          </div><!-- .join_form_input -->
          
          <div class="terms_p">
          
            <h3 class="join_title agree_title">약관 동의</h3>

            <ul class="terms_bx_list" id="termsBox">
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
                  <button id="termsBtnService" type="button" class="btn btn-sm btn-outline-dark termsBtn">상세보기</button>
                </span>
                <div class="terms_box" tabindex="0" id="dirService">
                  <!-- 서비스 이용약관 -->
                  <div class="article">
                    <h3 class="article_title">BATTLE MATCHING 이용약관</h3><br>
                    <p class="article_text"><strong>제1장 총 칙</strong>
<br>
<br>
제1조(목적)
<br>
<br>
 이 약관은 BATTLE MATCHING에서 제공하는 홈페이지서비스(이하 "서비스"라 한다)의 이용조건 및 절차에 관한 사항을 규정함을 목적으로 합니다.
<br>
<br>
제2조(정의)
<br>
<br>
 이 약관에서 사용하는 용어의 정의는 다음 각호와 같습니다.
<br>
  - 회원 : 이용자 아이디를 부여받은 자
<br>
  - ID : BATTLE MATCHING이 승인하는 문자 또는 숫자의 조합
<br>
  - 비밀번호 : 비밀 보호를 위해 회원 자신이 설정한 문자, 숫자의 조합
<br>
<br>
제3조(효력의 발생과 변경)
<br>
<br>
 이 약관의 내용은 BATTLE MATCHING 홈페이지 화면에 게시하거나 기타의 방법으로 공지함으로써 효력이 발생됩니다.
<br>
 BATTLE MATCHING은 이 약관을 변경할 수 있으며, 변경된 약관은 이용자에게 공지함으로써 효력이 발생됩니다.
<br>
<br>
제4조(준용규정)
<br>
<br>
 이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법 및 기타 관련법령의 규정에 따릅니다.
<br>
<br>
<br>
<strong>제2장 서비스 이용계약</strong>
<br>
<br>
제5조(이용계약의 성립)
<br>
<br>
 이용계약은 이용자의 이용신청에 대한 BATTLE MATCHING의 승낙과 이용자의 약관 내용에 대한 동의로 성립됩니다.
<br>
<br>
제6조(이용신청)
<br>
<br>
 이용신청은 인터넷을 통하여 이용자가 BATTLE MATCHING에서 정한 가입신청서에 기록하여 신청할 수 있습니다.
<br>
<br>
제7조(이용신청의 승낙)
<br>
<br>
 회원이 신청서의 모든 사항을 정확히 기재하여 이용신청을 하였을 경우에 승낙합니다.
<br>
 다음 각호의 1에 해당하는 경우에는 이용 승낙을 하지 않을 수 있습니다.
<br>
  - 현재 거주지가 구청이 아닌 경우
<br>
  - BATTLE MATCHING의 관할구역내에 사무소를 두지 않은 기업체ㆍ법인 및 단체인 경우
<br>
  - 이용신청의 내용을 허위로 기재한 경우
<br>
  - 다른 사람의 명의를 사용하여 신청한 경우
<br>
  - 기타 이용신청 요건에 미비 되었을 때
<br>
<br>
제8조(계약사항의 변경)
<br>
<br>
 회원은 이용신청시 기재한 사항이 변경되었을 경우에는 인터넷을 통하여 수정 요청을 할 수 있습니다.
<br>
<br>
<br>
<strong>제3장 계약당사자의 의무</strong>
<br>
<br>
제9조(BATTLE MATCHING의 의무)
<br>
<br>
 BATTLE MATCHING은 서비스 제공과 관련해서 알고 있는 회원의 신상 정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 또는 기타 관계법령에서 정한 절차에 의한 요청이 있을 경우에는 그러하지 않습니다.
<br>
<br>
제10조(회원의 의무)
<br>
<br>
 회원은 서비스를 이용할 때 다음 각호의 행위를 하지 않아야 합니다.
<br>
  - 다른 회원의 ID를 부정하게 사용하는 행위
<br>
  - 서비스에서 얻은 정보를 복제, 출판 또는 제3자에게 제공하는 행위
<br>
  - BATTLE MATCHING의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위
<br>
  - 공공질서 및 미풍양속에 위반되는 내용을 유포하는 행위
<br>
  - 범죄와 결부된다고 객관적으로 판단되는 행위
<br>
  - 기타 관계법령에 위반되는 행위
<br>
 회원은 서비스를 이용하여 영업활동을 할 수 없으며, 영업활동에 이용하여 발생한 결과에 대하여 BATTLE MATCHING은 책임을 지지 않습니다.
<br>
 회원은 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도ㆍ증여할 수 없으며, 이를 담보로도 제공할 수 없습니다.
<br>
<br>
<br>
<strong>제4장 서비스 이용</strong>
<br>
<br>
제11조(회원 홈페이지에 관한 의무)
<br>
<br>
 회원은 필요에 따라 자신의 홈페이지, 게시판, 방명록, 등록자료 유지보수에 대한 관리책임을 갖습니다.
<br>
 회원은 BATTLE MATCHING에서 제공하는 자료를 임의로 삭제, 변경할 수 없습니다.
<br>
 회원은 자신의 홈페이지에 공공질서 및 미풍양속에 위반되는 내용물이나 제3자의 저작권 등 기타권리를 침해하는 내용물을 등록하는 행위를 하지 않아야 합니다. 만약 이와같은 내용물을 게재하였을때 발생하는 결과에 대한 모든 책임은 회원에게 있습니다.
<br>
 회원은 자신의 책임하에 개설한 홈페이지를 백업 등 여러가지 방법으로 본인이 관리하여야 합니다.
<br>
<br>
제12조(회원의 게시물 관리 및 삭제)
<br>
<br>
 효율적인 서비스 운영을 위하여 회원의 메모리 공간, 메시지크기, 보관일수 등을 제한할 수 있으며 등록하는 내용이 다음 각 호의 1에 해당하는 경우에는 사전 통지없이 삭제할 수 있습니다.
<br>
  - 다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우
<br>
  - 공공질서 및 미풍양속에 위반되는 내용인 경우
<br>
  - 범죄적 행위에 결부된다고 인정되는 내용인 경우
<br>
  - BATTLE MATCHING의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
<br>
  - 회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란 사이트를 링크하는 경우
<br>
  - 기타 관계법령에 위반된다고 판단되는 경우
<br>
<br>
제13조(게시물의 저작권)
<br>
<br>
 게시물의 저작권은 게시자 본인에게 있으며 회원은 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.
<br>
<br>
제14조(서비스 이용시간)
<br>
<br>
 서비스의 이용은 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 다만 정기 점검 등의 사유 발생시는 그러하지 않습니다.
<br>
<br>
제15조(서비스 이용 책임)
<br>
<br>
 서비스를 이용하여 해킹, 음란사이트 링크, 상용S/W 불법배포 등의 행위를 하여서는 아니되며 이를 위반으로 인해 발생한 영업활동의 결과 및 손실, 관계기관에 의한 법적 조치 등에 관하여는 구청은 책임을 지지 않습니다.
<br>
<br>
제16조(서비스 제공의 중지)
<br>
<br>
 다음 각호의 1에 해당하는 경우에는 서비스 제공을 중지할 수 있습니다.
<br>
  - 서비스용 설비의 보수 등 공사로 인한 부득이한 경우
<br>
  - 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우
<br>
  - 시스템 점검이 필요한 경우
<br>
  - 기타 불가항력적 사유가 있는 경우
<br>
<br>
<br>
<strong>제5장 계약해지 및 이용제한</strong>
<br>
<br>
제17조(계약해지 및 이용제한)
<br>
<br>
 회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 인터넷을 통하여 해지신청을 하여야 하며, BATTLE MATCHING에서는 본인 여부를 확인 후 조치합니다.
<br>
 BATTLE MATCHING은 회원이 다음 각호의 1에 해당하는 행위를 하였을 경우 사전 통지없이 이용계약을 해지하거나 또는 서비스 이용을 중지할 수 있습니다.
<br>
  - 타인의 이용자ID 및 비밀번호를 도용한 경우
<br>
  - 서비스 운영을 고의로 방해한 경우
<br>
  - 허위로 가입 신청을 한 경우
<br>
  - 같은 사용자가 다른 ID로 이중 등록을 한 경우
<br>
  - 공공질서 및 미풍양속에 저해되는 내용을 유포시킨 경우
<br>
  - 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우
<br>
  - 서비스의 안정적 운영을 방해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송하는 경우
<br>
  - 정보통신설비의 오작동이나 정보 등의 파괴를 유발시키는 컴퓨터바이러스 프로그램 등을 유포하는 경우
<br>
  - BATTLE MATCHING 또는 다른 회원이나 제3자의 지적재산권을 침해하는 경우
<br>
  - 타인의 개인정보, 이용자ID 및 비밀번호를 부정하게 사용하는 경우
<br>
  - 회원이 자신의 홈페이지나 게시판 등에 음란물을 게재하거나 음란 사이트를 링크하는 경우
<br>
  - 기타 관련법령에 위반된다고 판단되는 경우
<br>
<br>
<br>
<strong>제6장 면 책</strong>
<br>
<br>
제18조(면책 조항)
<br>
<br>
 BATTLE MATCHING은 회원이 서비스를 이용하여 얻은 정보 및 자료 등에 대하여 책임을 지지 않습니다.
<br>
 BATTLE MATCHING은 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 기타 어떠한 내용에 관하여서도 책임을 지지 않습니다.
<br>
제19조(재판 관할)
<br>
<br>
 서비스 이용으로 발생한 분쟁에 대해 소송이 제기 될 경우 BATTLE MATCHING은 본청 소재지를 관할하는 법원을 전속 관할법원으로 합니다.
<br>
<br>
<br>
<strong>부 칙</strong>
<br>
<br>
 이 약관은 2019년 7월 1일부터 시행합니다.
                    </p>
                  </div>
                </div>
              </li>
              
              <li class="terms_bx">
                <span class="input_chk">
                  <input type="checkbox" id="termsPrivacy" name="termsPrivacy" class="chk">
                  <label for="termsPrivacy"><strong>개인정보 수집 및 이용</strong>에 동의합니다.
                    <span class="terms_necessary">(필수)</span>
                  </label>
                  <button id="termsBtnPrivacy" type="button" class="btn btn-sm btn-outline-dark termsBtn">상세보기</button>
                </span>
                <div class="terms_box" tabindex="0" id="dirPrivacy">
                  <!-- 개인정보 수집 및 이용 동의 -->
                  <div class="article">
                    <h3 class="article_title">개인정보의 수집 및 이용 목적</h3><br>
                    <p class="article_text">
BATTLE MATCHING 사이트에서 제공하는 서비스는 다음의 목적을 위해 개인정보를 수집 및 이용합니다. 수집된 개인정보는 다음 목적 이외의 용도로는 이용되지 않습니다.
<br>
<br>
1.홈페이지 회원가입 및 관리
<br>
2.매치와 관련된 팀 정보제공
<br>
3.접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계
<br>
<br>
<strong>수집하려는 개인정보의 항목</strong>
<br>
<br>
- 필수항목 : 이름, 아이디, 이메일, 비밀번호
<br>
<br>
<strong>개인정보의 보유 및 이용기간</strong>
<br>
<br>
회원가입일로부터 탈퇴시까지
<br>
<br>
<strong>개인정보 수집에 대한 거부 권리 및 그에 따른 서비스 제한사항</strong>
<br>
<br>
이용자는 본 사이트에서 수집하는 개인정보에 대해 동의를 거부할 권리가 있으나 필수항목에 대한 수집, 이용에 대한 동의 거부 시 회원가입과 서비스 이용에 제한을 받을 수 있습니다.
                    </p>
                  </div>
                </div>
              </li>
              
              <li class="terms_bx">
                <span class="input_chk">
                  <input type="checkbox" id="termsThirdParty" name="termsThirdParty" class="chk">
                  <label for="termsThirdParty"><strong>개인정보 제3자 제공</strong>에 동의합니다.
                    <span class="terms_necessary">(필수)</span>
                  </label>
                  <button id="termsBtnThirdParty" type="button" class="btn btn-sm btn-outline-dark termsBtn">상세보기</button>
                </span>
                <div class="terms_box" tabindex="0" id="dirThirdParty">
                  <!-- 개인정보 제3자 제공 동의 -->
                  <div class="article">
                    <h3 class="article_title">개인정보 제3자 제공</h3>
                    <p class="article_text">
귀하의 개인정보는 홈페이지 회원 가입 시 제3자 제공 동의를 선택한 경우 다음과 같이 제3자에게 제공됩니다.
<br>
<br>
<strong>1) 개인정보의 제공</strong>
<br>
<br>
- 제공대상 : BATTLE MATCHING LEGION
<br>
- 제공목적 : 각종 이벤트 및 홍보 마케팅의 정보 및 다양한 고객서비스의 혜택 제공
<br>
- 개인정보의 항목 : 성명, 이메일, 생년월일, 휴대폰번호
<br>
- 보유 및 이용기간 : 개인정보 보유기간과 동일
<br>
- 동의 거부권 및 거부 시 불이익 : 각종 이벤트와 홍보마케팅의 정보 및 다양한 고객서비스의 혜택을 받지 못할 수 있습니다.
<br>
- 각종 이벤트와 홍보 마케팅 활용 및 다양한 고객서비스 제공
<br>
<br>
<strong>2) 개인정보의 수집 이용</strong>
<br>
<br>
가) 개인정보의 수집 이용 목적
<br>
① 상품 및 서비스 홍보 및 판매 권유
<br>
② 경품지급, 사은행사 등 고객의 편의 제공
<br>
③ 고객유치, 고객 만족도 조사 및 이벤트행사
<br>
나) 수집ㆍ이용할 개인정보의 항목
<br>
- 성명, 생년월일, 휴대폰번호
<br>
<br>
<strong>3) 개인정보의 보유 이용기간 : 제공일로부터 3년</strong>
<br>
<br>
- 귀하의 개인정보는 수집ㆍ이용에 관한 동의일로부터 동의철회 시까지 보유 이용할 수 있습니다.
<br>
- 본 계약관련 (금융)거래 종료일 이후에는 위에 기재된 목적과 관련된 사고 조사, 분쟁 해결, 민원처리의 목적을 위하여 필요한 범위 내에서만 보유ㆍ이용됩니다.
<br>
- 귀하는 위 개인정보의 수집ㆍ이용에 대한 동의를 거부할 수 있으며, 동의 후에도 언제든지 철회 가능 합니다.
<br>
※ 귀하는 개인(신용)정보의 선택적인 제공에 대한 동의를 거부할 수 있습니다. 다만, 관련 편의 제공(사은품, 할인쿠폰 제공 등), 사은행사(할인, 적립 등)안내에 따른 혜택의 제한이 있을 수 있습니다.
<br>             
                    </p>
                  </div>
                </div>
              </li>
              
              <li class="terms_bx">
                <span class="input_chk">
                  <input type="checkbox" id="termsMarketing" name="termsMarketing" class="chk">
                  <label for="termsMarketing"><strong>마케팅 및 광고</strong>에의 활용에 동의합니다.
                    <span class="terms_choice">(선택)</span>
                  </label>
                  <button id="termsBtnMarketing" type="button" class="btn btn-sm btn-outline-dark termsBtn">상세보기</button>
                </span>
                <div class="terms_box" tabindex="0" id="dirMarketing">
                  <!-- 마케팅 및 광고에의 활용 -->
                  <div class="article">
                    <h3 class="article_title">마케팅 활용 방침</h3>
                    <p class="article_text">
귀하는 개인(신용)정보의 선택적인 수집∙이용, 제공에 대한 동의를 거부할 수 있습니다. 다만, 동의하지 않을 경우 관련 편의제공(경품제공, 신상품 및 투자 서비스소개, 사은행사)안내 등 이용 목적에 따른 혜택에 제한이 있을 수 있습니다. 그 밖에 계약과 관련되 불이익은 없습니다. 동의한 경우에도 귀하는 동의를 철회하거나 마케팅 목적으로 귀하에게 연락하는 것을 중지하도록 요청할 수 있습니다.
<br>
<br>
<strong>1. 제공목적</strong>
<br>
<br>
고객에 대한 편의제공, 귀사 및 제휴업체의 상품·서비스 안내 및 이용권유, 사은·판촉행사 등의 마케팅 활동, 시장조사 및 상품·서비스 개발연구 등을 목적으로 수집·이용
<br>
<br>
<strong>2. 제공항목</strong>
<br>
<br>
- 개인식별정보: 성명, 성별, 휴대전화번호, e-mail, 주소 등
<br>
- 고객 ID, 접속 일시, IP주소 SNS아이디 등
<br>
<br>
<strong>3. 보유기간</strong>
<br>
<br>
동의일로부터 회원 탈퇴 혹은 마케팅 동의 해제시 까지 보유·이용
<br>
<br>
※ 상기 내용이 변동하는 경우 당사의 인터넷홈페이지 게시 등을 통해 그 내용을 공시
                    </p>
                  </div>
                </div>
              </li>
            </ul>
            <span class="error_next_box" id="termsErrorMsg" style="display:none" role="alert">(필수)로 표시된 약관에 모두 동의해주세요.</span>
          </div><!-- .terms_p -->
          
        </div><!-- .join_form -->
        <div class="btn_area">
          <button class="btn btn_lg btn_type btn-outline-dark sunext" id="btnJoin" type="button">가입하기</button>
        </div><!-- .btn_area -->
      </form><!-- #join_form-->
    </div><!-- .join_content -->
  </div><!-- .content -->
</div><!-- .container -->

<jsp:include page="../javascript.jsp"/>
<jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />
<jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />
<jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />
<script>
"use strict"

var idFlag = false;
var pwFlag = false;
var authFlag = false;
var emailFlag = false;

$(document).ready(function() {
  defaultScript();

  $('#userId').keyup(debounce(function() {
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
  
  $("#chk_all").prop("checked",false);
  setTerms();
  
  $("#chk_all").click(function() {
    setTerms();
    location.hash = '#btnAgree';
  })
  
  $("#termsBtnService").click(function() {
    $("#dirService").slideToggle();
  })
  
  $("#termsBtnPrivacy").click(function() {
    $("#dirPrivacy").slideToggle();
  })
  
  $("#termsBtnThirdParty").click(function() {
    $("#dirThirdParty").slideToggle();
  })
  
  $("#termsBtnMarketing").click(function() {
    $("#dirMarketing").slideToggle();
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
      checkEmailText($('#email').val()) & 
      checkAuthNo() &
      checkTerms()
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

  var id = $('#userId').val();
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

  var id = $('#userId').val();
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