<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>게시글 등록</title>
<!-- common.css -->
<link rel="stylesheet" href="${contextRootPath}/css/common.css">

<!-- header -->
<jsp:include page="../commonSideHeaderFooter/commonHeaderCss.jsp" />

<!-- commonSidebar css -->
<jsp:include page="../commonSideHeaderFooter/commonSidebarCss.jsp" />

<!-- footer.css -->
<link rel="stylesheet" href="${contextRootPath}/css/footer.css">

<!-- recruit_board_form.css -->
<link rel="stylesheet" href="${contextRootPath}/css/recruit_board/recruit_board_form.css">

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

<!-- summernote -->
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">

</head>

<body>

  <jsp:include page="../commonSideHeaderFooter/commonHeader.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarTop.jsp" />

  <div id="main-wrap" class="container">

    <div id="main-text">
      <div class="text-field">
        <span style="font-weight: bold; font-size: 2.0em;">팀원을 모집 </span> <span
          style="font-size: 2.0em;"> 하는 글을 간편하게</span>
        <div style="font-size: 2.0em;">등록할 수 있습니다.</div>
        <br> <span>종목과 지역을 설정하고 <span style="font-weight: bold;">팀원</span>을 구해보세요.
        </span>
      </div>
    </div>

    <form id='add_form' name="add-cancle" action='add' method='post'>
      <div id="table">
        <table class="table table-bordered">
          <tbody>
            <tr>
              <th id="table-header" scope="row">지역</th>
              <td>
                  <select name="h_area1" onChange="cat1_change(this.value,h_area2)" id="area_select"
                    class="custom-select" style="box-shadow: 0 0 0px 0px;">
                    <option>-선택-</option>
                    <option value='1'>서울</option>
                    <option value='2'>부산</option>
                    <option value='3'>대구</option>
                    <option value='4'>인천</option>
                    <option value='5'>광주</option>
                    <option value='6'>대전</option>
                    <option value='7'>울산</option>
                    <option value='8'>강원</option>
                    <option value='9'>경기</option>
                    <option value='10'>경남</option>
                    <option value='11'>경북</option>
                    <option value='12'>전남</option>
                    <option value='13'>전북</option>
                    <option value='14'>제주</option>
                    <option value='15'>충남</option>
                    <option value='16'>충북</option>
                  </select> 
                  <select name="h_area2" id="local_select" class="custom-select"
                    style="box-shadow: 0 0 0px 0px;">
                    <option>-선택-</option>
                  </select>
              </td>
              <!-- <td><select id="area_select" class="custom-select" style="box-shadow: 0 0 0px 0px;">
                  <option selected>oo시</option>
                  <option value="1">서울</option>
                  <option value="2">부산</option>
                  <option value="3">대전</option>
              </select> <select id="local_select" class="custom-select" style="box-shadow: 0 0 0px 0px;">
                  <option selected>oo구</option>
                  <option value="1">강동</option>
                  <option value="2">강남</option>
              </select></td> -->
            </tr>
            <tr>
              <th id="table-header" scope="row">소속팀</th>
              <td><select class="custom-select" id="select2" name='team.teamId'
                style="box-shadow: 0 0 0px 0px;">
                  <option selected>팀을 선택해주세요.</option>
                  <c:forEach items="${team}" var="team">
                    <option value='${team.teamId}'>${team.teamName}</option>
                  </c:forEach>
              </select></td>
            </tr>
            <tr>
              <th id="table-header" scope="row">제목</th>
              <td><input id="title" name="teamTitle" class="form-control"></td>
            </tr>
            <tr>
              <th id="table-header" scope="row">내용</th>
              <td><textarea id="summernote" name='teamContents' rows='5'></textarea></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="form-group row">
        <div class="col-sm-12 text-center">
          <a id="cancle" class="btn btn-dark" href='${contextRootPath}/app/recruit_board'>취소</a>
          <button id="add" class="btn btn-dark">등록</button>
        </div>
      </div>
    </form>
  </div>

  <jsp:include page="../javascript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottom.jsp" />

  <script src="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.js"></script>

  <jsp:include page="../commonSideHeaderFooter/commonSidebarBottomScript.jsp" />

  <jsp:include page="../commonSideHeaderFooter/commonHeaderJs.jsp" />

  <script>

