<?php
global $lan, $cid, $navID, $hn_id, $js, $news;

$mid = $_SESSION["mid"];

$isDetail = $_GET["nid"] ? $_GET["nid"] : 0;
$news = 1;
$heute = date("Y-m-n");

$confirm_arr = confirmArray($ngid);
// print_r($confirm_arr);

if($isDetail) {
	$sql 	= "SELECT * FROM `morp_cms_news` WHERE nid=".$isDetail." AND sichtbar=1 AND ( nvon='0000-00-00' OR ( nvon <= '$heute' AND nbis >= '$heute' ) )";
	$res 	= safe_query($sql);

	$row = mysqli_fetch_object($res);
	$ntitle = $row->ntitle;
	$ntext = $row->ntext;
	$ngid = $row->ngid;

	// $lnk = $dir.$navID[$newsID].eliminiere($ntitle).'+'.$row->nid.'/';
	$lnk = $dir.$navID[$hn_id].'#n'.$row->nid;

	$images = '';

	for($i=1; $i<=3; $i++) {
		$get = "img".$i;
		if($row->$get) $images .= '				<img src="'.$dir.'images/news/'.$row->$get.'" alt="'.$ntitle.' '.$i.'" class="img-responsive" />
';
	}

	$pdf = '';
	if($row->pid) {
		$pdf = getPDF($row->pid);
		// print_r($pdf);
	}

	$confirm = in_array($ngid, $confirm_arr);
	if($confirm) $hasConfirmed = hasConfirmed($isDetail, $mid);
	else $hasConfirmed = 0;

	$output .= '
        <div class="container newsDetail">

	        <div class="col-md-12 mb2 mt4">
				<a href="'. $lnk .'" class="btn btn-info"><i class="fa fa fa-chevron-left"></i> &nbsp; Zurück zu den Neuigkeiten</a>
			</div>
	        <div class="col-md-4 col-sm-6 col-xs-12 mobileOff">
				'.$images.'
	        </div>
	        <div class="col-md-8 col-sm-6 col-xs-12">
				<p>'.euro_dat($row->nerstellt).'</p>
				<hr>
				<h3><a href="'. $lnk .'">'.$ntitle.'</a></h3>
				<p>'.nl2br($ntext).'</p>

				'.($pdf ? '
				<hr>
				<p><a href="'.$dir.'download.php?dfile='.$row->pid.'" target="_blank" title="'.$pdf["name"].'"  class="btn btn-default"><i class="fa fa-download"></i> Download - '.$pdf["name"].'</a></p>
				' : '').'
				'.($confirm ? '<hr><p class="hashtagNews">'.($hasConfirmed ? '<a href="#" class="btn btn-success confirmed"> &nbsp; Ich habe die Betriebsanweisung zur Kenntnis genommen.</a>' : '<a href="#" class="btn btn-warning confirm" ref="'.$isDetail.'"> &nbsp; Hiermit bestätige ich, dass ich die Betriebsanweisung zur Kenntnis genommen habe.</a>').'</p><hr>' : '').'

		    </div>

	        <div class="col-md-4 col-sm-6 col-xs-12 mobileOn mt6">
				'.$images.'
	        </div>
        </div>
';

$secure = date("Y")."pixDus".date("m");
$secure = md5($secure);

	$js = '

    $(".confirm").click(function () {
	    var obj = $(this);
	    id = obj.attr("ref");

	    request = $.ajax({
	        url: "'.$dir.'page/Update.php",
	        type: "post",
	        data: "col=mid&data='.$mid.'&col2=nid&data2="+id+"&tid=cid&tbl=1&id=1&ins=1&sec='.$secure.'",
	        success: function(data) {
				// console.log(data);
				location.reload();
  			}
	    });
    });

';

}

