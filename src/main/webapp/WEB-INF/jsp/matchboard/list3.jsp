<%@ page language="java" 
         contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <jsp:include page="../commonCss.jsp"/>
    <link href="${contextRootPath}/css/jquery-ui-1.10.2.custom.min.css" media="screen" rel="stylesheet" type="text/css">
    <link href="${contextRootPath}/css/stream.css"  media="screen" rel="stylesheet" type="text/css">
    
    <link href="${contextRootPath}/filter.js/dist/jquery-ui-custom/jquery-ui-1.10.2.custom.min.css" media="screen" rel="stylesheet" type="text/css">
    <jsp:include page="../javascript.jsp"/>
    <script src="${contextRootPath}/filter.js/dist/jquery-ui-custom/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>
    <script src="${contextRootPath}/filter.js/dist/filter.js" type="text/javascript"></script>
    <script src="${contextRootPath}/filter.js/dist/jquery.tinysort.min.js" type="text/javascript"></script>
    <script src="${contextRootPath}/filter.js/examples/basic.js" type="text/javascript"></script>
  </head>
   <body>
   
   <jsp:include page="../header.jsp" />
   
     <div class="featured_list_find" id="service_list"></div>
     
     <div class="clear"></div>
   
       <div class="sidebar_list">
            <h3>Search</h3>
            <input type="text" id="search_box" class="searchbox" placeholder="Type here &hellip;" />
        </div>
        
        <div class="sidebar_list">
            <h3>Filter by stadiumName</h3>
            <ul id="stadiumName">
              <li>
                <input id="active" value="인천경기장" type="checkbox">
                <span >인천경기장</span>
              </li>
              <li>
                <input id="inactive" value="고양경기장" type="checkbox">
                <span>고양경기장</span>
              </li>
              <li>
                <input id="Aactive" value="서초경기장" type="checkbox">
                <span>서초경기장</span>
              </li>
            </ul>
          </div>
          
          <div class="sidebar_list">
            <h3>Filter by Level</h3>
            <span id="price_range_label" style="margin:50px;">Level1-Level3</span>
            <div id="price_slider"></div>
            <input type="hidden" id="price_filter" value="1-3" />
          </div>
   
   
   <script id="template" type="text/html">
         <div class="fs_box">
           <div class="fs_left">
             <span class="fs_head">&%= title %&</span>
             <span class="fs_disc">&%= contents %&</span>
           </div>
           <div class="fs_price">$&%= teamNo %&</div>
           <div class="clear"></div>
          </div>
  </script>
  </body>
  </html>

