<?php
	global $morpheus, $dir, $navID;

	$max = 20;
	$cid = 26;

	$sql = "SELECT * FROM `morp_tags_list` t1, `morp_tags` t2 WHERE t1.tagID=t2.tagID GROUP BY tag LIMIT 0,$max";
	$res = safe_query($sql);


	while($row = mysqli_fetch_object($res)) {
		// $rw->tagID, $rw->tag, $rw->tag_long);

		$output .= '<a href="'.$dir.'?hn=hashtags&cont=hashtags&ht='.$row->tag.'" class="btn btn-default">#'.$row->tag_long.'</a>';

	}

?>