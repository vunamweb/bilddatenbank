<?php
global $navarray, $lan, $navID, $produkt_group_arr, $overlayLink;

$tmp 	= explode("|", $text);
$anker 	= explode("#", $tmp[0]);
$link 	= trim($anker[0]);
$anker	= $anker[1];
$txt 	= $tmp[1];


$overlayLink = $dir.$navID[$link];

/*
$output .= '	<p class="textLinkBold"><a href="'.$dir.$navID[$link].'">'.$txt.'</a></p>
';
*/

$morp = '<b>Link</b>: '.$txt.'<br/>';

?>