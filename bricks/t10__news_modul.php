<?php
/* pixel-dusche.de */


$sql = "SELECT * FROM news WHERE ngid=1 AND `sichtbar`=1 ORDER BY nerstellt DESC LIMIT 0,100";
$res = safe_query($sql);
$anz = mysqli_num_rows($res);
$x = 0;



while ($row = mysqli_fetch_object($res)) {
	$x++;

	$link = '';
	if($row->nlink) {
		if(isin("http", $row->nlink)) {
			$link = '<p class="pt2"><a href="'.$row->nlink.'" target="_blank"><i class="fa fa-external-link"></i> &nbsp; '.$row->nlink.'</a></p>';
		}
		else $link = '<p class="pt2"><a href="'.$dir.$navID[$row->nlink].'"><i class="fa fa-external-link"></i>  &nbsp; weitere Informationen</a></p>';

	}
	$pdf = '';
	if($row->pid) {
		$sql = "SELECT * FROM pdf WHERE pid=".$row->pid;
		$rs = safe_query($sql);
		$rw = mysqli_fetch_object($rs);
		$pdf = $rw->pname;
		$pdf = '<p class="pt2"><a href="'.$dir.'pdf/'.$pdf.'" target="_blank"><i class="fa fa-download"></i> &nbsp; PDF / '.$rw->pdesc.'</a></p>';

	}

	$output .= '<a name="n'.$row->nid.'"></a>
				<article class="aktuelles" id="n'.$row->nid.'" name="n'.$row->nid.'">
					<div class="container">
						<div class="row">
							<div class="item col-md-4 col-sm-6">
								'.($row->img1 ? '<img src="'.$dir.'timthumb.php?w=500&amp;h=300&amp;zc=1&amp;src=images/news/'.urlencode($row->img1).'" alt="'.$row->ntitle.'" class="img-responsive">' : '').'
							</div>
							<div class="col-md-8 col-sm-6">
								<p class="small">'.euro_dat($row->nerstellt).'</p>
								<h2>'.$row->ntitle.'</h2>
								'.$row->ntext.'
								'.$link.'
								'.$pdf.'
							</div>
						</div>
					</div>
				</article>


	';
}

?>