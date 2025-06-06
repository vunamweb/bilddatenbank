<?php
# # # # # # # # # # # # # # # # # # # # # # # # # # #
# www.pixel-dusche.de                               #
# björn t. knetter                                  #
# start 12/2003                                     #
# edit 27.11.2006                                   #
# post@pixel-dusche.de                              #
# frankfurt am main, germany                        #
# # # # # # # # # # # # # # # # # # # # # # # # # # #

session_start();
$myauth = 10;
include("cms_include.inc");

///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////

# print_r($_SESSION);
# print_r($_REQUEST);

///////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
//// EDIT_SKRIPT
$um_wen_gehts 	= "Event Zusagen";
$titel			= "Event Zusagen";
///////////////////////////////////////////////////////////////////////////////////////
$table 		= 'morp_event_zusage';
$tid 		= 'zusageid';
$table2		= 'morp_events';
$tid2 		= 'eventid';
$nameField 	= "eventName";
///////////////////////////////////////////////////////////////////////////////////////

// $new = '<a href="?neu=1" class="btn btn-info"><i class="fa fa-plus"></i> NEU</a>';
$new = '';

echo '<div id=vorschau>
	<h2>'.$titel.'</h2>

	'. ($edit || $neu ? '<p><a href="?">&laquo; zur&uuml;ck</a></p>' : '') .'
	<form action="" onsubmit="" name="verwaltung" method="post">
'.($edit || $neu ? '' : '').'
'.(!$edit && !$neu ? '' : '').'
';

// print_r($_POST);

/////////////////////////////////////////////////////////////////////////////////////////////////////
#$sql = "ALTER TABLE  $table ADD  `fFirmenFilterID` INT( 11 ) NOT NULL";
#safe_query($sql);
/////////////////////////////////////////////////////////////////////////////////////////////////////

$arr_form = array(
#		array("eventName", "Titel Event", '<input type="Text" value="#v#" class="form-control" name="#n#" required />'),
#		array("eventOrt", "Ort", '<input type="Text" value="#v#" class="form-control" name="#n#" />'),
#		array("eventDatum", "Datum", '<input type="Text" value="#v#" class="form-control" name="#n#" />', 'date'),

#		array("eventAnzahlTeilnehmer", "Anzahl Teilnehmer", '<input type="Text" value="#v#" class="form-control" name="#n#" />'),
#		array("eventBegleitung", "Wieviel Begleiter", '<input type="Text" value="#v#" class="form-control" name="#n#" />'),
//		array("datumende", "End Datum", '<input type="Text" value="#v#" class="form-control" name="#n#" required />'),
//		array("", "CONFIG", '</div><div class="col-md-6">'),

#		array("eventText", "Beschreibung", '<textarea class="form-control" name="#n#" />#v#</textarea>'),
//		array("eventStartZeit", "Uhrzeit Beginn", '<input type="Text" value="#v#" class="form-control" name="#n#" />'),

//		array("", "CONFIG", '</div><div class="col-md-12 mb3 mt2">'),
//		array("img1", "Foto 1", 'img'),
//		array("", "CONFIG", '</div></div>'),
);
///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////

$neuerDatensatz = isset($_GET["new"]) ? $_GET["new"] : 0;
$edit = isset($_REQUEST["edit"]) ? $_REQUEST["edit"] : 0;
$save = isset($_REQUEST["save"]) ? $_REQUEST["save"] : 0;
$del = isset($_REQUEST["del"]) ? $_REQUEST["del"] : 0;
$delete = isset($_REQUEST["delete"]) ? $_REQUEST["delete"] : 0;
$back = isset($_POST["back"]) ? $_POST["back"] : 0;

$filter = isset($_GET["filter"]) ? $_GET["filter"] : 0;
$datumfilter = isset($_GET["datumfilter"]) ? $_GET["datumfilter"] : 0;

///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////

