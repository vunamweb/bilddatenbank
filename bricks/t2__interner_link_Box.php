<?php
global $navarray, $lan, $navID, $BoxLink;

$tmp 	= explode("|", $text);
$anker 	= explode("#", $tmp[0]);
$link 	= trim($anker[0]);
$anker	= $anker[1];
$txt 	= $tmp[1];


$BoxLink = $dir.$navID[$link];

$morp = '<b>Link</b>: '.$txt.'<br/>';

?>