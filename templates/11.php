<?php
/* pixel-dusche.de */
	global $anzahlNews, $farbe, $titelNews, $News, $cid, $navID, $lan;

	$anz = $anzahlNews ? $anzahlNews : 100;
	$News = $News ? $News : 1;


if($nid) $template = '
				<section class="page-section">
					<div class="container-full clearfix section" style="padding: 80px 0; background:#fff;">

						<div class="container">
';
else $template = '
				<section class="page-section">
					<div class="container-full clearfix section" style="padding: 40px 0;'.($farbe ? ' background:#'.$farbe.';' : '').'">

						<div class="container">

						<div class="heading-block center">
							<h1>'.($titelNews ? $titelNews : 'News / Events').'</h1>
						</div>
';

if($nid) {
	$sql = "SELECT * FROM news WHERE nid=$nid AND sichtbar=1";
	$res = safe_query($sql);
	$row = mysqli_fetch_object($res);

	$template .= '
						<div class="row">
							<div class="col-md-4 col-sm-4">
								'.($row->nmovie ? '<div class="responsive-video"><iframe src="https://youtube.com/embed/'.$row->nmovie.'?autoplay=0&amp;rel=0"
	width="1600" height="900" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div>' : '') .'
								'.($row->img1 ? '	<img src="'.$dir.'mthumb.php?w=500&amp;&amp;src=images/news/'.urlencode($row->img1).'" alt="" class="img-responsive mb30">' : '').'
								'.($row->img2 ? '	<img src="'.$dir.'mthumb.php?w=500&amp;&amp;src=images/news/'.urlencode($row->img2).'" alt="" class="img-responsive mb30">' : '').'
								'.($row->img3 ? '	<img src="'.$dir.'mthumb.php?w=500&amp;&amp;src=images/news/'.urlencode($row->img3).'" alt="" class="img-responsive mb30">' : '').'
								'.($row->img4 ? '	<img src="'.$dir.'mthumb.php?w=500&amp;&amp;src=images/news/'.urlencode($row->img4).'" alt="" class="img-responsive mb30">' : '').'
							</div>

							<div class="col-md-8 col-sm-8">
								<h1>'.$row->ntitle.'</h1>

								<p>'.($row->ntext).'</p>

							</div>
						</div>
					</div>


					<div class="container-full clearfix section" style="padding: 80px 0;'.($farbe ? ' background:#'.$farbe.';' : '').'">

						<div class="container">

						<div class="heading-block center">
							<h1>'.($titelNews ? $titelNews : 'News / Events').'</h1>
						</div>
		';


}

	$sql = "SELECT * FROM news WHERE ngid=$News AND `sichtbar`=1 ORDER BY nerstellt DESC LIMIT 0,$anz";
	$res = safe_query($sql);
	$anz = mysqli_num_rows($res);
	$x = 0;
	$close = 0;

while ($row = mysqli_fetch_object($res)) {
	$x++;
	if($x < 2) {
		$template .= '						<div class="row events">
';
		$close = 1;
	}

	$template .= '					<div class="item col-md-4 col-sm-6" data-animate="fadeIn" data-delay="100">
								<div class="rahmen" ref="'.$dir.$lan.'/'.$navID[$cid].''.eliminiere($row->ntitle).'+'.$row->nid.'/">
									<div class="img_event">
										<div class="eventtop">
										'.($row->img1 ? '	<img src="'.$dir.'mthumb.php?w=500&amp;h=300&amp;zc=1&amp;a=t&amp;src=images/news/'.urlencode($row->img1).'" alt="" class="img-responsive">' : '').'
										</div>
									</div>

									<div class="inner_news">
										<h2>'.$row->ntitle.'</h2>
										<p class="mb0">'.($row->nabstr).'</p>
										<p><a href="'.$dir.$lan.'/'.$navID[$cid].''.eliminiere($row->ntitle).'+'.$row->nid.'/"><i class="fa fa-external-link"></i> weiterlesen</a></p>
									</div>
								</div>
							</div>

		';

			if($x == 3) {
				$template .= '						</div>
';
				$x=0; $close = 0;
			}
		}

if(!$close) $template .= '</div>';

$template .= '
						</div>
						</div>
					</div>
				</section>
';


?>