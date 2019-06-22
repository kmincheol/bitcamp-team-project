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
			$('nav').addClass('darkred');
		}

		else {
			$('nav').removeClass('darkred');
		}
	})
</script>   
 <script>
   $('#mypage-btn').on('click', function(){
      var no = $('#loginNo').val(); 
      no2 = btoa(no); 
      location="${contextRootPath}/app/member/" + no2;   
   });
    
    </script>  