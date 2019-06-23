<%@page import="com.eomcs.lms.domain.Match"%>
<%@page import="com.eomcs.lms.domain.Team"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<title>매치보드 글 등록하기</title>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">

<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">

<link rel="stylesheet" href="${contextRootPath}/css/matchboard.css">

<link rel="stylesheet" href="${contextRootPath}/jquery-ui-1.12.1.datepicker2/jquery-ui.css" />

<script src="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
<link href="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet"> 
<link href="https://sweetalert2.github.io/styles/bootstrap4-buttons.css" rel="stylesheet">

<style>   
  th{
    vertical-align: middle!important;
    text-align: center;
    background: #f9f7f7;
  }
  .ui-datepicker-calendar thead th {
color:black;
 }
.btn-sss, .btn-fff {
 cursor: pointer
}
</style>

</head>      
<body>
 <c:choose>
      <c:when test="${teamsCheck eq 'notTeams'}">
      <script>
      alert("소속된 팀이 없습니다. 팀을 먼저 생성해주세요!")
       location.href="${contextRootPath}/app/matchboard";
      </script>
       </c:when>
</c:choose>


  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />
      
<div id="main-text" style="margin-bottom: 40px;">
    <img src="${contextRootPath}/images/matchboard.png" style="width: 100%; height: 100%;">
    <div class="text-field" id="main-textfield">
      <h2 style="text-align: center;">
        <b>매치 글</b>을 <b>등록</b>할 수 있습니다.
      </h2>
      <br>
      <p>   
        <b>매치</b> 글을 등록한 후
      </p>
      <p>
        다른 팀의<b>대결 신청을 받아</b>경기를 진행해 보세요.
      </p>      
    </div>
  </div>        
     
  <div class="container" id="main-wrap" style="box-shadow: 0px 0px 10px 0px darkgrey; padding: 15px; margin-bottom: 100px;">
  
    <form action='add' method='post' name="submit">
      <table id="match_table" class="table table-bordered table-white">
        <tbody>
          <tr>
            <th scope="row">제목</th>
            <td colspan="3"><input autocomplete=off type="text" id="title" class="form-control col-md-12"
              name="title"></td>
          </tr>
          <tr>
            <th scope="row">소속팀</th>
            <td><select name='teamNo' class="custom-select" id="selectBox22">
                <option value="" disabled selected hidden>소속팀 선택</option>
                <c:forEach items="${match}" var="match">   
                  <c:if test="${!match.team.teamMember.team_leader}">
                    <option value='${match.team.teamId}'>${match.team.teamName}</option>
                  </c:if>
                </c:forEach>
            </select></td>
            <th scope="row">경기일</th>
            <td><input autocomplete=off class="form-control" type='text' id="datepicker" name='playDate' value=""/></td>
          </tr>
          <tr>
            <th scope="row">종목</th>
            <td><select name='teamSportsId' class="custom-select" id="inputGroupSelect01">
                <option value="" disabled selected hidden>종목선택</option>
                <!-- db명 toplc  -->
                <option value="1">축구</option>
                <option value="2">야구</option>
                <option value="3">농구</option>
                <option value="4">탁구</option>
            </select></td>
            <th scope="row">경기장</th>
            <td>
              <div class="input-group md-form form-sm form-2 pl-0">
                <input id="pInput" autocomplete=off class="form-control my-0 py-1 lime-border" type="text"
                  placeholder="검색하세요" aria-label="Search" name="stadiumName">
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
                      <option value="" disabled selected hidden>지역선택</option>
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
                      <option value="" disabled selected hidden>지역선택</option>
                    </select>
                  </div>
                </div>
                <input type="hidden" name="location" id="location" value=""> <!-- 실질적 위치 들어가는 부분 -->
              </div>
            </td>
            <th scope="row">전화번호</th>
            <td><input autocomplete=off type="text" class="form-control" name="telephone"></td>
          </tr>
          <tr>
            <th scope="row">내용</th>
            <td colspan="3"><textarea name="contents" class="form-control" 
            rows="10" cols="50" placeholder="경기 상세정보를 입력하세요"></textarea>
            </td>
          </tr>    
          <tr>    
            <th scope="row">비용(원)</th>                      
            <td colspan="3">
            <input type="number" autocomplete=off class="form-control" maxlength="7" oninput="numberMaxLength(this);"
            name="cost" value=0 style="width: 343px;"></td>
          </tr>
        </tbody>
      </table>

      <div id="btnArea" style=" text-align: center; margin-bottom: 25px;">       
          <a class="btn btn-outline-dark" href='${contextRootPath}/app/matchboard'>목록</a>
          <input type="button" id="add" class="btn btn-outline-dark" onclick="check_onclick()" value="매치보드에 등록하기">
      </div>
    </form>

  </div>
  <!-- .container -->



<script src="${contextRootPath}/node_modules/jplist-es6/dist/1.2.0/jplist.min.js"></script>
 <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />
 <!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

  <script src="${contextRootPath}/jquery-ui-1.12.1.datepicker2/jquery-ui.min.js"></script>

