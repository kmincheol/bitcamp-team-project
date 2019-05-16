<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>


<body>
  <form>
  
        <div class="form-group row">
          <label for="title" class="col-sm-2 col-form-label">내용</label>
          <textarea id="summernote" name="contents">${comment.contents}</textarea>
        </div>

        <div class="form-group row">
          <label for="createdDate" class="col-sm-2 col-form-label">최근수정일</label>
          <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" id="createdDate"
              value="${comment.modifierDate}">
          </div>
        </div>

        <!-- 버튼과 관련된 영역 -->
        <div class="form-group row">
          <div class="col-sm-10">
            <button class="btn btn-primary">변경하기</button>
          </div>
        </div>
      </form>

  <jsp:include page="../javascript.jsp" />
</body>
</html>






