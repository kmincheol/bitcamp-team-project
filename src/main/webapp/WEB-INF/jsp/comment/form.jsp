<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <form action='../comment/add' method="post">

    <div id="comment">

      <div class="form-group row">
        <div class="col-sm-10">
          <input class="form-control" id="contents" name='contents' placeholder="댓글을 작성하세요." style="width:500px;">${comment.contents}</input>
          <button type='submit' class="input-group-btn btn btn-dark"
            style="left: 520px; top:0px; position: absolute;">작성</button>
        </div>
      </div>
    </div>
<br>

  </form>
</body>

</html>