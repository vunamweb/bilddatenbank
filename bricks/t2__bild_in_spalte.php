<?php
global $img_pfad, $dir, $grIMG, $socialImage;

$imgid  = $text;

if($text) {
	$que  	= "SELECT itext, imgname FROM image WHERE imgid=$imgid";
	$res 	= safe_query($que);
	$rw     = mysqli_fetch_object($res);
	$itext 	= $rw->itext;
	$inm 	= $rw->imgname;

	if (isin("^http", $itext)) $ext = '<a href="'.$itext.'" target="_blank" title="'.$itext.'">';

	$grIMG = $ext.'<img src="'.$dir.'mthumb.php?w=650&amp;src=images/userfiles/image/'.urlencode($inm).'" class="img-responsive" />'.($ext ? '</a>' : '');
}

$morp = $inm;

$socialImage = urlencode($inm);

?>