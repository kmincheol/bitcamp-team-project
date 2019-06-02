<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<script>
	$(document).ready(function() {
		$(".menu-icon").on("click", function() {
			$("nav ul").toggleClass("showing");
		});
	});

	// Scrolling Effect

	$(window).on("scroll", function() {
		if ($(window).scrollTop()) {
			$('nav').addClass('black');
		}

		else {
			$('nav').removeClass('black');
		}
	})
</script>