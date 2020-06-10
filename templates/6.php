<?php
/* pixel-dusche.de */

global $galHR, $galLR, $gallery;

$gallery = 1;

$template .= '
<section id="galery">
	<div class="container">
		<div class="row">
			<div class="col-md-9">
			  <div class="swiper-container gallery-top">
			    <div class="swiper-wrapper">
'.$galHR.'
			    </div>
			    <!-- Add Arrows -->
			    <div class="swiper-button-next swiper-button-white"></div>
			    <div class="swiper-button-prev swiper-button-white"></div>
			  </div>
			</div>
			<div class="col-md-3 mobileOff">
'.$galLR.'
			</div>
		</div>
	</div>
</section>
';


?>