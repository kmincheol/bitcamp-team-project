<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
    
    <style type="text/css">
    .popover-content {
        overflow-y: scroll;
        height: 150px;
    }

    .popover-footer {
        margin: 0;
        padding: 8px 14px;
        font-size: 14px;
        font-weight: 400;
        line-height: 18px;
        background-color: #F7F7F7;
        border-bottom: 1px solid #EBEBEB;
        border-radius: 5px 5px 0 0;
    }

    .flex-container {
        padding: 0;
        margin: 0;
        list-style: none;
        display: -webkit-box;
        display: -moz-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-flex-flow: row wrap;
        justify-content: space-around;
    }

    .flex-item {
        background: tomato;
        /*    padding: 13px;*/
        width: 74px;
        ;
        height: 83px;
        margin-top: 2px;
        color: white;
        font-weight: bold;
        font-size: 3em;
        text-align: center;
    }

    #General {
        background: #383a35;
    }
    </style>

    <body>
        <div>

     <!--             <div class="flex-container">
                    <div id="General" class="flex-item"> 1
                        <div class="glyphicon glyphicon-envelope"> </div>
                    </div>
                </div>
      -->
        </div>
        <a href="#" rel="details" class="btn btn-small pull-left" data-toggle="popover">click me to see popover</a>
        <script type="text/javascript">
        
        $("[rel=details]").popover({
            trigger: 'click',
            placement: 'right',
            html: 'true',
            content: '<div class="flex-container"><div id="General" class="flex-item"> 1<div class="glyphicon glyphicon-envelope"> </div></div></div>',

            template: '<div class="popover"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div><div class="footer"><center><a href="" >more</a></center></div></div>'
        
        
        
        });
        </script>
    </body>

    </html>