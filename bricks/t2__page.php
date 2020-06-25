<?php
# $output .= $text;
$page = explode("?", trim($text));
$ziel = $page[1];
include("page/".$page[0]);

$morp .= $page[0].' / ';

?>