<script src="${contextRootPath}/js/rootpath.js"></script>

  <script type="text/javascript">
			var openWin;
			
			var swalWithBootstrapButtons = Swal.mixin({
        customClass: {
          confirmButton: 'btn btn-success btn-sss',
          cancelButton: 'btn btn-danger btn-fff'
        },
        buttonsStyling: false,
      })
			
			function openMap() {
				// window.name = "부모창 이름"; 
				window.name = "parentForm";
				// window.open("open할 window", "자식창 이름", "팝업창 옵션");
				openWin = window.open(
       "${contextRootPath}/app/matchboard/map.jsp", "childForm", "width=800, height=500, resizable = no, scrollbars = no");
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
            	   
            	    $.getJSON('./AddressCheck', 
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
            	             
            	             var mid = $("#gugun option:selected").val();
            	             var top = $("#sido option:selected").val();
            	                console.log(top)
            	                console.log(mid)
            	               $('#location').val(top + mid) 
            	               console.log($('#location').val())
            	           } 
            	           }); 
            	 });
            
            $('#gugun').on('click', function(){
            	   
                var top = $("#sido option:selected").val();
                var mid = $("#gugun option:selected").val();
               
                console.log(top)
                console.log(mid)
                
               $('#location').val(top + mid) 
               console.log($('#location').val())
              });
            

			
			function numberMaxLength(e){
			    if(e.value.length > e.maxLength){
			        e.value = e.value.slice(0, e.maxLength);
			    }
			}
			
			
function check_onclick(){
  		theForm=document.submit;
  		var choicelocation1 = $("#sido option:selected").val();
  		var choicelocation2 = $("#gugun option:selected").val();
  
  if(theForm.title.value=="" || theForm.teamNo.value=="" || theForm.playDate.value==""
      || choicelocation1=="" || theForm.teamSportsId.value=="" || theForm.contents.value==""
        || theForm.cost.value==""){
    
  		if(theForm.title.value==""){
  		  swalWithBootstrapButtons.fire({
          title: "확인해 주세요!",
          html: '제목 입력란이 비어있습니다.',
          type: 'error'
      }).then((result) => {
          if (result.value) {
            theForm.title.focus();
            return false;
          }
      })
  		}
  		else if(theForm.teamNo.value==""){
        swalWithBootstrapButtons.fire({
          title: "확인해 주세요!",
          html: '소속팀 선택이 되어있지 않습니다.',
          type: 'error'
      }).then((result) => {
          if (result.value) {
            theForm.teamNo.focus();
            return false;
          }
      })
    		}
      else if(theForm.playDate.value==""){
        swalWithBootstrapButtons.fire({
          title: "확인해 주세요!",
          html: '경기 날짜를 입력해주세요.',
          type: 'error'
      }).then((result) => {
          if (result.value) {
            theForm.playDate.focus();
            return false;
          }
      })
    		}
       else if(choicelocation1==""){
         swalWithBootstrapButtons.fire({
           title: "확인해 주세요!",
           html: '지역을 선택 해주세요.',
           type: 'error'
       }).then((result) => {
           if (result.value) {
             return false;
           }
       })
    		}
      else if(theForm.teamSportsId.value==""){
        swalWithBootstrapButtons.fire({
          title: "확인해 주세요!",
          html: '종목을 선택해 주세요.',
          type: 'error'
      }).then((result) => {
          if (result.value) {
            theForm.teamSportsId.focus();
            return false;
          }
      })
    		}
      else if(theForm.contents.value==""){
        swalWithBootstrapButtons.fire({
          title: "확인해 주세요!",
          html: '내용을 입력해 주세요.',
          type: 'error'
      }).then((result) => {
          if (result.value) {
            return false;
          }
      })
        }
      else if(theForm.cost.value == ""){
        swalWithBootstrapButtons.fire({
          title: "확인해 주세요!",
          html: '비용을 입력해 주세요.',
          type: 'error'
      }).then((result) => {
          if (result.value) {
            theForm.cost.focus();
            return false;
          }
      })
        }
  		
  		return false;
  }
  
  if (theForm.playDate.value.length > 0 || theForm.playDate.value != null) {
    console.log("여기");
    
    if (dateDiff(theForm.playDate.value,new Date())) { // 현재날짜가 삭제 시작일 후 인 경우
      console.log("여긴?");
      swalWithBootstrapButtons.fire({
        title: "확인해 주세요!",
        html: '현재 날짜 이후로만 선택할 수 있습니다.',
        type: 'error'
    })
          theForm.cost.focus();
          return false;
      
    }
  }
  
  swalWithBootstrapButtons.fire({
    title: '매치를 등록하시겠습니까?',
    type: 'warning',
    showCancelButton: true,
    confirmButtonText: '확인',
    cancelButtonText: '취소',
    reverseButtons: true
  }).then((result) => {
    if (result.value) {
      document.submit.submit();
    } else if (result.dismiss === Swal.DismissReason.cancel) {
      return false;
    }
  })
  }
  
function dateDiff(_date1, _date2) {
  var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
  var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);

  diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
  diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());

  var diff = diffDate_2.getTime() - diffDate_1.getTime();
  //diff = Math.ceil(diff / (1000 * 3600 * 24));
  console.log(diff);
  
  if (diff > 0) {
    return true;
  } else {
    return false;
  }
  
 // return diff;
  }
		</script>



</body>
</html>
