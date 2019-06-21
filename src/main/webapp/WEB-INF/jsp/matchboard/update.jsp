<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>매치보드 글 수정하기</title>
<head>
<link rel="stylesheet" href="${contextRootPath}/css/common.css">
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">
<link rel="stylesheet" href="${contextRootPath}/jquery-ui-1.12.1.datepicker2/jquery-ui.css" />

<style>
  th{
    vertical-align: middle!important;
    text-align: center;
    background: #f9f7f7;
  }
  .ui-datepicker-calendar thead th {
color:black;
 }
</style>

</head>
<body>
 <c:choose>

      <c:when test="${confirm ne 'confirm'}">
      <script>
      alert("잘못된 접근입니다.")
       location.href="${contextRootPath}/app/matchboard";
      </script>
      </c:when>
      
</c:choose>


  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" /> 

  <div id="main-text">    
    <h2 style="text-align:center;"><b>매치 글</b>을 <b>수정</b>할 수 있습니다.</h2>
  </div>
  
  <div class="container" id="main-wrap" style="margin-top: 50px;">

    <form action='../update' method='post' name="update">
    
    <input type="hidden" name="no" value="${match.no}" style="display: none;" />
    <input type="hidden" name="teamNo" value="${match.teamNo}" style="display: none;">
      
      <table id="match_table" class="table table-bordered table-white">
        <tbody>
          <tr>
            <th scope="row">제목</th>
            <td colspan="3"><input type="text" id="title" class="form-control col-md-12"
              name="title" value="${match.no}"></td>
          </tr>
          <tr>
            <th scope="row">소속팀</th>
            <td>
            ${match.team.teamName}
            </td>
            <th scope="row">경기일</th>
            <td>
            <input autocomplete=off class="form-control" type='text' 
            id="datepicker" name='playDate' value="${match.playDate}"/>
            </td>
          </tr>
          <tr>
            <th scope="row">종목</th>
            <td><select name='teamSportsId' class="custom-select" id="inputGroupSelect01">
                <option value="${match.teamTypeSports.teamSportsTypeId}" disabled selected hidden></option>
                <option value="1">축구</option>
                <option value="2">야구</option>
                <option value="3">농구</option>
                <option value="4">탁구</option>
            </select></td>
            <th scope="row">경기장</th>
            <td>
            <div class="input-group md-form form-sm form-2 pl-0">
                <input id="pInput" class="form-control my-0 py-1 lime-border" type="text"
                  placeholder="검색하세요" value="${match.stadiumName}" aria-label="Search" name="stadiumName">
                <div class="input-group-append">
                  <span class="input-group-text lime lighten-2" id="basic-text1"><a
                    onclick="openMap()" class="fas fa-search text-grey" aria-hidden="true"></a></span>
                </div>
              </div>
            </td>
          </tr>
          <tr>
            <th scope="row">경기 지역</th>
            <td>
              <div class="form-group row" style="margin-bottom: 0;">
                <div class="col-sm">
                  <div class="input-group">
                    <select class="custom-select" id="sido">
                      <option value="${top.topLocationId}" disabled selected hidden>지역선택</option>
                       <c:forEach items="${locations}" var="topLocation">
                        <option value="${topLocation.topLocationNo}"
                          ${team.topLocation.topLocationId == topLocation.topLocationId ? "selected" : ""}>${topLocation.topLocationName}
                        </option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
                <div class="col-sm">
                  <div class="input-group">
                    <!-- 지역번호2를 받아야하니까 도메인 수정하장 -->
                    <select class="custom-select" id="gugun">
                      <option value="${middle.middleLocationId}" disabled selected hidden>지역선택</option>
                    </select>
                  </div>
                </div>
                <input type="hidden" name="location" id="location" value=""> <!-- 실질적 위치 들어가는 부분 -->
              </div>
            </td>
            <th scope="row">전화번호</th>
            <td><input type="text" class="form-control" name="telephone" value="${match.telephone}"></td>
          </tr>
          <tr>
            <th scope="row">내용</th>
            <td colspan="3"><textarea name="contents" class="form-control"
             rows="10" cols="50" placeholder="경기 상세정보를 입력하세요">${match.contents}</textarea>
            </td>
          </tr>    
          <tr>    
            <th scope="row">비용(원)</th>                      
            <td colspan="3">
            <input type="number" class="form-control" maxlength="7" oninput="numberMaxLength(this);"
            name="cost" value="${match.cost}" style="width: 343px;"></td>
          </tr>
        </tbody>
      </table>

      <div id="btnArea" style=" text-align: center;">       
          <a class="btn btn-outline-dark" href='${contextRootPath}/app/matchboard'>목록</a>
          <input type="button" id="add" class="btn btn-outline-dark" onclick="check_onclick()" value="매치보드 글 수정하기">
      </div>
    </form>
  </div>
  <!-- .container -->

 <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