function liste() {
	global $arr_form, $table, $tid, $filter, $datumfilter, $nameField, $table2, $tid2;

	//// EDIT_SKRIPT
	$ord = 'eventDatum ASC, datumZusage DESC';
	$anz = $nameField;

	////////////////////
	if($filter) $where = " t1.$tid2=$filter ";
	else $where = 1;
	////////////////////
	$heute = date("Y-m-d");
	if($datumfilter == 1 || $filter) $whereDatum = "";
	else $whereDatum = "AND eventDatum >= '$heute' ";



	$echo .= '<p>&nbsp;</p>

'.($datumfilter ? '<a href="?datumfilter=0"class="btn btn-info">Nur aktuelle Veranstaltungen anzeigen</a>' : '<a href="?datumfilter=1"class="btn btn-success">Auch Veranstaltungen aus der Vergangeheit anzeigen</a>').'
	 &nbsp;
'.($filter ? '<a href="?" class="btn btn-info">Alle Zusagen anzeigen</a>' : '');



	$sql = "SELECT * FROM $table t1, $table2 t2 WHERE t1.$tid2 = t2.$tid2 AND $where $whereDatum ORDER BY ".$ord."";
	$res = safe_query($sql);
	// echo mysqli_num_rows($res);

	$oldEvent = 0;

	$anzahl = 0;

	while ($row = mysqli_fetch_object($res)) {
		$edit = $row->$tid;
		$event = $row->$tid2;

		if($oldEvent != $event) {
			if($anzahl > 0) $echo .= '
				<div class="row" style="border-bottom:solid 1px #eee; padding: 4px 10px; background:#efefef; font-size:.8em !important">
					<div class="col-md-2">Anzahl Teilnehmer</div>
					<div class="col-md-6">&nbsp;</div>
					<div class="col-md-2">'.$anzahl.'</div>
				</div>
';

			$echo .= '<h2 style="margin-bottom:0;font-size:1.5em; background:#efefef; padding: 4px 10px; margin-top:2em;"><a href="?filter='.$row->$tid2.'"><i class="fa fa-sign-in"></i> '.$row->$nameField.' am '.euro_dat($row->eventDatum).' um '.$row->eventStartZeit.'</a></h2>';


			$echo .= '
				<div class="row" style="border-bottom:solid 1px #eee; padding: 4px 10px; background:#efefef; font-size:.8em !important">
					<div class="col-md-2">Name Mitarbeiter</div>
					<div class="col-md-2">Telefon</div>
					<div class="col-md-4">E-Mail</div>
					<div class="col-md-2">Anzahl Begleitung</div>
					<div class="col-md-2">Datum Zusage</div>
				</div>
';

			$oldEvent = $event;
			$anzahl = 0;
		}

		$mitarbeiter = getProfile($row->mid);

		$echo .= '
		<div class="row" style="border-bottom:solid 1px #eee; padding: 4px 10px;">
			<div class="col-md-2">'.$mitarbeiter["vname"].' '.$mitarbeiter["nname"].'</div>
			<div class="col-md-2">'.$mitarbeiter["fon"].'</div>
			<div class="col-md-4"><a href="mailto:'.$mitarbeiter["mail"].'">'.$mitarbeiter["mail"].'</a></div>
			<div class="col-md-2">'.$row->anzahlBegleitung.'</div>
			<div class="col-md-2">'.euro_dat($row->datumZusage).'</div>
		</div>
';

		$anzahl++;
		if($row->anzahlBegleitung > 0) $anzahl += $row->anzahlBegleitung;
	}

	$echo .= '				<div class="row" style="border-bottom:solid 1px #eee; padding: 4px 10px; background:#efefef; font-size:.8em !important">
					<div class="col-md-2">Anzahl Teilnehmer</div>
					<div class="col-md-6">&nbsp;</div>
					<div class="col-md-2">'.$anzahl.'</div>
				</div>';

	$echo .= '<p>&nbsp;</p>';

	return $echo;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

function edit($edit) {
	global $arr_form, $table, $tid, $imgFolder, $um_wen_gehts;

	$sql = "SELECT * FROM $table WHERE $tid=".$edit."";
	$res = safe_query($sql);
	$row = mysqli_fetch_object($res);

	$echo .= '
		<input type="Hidden" name="edit" value="'.$edit.'">
		<input type="Hidden" name="save" value="1">
		<input type="hidden" value="0" name="back" id="back" />

		<div class="row">
			<div class="col-md-6">

	';

	foreach($arr_form as $arr) {
		$echo .= setMorpheusForm($row, $arr, $imgFolder, $edit, 'morp_blog', $tid);
	}

	$echo .= '<br>
				<button type="submit" id="savebtn" class="btn btn-success"><i class="fa fa-save"></i> &nbsp; '.$um_wen_gehts.' speichern / aktualisieren</button>
				<button type="submit" id="savebtn2" value="hier" class="btn btn-success"><i class="fa fa-save"></i> &nbsp; '.$um_wen_gehts.' speichern und zurück</button>
		</div>
	</div>
';

	return $echo;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

function neu() {
	global $arr_form, $table, $tid, $um_wen_gehts;

	$x = 0;


	$echo .= '<input type="Hidden" name="neu" value="1"><input type="Hidden" name="save" value="1">

	<table cellspacing="6" style="width:100%;">';

	foreach($arr_form as $arr) {
		if ($x < 1) $echo .= '<tr>
			<td>'.$arr[1].':</td>
			<td>'. str_replace(array("#v#", "#n#", "#s#"), array($get, $arr[0], 'width:400px;'), $arr[2]).'</td>
		</tr>';
		$x++;
	}

	$echo .= '<tr>
		<td></td>
		<td>
			<br>
			<button type="submit" id="savebtn" class="btn btn-success"><i class="fa fa-save"></i> &nbsp; '.$um_wen_gehts.' speichern</button>
		</td>
	</tr>
</table>';


	return $echo;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

if ($save) {
	$neu = isset($_POST["neu"]) ? $_POST["neu"] : 0;

	// echo "save";
	$edit = saveMorpheusForm($edit, $neu);

	if(neu) unset($neu);

	$scriptname = basename(__FILE__);

	if($back) {
?>
	<script>
		location.href='<?php echo $scriptname; ?>';
	</script>
<?php
	}
	elseif($neu) {
?>
	<script>
		location.href='<?php echo $scriptname; ?>?edit=<?php echo $edit; ?>';
	</script>
<?php
	}

	// unset($edit);
}

elseif ($delimg) {
	deleteImage($delimg, $edit, $imgFolder);
}

elseif($delete) {
	$sql = "DELETE FROM `$table` WHERE $tid=$delete ";
	safe_query($sql);
}

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

if($del) {
	echo '	<h2>Wollen Sie '.$um_wen_gehts.' wirklich löschen?</h2>

			<a href="?delete='.$del.'" class="btn btn-danger"><i class="fa fa-trash"></i> &nbsp; Ja</a>
			<a href="?" class="btn btn-default"><i class="fa fa-remove"></i> &nbsp; Nein / Abbruch</a>

';
}
elseif ($neuerDatensatz) 	echo neu("neu");
elseif ($edit) 			echo edit($edit);
else						echo liste().$new;

echo '
</form>
';

include("footer.php");

?>

<script>
	  $(".form-control").on("change", function() {
	  	$("#savebtn").addClass("btn-danger");
	  	$("#savebtn2").addClass("btn-danger");
	  });
	  $("#savebtn2").on("click", function() {
	  	$("#back").val(1);
	  });
</script>