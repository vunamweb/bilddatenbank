<?php
	global $morpheus, $dir, $navID;

	$max = 4;
	$cid = 11;

	$sql = "SELECT * FROM `morp_cms_angebote` WHERE sichtbar=1 ORDER BY aid DESC LIMIT 0, $max";
	$res = safe_query($sql);


	while($row = mysqli_fetch_object($res)) {
		$x++;

		$img = $row->img1 ? '<img src="'.$dir.'mthumb.php?w=500&amp;h=150&amp;zc=1&amp;src=images/angebote/'.urlencode($row->img1).'" class="img-responsive" />' : '';
		$output .= '

			<div class="download-item bg-weiss">
				'.($img ? $img.'<hr>' : '').'

				<h2>'.$row->aTitle.'</h2>
				<p>'.nl2br($row->aDesc).'</p>
				'.( $row->aPreis ? '<hr>
				<p class="zeile1"><em class="leftcol">Preis:</em> <b class="rightcol">'.$row->aPreis.'</b></p>' : '').'
			</div>
';

	}

?>