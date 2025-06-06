<?php
	global $morpheus, $dir, $navID;


	$max = 5;
	$cid = 2;

	$sql 	= "SELECT * FROM `morp_cms_news` WHERE sichtbar=1 AND ( nvon='0000-00-00' OR ( nvon <= '$heute' AND nbis >= '$heute' ) ) ORDER BY nerstellt DESC, nid LIMIT 0,$max";
	$res 	= safe_query($sql);


	while ($row = mysqli_fetch_object($res)) {
		$ntitle = $row->ntitle;
		$nabstr = $row->nabstr;
		$nid 	= $row->nid;

		$lnk = $dir.$navID[$cid].'news+'.$nid.'/';
		// $lnk = $dir.$navID[$newsID].'#n'.$row->nid;


		$output .= '

						<div class="news modul">
							'.($row->img1 ? '<a href="'. $lnk .'"><img src="'.$dir.'mthumb.php?w=700&amp;h=200&amp;zc=1&amp;src=images/news/'.urlencode($row->img1).'" alt="'.$ntitle.'" class="img-responsive" /></a>' : '').'
							<h1><a href="'. $lnk .'">'.$ntitle.'</a></h1>
							<p>'.$nabstr.'</p>
							<p class="lnk"><a href="'. $lnk .'"><i class="fa fa-chevron-right mr10"></i> Zum Artikel</a></p>
							'.($hashtagListe ? '<p class="hashtagNews filter-button-group">'.$hashtagListe.'</p>' : '').'
						</div>
<hr>
';
	}



?>