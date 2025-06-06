<?php
global $navarray, $lan, $navID, $produkt_group_arr;

$tmp 	= explode("|", $text);
$anker 	= explode("#", $tmp[0]);
$link 	= trim($anker[0]);
$anker	= $anker[1];
$txt 	= $tmp[1];


$output .= '<a class="btn btn-danger btn-pixel-2" href="'.$dir.$navID[$link].'">'.$txt.'</a>';

$morp = '<b>Link</b>: '.$txt.'<br/>';

?>