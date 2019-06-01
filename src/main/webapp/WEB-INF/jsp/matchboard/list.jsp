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
          <input type="text" class="form-control" id="searchbox" placeholder="Search &hellip;">
          <span class="glyphicon glyphicon-search search-icon"></span>
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
                <span>대분류<span>
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
             <div class="col-md-4 movie fjs_item" id="fjs_1" style="display: block;">
       
        	<div class="thumbnail">
        	
          <span class="label label-success rating">
            9.3
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
              제목:${match.title}<br>
              내용:${match.contents}<br>
              <span class="runtime">
                연락처:${match.telephone}
              </span>
            </div>
            
            <div class="detail" >
              <dl>
                <dt>종목:</dt>
                <dd>${match.teamTypeSports.teamSportsType}</dd>
                <dt>위치:</dt>
                <dd>${match.location}</dd>
                <dt>경기장:</dt>
                <dd>${match.stadiumName}</dd>
                <dt>경기날짜: </dt>
                <dd>${match.playDate}</dd>
              </dl>
            </div>
          </div>
        
          </div>
			
			</div>
			</c:forEach>
 			</div>
		 </div>
        </div>





  </body>
  </html>

