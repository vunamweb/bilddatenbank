<?php
global $navarray, $lan, $navID, $containerLink1, $containerLinkText1;

$tmp 	= explode("|", $text);
$anker 	= explode("#", $tmp[0]);
$link 	= trim($anker[0]);
$anker	= $anker[1];
$txt 	= $tmp[1];


$containerLink1 = $dir.$navID[$link];
$containerLinkText1 = $txt;

$morp = '<b>Link</b>: '.$txt.'<br/>';

?>