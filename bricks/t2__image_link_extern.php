<?php

global $navarray, $lan, $navID;

$tmp 	= explode("|", $text);
$link 	= $tmp[1];
$imgid 	= $tmp[0];

$query  = "SELECT itext, imgname FROM image WHERE imgid=$imgid";
$result = safe_query($query);
$row    = mysqli_fetch_object($result);
$itext 	= $row->itext;
$inm 	= $row->imgname;
$img_pfad = "images/userfiles/image/";

$output .= '<a href="'.(isin("^http", $link) ? '' : 'http://').$link.'" target="_blank" style="height:auto;margin:0;"><img src="'.$dir.$img_pfad.$inm.'" /></a>';

?>