<?php
global $img_pfad, $dir, $druckversion, $navID, $lan, $morpheus, $galHR, $galLR;

$gnid 	= $text;

$que  	= "SELECT * FROM galerie_name n, galerie g WHERE g.gnid=".$gnid." AND g.gnid=n.gnid ORDER BY g.sort";

$res 	= safe_query($que);
$x		= mysqli_num_rows($res);
$galHR = '';
$galLR = '';
$n = 0;

while ($row = mysqli_fetch_object($res)) {
	$n++;
	$img 	= $row->gname;
	$tn 	= $row->tn;
	$ordner = $row->gnname;
	$gnid 	= $row->gnid;

	$galHR .= '<div class="swiper-slide" style="background-image:url('.$dir.'Galerie/'.$morpheus["GaleryPath"].'/'.$ordner.'/'.$img.')" data-hash="slide'.$n.'"></div>';
	$galLR .= '<div class="swipe"><a href="#slide'.$n.'"><img class="img-responsive" src="'.$dir.'Galerie/'.$morpheus["GaleryPath"].'/'.$ordner.'/'.$img.'"></a></div>';
}

$morp = "Galery $text";
?>