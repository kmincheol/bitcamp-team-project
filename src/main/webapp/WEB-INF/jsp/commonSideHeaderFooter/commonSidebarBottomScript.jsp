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