else {
	$max = 30;
	if($cid == 2) 	$sql 	= "SELECT * FROM `morp_cms_news` WHERE sichtbar=1 AND ( nvon='0000-00-00' OR ( nvon <= '$heute' AND nbis >= '$heute' ) ) ORDER BY nerstellt DESC, nid LIMIT 0,$max";
	else  			$sql 	= "SELECT * FROM `morp_cms_news` WHERE ngid=".$text." AND sichtbar=1 AND ( nvon='0000-00-00' OR ( nvon <= '$heute' AND nbis >= '$heute' ) ) ORDER BY nerstellt DESC, nid ";

	$res 	= safe_query($sql);
	$anzahl = mysqli_num_rows($res);

	$output .= '
        <div class="container-full mt3">
			<div class="row">
		        <div class="col-sm-10">
					<div class="grid">
';

	$tagListButtons = array();

	while ($row = mysqli_fetch_object($res)) {
		$ntitle = $row->ntitle;
		$nabstr = $row->nabstr;
		$nid 	= $row->nid;
		$ngid 	= $row->ngid;

		// $confirm = need2confirm($ngid);
		$confirm = in_array($ngid, $confirm_arr);

		if($confirm) $hasConfirmed = hasConfirmed($nid, $mid);
		else $hasConfirmed = 0;

		$lnk = $dir.$navID[$cid].'news+'.$nid.'/';
		// $lnk = $dir.$navID[$newsID].'#n'.$row->nid;

		$hashtags = getTags($nid, 'news');
		$hashtagListe = '';
		$filter='';
		foreach($hashtags as $arr) {
			$hashtagListe .= '<button class="btn btn-default hashtag" data-filter=".'.$arr[1].'">#'.$arr[2].'</button>';
			$filter .= " ".$arr[1];
			$tagListButtons[$arr[1]] = $arr[2];
		}

		$output .= '
					<div class="grid-item grid-sizer'.$filter.'">
						<div class="news">
							<a href="'. $lnk .'"><img src="'.$dir.'mthumb.php?w=700&amp;h=400&amp;zc=1&amp;src='.($row->img1 ? 'images/news/'.urlencode($row->img1) : 'images/news-allgemein-stift.jpg').'" alt="'.$ntitle.'" class="img-responsive" /></a>
							<h1><a href="'. $lnk .'">'.$ntitle.'</a></h1>
							<p>'.$nabstr.'</p>
							<p class="lnk"><a href="'. $lnk .'"><i class="fa fa-chevron-right mr10"></i> Zum Artikel</a></p>
							'.($confirm ? '<p class="hashtagNews"><a href="'. $lnk .'" class="btn'.($hasConfirmed ? ' btn-success"><i class="fa fa-check-square-o"></i> &nbsp; Zur Kenntnis genommen' : ' btn-warning"><i class="fa fa-square-o"></i> &nbsp; Zur Kenntnisnahme').'</a></p>' : '').'
							'.($hashtagListe ? '<p class="hashtagNews filter-button-group">'.$hashtagListe.'</p>' : '').'
						</div>
					</div>
';
	}

		// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
	// because of flex modelling i have to set empty div container
/*
	$rest = explode(".", $anzahl/4);
	if($rest[1] > 0) {
		$rest = $rest[1];
		if($rest == 25) $rest = 3;
		elseif($rest == 5) $rest = 2;
		else $rest = 1;

		for($a=1; $a<=$rest; $a++) {
			$output .= '	            <div class="col-md-3 col-sm-6 col-xs-12"><div class=""></div></div>
';
		}
	}
*/
	// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
	// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

	$filterButton = '';
	ksort($tagListButtons);

	foreach($tagListButtons as $key=>$val) {
		$filterButton .= '			<button class="btn btn-info" data-filter=".'.$key.'">#'.$val.'</button>
';
	}

	$output .= '

					</div>
				</div>

					<div class="col-sm-2">
						<div id="filters" class="button-group filter-button-group">
							<button class="btn btn-info is-checked" data-filter="*">Zeige alle News</button>
							'.$filterButton.'
						</div>
					</div>

			</div>
		</div>
';

	$js = '
var $grid = $(\'.grid\').isotope({
  itemSelector: \'.grid-item\',
  masonry: {
	columnWidth: \'.grid-sizer\',
	percentPosition: true
  }
});

$grid.imagesLoaded().progress( function() {
  $grid.isotope(\'layout\');
});

var $items = $grid.find(\'.grid-item\');
$grid.addClass(\'is-showing-items\')
// .isotope( \'revealItemElements\', $items );

// bind filter button click
$(\'.filter-button-group\').on( \'click\', \'button\', function() {
  var filterValue = $( this ).attr(\'data-filter\');
  $grid.isotope({ filter: filterValue });
  //$grid.masonry();
});

// change is-checked class on buttons
$(\'.button-group\').each( function( i, buttonGroup ) {
  var $buttonGroup = $( buttonGroup );
  $buttonGroup.on( \'click\', \'button\', function() {
    $buttonGroup.find(\'.is-checked\').removeClass(\'is-checked\');
    $( this ).addClass(\'is-checked\');
  });
});
';

}

$morp = 'News Modul // ';

?>