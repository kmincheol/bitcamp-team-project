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
#main-text {
  position: relative;
  text-align: center;
  width: 100%;
  height: 230px;
  border-bottom: 2px solid black;
  margin-bottom: 40px;
}     
    
#main-text h1 {
  position: relative;
    top: -60%;
    color: white;
}

#main-text h1 img {
  width: 30px;
  height: 30px;
  margin-bottom: 25px;
  margin-right: 5px;
}
</style>

</head>
<body>
  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />
      <div id="main-text">
    <img src="${contextRootPath}/images/국대.jpg" style="width:100%; height:100%;">
  <h1>    
        나의 팀정보
      </h1>
    </div>
  <div id="main-wrap" class="container">
      
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
           <div id="matchNo">${matchNosd3[status.index].no} </div> 
        <div style="background: #949494; text-align: center; font-weight: bold; line-height: 40px;">
         <div>${matchNosd3[status.index].playDate}</div>
        </div>       
      <div style="width:1080px; height:200px"> 
     
      <div style="width:450px; height:200px; float:left;text-align : center"> 
        <img style="height: 150px;width: 150px;margin-top : 20px;" 
        src="${myTeam.teamEmblemPhoto}">
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
         <img style="height: 150px;width: 150px;margin-top : 20px;" 
         src="${otherTeam.teamEmblemPhoto}">
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