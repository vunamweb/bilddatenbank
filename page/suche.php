<?php
global $lan, $navID, $dir;

$suche = isset($_GET["suche"]) ? $_GET["suche"] : '';
$hashtag = isset($_GET["hashtag"]) ? 1 : 0;
// print_r($_GET);

$suche 	= trim($suche);
// $hashtag = trim($hashtag);
// $suche 	= substr(trim(utf8_decode($suche)),0,30);

if(!$suche) {  $output = '<h2>Ihre Such-Anfrage ist leer</h2>'; }

else {
// TRACKING der Suchbegriffe //
$dat = date("Y-m-d H:m:s");
$sql = "INSERT morp_suche_track set suche='$suche', time='$dat'".($hashtag ? ", hashtag=1" : "");
safe_query($sql);
// ===========================================================//

#$sql = "SELECT * FROM morp_cms_content WHERE content LIKE '%ü%' COLLATE utf8_bin;";
#$res = safe_query($sql);
#echo '--- '.$n 	 = mysqli_num_rows($res);
// $row = mysqli_fetch_object($res);


/*
$ersetz	= array ("ä","ö","ü","Ä","Ö","Ü","ß");
$durch = array ("ae","oe","ue","Ae","Oe","Ue","ss");
$suche = str_replace($ersetz, $durch, $suche);
*/

$AND = 0;
$OR = 0;

if(preg_match("/ \+ /", $suche)) 			$AND = 1;
elseif(preg_match("/ oder /", $suche)) 	$OR = 1;
elseif(preg_match("/ | /", $suche)) 		$OR = 1;


// echo "<br>$suche ////// oder: $OR / and: $AND<br>";


$ersetz	= array (" und ",  " and ",  " oder ",  " or ",  ' + ',  ' +',  '+ ',  '+',  '|');
$marker = str_replace($ersetz, array(" ", " ", " ", " ", " ", " ", " ", " ", ""), $suche);
$sstr 	= explode(" ", $marker);
$sstr 	= array_unique($sstr);

// print_r($sstr);
$newarr = array();
foreach ($sstr as $search) {
	if($search) $newarr[] = $search;
}
$sstr = $newarr;

// print_r($sstr);

$output = '
	<div class="container container-xl suche">
		<div class="row">
			<div class="col-md-12">

				<h1>Sie suchen nach: '.implode(" UND ", $sstr).'</h1>

			</div>
';








//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////

function setSearchSQL($sstr, $felder, $AND, $OR, $utf8=0) {
	$felder = explode(",",$felder);
	$where = '( ';
	$x = 0;
	foreach ($sstr as $search) {
		$where .= $x > 0 ? ' ) AND ( ' : '';

		if($search) {
			if($utf8) $search = utf8_encode($search);

			$y = 0;
			foreach($felder as $feld) {
				$where .= ($y > 0 ? ' OR ' : ' ').'`'.$feld.'`'." LIKE '%".trim($search)."%'  COLLATE utf8_unicode_ci ";
				$y++;
			}

		}
		$x++;
	}
	return $where.' )';
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////

















//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// TABELLE CONTENT DURCHSUCHEN

$whereString = setSearchSQL($sstr, "content", $AND, $OR);
$sql 		= "SELECT navid FROM morp_cms_content WHERE $whereString GROUP BY navid";
$res 		= safe_query($sql);
$n 	 		= mysqli_num_rows($res);

$navid_arr = array();

if($n) {
	while ($row = mysqli_fetch_object($res)) {
		$navid_arr[]  = $row->navid;
	}
}

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// TABELLE NAV DURCHSUCHEN

$whereString = setSearchSQL($sstr, "name,title,desc", $AND, $OR);
$sql 		= "SELECT navid FROM morp_cms_nav WHERE $whereString GROUP BY navid";
$res 		= safe_query($sql);
$n 	 		= mysqli_num_rows($res);

if($n) {
	while ($row = mysqli_fetch_object($res)) {
		$navid_arr[]  = $row->navid;
	}
}

$navid_arr = array_unique($navid_arr);

	$output .= '<div class="col-md-4"><h2><i class="fa fa-search"></i> &nbsp; Suche im Text</h2>';

if(count($navid_arr) > 0) {

	$such = implode($navid_arr, " OR n.navid=");

	$sql = "SELECT n.navid, name FROM morp_cms_nav n, morp_cms_content c
			WHERE
				n.navid=c.navid AND
				(
				n.navid=$such
				)
			GROUP BY n.navid
	";

	$res = safe_query($sql);
	$ct  = mysqli_num_rows($res);

	while ($row = mysqli_fetch_object($res)) {
		$id  = $row->navid;
		$de  = $row->name;

		$output .= '<p><a href="'.$dir.$navID[$id].'"><i class="fa fa-chevron-right"></i> &nbsp; '.$de.'</a></p>';

	}
}






//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// TABELLE NEWS DURCHSUCHEN
$idFeld = "nid";
$nameFeld = "ntitle";

$whereString = setSearchSQL($sstr, "ntitle,nsubtitle,ntext", $AND, $OR);
$sql 		= "SELECT $idFeld FROM morp_cms_news WHERE $whereString AND sichtbar=1 GROUP BY $idFeld";
$res 		= safe_query($sql);
$n 	 		= mysqli_num_rows($res);

$navid_arr = array();

if($n) {
	while ($row = mysqli_fetch_object($res)) {
		$navid_arr[]  = $row->$idFeld;
	}
}

$navid_arr = array_unique($navid_arr);
// print_r($navid_arr);

	$output .= '</div><div class="col-md-4"><h2><i class="fa fa-search"></i> &nbsp; Suche in den Neuigkeiten</h2>';

if(count($navid_arr) > 0) {

	$such = implode($navid_arr, " OR n.$idFeld=");

	$sql = "SELECT n.$idFeld, $nameFeld FROM morp_cms_news n
			WHERE
				( n.$idFeld=$such )
				AND sichtbar=1
			ORDER BY nerstellt DESC
	";

	$res = safe_query($sql);
	$ct  = mysqli_num_rows($res);

	while ($row = mysqli_fetch_object($res)) {
		$id  = $row->$idFeld;
		$de  = $row->$nameFeld;

		$output .= '<p><a href="'.$dir.$navID[2].'news+'.$id.'/"><i class="fa fa-chevron-right"></i> &nbsp; '.$de.'</a></p>';

	}
}








//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// TABELLE TELEGRAM DURCHSUCHEN
/*
$idFeld = "tid";
$nameFeld = "tTitle";

$whereString = setSearchSQL($sstr, "tTitle,tText", $AND, $OR);
$sql 		= "SELECT $idFeld FROM morp_cms_telegram WHERE $whereString AND sichtbar=1 GROUP BY $idFeld";
$res 		= safe_query($sql);
$n 	 		= mysqli_num_rows($res);

$navid_arr = array();

if($n) {
	while ($row = mysqli_fetch_object($res)) {
		$navid_arr[]  = $row->$idFeld;
	}
}

$navid_arr = array_unique($navid_arr);
// print_r($navid_arr);

	$output .= '</div><div class="col-md-4"><h2><i class="fa fa-search"></i> &nbsp; Suchen im Telegram</h2>';

if(count($navid_arr) > 0) {

	$such = implode($navid_arr, " OR $idFeld=");

	$sql = "SELECT $idFeld, $nameFeld FROM morp_cms_telegram
			WHERE
				( $idFeld=$such )

			ORDER BY datum DESC
	";

	$res = safe_query($sql);
	$ct  = mysqli_num_rows($res);

	while ($row = mysqli_fetch_object($res)) {
		$id  = $row->$idFeld;
		$de  = $row->$nameFeld;

		$output .= '<p><a href="'.$dir.$navID[22].'news+'.$id.'/"><i class="fa fa-chevron-right"></i> &nbsp; '.$de.'</a></p>';

	}
}
*/



//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// TABELLE DOWNLOADS DURCHSUCHEN
$idFeld = "pid";
$nameFeld = "pname";

$whereString = setSearchSQL($sstr, "pdesc,pname,plong", $AND, $OR);
$sql 		= "SELECT $idFeld FROM morp_cms_pdf WHERE $whereString GROUP BY $idFeld";
$res 		= safe_query($sql);
$n 	 		= mysqli_num_rows($res);

$navid_arr = array();

if($n) {
	while ($row = mysqli_fetch_object($res)) {
		$navid_arr[]  = $row->$idFeld;
	}
}

$navid_arr = array_unique($navid_arr);
// print_r($navid_arr);

	$output .= '</div><div class="col-md-4 "><h2><i class="fa fa-search"></i> &nbsp; Suche in den Downloads</h2>';


if(count($navid_arr) > 0) {

	$such = implode($navid_arr, " OR $idFeld=");

	$sql = "SELECT $idFeld, $nameFeld, psize FROM morp_cms_pdf
			WHERE
				$idFeld=$such
			ORDER BY $nameFeld ASC
	";

	$res = safe_query($sql);
	$ct  = mysqli_num_rows($res);

	while ($row = mysqli_fetch_object($res)) {
		$id  = $row->$idFeld;
		$de  = $row->$nameFeld;
		$size  = $row->psize;

		$output .= '<p><a href="'.$dir.'download.php?dfile='.$id.'" target="_blank" title="'.$de.' zum Download"  class="btn btn-default"><i class="fa fa-download"></i> Download: '.$de.' | '.round($size / 1024 / 1000, 3).' MB</a></p>';

	}
}





//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// TABELLE Termine  DURCHSUCHEN
$idFeld = "id";
$nameFeld = "name";
$heute = date("d-m-Y");

$whereString = setSearchSQL($sstr, "name,description,inviteText", $AND, $OR, 1);
$sql 		= "SELECT $idFeld FROM timetables WHERE $whereString AND date>='$heute' GROUP BY $idFeld";
$res 		= safe_query($sql);
$n 	 		= mysqli_num_rows($res);

$navid_arr = array();

if($n) {
	while ($row = mysqli_fetch_object($res)) {
		$navid_arr[]  = $row->$idFeld;
	}
}

$navid_arr = array_unique($navid_arr);
// print_r($navid_arr);

	$output .= '</div></div><div class="row"><div class="col-md-4 mt3"><h2><i class="fa fa-search"></i> &nbsp; Suche in den Terminen</h2>';

if(count($navid_arr) > 0) {

	$such = implode($navid_arr, " OR $idFeld=");

	$sql = "SELECT * FROM timetables
			WHERE
				( $idFeld=$such )
			ORDER BY date DESC
	";

	$res = safe_query($sql);
	$ct  = mysqli_num_rows($res);

	while ($row = mysqli_fetch_object($res)) {
		$id  = $row->$idFeld;
		$de  = $row->$nameFeld;
		$datum = str_replace("-", ".", $row->date);

		$output .= '<p><a href="'.$dir.$navID[3].'"><i class="fa fa-chevron-right"></i> &nbsp; '.utf8_decode($de).' am '.$datum.'</a></p>';

	}
}





//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// TABELLE Meinungen DURCHSUCHEN
$idFeld = "tid";
$nameFeld = "tTitle";

$whereString = setSearchSQL($sstr, "tTitle,tText", $AND, $OR);
$sql 		= "SELECT $idFeld FROM morp_cms_meinungen WHERE $whereString AND sichtbar=1 GROUP BY $idFeld";
$res 		= safe_query($sql);
$n 	 		= mysqli_num_rows($res);

$navid_arr = array();

if($n) {
	while ($row = mysqli_fetch_object($res)) {
		$navid_arr[]  = $row->$idFeld;
	}
}

$navid_arr = array_unique($navid_arr);
// print_r($navid_arr);

	$output .= '</div></div><div class="row"><div class="col-md-4 mt3"><h2><i class="fa fa-search"></i> &nbsp; Suche im Forum</h2>';

if(count($navid_arr) > 0) {

	$such = implode($navid_arr, " OR $idFeld=");

	$sql = "SELECT $idFeld, $nameFeld FROM morp_cms_meinungen
			WHERE
				( $idFeld=$such )

			ORDER BY datum DESC
	";

	$res = safe_query($sql);
	$ct  = mysqli_num_rows($res);

	while ($row = mysqli_fetch_object($res)) {
		$id  = $row->$idFeld;
		$de  = $row->$nameFeld;

		$output .= '<p><a href="'.$dir.'?hn=meinungen&cont=meinungen-comment&sn2=meinungen-comment&meinungen='.$id.'&topic=0/"><i class="fa fa-chevron-right"></i> &nbsp; '.$de.'</a></p>';

	}
}











//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// TABELLE SCHWARZES BRETT DURCHSUCHEN
$idFeld = "aid";
$nameFeld = "aTitle";

$whereString = setSearchSQL($sstr, "aTitle,aDesc", $AND, $OR);
$sql 		= "SELECT $idFeld FROM morp_cms_angebote WHERE $whereString AND sichtbar=1 GROUP BY $idFeld";
$res 		= safe_query($sql);
$n 	 		= mysqli_num_rows($res);

$navid_arr = array();

if($n) {
	while ($row = mysqli_fetch_object($res)) {
		$navid_arr[]  = $row->$idFeld;
	}
}

$navid_arr = array_unique($navid_arr);
// print_r($navid_arr);

	$output .= '</div><div class="col-md-4 mt3"><h2><i class="fa fa-search"></i> &nbsp;  Suche auf dem Schwarzen Brett</h2>';

if(count($navid_arr) > 0) {

	$such = implode($navid_arr, " OR $idFeld=");

	$sql = "SELECT $idFeld, $nameFeld FROM morp_cms_angebote
			WHERE
				( $idFeld=$such )
				AND sichtbar=1
			ORDER BY aid DESC
	";

	$res = safe_query($sql);
	$ct  = mysqli_num_rows($res);

	while ($row = mysqli_fetch_object($res)) {
		$id  = $row->$idFeld;
		$de  = $row->$nameFeld;

		$output .= '<p><a href="'.$dir.$navID[11].'angebot+'.$id.'/"><i class="fa fa-chevron-right"></i> &nbsp; '.$de.'</a></p>';

	}
}



















$output .= '
		</div>
	</div>
</div>

';



//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////

}


?>