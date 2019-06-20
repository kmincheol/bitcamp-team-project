<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<script src="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
<link href="${contextRootPath}/node_modules/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet"> 
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- recruit_board_list.css -->
<%-- <link rel="stylesheet" href="${contextRootPath}/css/recruit_board/recruit_board_list.css"> --%>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
  rel="stylesheet">

<!-- Your custom styles (optional) -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/style.css" rel="stylesheet">

<!-- MDBootstrap Datatables  -->
<link href="${contextRootPath}/node_modules/mdbootstrap/css/addons/datatables.min.css"
  rel="stylesheet">
  
   <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet"> 

<style>
.container {
  font-family: 'Jua', sans-serif;
}

.team_info {

}
#main-text h2 {
  position: absolute;
  text-align: left;
  bottom: 0;
}

#main-text h2 img {
  margin-bottom: 25px;
  margin-right: 5px;
  width:80px;
  height:80px;
}
</style>

</head>
<body>
  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />
   
  <div id="main-wrap" class="container">
        <div id="main-text">
    <h2>    
        <img src="${contextRootPath}/images/3dusersoccer.jpg">성사된 경기
      </h2>
    </div>
       <div id="cdcd" style="width:1080px;height: 50px;margin-top: 30px;">
             <div id="myTeamHeader" style="text-align: center; font-size: 20px;">
          <span style="margin : 50px;"><a href="${contextRootPath}/app/myteam"style="text-decoration:none; color:black"> 나의팀 </a> </span> 
        <span style="margin : 50px;"><a href="${contextRootPath}/app/myteam/list3/${tno}" style="text-decoration:none; color:black">요청한 경기</a></span > 
        <span style="margin : 50px;"><a href="${contextRootPath}/app/myteam/list2/${tno}" style="text-decoration:none; color:black">요청받은 경기</a></span>
        <span style="margin : 50px;border-bottom: 2px solid #51c321;"><a href="${contextRootPath}/app/myteam/list5/${tno}" style="text-decoration:none; color:black">성사된 나의 경기</a></span>
                </div>
          
    </div>
    <div > 
      <c:forEach items="${otherTeam}"  varStatus="status" var="otherTeam">
        <c:forEach items="${myTeam}" var="myTeam">
      <div style="height:330px">
           <div id="matchNo"   >${matchNosd3[status.index].no} </div> 
        <div style="background: #949494; text-align: center; font-weight: bold; line-height: 40px;">
         <div>${matchNosd3[status.index].playDate}</div>
        
        
        </div>       
      <div style="width:1080px; height:200px"> 
     
      <div style="width:450px; height:200px; float:left;text-align : center"> 
        <img style="
    height: 150px;
    width: 150px;
    margin-top : 20px;
" src="data:image/png;base64,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">
      </div>
        <div style="width:178px; height:200px; float:left"> 
              <div style="width:178px; height:150px; float:left"> 
                    <img style="     
    height: 150px;
    width: 178px;
    
" src="data:image/jpeg;base64,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">
      </div>
 <div style="text-align: center"> <div>${matchNosd3[status.index].stadiumName}</div>
                                     <div>${matchNosd3[status.index].cost}원 </div> </div> 
      </div>
      <div style=" width:450px; height:200px; float:right; text-align : center"> 
         <img style="
    height: 150px;
    width: 150px;
     margin-top : 20px;
" src="data:image/png;base64,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">
      </div>
      </div>
          
    <div style=" width:1080px;"> 
      <div style=" width:450px; float:left; "> 
        <div style="text-align: center; font-size:20px">${myTeam.teamName}</div>
    </div>
    
      <div style=" width:450px; float:right"> 
        <div  style="text-align: center; font-size:20px">${otherTeam.teamName}</div>
    </div>
   
    </div>
        <div>
         <button class ="cancel btn btn-outline-dark" style="margin-left: 50px;margin-top: 10px;" type="button" > 경기 취소</button>
        </div>  
        </div>
        </c:forEach>
         </c:forEach>
    </div>   
  </div>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

<script type="text/javascript">


$('.cancel').on('click', function(){

	var matchNo = $(this).parent().parent().children('#matchNo').text();
	
	Swal.fire({
    title: '경기를 취소 하시겠습니까?',
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: '예! 취소하겠습니다.',
    cancelButtonText: '아니오'
  }).then((result) => {
    if (result.value) {
      Swal.fire(
       '경기가 취소되었습니다'
      )
    location.href='delete/' + matchNo 
    }
  })
});



	



</script>


</body>
</html>