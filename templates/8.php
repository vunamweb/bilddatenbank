<?php
/* pixel-dusche.de */

global $dir;
global $containerLink1, $containerLink2, $containerLinkText1, $containerLinkText2, $img1, $img2;


$template = '
<section>
    <div class="container-full bg-senf">
	    <div class="container">
	        <div class="row imgwrap">
    	        <div class="col-xs-6">
	    	        <div class="bg-weiss">
						<a href="'.$containerLink1.'"><img src="'.$img1.'" alt="'.$containerLinkText1.'" class="img-responsive" /></a>
						<div class="hl-box"><a href="'.$containerLink1.'">'.$containerLinkText1.'</a></div>
	    	        </div>
    	        </div>
    	        <div class="col-xs-6">
	    	        <div class="bg-weiss">
						<a href="'.$containerLink2.'"><img src="'.$img2.'" alt="'.$containerLinkText2.'" class="img-responsive" /></a>
						<div class="hl-box"><a href="'.$containerLink2.'">'.$containerLinkText2.'</a></div>
	    	        </div>
    	        </div>
            </div>
        </div>
    </div>
</section>

';

$containerLinkText1 = '';
$containerLinkText2 = '';
$containerLink1 = '';
$containerLink2 = '';

?>