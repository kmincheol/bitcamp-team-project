<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextRootPath}/css/comment.css">
<title>Insert title here</title>
</head>
<body>

  <form action='../comment/add' method="post">

    <div id="comment">

      <div class="form-group row">
        <div class="col-sm-10">
          <input class="cmtform form-control" name='contents' placeholder="댓글을 작성하세요.">${comment.contents}
          <button class="a input-group-btn btn btn-dark" type='submit'>작성</button>
        </div>
      </div>
    </div>
<br>

  </form>
  
<!--   <script type="text/javascript">
  
  $('.a').click((e) => {
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
  });
  
  
  </script> -->
</body>

</html>