<script src="${contextRootPath}/node_modules/jplist-es6/dist/1.2.0/jplist.min.js"></script>

  <script src="${contextRootPath}/jquery-ui-1.12.1.datepicker2/jquery-ui.min.js"></script>
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />


<script type="text/javascript">

var openWin;
var matctTeamTypeVal = ${match.teamTypeSports.teamSportsTypeId};

/* 페이지 로드시 종목번호로 자동 셀렉트 해줌 */
  $(function() {
	  $("#inputGroupSelect01 option:eq(${match.teamTypeSports.teamSportsTypeId})").attr("selected","selected");
  });

function openMap()
{
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("${contextRootPath}/app/matchboard/map.jsp",
            "childForm", "width=800, height=500, resizable = no, scrollbars = no");    
}



$(function() {
    $( "#datepicker" ).datepicker({
           defaultDate: +7,
           dateFormat: 'yy-mm-dd',
           buttonText: "선택",
           showMonthAfterYear:true,
           yearSuffix: "년",
           buttonImageOnly: true,
           dayNamesMin: ['일','월','화','수','목','금','토'],
           monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
           buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"
    });
});



$('#sido').change(function() {
	   var no = $(this).val();
	   console.log(name)
	   
	    $.getJSON('../AddressCheck', 
	         {
	       no: no
	         },
	       function(obj) {
	         if (obj.status == 'success') { 
	           var location = new Array;
	           var subLocation = obj.middleLocations 
	           var length = subLocation.length; 
	             $('#gugun').html('');
	             
	             for (var i = 0; i < length; i++) {
	               var option = $(
	                   "<option value='" + subLocation[i].middleLocationId+ "'>" + subLocation[i].middleLocationName + "</option>"); 
	                
	               $(option).appendTo($('#gugun'));
	             }
	           } 
	           }); 
	 });

        	$('#gugun').on('click', function() {
        
        		var top = $("#sido option:selected").val();
        		var mid = $("#gugun option:selected").val();
        
        		console.log(top)
        		console.log(mid)
        
        		$('#location').val(top + mid)
        		console.log($('#location').val())
        	});
        
        	
        	function numberMaxLength(e) {
        		if (e.value.length > e.maxLength) {
        			e.value = e.value.slice(0, e.maxLength);
        		}
        	}

	function check_onclick() {
		theForm = document.update;
		var choicelocation1 = $("#sido option:selected").val();
		var choicelocation2 = $("#gugun option:selected").val();

		if (theForm.title.value == "" || theForm.playDate.value == ""
				|| choicelocation1 == "" || theForm.teamSportsId.value == ""
				|| theForm.contents.value == "" || theForm.cost.value == "") {

			if (theForm.title.value == "") {
				alert("제목 입력란이 비어있습니다. 확인해 주세요.");
				theForm.title.focus();
			} else if (theForm.playDate.value == "") {
				alert("경기 날짜를 입력해주세요.");
			} else if (choicelocation1 == "") {
				alert("지역을 선택 해주세요.");
			} else if (theForm.teamSportsId.value == "") {
				alert("종목을 선택해 주세요.");
				theForm.teamSportsId.focus();
			} else if (theForm.contents.value == "") {
				alert("내용을 입력해 주세요.");
			} else if (theForm.cost.value == "") {
				alert("비용을 입력해 주세요.");
				theForm.teamSportsId.focus();
			}
		} else {
			if (confirm("매치 수정하시겠습니까?") == true) { //확인
				document.update.submit();
			} else { //취소
				return false;
			}
		}

	}
</script>

</body>


</html>