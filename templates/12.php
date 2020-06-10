<?php
/* pixel-dusche.de */

global $containerLink, $containerLinkText, $grIMG, $template12count, $templateTotal;
global $design, $cid, $tref, $overlayText, $lasttref;

$template = '';

$setend = 0;

// echo $lasttref.$tref.'<br>';

if($template12count && $lasttref != $tref) $setend = 1;
elseif($template12count == 4 && $tref == 3) $setend = 1;
elseif($template12count == 3 && $tref == 2) $setend = 1;
elseif($template12count == 2 && $tref == 1) $setend = 1;

if($setend) {
	$template = '
		</div>
	</div>
</section>
';
	$template12count = 0;
	$templateTotal = 0;
}

$lasttref = $tref;


if(!$template12count || $template12count < 1) {
	$sql = "SELECT cid FROM content WHERE tid=3 AND navid=$cid AND ton=1";
	$res = safe_query($sql);
	$templateTotal = mysqli_num_rows($res);

	$template12count = 1;
}
else $template12count++;


if($template12count == 1) $template .= '

<section'.($tref == 1 || !$tref ? '' : ' class="mt6"').'>
    <div class="container py-2">
		<div class="row">

';
else $template = '';


/*
<section class="mt6">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-xs-6">
    	        <div class="wohnen he">
*/

if($tref == 1 || !$tref) $template .= '

  	            <div class="col-md-6 col-sm-6 col-xs-12">
  					<div class="full w-100" style="background: url('.$grIMG.') 0 0 no-repeat;background-size: cover;">
  						<div class="overlay-effect h-100 w-100">
	  						<p><a href="#">'.$overlayText.'</a></p>
  						</div>
	  				</div>
  				</div>

';
elseif($tref == 2) $template .= '

  	            <div class="col-md-4 col-sm-6 col-xs-12">
  					<div class="half w-100" style="background: url('.$grIMG.') 0 0 no-repeat;background-size: cover;">
  						<div class="overlay-effect h-100 w-100">
	  						<p><a href="#">'.$overlayText.'</a></p>
  						</div>
	  				</div>
  				</div>

';
elseif($tref == 3) $template .= '

  	            <div class="col-md-3 col-sm-6 col-xs-12">
  					<div class="half2 w-100" style="background: url('.$grIMG.') 0 0 no-repeat;background-size: cover;">
  						<div class="overlay-effect h-100 w-100">
	  						<p><a href="#">'.$overlayText.'</a></p>
  						</div>
	  				</div>
  				</div>

';

if($template12count == $templateTotal) {
	$template .= '
		</div>
	</div>
</section>
';
	$template12count = 0;
	$templateTotal = 0;
}

$overlayText = '';

?>