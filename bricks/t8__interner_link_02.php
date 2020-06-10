<?php
global $navarray, $lan, $navID, $containerLink2, $containerLinkText2;

$tmp 	= explode("|", $text);
$anker 	= explode("#", $tmp[0]);
$link 	= trim($anker[0]);
$anker	= $anker[1];
$txt 	= $tmp[1];


$containerLink2 = $dir.$navID[$link];
$containerLinkText2 = $txt;

$morp = '<b>Link</b>: '.$txt.'<br/>';

?>