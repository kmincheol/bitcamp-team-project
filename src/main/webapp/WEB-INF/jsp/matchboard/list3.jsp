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
        <link rel="stylesheet" href="${contextRootPath}/css/list3.css" />
        
<style>
#ui-datepicker-div {
background:aqua;
}

</style>
    </head>
    <body>
    
<!-- 테스트용 모달 -->

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" id="myModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!-- 테스트 모달 끝 -->
    
    
    <jsp:include page="../header.jsp"/>
    
  <div class="container">
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
            data-type="text"
            
            data-path-6=".teamAges"
            data-order="asc"
            data-type="text">
        </div>

    <div class="content">
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
         전체
         </button>
        
        <button
            data-jplist-control="buttons-text-filter"
            data-path=".sportsType"
            data-mode="radio"
            data-group="group1"
            name="sportsType"
            data-text="축구"
            >
        축구
        </button>
        
        <button
            data-jplist-control="buttons-text-filter"
            data-path=".sportsType"
            data-mode="radio"
            data-group="group1"
            name="sportsType"
            data-text="야구">
        야구
        </button>
        
        <button
            data-jplist-control="buttons-text-filter"
            data-path=".sportsType"
            data-mode="radio"
            data-group="group1"
            name="sportsType"
            data-text="농구">
        농구
        </button>
        
        <button
            data-jplist-control="buttons-text-filter"
            data-path=".sportsType"
            data-mode="radio"
            data-group="group1"
            name="sportsType"
            data-text="탁구">
        탁구
        </button>
        
         <br>
         
         <!-- filter control -->
        <button
            data-jplist-control="buttons-text-filter"
            data-path="default"
            data-mode="radio"
            data-group="group1"
            name="teamLevel"
            data-selected="true">
         전체
         </button>

        <button
            data-jplist-control="buttons-text-filter"
            data-path=".teamLevel"
            data-mode="radio"
            data-group="group1"
            name="teamLevel"
            data-text="상"
            >
        상
        </button>
        
        <button
            data-jplist-control="buttons-text-filter"
            data-path=".teamLevel"
            data-mode="radio"
            data-group="group1"
            name="teamLevel"       
            data-text="중">
        중
        </button>
        
        <button
            data-jplist-control="buttons-text-filter"
            data-path=".teamLevel"
            data-mode="radio"
            data-group="group1"
            name="teamLevel"
            data-text="하">
        하
        </button>
        
        <br>
      <br>
        <p>Date: <input type="text" id="datepicker"></p>
        
<div style="display: none;">
    <input
         id="textbox-filter"
         data-jplist-control="textbox-filter"
         data-group="group1"
         data-name="my-filter-1"
         data-path=".playDate"
         name="playDate"
         type="text"
         value=""
         data-clear-btn-id="name-clear-btn"
         placeholder="Filter by Name" />

    <button type="button" id="name-clear-btn">Clear</button>
</div>
        
        <!-- pagination control -->
        <div
                data-jplist-control="pagination"
                data-group="group1"
                data-items-per-page="5"
                data-current-page="0"
                data-name="pagination1">
        
        <div id="control-box" class="form-group row">
            <button id="firstbtn" type="button" data-type="first">«</button>
            <button id="prebtn" type="button" data-type="prev">‹</button>
        
            <div class="jplist-holder" data-type="pages">
                <button type="button" data-type="page">Page {pageNumber}</button>
            </div>
        
            <button id="nextbtn" type="button" data-type="next">›</button>
            <button id="lastbtn" type="button" data-type="last">»</button>
        </div>
        
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
                    <div class="teamAges">ages : ${match.teamAges.teamAges}</div>
                </div>
                </c:forEach>
                    <!-- no results control -->               
                <div data-jplist-control="no-results" data-group="group1" data-name="no-results">No Results Found</div>
        </div>
    </div><!-- .content -->      
  </div><!-- .container -->

<jsp:include page="../javascript.jsp"/>
<script src="${contextRootPath}/jquery-ui-1.12.1.datepicker/jquery-ui.min.js"></script>
<script src="${contextRootPath}/jquery-ui-1.12.1.datepicker/datepicker-ko.js"></script>
        <!-- jPList Library -->
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
        </script>
        
        
    </body>
</html>



