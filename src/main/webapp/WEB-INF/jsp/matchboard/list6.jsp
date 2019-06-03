<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <head>
        <title>매치보드</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <jsp:include page="../commonCss.jsp"/>
        <!-- jPList CSS -->
        <link rel="stylesheet" href="${contextRootPath}/node_modules/jplist-es6/dist/1.2.0/jplist.styles.css" />
        
    </head>
    <body>
    
    <jsp:include page="../header.jsp"/>
    
       <!-- hidden sort control -->
        <div
            style="display: none"
            data-jplist-control="hidden-sort"
            data-group="group1"
            
            data-path=".no"
            data-order="asc"
            data-type="number"

            data-path-1=".teamNo"
            data-order="asc"
            data-type="number"
            
            data-path-2=".title"
            data-order="asc"
            data-type="text"
            
            data-path-3=".contents"
            data-order="asc"
            data-type="text"
            
            data-path-4=".sportsType"
            data-order="asc"
            data-type="text"
            
            data-path-5=".teamLevel"
            data-order="asc"
            data-type="text"
            
            data-path-5=".playDate"
            data-order="asc"
            data-type="text">
        </div>

        <!-- text filter control -->
        <div>
            <input
                data-jplist-control="textbox-filter"
                data-group="group1"
                data-name="my-filter-1"
                data-path=".title"
                type="text"
                value=""
                data-clear-btn-id="name-clear-btn"
                placeholder="Filter by Title" />
            
            <button type="button" id="name-clear-btn">Clear</button>
        </div>      
          
        <!-- filter control -->
        <button
            data-jplist-control="buttons-text-filter"
            data-path="default"
            data-mode="radio"
            data-group="group1"
            name="sportsType"
            data-selected="true">
         경기유형
         </button>
        
        <button
            data-jplist-control="buttons-text-filter"
            data-path=".sportsType"
            data-mode="radio"
            data-group="group1"
            name="sportsType"
            data-text="soccer"
            >
        축구
        </button>
        
        <button
            data-jplist-control="buttons-text-filter"
            data-path=".sportsType"
            data-mode="radio"
            data-group="group1"
            name="sportsType"
            data-text="baseball">
        야구
        </button>
        
        <button
            data-jplist-control="buttons-text-filter"
            data-path=".sportsType"
            data-mode="radio"
            data-group="group1"
            name="sportsType"
            data-text="basketball">
        농구
        </button>
        
        <button
            data-jplist-control="buttons-text-filter"
            data-path=".sportsType"
            data-mode="radio"
            data-group="group1"
            name="sportsType"
            data-text="pingpong">
        탁구
        </button>
        
         <!-- filter control -->
        <button
            data-jplist-control="buttons-text-filter"
            data-path="default"
            data-mode="radio"
            data-group="group1"
            name="teamLevel"
            data-selected="true">
         실력
         </button>
        
        <button
            data-jplist-control="buttons-text-filter"
            data-path=".teamLevel"
            data-mode="radio"
            data-group="group1"
            name="teamLevel"
            data-text="high"
            >
        상
        </button>
        
        <button
            data-jplist-control="buttons-text-filter"
            data-path=".teamLevel"
            data-mode="radio"
            data-group="group1"
            name="teamLevel"       
            data-text="mid">
        중
        </button>
        
        <button
            data-jplist-control="buttons-text-filter"
            data-path=".teamLevel"
            data-mode="radio"
            data-group="group1"
            name="teamLevel"
            data-text="low">
        하
        </button>
        
        
        <!-- pagination control -->
        <div
                data-jplist-control="pagination"
                data-group="group1"
                data-items-per-page="5"
                data-current-page="0"
                data-name="pagination1">
        
            <button type="button" data-type="first">«</button>
            <button type="button" data-type="prev">‹</button>
        
            <div class="jplist-holder" data-type="pages">
                <button type="button" data-type="page">Page {pageNumber}</button>
            </div>
        
            <button type="button" data-type="next">›</button>
            <button type="button" data-type="last">»</button>
        </div>
     
          <!-- content to filter -->
            <div data-jplist-group="group1">

                <c:forEach items="${all}" var="match">
                 <div data-jplist-item>
                    <div class="no">no : ${match.no}</div>
                    <div class="teamNo">teamNo : ${match.teamNo}</div>
                    <div class="title">title : ${match.title}</div>
                    <div class="contents">contents : ${match.contents}</div>
                    <div class="playDate">playDate : ${match.playDate}</div>
                    <div class="sportsType">sportsType : ${match.teamTypeSports.teamSportsType}</div>
                    <div class="teamLevel">teamLevel : ${match.teamLevel.teamLevel}</div>
                </div>
                </c:forEach>
                
                    <!-- no results control -->               
                <div data-jplist-control="no-results" data-group="group1" data-name="no-results">No Results Found</div>
                

        </div>

<jsp:include page="../javascript.jsp"/>
        <!-- jPList Library -->
        <script src="${contextRootPath}/node_modules/jplist-es6/dist/1.2.0/jplist.min.js"></script>
        <script>
            jplist.init();
        </script>
        
        
    </body>
</html>