$(document).ready(function() {
  $('#summernote').summernote({
    height: 400,
    minHeight: null,
    maxHeight: null,
    focus: true
  });
  
  $('#add').click((e) =>{
    submitAgree();
    return false;
  })
});

function checkTerms() {
  var res = true;
  
  var titleCheck = $.trim($('#title').val());
  var contentsCheck = $.trim($('#summernote').val());
  var areaSelect = $('#area_select').val();
  var localSelect = $('#local_select').val();
  var teamSelect = $('#select2').val();
  
  if (areaSelect == $('#area_select option:eq(0)').val() ||
      localSelect == $('#local_select option:eq(0)').val() ||
      teamSelect == $('#select2 option:eq(0)').val()) {
    alert("지역과 팀을 선택해주세요!");
    res = false;
  }

  if (titleCheck.length <= 0 ||
      contentsCheck.length <= 0 ||
      areaSelect.length <= 0 ||
      localSelect.length <= 0 ||
      teamSelect.length <= 0) {
    alert("필수 내용을 모두 입력해주세요!");
    res = false;
  }

  return res;
}

function submitAgree() {
  if (checkTerms() != true) {
    return false;
  }

  $("#add_form").submit();
  return true;
}

</script>

  <script>



 



 var cat1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);

 var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북');





 var cat2_num = new Array();

 var cat2_name = new Array();





 cat2_num[1] = new Array(17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41);

 cat2_name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');





 cat2_num[2] = new Array(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57);

 cat2_name[2] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');





 cat2_num[3] = new Array(58,59,60,61,62,63,64,65);

 cat2_name[3] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');





 cat2_num[4] = new Array(66,67,68,69,70,71,72,73,74,75);

 cat2_name[4] = new Array('계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');





 cat2_num[5] = new Array(76,77,78,79,80);

 cat2_name[5] = new Array('광산구','남구','동구','북구','서구');





 cat2_num[6] = new Array(81,82,83,84,85);

 cat2_name[6] = new Array('대덕구','동구','서구','유성구','중구');





 cat2_num[7] = new Array(86,87,88,89,90);

 cat2_name[7] = new Array('남구','동구','북구','중구','울주군');





 cat2_num[8] = new Array(91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108);

 cat2_name[8] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');





 cat2_num[9] = new Array(109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148);

 cat2_name[9] = new Array('고양시 덕양구','고양시 일산구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','하남시','화성시','가평군','양주군','양평군','여주군','연천군','포천군');





 cat2_num[10] = new Array(149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168);

 cat2_name[10] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');





 cat2_num[11] = new Array(169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192);

 cat2_name[11] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');





 cat2_num[12] = new Array(193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214);

 cat2_name[12] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');





 cat2_num[13] = new Array(215,216,217,218,219,220,221,222,223,224,225,226,227,228,229);

 cat2_name[13] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');





 cat2_num[14] = new Array(230,231,232,233);

 cat2_name[14] = new Array('서귀포시','제주시','남제주군','북제주군');





 cat2_num[15] = new Array(234,235,236,237,238,239,240,241,242,243,244,245,246,247,248);

 cat2_name[15] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');





 cat2_num[16] = new Array(249,250,251,252,253,254,255,256,257,258,259,260);

 cat2_name[16] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');





function cat1_change(key,sel){

 if(key == '') return;

 var name = cat2_name[key];

 var val = cat2_num[key];



 for(i=sel.length-1; i>=0; i--)

  sel.options[i] = null;

 sel.options[0] = new Option('-선택-','', '', 'true');

 for(i=0; i<name.length; i++){

  sel.options[i+1] = new Option(name[i],val[i]);

 }

}




</script>



</body>
</html>
