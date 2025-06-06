<?php
	global $navID, $dir, $lan;

	$sql = "SELECT * FROM news_group WHERE ngid=$text";
	$res = safe_query($sql);
	$row = mysqli_fetch_object($res);
	$format = $row->format;

	$sql = "SELECT * FROM news WHERE ngid=$text AND `sichtbar`=1 ORDER BY nerstellt DESC, nid DESC";
	$res = safe_query($sql);

	$output .= '
		</div>
		<div class="main_content">
			<div class="container">
				<div class="row">
';




	if($format == 4) $output .= '
					<div class="col col-12 col-lg-12 co-sm-12">
						<ul class="list_service clearfix">
';
	else if($format == 1) $output .= '
					<div class="col col-12 col-lg-10 col-sm-12 mx-auto">
						 <div class="accordion">
				            <dl>
';


	$x = 0;

	while($row = mysqli_fetch_object($res)) {
		# mehr zu thema
		$nlink = $row->nlink;
		$more = '';
		$x++;

		if ($nlink) {
			if (isin("^http", $nlink)) {	$more .= "<p><a href=\"".$nlink ."\" title=\"".$nlink ."\" target=\"_blank\">".'<i class="fa fa-chevron-right"></i> '.$nlink ."</a></p>";	}
			else {
	 			$more .= "<p><a href=\"$dir".$lan.'/'.$navID[$nlink]."\" title=\"". $navID[$nlink] ."\">".'<i class="fa fa-chevron-right"></i> weitere Informationen</a></p>';
			}
		}

		// $anker = preg_split("/[\s,\/\-\.]+/", $text);

		$nlink = explode("#", $nlink);
		$anker = $nlink[1];
		$nlink = $nlink[0];

		if($format == 3) $output .= '					<div class="col-lg-6 co-sm-6 col-12 portfolio_items">
						<article>
							<h3>'.($nlink ? '<a href="'.$dir.$lan.'/'.$navID[$nlink].($anker ? '#'.$anker : '').'">' : '').$row->ntitle.($nlink ? '</a>' : '').'</h3>
							<div class="portfolio_items_content">
								'.($nlink ? '<a href="'.$dir.$lan.'/'.$navID[$nlink].($anker ? '#'.$anker : '').'">' : '').$row->ntext.($nlink ? '</a>' : '').'
							</div>
						</article>
					</div>
';
		else if($format == 4) $output .= '
							<li>
								<figure class="snip1205">

									'.($nlink ? '<a href="'.$dir.$lan.'/'.$navID[$nlink].($anker ? '#'.$anker : '').'">' : '').'<i class="fa '.$row->icon.' bigHover"></i>'.$row->ntitle.($nlink ? '</a>' : '').'
								</figure>
							</li>
';
		else if($format == 1) {
			# # # # # # # # # # # #
			# pdf oder anderes dokument doc, xls, etc. wird angezeigt
			$dl = '';
			if ($pid = $row->pid) {
				$sql 	= "SELECT * FROM pdf where pid=$pid";
				$rs 	= safe_query($sql);
				$rw 	= mysqli_fetch_object($rs);
				$typ 	= explode(".", $row->pname);
				$c	 	= (count($typ)-1);
				$img 	= $typ[$c]."_s.gif";

				$go    	= $dir."pdf/".$rw->pname;
				$dl 	= "<p><a href=\"$go\" target=\"_blank\" title=\"" .$rw->pdesc ."\">".'<i class="fa fa-download"></i> &nbsp; ' .$rw->pdesc ."</a></p>";
			}
			# _pdfs
			# # # # # # # # # # # #


			$output .= '
				              <dt>
				                <a href="#accordion'.$x.'" aria-expanded="'.($x == 1 ? 'true' : 'false').'" aria-controls="accordion'.$x.'" data-toggle="is-collapsed" class="accordion-title accordionTitle js-accordionTrigger'.($x == 1 ? '' : ' is-collapsed').'">'.$row->ntitle.' <span class="date">'.dat_monat($row->nerstellt,1).'</span></a>
				              </dt>
				              <dd class="accordion-content accordionItem'.($x == 1 ? '' : ' is-collapsed').'" id="accordion'.$x.'" aria-hidden="false">
				                '.$row->ntext.'
				                '.$dl.'
				              </dd>
';
		}

	}





	if($format == 4) $output .= '
						</ul>
					</div>
';
	else if($format == 1) $output .= '
							</dl>
						</div>
					</div>

';


	$output .= '
				</div>
			</div>
		</div>
';

$morp = "<b>News-Modul</b>";

?>