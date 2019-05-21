<%@page import="com.eomcs.lms.domain.Free"%>
<%@page import="com.eomcs.lms.domain.Member"%>
<%@page import="com.eomcs.lms.domain.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<body>

  
    <div class="comment-list">
      <table class="table table-hover">
        <tbody class="cmtlist">
          <c:forEach items="${list}" var="comment">
            <span style="font-size: 15px; margin-right: 10px;"><b>${comment.member.name}</b></span>
            <span style="font-size: 12px;">${comment.modifierDate}</span>
            <br> 
            <div class="conts">
              <input type="text" class="no" name="no" value="${comment.no}" style="display: none;">
              <input type="text" class="cmtcontents" name="contents" value="${comment.contents}"
                style="font-size: 20px; border: none; display:inline; margin-left: 10px; margin-bottom:5px;" readonly>  
 
              <c:if test="${sessionScope.loginUser.name eq comment.member.name}">
                <div class="btnsave">
                
                  <a class="deletebtn input-group-btn btn btn-dark" 
                    href='${contextRootPath}/app/comment/delete/${comment.no}'>삭제</a>
                  <button class="update-btn input-group-btn btn btn-dark" type="button">변경</button>
                  <div class="save-cancel" style="display: none;">
                   <form id="form-save" action="../comment/update" method="post">
                    <input type="text" class="form-control-plaintext" id="no" name='no' value='${comment.no}'style="display:none;">
                   <textarea class="form-control" id="contents" name='contents' style='margin-top:10px; font-size: 20px;'>${comment.contents}</textarea>
                    <button class="save-btn input-group-btn btn btn-dark">저장</button>
                     </form>
                    <a class="cancel-btn input-group-btn btn btn-dark" style="color: white;">취소</a>
                  </div>
                </div>
              </c:if>
              <hr>
            </div>
          </c:forEach>
        </tbody>
      </table>
    </div>
 



  <script type="text/javascript">

      $(document).ready(function() {
        $('.update-btn').click(function() {
          $(this).hide();
          $(this).prev().hide();
          $.fn.btnFuntion($(this));
          $.fn.contsFunction($(this));
        });

        $.fn.btnFuntion = function(updatebtn) {
          var state = updatebtn.next();
          if (state.css('display') == 'none') {
            state.show();
            
          }
        };

        $.fn.contsFunction = function(updatebtn) {
          var state = updatebtn.parent().parent().children('.cmtcontents');
          if (state.css('style') != 'none') {
            state.attr("style", "display:none;");
          }
        };
      });

      $(document).ready(function() {
        $('.cancel-btn').click(function() {
          $('.update-btn').show();
           $('.deletebtn').show();  
          var state = $('.save-cancel').css('display');

          if (state == 'none') {
            $('.save-cancel').hide();
          } else {
            $('.save-cancel').hide();
          }

          var state = $('.cmtcontents').css('style');
          if (state != 'none') {
            $('.cmtcontents').attr("style", "font-size: 20px; border: none; margin-left:10px;");
          }
        });
      });

      $('.cancel-btn').on('click', function() {
        $('.cmtcontents').attr('readonly', 'true');
      });
      
      $(document).ready(function(){
        $(".save-btn").click(function(){
            $(".cmt-list").load("list.jsp");
        });
    });

        
      
      
    </script>

</body>
</html>







