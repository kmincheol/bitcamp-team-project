<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Facebook 로그인</title>
<style>
.fbBtn {
  border-radius: 4px;
  max-width: 400px;
  min-width: initial;
  background-color: #e9ebee;
  cursor: pointer;
  display: inline-block;
  vertical-align: top;
  font-size: 11px;
  width: 220px;
  height: 40px
}
.fbTable {
  table-layout: fixed;
  max-width: 272px;
  min-width: initial;
  width: auto;
  border: 0;
  border-collapse: collapse;
  border-spacing: 0;
  background-color: #4267b2;
  border-radius: 4px;
  color: #fff;
  display: table;
}
.fbTable tbody{
  display: table-row-group;
  vertical-align: middle;
  border-color: inherit;
}
.fbTable tbody tr {
  display: table-row;
  vertical-align: inherit;
  border-color: inherit;
}
.td1 {
  width: 40px;
  text-align: left;
  display: table-cell;
  vertical-align: inherit;
  padding: 0; 
}
.div1 {
  white-space: nowrap;
  display: block;
}
.span1 {
  height: 24px;
  margin: 8px;
  float: left;
  background-color:white;
}
.facebookImg {
  width: 24px;
  heigth: 24px;
  border: 0;
  background-color: #4267b2;
}
.td2 {
  padding: 0 8px 0 0;
  font-family: Helvetica, Arial, sans-serif;
  text-align: left;
  display: table-cell;
  vertical-align: inherit;
}
.div2 {
  display:block;
}
.fbText {
  font-size: 16px;
  border: none;
  font-family: Helvetica, Arial, sans-serif;
  letter-spacing: .25px;
  overflow: hidden;
  text-align: center;
  text-overflow: clip;
  white-space: nowrap;
  display: block;
}
</style>
</head>
<body>
<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script>

<div class="fbBtn" role="button" tabindex="0" onClick="windowopenPopup()">
<table class="fbTable" cellspacing="0" cellpadding="0">
<tbody>
  <tr>
    <td class="td1">
      <div class="div1">
        <span class="span1">
            <img class="facebookImg" src="${contextRootPath}/images/facebookLogin.png">
        </span>
      </div>
    </td>
    <td class="td2">
      <div class="div2">
        <div class="fbText">Facebook으로 계속하기</div>
      </div>
    </td>
  </tr>
</tbody>
</table>
</div>
<script>
function windowopenPopup() {
  
  var popupX = (window.screen.width / 2) - (600 / 2);
  var popupY= (window.screen.height / 2) - (600 / 2);
  
  window.open(
      'facebookSignin', 
      'Facebook 로그인', 
      'width=600, height=600, left=' + popupX +
      ', top=' + popupY + ', toolbar=no, menubar=no, location=no, status=no'
      );
}
</script>

</body>
</html>