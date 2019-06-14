<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>

<script type="text/javascript">
	jQuery(function($) {
		$(".sidebar-dropdown > a").click(function() {
			$(".sidebar-submenu").slideUp(200);
			if ($(this).parent().hasClass("active")) {
				$(".sidebar-dropdown").removeClass("active");
				$(this).parent().removeClass("active");
			} else {
				$(".sidebar-dropdown").removeClass("active");
				$(this).next(".sidebar-submenu").slideDown(200);
				$(this).parent().addClass("active");
			}
		});
		$("#show-sidebar").click(function() {
			$(".page-wrapper").addClass("toggled");
		});
		$("#close-sidebar").click(function() {
			$(".page-wrapper").removeClass("toggled");
		});
	});

	$(document).ready(function() {
		$(".menu-icon").on("click", function() {
			$("nav ul").toggleClass("showing");
		});
	});
</script>

<script>
$(function() {
  
  var facebook = 'facebook';
  var naver = 'naver';
  var kakao = 'kakao';
  var google = 'google';
  
  $('#facebookBtn').click(function() {windowopenPopup(facebook);});
  $('#naverBtn').click(function() {windowopenPopup(naver);});
  $('#kakaoBtn').click(function() {windowopenPopup(kakao);});
  $('#googleBtn').click(function() {windowopenPopup(google);});
  
});

function windowopenPopup(type) {
  var popupX = (window.screen.width / 2) - (600 / 2);
  var popupY= (window.screen.height / 2) - (600 / 2);
  
  window.open(
      'auth/snsSignin?loginType=' + type, 
      type +' 로그인', 
      'width=600, height=600, left=' + popupX +
      ', top=' + popupY + ', toolbar=no, menubar=no, location=no, status=no'
      );
}
</script>