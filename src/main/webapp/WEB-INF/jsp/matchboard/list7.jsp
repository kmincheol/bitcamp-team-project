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
    
          <!-- text filter control -->
      <input  id="dateBtn" 
           data-jplist-control="textbox-filter"
           data-group="group1"
           data-name="my-filter-1"
           data-path=".playDate"
           type="text"
           value=""
      />
      
  <div data-jplist-group="group1">

                <c:forEach items="${all}" var="match">
                 <div data-jplist-item>
                    <div class="playDate">playDate : ${match.playDate}</div>
                </div>
                </c:forEach>
                
                    <!-- no results control -->               
                <div data-jplist-control="no-results" data-group="group1" data-name="no-results">No Results Found</div>
                

        </div>
<input type="text" name="date" id="date1" size="12" />
    

<jsp:include page="../javascript.jsp"/>
<script src="${contextRootPath}/jquery-ui-1.12.1.datepicker/jquery-ui.min.js"></script>
<script src="${contextRootPath}/jquery-ui-1.12.1.datepicker/datepicker-ko.js"></script>

        <!-- jPList Library -->
        <script src="${contextRootPath}/node_modules/jplist-es6/dist/1.2.0/jplist.min.js"></script>
        <script>
            jplist.init();
        </script>
<script type="text/javascript">

$(function(){
  
    $("#date1").datepicker({
      
      onSelect:function(dateText, inst) {

        console.log(dateText);
        
        $('#dateBtn').val(dateText);
        
        var e = jQuery.Event("keypress", {keyCode: 13});

        $(this).parent().children('#dateBtn').trigger(e);
        /* $("#dateBtn").trigger(e); */
        
    }
    });
    
});

</script>




        
    </body>
</html>

