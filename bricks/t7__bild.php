<?php
global $img_pfad, $dir, $emotional, $socialImage, $imgSl;

$imgid  = $text;

if($text) {
	$que  	= "SELECT itext, imgname FROM image WHERE imgid=$imgid";
	$res 	= safe_query($que);
	$rw     = mysqli_fetch_object($res);
	$itext 	= $rw->itext;
	$inm 	= $rw->imgname;
	$ext = '';

	$imgSl = $dir.'images/userfiles/image/'.$inm;
}

$morp = $inm;
$socialImage = urlencode($inm);

?>