<?php
global $navarray, $lan, $navID, $containerLink, $containerLinkText;

$tmp 	= explode("|", $text);
$anker 	= explode("#", $tmp[0]);
$link 	= trim($anker[0]);
$anker	= $anker[1];
$txt 	= $tmp[1];


$containerLink = '<a href="'.$dir.$navID[$link].'">';
$containerLinkText = $txt;

$morp = '<b>Link</b>: '.$txt.'<br/>';

?>