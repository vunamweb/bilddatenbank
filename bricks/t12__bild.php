<?php
global $img_pfad, $dir, $grIMG, $socialImage, $containerLinkText;

$imgid  = $text;

if($text) {
	$que  	= "SELECT itext, imgname FROM image WHERE imgid=$imgid";
	$res 	= safe_query($que);
	$rw     = mysqli_fetch_object($res);
	$itext 	= $rw->itext;
	$inm 	= $rw->imgname;

	$grIMG = $dir.'images/userfiles/image/'.urlencode($inm);
}

$morp = $inm;

$socialImage = urlencode($inm);

?>