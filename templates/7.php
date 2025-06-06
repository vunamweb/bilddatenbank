<?php
/* pixel-dusche.de */

global $cid, $template3count, $templateTotal, $imgSl, $overlayLink;

if(!$template3count || $template3count < 1) {
	$sql = "SELECT cid FROM content WHERE tid=7 AND navid=$cid AND ton=1";
	$res = safe_query($sql);
	$templateTotal = mysqli_num_rows($res);

	$template3count = 1;
}
else $template3count++;



if($template3count == 1) $template = '
<section class="slider">
	<div class="container-full">
		<div class="inner-slider">

		    <div class="swiper-container main-slider" id="myCarousel">
		        <div class="swiper-wrapper">

';
else $template = '';


$template .= '
		            <div class="swiper-slide slider-bg-position" style="background:url(\''.$imgSl.'\')" data-hash="slide1">
			            <div class="overlay animated fadeInDown" data-animation="flipInY"'.($overlayLink ? ' ref="'.$overlayLink.'"' : '').'>
#cont#
			            </div>
		            </div>
';

if($template3count == $templateTotal) {
	$template .= '
		        </div><!-- Add Navigation -->

				<div class="swiper-button-prev swiper-button-white" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="false"></div>
				<div class="swiper-button-next swiper-button-white" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></div>
		    </div>

		</div>
	</div>
</section>
';

	$template3count = 0;
	$templateTotal = 0;
}

$imgSl = '';
$overlayLink = '';


?>