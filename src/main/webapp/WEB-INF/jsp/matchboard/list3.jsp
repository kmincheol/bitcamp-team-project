<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <link href="${contextRootPath}/css/bootstrap.min.css" media="screen" rel="stylesheet" type="text/css">
    <link href="${contextRootPath}/css/jquery-ui-1.10.2.custom.min.css" media="screen" rel="stylesheet" type="text/css">
    <link href="${contextRootPath}/css/stream.css"  media="screen" rel="stylesheet" type="text/css">
    
    <script src="${contextRootPath}/node_modules/filter.js/filter.js" type="text/javascript"></script>
    
<%-- <script src="${contextRootPath}/node_modules/test/assets/js/jquery-1.11.3.min.js" type="text/javascript"></script>
         <script src="${contextRootPath}/node_modules/test/assets/js/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>  --%>
<%--     <script src="${contextRootPath}/node_modules/test/data/movies.js" type="text/javascript"></script>     --%>
<%--     <script src="${contextRootPath}/node_modules/test/pagination.js" type="text/javascript"></script>  --%>
  </head>
   <body>
   
    <div class="container">
      
      <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalCenterTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
               <div class="modal-body">
            </div>
             <div class="modal-footer">
             <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
             <button type="button" class="btn btn-primary">신청하기</button>
             </div>
             </div>
             </div>
             </div>
                </td>
      
      
      
      
      
      
      
      
      
      
      
      <div id="matchTitle" style="text-align:center;">
        <h2>
        등록된 <b>매치 글</b>을 검색하여 찾거나
      </h2>
      <h2>직접 매치글을 등록할 수 있습니다.</h2>
      <br>
      <p>
        원하는 <b>검색 결과에 맞춰</b> 경기를 매칭시키거나
      </p>
      <p>
        <b>추천 매칭</b>을 통하여 경기를 매칭시켜보세요.
      </p>
      </div>
    
      <div class="sidebar col-md-3">
      
        <div>
          <h4 class='col-md-6'>매치 (<span id="total_movies">0</span>)</h4>
          <div class="col-md-6 progress">
            <div class="progress-bar" id="stream_progress" style="width: 0%;">0%</div>
          </div>
        </div>
        
        <div>
          <label class="sr-only" for="searchbox">Search</label>
          
            <input class="form-control" id="searchbox"
                data-jplist-control="textbox-filter"
                data-group="group1"
                data-name="my-filter-1"
                data-path=".title"
                type="text"
                value=""
                data-clear-btn-id="name-clear-btn"
                placeholder="Filter by Title" />
            
            <button type="button" id="name-clear-btn">Clear</button>
            
          <span class="glyphicon glyphicon-search search-icon"></span> <!-- 아이콘 깨짐 -->
        </div>
        <br>
        
        <div class="well">
          <fieldset id="rating_criteria">
            <legend>실력</legend> <span id="rating_range_label" class="slider-label">하 - 중 - 상</span>
            <div id="rating_slider" class="slider">
            </div>
            <input type="hidden" id="rating_filter" value="8-10">
          </fieldset>
        </div>
        
        <div class="well">
          <fieldset id="runtime_criteria">
            <legend>연령대</legend> <span id="runtime_range_label" class="slider-label">10대 - 60대</span>
            <div id="runtime_slider" class="slider">
            </div>
            <input type="hidden" id="runtime_filter" value="50-250">
          </fieldset>
        </div>
        
        <div class="well">
          <fieldset id="year_criteria">
            <legend>경기날짜</legend>
            <input class="form-control" type='date' name='year_filter'/>
          </fieldset>
        </div>
        
        <div class="well">
          <fieldset id="genre_criteria">
            <legend>Genre</legend>
            <div class="checkbox">
              <label>
                <input type="checkbox" value="All" id="all_genre">
                <span>모든위치</span>
              </label>
            </div>
            <div class="checkbox">
              <label>
                <input type="checkbox" value="Crime">
                <span>대분류</span>
                  </label>
                </div>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" value="Drama">
                    <span>소분류</span>
                  </label>
                </div>

              </fieldset>
            </div>
          </div>

<!--           <div class="col-md-9">
            <div class="movies content row" id="movies"> </div>
          </div> -->
          <div class="col-md-9">
            <div class="movies content row" id="movies">
            
             <c:forEach items="${matches}" var="match">
            <div data-jplist-group="group1" >
                 <div data-jplist-item>
             <div class="col-md-4 movie fjs_item" id="fjs_1" style="display: block;">
       
          <div class="thumbnail">
          <span class="label label-success rating">팀실력
            <i class="glyphicon glyphicon-star"></i>
          </span>
          
          
          <div class="caption" id="info" style="cursor: pointer;" 
          onClick="location.href='${contextRootPath}/app/matchboard/${match.no}'">
          
            <h3><a id="teaminfo" class="th-sm sorting_asc"
                style="cursor: pointer;"
                onClick="location.href='${contextRootPath}/app/matchboard/team/${match.team.teamId}'">
                <img src='${match.team.teamEmblemPhoto}'>
                ${match.team.teamName}
            </a></h3>
            
            
            <div class="outline" >
           <div class="title">title : ${match.title}</div>
           <div class="contents">contents : ${match.contents}</div>
              <span class="runtime">
                연락처:${match.telephone}
              </span>
            </div>
            
            
            <div class="detail" >
            <!-- content to filter -->
                    <div class="no">no : ${match.no}</div>
                    <div class="teamNo">teamNo : ${match.teamNo}</div>

                    <div class="playDate">playDate : ${match.playDate}</div>
                    <div class="sportsType">sportsType : ${match.teamTypeSports.teamSportsType}</div>
                    <div class="teamLevel">teamLevel : ${match.teamLevel.teamLevel}</div>
                    <div class="teamAges">ages : ${match.teamAges.teamAges}</div>
            </div>
                    <!-- no results control -->
                <div data-jplist-control="no-results" data-group="group1" data-name="no-results">No Results Found</div>
            </div>
              
              
          </div>
          </div>
          </div>
      </div>
      </c:forEach>
      </div>
     </div>
        </div>

<jsp:include page="../javascript.jsp"/>
        <script src="${contextRootPath}/jquery-ui-1.12.1.datepicker/jquery-ui.min.js"></script>
        <script src="${contextRootPath}/jquery-ui-1.12.1.datepicker/datepicker-ko.js"></script>
        
        <script src="${contextRootPath}/node_modules/jplist-es6/dist/1.2.0/jplist.min.js"></script>
        <script>
            jplist.init();
            
            $( "#datepicker" ).datepicker({
              onSelect: function(value, props) {
                      
                     var tb = document.getElementById('textbox-filter');
                     tb.value = value;
                     let keyupEvent = new Event('keyup');
                     tb.dispatchEvent(keyupEvent);
                   },
                   //selectWeek: true,
                   //inline: true,
                   //startDate: '01/01/2000',
                   //firstDay: 1
           });
            
            
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
              })
        </script>


  </body>
  </html>

