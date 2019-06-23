<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <head>
        <title>매치보드</title>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="${contextRootPath}/node_modules/mdbootstrap/css/mdb.min.css" >
        <link rel="stylesheet" href="${contextRootPath}/css/common.css" />
        <link rel="stylesheet" href="${contextRootPath}/node_modules/jplist-es6/dist/1.2.0/jplist.styles.css" />
 
 <!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- recruit_board_list.css -->
<link rel="stylesheet" href="${contextRootPath}/css/free/free.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">

<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">

<!-- MDBootstrap Datatables  -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/addons/datatables.min.css" rel="stylesheet">

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
<!-- <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet"> -->
 
        <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="${contextRootPath}/css/matchboardlist3.css" />
        <link rel="stylesheet" href="${contextRootPath}/css/recommendMatch.css" />
        <link rel="stylesheet" href="${contextRootPath}/jquery-ui-1.12.1.datepicker2/jquery-ui.css" /> 
 <style>
 .modal-title{
 color:red;
 }
       
 .recommendDiv {
  position: absolute;
  right: 115px;
  top: 350px;
}
 </style>
 
<jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />
  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" /> 
    </head>
    <body ng-app="app"> 

    <div id="topComment">
      <h2>
        등록된 <b>매치 글</b>을 검색하여 찾거나
      </h2>
      <h2>직접 매치글을 등록할 수 있습니다.</h2>
      <p style="margin-bottom:50px;">
      </p>
    </div>
  <div class="container" id="main-wrap">
       <!-- hidden sort control  -->
        <div style="display: none" data-jplist-control="hidden-sort" data-group="group1"
            data-path=".playDate"  data-order="asc"  data-type="text" >
        </div>
        
    <div class="content">
    <div id="searchArea">
    
        <!-- filter control -->
        <div id="toolsss">
					<table id="tabletable">
						<tr>
							<td>
								<div style="margin-left: 80px">
									<div id="allTypes">
										<button class="btn btn-dark" id="allbtn1" type="button"
											data-jplist-control="buttons-text-filter" data-path="default"
											data-mode="radio" data-group="group1" name="sportsType"
											data-selected="true">모든 종목</button>

										<div id="sstypeArea">
											<button id="stype" type="button"
												data-jplist-control="buttons-text-filter"
												data-path=".sportsType" data-mode="radio"
												data-group="group1" name="sportsType" data-text="축구">
												<img id="imgcontro1"
													src="${contextRootPath}/images/football_list_min.png"
													title="축구" style="width: 28px; height: 28px;">
											</button>
											<!-- 축구버튼 -->

											<button id="stype" type="button"
												data-jplist-control="buttons-text-filter"
												data-path=".sportsType" data-mode="radio"
												data-group="group1" name="sportsType" data-text="야구">
												<img id="imgcontro2"
													src="${contextRootPath}/images/baseball_list_min.png"
													title="야구" style="width: 28px; height: 28px;">
											</button>
											<!-- 야구버튼 -->

											<button id="stype" type="button"
												data-jplist-control="buttons-text-filter"
												data-path=".sportsType" data-mode="radio"
												data-group="group1" name="sportsType" data-text="농구">
												<img id="imgcontro3"
													src="${contextRootPath}/images/basketball_list_min.png"
													title="농구" style="width: 28px; height: 28px;">
											</button>
											<!-- 농구버튼 -->

											<button id="stype" type="button"
												data-jplist-control="buttons-text-filter"
												data-path=".sportsType" data-mode="radio"
												data-group="group1" name="sportsType" data-text="탁구">
												<img id="imgcontro4"
													src="${contextRootPath}/images/pingpong_list_min.png"
													title="탁구" style="width: 28px; height: 28px;">
											</button>
											<!-- 탁구버튼 -->

										</div>
									</div>

									<!-- 여기에 왼쪽에 공백있음 -->
									<div id="allLevel">
										<!-- filter control -->
										<button class="btn btn-dark" id="allbtn2"
											data-jplist-control="buttons-text-filter" data-path="default"
											data-mode="radio" data-group="group1" name="teamLevel"
											data-selected="true">모든 레벨</button>
										<!-- 전체 -->

										<div id="levelArea">
											<button type="button" id="levelbtn1"
												class="btn btn-outline-dark"
												data-jplist-control="buttons-text-filter"
												data-path=".teamLevel" data-mode="radio" data-group="group1"
												name="teamLevel" data-text="상">상</button>

											<button type="button" id="levelbtn2"
												class="btn btn-outline-dark"
												data-jplist-control="buttons-text-filter"
												data-path=".teamLevel" data-mode="radio" data-group="group1"
												name="teamLevel" data-text="중">중</button>

											<button type="button" id="levelbtn3"
												class="btn btn-outline-dark"
												data-jplist-control="buttons-text-filter"
												data-path=".teamLevel" data-mode="radio" data-group="group1"
												name="teamLevel" data-text="하">하</button>
										</div>
									</div>
								</div>
							</td>

							<td>
								<div id="inputBox2" style="margin-top: 5px;">
									<div class="md-form"
										style="font-size: 16px; margin-bottom: 15px;">
										글 제목 : <input autocomplete=off class="form-control-sm"
											id="titleSearchBox" aria-describedby="emailHelp"
											data-jplist-control="textbox-filter" data-group="group1"
											data-name="my-filter-1" data-path=".title" type="text"
											value="" data-clear-btn-id="name-clear-btn1" />
										<button type="button" class="btn btn-dark"
											id="name-clear-btn1">지우기</button>
									</div>

									<div class="md-form"
										style="font-size: 16px; margin-bottom: 15px;">
										팀 명 : <input autocomplete=off class="form-control-sm"
											id="teamSearchBox" aria-describedby="emailHelp"
											data-jplist-control="textbox-filter" data-group="group1"
											data-name="my-filter-1" data-path=".teamName" type="text"
											value="" data-clear-btn-id="name-clear-btn2" />

										<button type="button" class="btn btn-dark"
											id="name-clear-btn2">지우기</button>
									</div>

									<!-- datepicker 적용 -->
									<div class="md-form"
										style="font-size: 16px; margin-bottom: 15px;">
										날 짜 : <input autocomplete=off class="form-control-sm"
											type="text" id="datepicker">
										<button type="button" class="btn btn-dark"
											id="name-clear-btn3">초기화</button>

									</div>


								</div>

								<div style="display: none;">
									<input data-jplist-control="textbox-filter" data-group="group1"
										data-name="my-filter-1" data-path=".playDate"
										id="textbox-filter" name="playDate" type="text" value=""
										data-clear-btn-id="name-clear-btn3" placeholder="날짜를 선택하세요" />
								</div>
							</td>
							<td>
								<div id="submitArea"
									style="margin-left: 50px; margin-top: -4px;">
									<button type="button" class="btn btn-outline-dark"
										id="matchform"
										onClick="location.href='${contextRootPath}/app/matchboard/form'">
										매치등록하기</button>
								</div>
							</td>
						</tr>
					</table>
				</div> <!-- tools 끝 -->
        
        
                <!-- text filter control -->
        </div>
        
        <!-- 페이지 컨트롤 부분 -->
      <div id="formform">
     <div id="floatfloat">
        <div id="listtitle">
          매치 목록
        </div>
     <div id="list">
          <!-- 매치글 출력 부분: 팀정보,매치글정보-->
            <div data-jplist-group="group1">

                <c:forEach items="${all}" var="match">
                 
                 <div data-jplist-item>
                 <table class="table table-bordered table-striped results" id="matchInfo">    
                 
                 <tr onMouseOver="this.style.backgroundColor='#f2f3f2';" onMouseOut="this.style.backgroundColor='white';" style="background: white;">      
                 <td id="${match.team.teamId}" class="teamInfo sorting_asc" colspan="1" 
                 data-toggle="modal" data-target="#exampleModalCenter2"
                  onClick="window.open('${contextRootPath}/app/team/${match.team.teamId}', '팝업!', 'width=804, height=752');return false;"
                  align="center" style="cursor: pointer; padding-top: 13px; width:195px;" >
                             
                  
                  <div>     
                  <img class="TeamEmblemPhoto" src="${match.team.teamEmblemPhoto}" style="width:100px; height:100px;" 
                       onerror="this.src='${contextRootPath}/upload/emblem/vs.jpg'"></div>
                       
                   <div class="teamName">${match.team.teamName}</div><br>     
                </td>
                
                <td class="detail" id="${match.no}" colspan="5"
                 onMouseOver="this.style.backgroundColor='#f2f3f2';" onMouseOut="this.style.backgroundColor='white';"
                style="cursor: pointer; padding-top: 12px; width:130px; background: white;" data-toggle="modal" data-target="#exampleModalCenter"
                onClick="modalEvent('${match.no}');" >
                    <div class="teamName" style="width:130px; display:none">${match.team.teamName}</div>
                    <div class="title">- ${match.title} -</div><br>
                    <div class="sportsType" style="float: left; font-size: 16px;">&middot; 종목 :
                    <c:choose>       
                            <c:when test="${match.teamTypeSports.teamSportsType eq '축구'}">
                            <p style="display:none;">축구</p>
                                 축구 <img style="width:15px; height:15px; margin-bottom:5px;" src="${contextRootPath}/images/football_list_min.png">
                            </c:when>
                            <c:when test="${match.teamTypeSports.teamSportsType eq '야구'}">
                            <p style="display:none;">야구</p>
                                 야구 <img style="width:15px; height:15px; margin-bottom:5px;" src="${contextRootPath}/images/baseball_list_min.png">
                            </c:when>
                            <c:when test="${match.teamTypeSports.teamSportsType eq '농구'}">
                            <p style="display:none;">농구</p>
                                 농구 <img style="width:15px; height:15px; margin-bottom:5px;" src="${contextRootPath}/images/basketball_list_min.png">
                            </c:when>
                            <c:when test="${match.teamTypeSports.teamSportsType eq '탁구'}">
                            <p style="display:none;">탁구</p>
                                 탁구 <img style="width:15px; height:15px; margin-bottom:5px;" src="${contextRootPath}/images/pingpong_list_min.png">
                            </c:when>
                          </c:choose>
                    </div>
                         
                    <div class="playDate" style="font-size: 16px; float: left; margin-left: 75px;">&middot; 경기날짜 : ${match.playDate}</div><br>
                     <div class="matchArea" style="clear: both; font-size: 16px; float: left; margin-top: 10px;">&middot; 지역 : ${match.topLocation.topLocationName}&nbsp ${match.middleLocation.middleLocationName} </div>
                    
                    <div class="teamLevel1" style="float: left; font-size: 16px; margin-left: 45px; margin-top: 10px;">&middot; 연령대 : ${match.teamAges.teamAges}</div>
                    <div class="teamLevel" style="float: left; font-size: 16px; margin-left: 120px; margin-top: 10px;">&middot; 팀 레벨 : 
                          <c:choose>
                            <c:when test="${match.teamLevel.teamLevel eq '상'}">
                             상
                            </c:when>
                            <c:when test="${match.teamLevel.teamLevel eq '중'}">
                             중
                            </c:when>
                            <c:when test="${match.teamLevel.teamLevel eq '하'}">
                             하
                            </c:when>
                          </c:choose></div>
                 </td>
                 </tr>
                </table>
                </div>
                <!-- 매치글 출력 끝 -->
                
                <!--경기정보 모달 시작. -->
           <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" 
           aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalCenterTitle">잠시만 기다려주세요</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
           </div>
           <div class="modal-body" style="cursor:pointer; overflow-y:scroll; height: 180px; width:500px; word-break:break-all;" >
               잠시만 기다려주세요</div>
                          
           <div class="modal-footer">
           
           <div class="modal-footer-inside-control">
              <div class="modal-footer-inside" ></div>
           </div>
           
             <div id="mtaply" style='display:inline; min-width:100px;' >
             <c:if test="${!empty sessionScope.loginUser}">
             <h6 id="myteamtext" style="color:green; display:inline; float:left">나의 팀 :</h6>
               <select name='teamId' class="form-control" id="selectBox">
                 <option value="" selected>나의 소속팀</option>
                  <c:forEach items="${myteam}" var="myteam">
                    <option value='${myteam.team.teamId}'>${myteam.team.teamName}</option>
                  </c:forEach>
               </select>
                <button class="btn btn-danger" id="btnsub2">매치신청보내기</button>
              </c:if>
              </div>
           </div>
                </div>
                </div>
            </div>
             <!--경기정보 모달 끝. -->
             
             
