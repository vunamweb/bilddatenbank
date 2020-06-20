<?php
# $output .= $text;
$page = explode("?", trim($text));
//print_r($page); die();
$ziel = $page[1];
include("page/".$page[0]);

$morp .= $page[0].' / ';

?>