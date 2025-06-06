<?php
	global $morpheus, $dir, $navID;

	$max = 3;
	$cid = 22;

	$sql = "SELECT * FROM `morp_cms_telegram` WHERE sichtbar=1 ORDER BY tid DESC LIMIT 0,$max";
	$res = safe_query($sql);

	while($row = mysqli_fetch_object($res)) {

		$output .= '
				<div class="modul">
					<p class="telegramDatum">'.euro_dat($row->datum).'</p>
					<h2 class="mb1">'.nl2br($row->tTitle).'</h2>
					<p class="mb1">'.nl2br($row->tText).'</p>
					<p class="mb1"><a href="'.$dir.$navID[$cid].'"><i class="fa fa-envelope"></i> zum Telegram</a></p>

				</div>

';

	}