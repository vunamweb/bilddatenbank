<?php
global $navarray, $lan, $navID, $produkt_group_arr;

$tmp 	= explode("|", $text);
$anker 	= explode("#", $tmp[0]);
$link 	= trim($anker[0]);
$anker	= $anker[1];
$txt 	= $tmp[1];


$output .= 'ilink <a class="text-gray-dark btnAboutus" href="'.$dir.$navID[$link].'"><u>'.$txt.'</u></a>ilink';

$morp = '<b>Link</b>: '.$txt.'<br/>';

?>