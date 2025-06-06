<?php
	global $H1_count;

	if(!$H1_count) $H1_count = 1;
	else $H1_count++;

	$output .= ($H1_count > 1 ? '<h1>' : '<h1>').nl2br($text).($H1_count > 1 ? '</h1>' : '</h1>');
	$morp = $text;
?>