<?php
	global $dir, $morpheus, $navID;

	$cid = 4;

	$que = "SELECT * FROM `morp_cms_galerie_name` n, `morp_cms_galerie` g WHERE sichtbar=1 AND g.gnid=n.gnid GROUP BY g.gnid ORDER BY n.date DESC LIMIT 0,3";

	$res 	= safe_query($que);
	$x		= mysqli_num_rows($res);
	$n = 0;


	while ($row = mysqli_fetch_object($res)) {
		$n++;
		$img 	= $row->gname;
		$ordner = $row->gnname;
		$gnid 	= $row->gnid;

		$textde = $row->textde;
		$hl = $row->gntextde;

		$besitzer = $row->mid;
		$profile = getProfile($besitzer);

		$output .= '

				<div class="modul linkbox mb2" ref="'.$dir.$navID[$cid].'kategorien+'.$gnid.'/">
				    <div class="hovereffect">
				        <img class="img-responsive" src="'.$dir.'mthumb.php?w=700&amp;h=200&amp;zc=1&amp;src=Galerie/'.$morpheus["GaleryPath"].'/'.$ordner.'/'.urlencode($img).'">
			            <div class="overlay">
			                <h2 class="uc">'.$hl.($besitzer ? '</h2><span>von '.$profile["vname"].' '.$profile["nname"] : '').'</span>
							'.($textde ? '<p>'.$textde.'</p>' : '').'
			            </div>
				    </div>
				</div>
		';
	}
/*

	$tagList = getAllTags($id, $art='image');
	ksort($tagList);
	$filterButton = '';

	foreach($tagList as $arr) {
		$filterButton .= '<a href="'.$dir.'?hn=galerien&cont=galerien&hashtagid='.$arr[0].'&hashtag='.$arr[1].'" class="btn btn-info hashtagGal">#'.$arr[2].'</a>
';
	}
*/




?>