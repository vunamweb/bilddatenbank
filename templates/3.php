<?php
/* pixel-dusche.de */

global $containerLink, $containerLinkText, $grIMG, $template3count, $templateTotal;
global $design, $cid, $tref;

if(!$template3count || $template3count < 1) {
	$sql = "SELECT cid FROM content WHERE tid=3 AND navid=$cid AND ton=1";
	$res = safe_query($sql);
	$templateTotal = mysqli_num_rows($res);

	$template3count = 1;
}
else $template3count++;


if($template3count == 1) $template = '

    <div class="container">
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

$template .= '
	            <div class="col-md-4 col-sm-6 col-xs-12">
	    	        <div class="wohnen he">
						'.$containerLink.$grIMG.'</a>
#cont#
						<div class="DIVoverlay">'.$containerLink.'</a></div>
	    	        </div>
	            </div>

';

if($template3count == $templateTotal) {
	$template .= '
		</div>
	</div>

';
	$template3count = 0;
	$templateTotal = 0;
}

?>