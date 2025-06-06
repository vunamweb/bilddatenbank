<?php
global $img_pfad, $dir, $emotional, $socialImage;

$imgid  = $text;

if($text) {
	$que  	= "SELECT itext, imgname FROM image WHERE imgid=$imgid";
	$res 	= safe_query($que);
	$rw     = mysqli_fetch_object($res);
	$itext 	= $rw->itext;
	$inm 	= $rw->imgname;
	$ext = '';

	$output .= '		<img src="'.$dir.'images/userfiles/image/'.$inm.'" class="pull-right img-right" alt="'.$itext.'" />';
}

$morp = $inm;
$socialImage = urlencode($inm);

?>