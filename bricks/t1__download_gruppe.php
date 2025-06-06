<?php
/*
$v = Imagick::getVersion();
print_r($v);
preg_match('/ImageMagick ([0-9]+\.[0-9]+\.[0-9]+)/', $v['versionString'], $v);
if(version_compare($v[1],'6.2.8')<=0){
   print "Your ImageMagick Version {$v[1]} is '6.2.8' or older, please upgrade!";
}
*/

global $pdf, $dir, $fileTypes;


$output .= '<div class="container container-xl">
';

if($text) {
	$sql  = "SELECT * FROM morp_cms_pdf p, morp_cms_pdf_group pg WHERE p.pgid=pg.pgid AND p.pgid=$text";
	$res = safe_query($sql);

	$x = 0;

	while($row = mysqli_fetch_object($res)) {
		$de = $row->pdesc;
		$pl = $row->plong;
		$nm = $row->pname;
		$si = number_format($row->psize / (1024*1000) , 2).' MB';
		$da = $row->pdate;
		$pi = $row->pimage;
		$da = euro_dat($da);

		$icon = $row->img1;
		$hl = $row->pghl;

		// makeImage(DIR.'/pdf/'.$nm, DIR.'/images/icons/', "400x400", 0);

		if($x < 1) {
					$output .= '
<div class="row">
	<div class="col-md-12"><h1 class="download">'.$hl.'</h1></div>
</div>
<div class="row downloads row-flex row-flex-wrap">
';
		}

		$typ = explode(".", $nm);
		$c	 = (count($typ)-1);
		$img = $typ[$c]."_s.gif";

		if($typ[$c] == "pdf") 	$vorschau = str_replace(".".$typ[$c], '-1.jpg', $nm);
		else 					$vorschau = str_replace(".".$typ[$c], '.jpg', $nm);

		$output .= '
	<div class="col-lg-3 col-sm-6 col-md-4">
		<div class="download-item">
			<p class="z1">
				<a href="'.$dir.'pdf/'.$nm.'" target="_blank" title="'.$nm.' zum Download"><span class="icon">'. strtolower($typ[$c]) .'</span></a>
				'.($de ? $de : str_replace("_", " ", $nm)).'
			</p>
			<hr>
			<p class="z2">'.nl2br($pl).'</p>
			<p class="z2">Upload - Datum: <b>'.($da).'</b></p>
			<p class="z2">Dateigröße: <b>'.($si).'</b></p>

			'.(file_exists(DIR.'/images/icons/'.$vorschau) ? '<img src="'.$dir.'mthumb.php?w=400&amp;h=400&amp;zc=2&amp;src=images/icons/'.$vorschau.'" alt="" class="img-responsive vorschau" />' : '').'
			<hr>
			<p><a href="'.$dir.'download.php?dfile='.$row->pid.'" target="_blank" title="'.$nm.' zum Download"  class="btn btn-default"><i class="fa fa-download"></i> Download</a></p>
		</div>
	</div>

';

		$x++;
	}

	$output .= '</div>';

}

$output .= '</div>';


$morp = '<b>Download:</b> '.$de.'<br/>';
?>