<!--            <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" 
           aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header2">
                 <h5 class="modal-title2" id="exampleModalCenterTitle">잠시만 기다려주세요</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
           </div>
               <div class="modal-body2" id="modalbody" style="text-align:left; width:200px; height:1200px; padding-left:-400px;">잠시만 기다려주세요</div>
             <div class="modal-footer2"></div>
             </div>
             </div>
             </div> -->
             
                </c:forEach>
                    <!-- no results control -->               
                <div id="noresul" data-jplist-control="no-results" 
                data-group="group1" data-name="no-results">검색 결과가 없습니다.
                </div>
      </div>
      </div>
                　　　　　　　　　　　　　　　　　　　　<!-- 칸 일그러짐 방지 -->　　　　　　　　　　　　　　　　　　　　　　　
      </div>
      <div class="recommendDiv">
        <table class="recommendTable">
          <tr>
            <th class="recommendTh">추천매칭</th>
          </tr>
          <c:choose>
            <c:when test="${!empty sessionScope.loginUser}">
              <c:choose>
                 <c:when test="${noSetTeam eq 'noSetTeam'}">
                  <tr>
                    <td>
                      <div id="noSuggestion"><br>추천할 팀이 없습니다. <br> 대표팀을 설정하세요.<br><br>
                      <button class="btn" style="color:#008bff; "
                      onClick="location.href='${contextRootPath}/app/myteam' " >
                          대표팀 설정하기
                      </button>
                      <br>
                      </div>
                    </td>
                   </tr>
                  </c:when>
              
              
                <c:when test="${teamsCheck eq 'exist'}">
                  <c:forEach items="${recommendMatches}" var="match">
                    <tr>
                     
                      <td class="detail recommendTd" id="${match.no}" colspan="5" 
                          style="cursor: pointer;" 
                           onMouseOver="this.style.backgroundColor='rgb(45, 45, 45)';" 
                           onMouseOut="this.style.backgroundColor=''"
                          data-toggle="modal" 
                          data-target="#exampleModalCenter"
                          onClick="modalEvent('${match.no}');" >
                                  
                        <div class="recommendPlayDate">경기날짜 : ${match.playDate}</div>
                        <div class="recommendBox">
                        <div class="recommendTeamEmblem">
                        
                          <img class="recommendTeamEmblemPhoto" 
                               src="${match.team.teamEmblemPhoto}" 
                               onerror="this.src='${contextRootPath}/upload/emblem/vs.jpg'">
                        
                          <c:choose>
                            <c:when test="${match.teamTypeSports.teamSportsType eq '축구'}">
                              <div class="recommendSportsType"><img style="width:15px; height:15px; margin-top: 5px; margin-right: 2px; " src="${contextRootPath}/images/football_list_min.png"></div>
                            </c:when>
                            <c:when test="${match.teamTypeSports.teamSportsType eq '농구'}">
                              <div class="recommendSportsType"><img style="width:15px; height:15px; margin-top: 5px; margin-right: 2px; " src="${contextRootPath}/images/basketball_list_min.png"></div>
                            </c:when>
                            <c:when test="${match.teamTypeSports.teamSportsType eq '야구'}">
                              <div class="recommendSportsType"><img style="width:15px; height:15px; margin-top: 5px; margin-right: 2px; " src="${contextRootPath}/images/baseball_list_min.png"></div>
                            </c:when>
                            <c:when test="${match.teamTypeSports.teamSportsType eq '탁구'}">
                              <div class="recommendSportsType"><img style="width:15px; height:15px; margin-top: 5px; margin-right: 2px; " src="${contextRootPath}/images/pingpong_list_min.png"></div>
                            </c:when>
                          </c:choose>
                               <label id="teamNameText">${match.team.teamName}</label>
                               
                               <br>
                               <ul id="EEE">
                          <li class="sibarLocation" id="sibarLocation">${match.topLocation.topLocationName}&nbsp ${match.topLocation.middleLocation.middleLocationName}</li>
                          <li>${match.teamAges.teamAges} / 
                          <c:choose>
                            <c:when test="${match.teamLevel.teamLevel eq '상'}">
                             상
                            </c:when>
                            <c:when test="${match.teamLevel.teamLevel eq '중'}">
                             중
                            </c:when>
                            <c:when test="${match.teamLevel.teamLevel eq '하'}">
                             하
                            </c:when>
                          </c:choose>
                          </li>
                              </ul>
                               </div>
                          <div id="sidbarSubmit">
                          신청하기
                          </div>
                        </div>
                      </td>
                     </tr>
                  </c:forEach>
                </c:when>
                
              </c:choose>
            </c:when>
            
            <c:otherwise>
              <tr>
                <td id="loginsugge">
                  <div>로그인을 하면 팀에 맞는<br> 경기를 추천해드립니다.</div>
                      <button class="btn" style="color:#008bff; "
                      onClick="location.href='${contextRootPath}/app/auth/form' " >
                      로그인
                      </button>
                </td>
              </tr>
            </c:otherwise>
            
          </c:choose>
          
        </table>
      </div>
      </div>
      
      <div class="controls">
        <div
                data-jplist-control="pagination"
                data-group="group1"
                data-items-per-page="6"
                data-current-page="0"
                data-name="pagination1">
        
        <div id="control-box" class="form-group row">
            <button id="firstbtn" type="button" data-type="first" style="background-color:#9b9b9b;">«</button>
            <button id="prebtn" type="button" data-type="prev" style="background-color:#9b9b9b;">‹</button>
        
            <div class="jplist-holder" data-type="pages">
                <button id="selectbtn" type="button" data-type="page" >{pageNumber}</button>
            </div>
            
            <button id="nextbtn" type="button" data-type="next" style="background-color:#9b9b9b;">›</button>
            <button id="lastbtn" type="button" data-type="last" style="background-color:#9b9b9b;">»</button>
        </div>
        
        </div>
     </div>
    </div><!-- .content -->
  </div><!-- .container -->


