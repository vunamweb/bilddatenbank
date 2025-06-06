<?php
global $dir;

$tmp 	= explode("|", $text);
$link 	= $tmp[0];
$txt 	= $tmp[1];

if (ereg('^/', $link)) $link = $dir.substr($link, 1);
else {
	$link = (ereg("^http", $link) ? '' : 'http://').$link;
	$blank = " target=\"_blank\"";
}

$output .= '<a class="btn btn-danger btn-pixel-2" href="'.$link.'" '.$blank.'>'.$txt.'</a>';

$morp = '<b>Link</b>: '.$txt.'<br/>';

?>