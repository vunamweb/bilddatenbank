

</body>
</html>

<script>
$(function () {
    $('.navbar-toggle').click(function () {
        $('.navbar-nav').toggleClass('slide-in');
        $('.side-body').toggleClass('body-slide-in');
        $('#search').removeClass('in').addClass('collapse').slideUp(200);

        /// uncomment code for absolute positioning tweek see top comment in css
        //$('.absolute-wrapper').toggleClass('slide-in');

    });

   // Remove menu for searching
   $('#search-trigger').click(function () {
        $('.navbar-nav').removeClass('slide-in');
        $('.side-body').removeClass('body-slide-in');

        /// uncomment code for absolute positioning tweek see top comment in css
        //$('.absolute-wrapper').removeClass('slide-in');

    });
});


$(document).on('click', '[data-toggle="lightbox"]', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox( );
});

/*
	function setVorschau() {
		wW = $(window).width();
		abzug = 278;
		wNew = wW - abzug;
		$("#vorschau").css({"width":wNew+"px"});
		console.log(wW);

	}

	$(window).on('resize', function(){
		setVorschau();
	});
	$( document ).ready(function() {
		setVorschau();
	});
*/

</script>

<?php global $jsFunc; echo $jsFunc; ?>