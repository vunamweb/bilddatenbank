<?php
global $navarray, $lan, $navID, $produkt_group_arr;

$tmp 	= explode("|", $text);
$anker 	= explode("#", $tmp[0]);
$link 	= trim($anker[0]);
$anker	= $anker[1];
$txt 	= $tmp[1];


$output .= '	<p class="falink"><a href="'.$dir.$navID[$link].'"><i class="fa fa-chevron-right"></i> '.$txt.'</a></p>
';

$morp = '<b>Link</b>: '.$txt.'<br/>';

?>