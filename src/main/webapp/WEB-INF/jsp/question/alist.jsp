<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
  <div id="main-wrap" class="container">
        <label for="content">답변</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <textarea class="form-control col-sm-13" rows="5" id="content" name="content" 
                readonly>${answer.contents}</textarea>
            </div>
        </form>
    </div>

<jsp:include page="../javascript.jsp" />

<script>

</script>
 
</body>
</html>
