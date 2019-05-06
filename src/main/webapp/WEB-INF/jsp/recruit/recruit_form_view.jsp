<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>팀원 구함(뷰페이지)</title>
 <!--  <jsp:include page="../commonCss.jsp"/> -->
   <link rel="stylesheet" href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextRootPath}/css/recruit_form_view.css">
</head>
<body>

<jsp:include page="../header.jsp"/>

  
  <h2>마음에 드는 팀에게 댓글을 달아보세요. </h2>
<div class="container">
  
  <hr color="black" width=90% >
    <form action='add' method='post'>
      
        <div class="form-group row">
          
          <label for="location" class="col-sm-2 col-form-label"><b>지역</b></label>
		<label for="colFormLabelSm" class="col-sm-2 col-form-label">서울시</label>
		<label for="colFormLabelSm" class="col-sm-2 col-form-label">강남구</label>
		<label for="colFormLabelSm" class="col-sm-2 col-form-label">xx동</label>
          </div>
        
        
        <div class="form-group row">
          <label for="playtype" class="col-sm-2 col-form-label"><b>경기유형</b></label>
		<label for="colFormLabelSm" class="col-sm-2 col-form-label">축구</label>
            </div>
        
         
        <div class="form-group row">
          <label for="team" class="col-sm-2 col-form-label"><b>소속팀</b></label>
      		<label for="colFormLabelSm" class="col-sm-2 col-form-label">비트캠프</label>
        </div>
         
        <div class="form-group row">
          <label for="title" class="col-sm-2 col-form-label"><b>제목</b></label>
          <div class="col-sm-8">
            <input type="text" class="form-control" name="title" id="title" value="제목자리입니다." readonly="readonly"/>
          </div>
        </div>

        <div class="form-group row">
    <label for="contents" class="col-sm-2 col-form-label"><b>내용</b></label>
    	<div class="col-sm-8">
      	<textarea class="form-control" id="contents" name='contents' rows='5'
      	 readonly="readonly">강남에서 축구하실 20대 3분 구합니다. </textarea>
    	</div>
  		</div>


        <div class="button2">
          <div class="col-sm-10">
            <button class="btn btn-primary">신청하기</button>
          </div>
        </div>


    
                
                    <p><b>댓글수자리  | 조회수자리</b></p>
              
              
        <table class="comment_view">
            <tbody>
                   <tr>
                   
                   <td id="id_loc" >
                   아이디자리입니다 <p style="font-size: 8px;" >댓글날짜입니다.</p>
                   </td>
                   
                   <td>
                   <input type="hidden" value="33333" id="com_IDX">
                   <div id="contentsBox">
                   <input type="hidden" id="com_CON">댓글내용자리입니다 ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</div>
                   <div align="right">
                   <a href="#" class="btn">삭제</a>
                   <a href="#" class="btn">수정</a>
                   </div>                            
                   </td>
                   
                   </tr>
                   
                <tr>
                    <td colspan="2">
                        <div>
                            <textarea  rows="5" cols="130" name="COM_CONTENTS" ></textarea>
                             <p align="right" ><button type="button" id="comment_sumit" class="btn btn-primary">등록</button></p>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    
    
        </form>
            
  </div> <!-- .container -->
  
  
<jsp:include page="../javascript.jsp"/>
</body>
</html>
