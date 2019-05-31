<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <link href="${contextRootPath}/css/bootstrap.min.css" media="screen" rel="stylesheet" type="text/css">
    <link href="${contextRootPath}/css/jquery-ui-1.10.2.custom.min.css" media="screen" rel="stylesheet" type="text/css">
    <link href="${contextRootPath}/css/stream.css"  media="screen" rel="stylesheet" type="text/css">
    
    <link href="${contextRootPath}/filter.js/dist/jquery-ui-custom/jquery-ui-1.10.2.custom.min.css" media="screen" rel="stylesheet" type="text/css">
    <script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <script src="${contextRootPath}/filter.js/dist/jquery-ui-custom/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>
    <script src="${contextRootPath}/filter.js/dist/filter.js" type="text/javascript"></script>
    <script src="${contextRootPath}/filter.js/dist/jquery.tinysort.min.js" type="text/javascript"></script>
    <script src="${contextRootPath}/filter.js/examples/basic.js" type="text/javascript"></script>
  </head>
   <body>
   
     <div class="featured_list_find" id="service_list"></div>
     <script>
        //<![CDATA[

        var services = [
        {
            "title": "Mr. Ona Howe",
            "nonprofit": "Eldon Zulauf"
        },
        {
            "title": "Darien Hoeger",
            "nonprofit": "Beryl McDermott"
        },
        {
            "title": "Mrs. Frederique Kris",
            "nonprofit": "Eldon Zulauf"
        },
        {
            "title": "Jedediah Pouros",
            "nonprofit": "Mabel Tillman I"
        },
        {
            "title": "Mrs. Daisy Macejkovic",
            "nonprofit": "Mr. Ayden O'Keefe"
        } ];
        console.log(services);
        //]]>
      </script>
      <div class="clear"></div>
   
   <script id="template" type="text/html">
           <div class="fs_left">
             <span class="fs_head">&%= title %&</span>
             <span class="fs_disc">&%= contents %&</span>
           </div>
  </script>
  </body>
  </html>

