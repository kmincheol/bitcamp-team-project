<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <head>
        <title>jPList Hello World</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <!-- jPList CSS -->
        <link rel="stylesheet" href="${contextRootPath}/node_modules/jplist-es6/dist/1.2.0/jplist.styles.css" />
        <link rel="stylesheet" href="${contextRootPath}/jquery-ui-1.12.1.datepicker/jquery-ui.min.css" />
        
    </head>
    <body>
    
    
    
     
<p>Date: <input type="text" id="datepicker"></p>

<!-- text filter control -->
<div style="display: none;">
    <input
         id="textbox-filter"
         data-jplist-control="textbox-filter"
         data-group="group1"
         data-name="my-filter-1"
         data-path=".date"
         type="text"
         value=""
         data-clear-btn-id="name-clear-btn"
         placeholder="Filter by Name" />

    <button type="button" id="name-clear-btn">Clear</button>
</div>
      
  <div data-jplist-group="group1">

                <c:forEach items="${all}" var="match">
                 <div data-jplist-item>
                    <div class="date">playDate : ${match.playDate}</div>
                </div>
                </c:forEach>
                
                    <!-- no results control -->               
                <div data-jplist-control="no-results" data-group="group1" data-name="no-results">No Results Found</div>
                

        </div>


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

