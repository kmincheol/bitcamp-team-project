<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextRootPath}/css/comment.css">
<title>Insert title here</title>
</head>
<body>

  <form action='../comment/add' method="post">

    <div id="comment"> 

      <div class="form-group row"> 
        <div class="col-sm-10"> 
          <textarea class="cmtform form-control comment-form" name='contents' placeholder="댓글을 작성하세요."  autocomplete=off rows="2">${comment.contents}</textarea>
          <span id="counter">###</span> 
          <button class="a input-group-btn btn btn-dark" type='submit'>작성</button>   
        </div>
      </div>
    </div>
<br>

  </form>
  <!-- JQuery -->
  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp"/> 
  <script type="text/javascript">
 
  $(document).ready(function(){
    
    $('.comment-form').on('keyup', function() {
      if($(this).val().length > 150) {
          $(this).val($(this).val().substring(0, 150));
      }
      
      var content = $(this).val();
      $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
      $('#counter').html(content.length + '/150');
  });
  $('.comment-form').keyup();
      
    });
  
  
  
  
  
 /*  $('.a').click((e) => {
    e.preventDefault();
    var xhr = new XMLHttpRequest();
    var cmt = $('#contents').val();

    var aJson = new Object();
    aJson.contents = cmt;
    
    var sJson = JSON.stringify(aJson);
    
    xhr.onreadyStateChange = () => {
      if (xhr.readyState == 4){
        if (xhr.status == 200) {
            var data = JSON.parse(xhr.responseText);
            console.log(data);
           
        } else {
          alert('실패');
        } 
        
      }
    };
    
    xhr.open("POST", "../../app/comment/add", true);
    xhr.setRequestHeader("Content-type", "application/json");
    xhr.send(sJson);
  }); */
  
  
  </script> 
</body>

</html>