<script src="${contextRootPath}/node_modules/jplist-es6/dist/1.2.0/jplist.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.2/js/mdb.min.js"></script>
        <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />
<script src="${contextRootPath}/jquery-ui-1.12.1.datepicker2/jquery-ui.min.js"></script>
        <script>
            jplist.init();
            
            var no = 0; //매치번호
            var nocom; //no 배열관련
            var choiceTeamValue; //신청팀번호
            var number; // 매치번호선택값 들어옴
            var matchTeamNo;// 매치글의 팀번호 들어옴
            var sizesize = $("input[id='loginUserTeamNumbers']").length; // 신청자의 팀 배열 길이.
            var teamnocom = sizesize;
            
            
             $("#datepicker").on("keyup", function() {
                var value = $(this).val().toLowerCase(); 
                  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
              });
            
            
          $(function() {
            
            
            function modalEvent(number) {
              
              $('.detail').each(function(index) {
                nocom = $('.detail')[index].id;
                if (nocom == number) {
                  no = nocom;
                }
              })
              
              $.getJSON("matchboard/data", {"no" : no}, function(data) {
                console.log(data);
                  $('.modal-title').text(data.match.team.teamName);
                  $('.modal-body').append("<div='ajlocation'><br> 지역 : "+data.addressTop.topLocationName+ " " + data.addressMiddle.middleLocationName + "</div>");
                  matchTeamNo = data.match.team.teamId;
                  console.log(matchTeamNo+"-> 매치글작성한 팀번호");
           console.log(no+"-> 매치글번호");
          console.log(data.match.topLocation.topLocationName);
          console.log(data.match.middleLocation.middleLocationName)
                  });
              }
            
            $( "#datepicker" ).datepicker({
           
                  onSelect: function(value, props) {
                         var tb = document.getElementById('textbox-filter');
                         tb.value = value;
                         let keyupEvent = new Event('keyup');
                         tb.dispatchEvent(keyupEvent);
                       },
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
            
            $('#btnsub2').click(function() {
                  var choiceTeamValue = $("#selectBox option:selected").val();

                 //console.log(typeof choiceTeamValue);
                 console.log(no +"-> 매치번호"); // 매치번호
                 console.log(choiceTeamValue+"-> 신청팀번호"); //신청팀번호
               
                 if (choiceTeamValue == "") {
                   alert("팀을 선택해주세요.");
                    return false;
                  }
          if (matchTeamNo == choiceTeamValue) {
            alert("자기가 속한 팀에 신청을 할 수 없습니다.")
            return false;
          }
          
                  $.ajax({
                    type:"POST",
                    url:'matchboard/submit/' + no,
                    contentType: 'application/json',
                    dataType: "text",
                    data:JSON.stringify({
                      teamId: choiceTeamValue
                    }),
                    success : function(data) {
                      console.log(data)
                      if (data == 12345) {
                        alert("신청 되었습니다.");
                        location.href="matchboard";
                          }
                      },
                    error : function(data) {
                       alert("이미 신청되었습니다.")
                      }
                    })
                 });
          })
          
          
              $('.recommendTd').on('click', function(){ 
                var location = $(this).children($('.sibarLocation')).text(); 
                console.log(location)    
              });
          
            //매치정보 모달창
            function modalEvent(number) {
             
              $('.detail').each(function(index) {
                nocom = $('.detail')[index].id;
                if (nocom == number) {
                  no = nocom;
                }
              })
              
              $.getJSON("matchboard/data", {"no" : no}, function(data) {
                console.log(data);
                console.log(data.topLocation);
                  $('.modal-title').text(data.match.team.teamName);
                  $('.modal-title').append("<div id='ajmatchno' style='color:black;'><h6>매치번호"+ data.match.no + " 　　　　　　　　　　　　　　조회수 " + data.match.viewCount + " </h6></div>");
                  $('.modal-body').append("<div id='ajplaydate' style='color:black;'>경기날짜 : "+data.match.playDate +"</div>");
                  $('.modal-body').text("제목 : "+data.match.title); 
                    $('.modal-body').append("<div='ajPlayDate' ><br> 경기날짜 : " +data.match.playDate + "</div>");
                  $('.modal-body').append("<div='ajsporttype'><br> 종목 : "+data.match.teamTypeSports.teamSportsType + "</div>");
                  $('.modal-body').append("<div='ajlocation'><br> 지역 : "+data.topLocation.topLocationName+ " " + data.middleLocation.middleLocationName + "</div>");
                  $('.modal-body').append("<div='ajlevel' ><br>연령대 :"+ data.match.teamAges.teamAges  +" / 팀 레벨 :" +data.match.teamLevel.teamLevel + "</div>");
                  $('.modal-body').append("<div='ajstadium'><br> 경기장 : "+data.match.stadiumName + "</div>");
                  $('.modal-body').append("<div='ajcontents'><br> 내용 : "+data.match.contents + "</div>");
                  $('.modal-footer-inside').text("상대전화번호 : "+data.match.telephone);
                  $('.modal-footer-inside').append("<div='ajcost'><br> 비용 : "+data.match.cost + "원</div>");
                  matchTeamNo = data.match.team.teamId;
                  console.log(matchTeamNo+"-> 매치글작성한 팀번호");
           console.log(no+"-> 매치글번호");
          console.log(data.match.topLocation.topLocationName);
          console.log(data.match.middleLocation.middleLocationName)
          
                  });
              }
              
          $('#name-clear-btn3').click(function() {
            $('#datepicker').val('');
          });
          
          
           $('.modal-body').click(function() {
            location.href = 'matchboard/' + no;
          });
              
           $(document).ready(function() {

             // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
             var floatPosition = parseInt($(".recommendDiv").css('top'));
             // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

             $(window).scroll(function() {
               // 현재 스크롤 위치를 가져온다.
               var scrollTop = $(window).scrollTop();
               var newPosition = scrollTop + floatPosition + "px";

               /* 애니메이션 없이 바로 따라감
                $("#floatMenu").css('top', newPosition);
                */

               $(".recommendDiv").stop().animate({
                 "top" : newPosition
               }, 500);

             }).scroll();

           });


          
             
        </script>
        
    </body>
</html>

<!-- style='float:right; margin-top' -->


