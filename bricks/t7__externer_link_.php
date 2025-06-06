<?php
global $dir, $overlayLink;

$tmp 	= explode("|", $text);
$link 	= $tmp[0];
$txt 	= $tmp[1];

if (ereg('^/', $link)) $link = $dir.substr($link, 1);
else {
	$link = (ereg("^http", $link) ? '' : 'http://').$link;
	$blank = " target=\"_blank\"";
}

$overlayLink = $link;

/*
$output .= "<a href=\"".$link."\" '.$blank.'>$txt</a><br/>
";
*/

$morp = '<b>Link</b>: '.$txt.'<br/>';

?>