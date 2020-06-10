<?php
session_start();

global $form_desc, $cid, $navID, $lan, $nosend, $morpheus, $ssl_arr, $ssl, $lokal_pfad, $js;

$uri	 = $_SERVER["REQUEST_URI"];


// print_r($_REQUEST);

$absenden = $_POST["absenden"];
$ei = $_POST["eintrag"];

$checkit = isset($_SESSION['evC']) ? $_SESSION['evC'] : '';
$send = 0;

if ($checkit) {
	$checkit = explode("-", $checkit);
	$checkit = $checkit[1];
	$send = $ei == $checkit ? 1 : 0;
}

if ($send) {


	// felder werden ausgelesen
	$query  = "SELECT * FROM form_field WHERE fid=".$_POST["fid"]." ORDER BY reihenfolge";
	$result = safe_query($query);
	while ($row = mysqli_fetch_object($result)) {
		$feld = $row->feld;
		$art = $row->art;

		if (isin("\|", $feld)) {
			$t	 = explode("|", $feld);
			$feld 	= $t[0];
			$value  = $t[1];
		}

		$desc = str_replace(array("√º"), array("¸"), $row->desc);
		$post = utf8_decode($_POST[$feld]);
		$c = strlen($feld)*-1;
		# if ($feld && $post) $mail .= $feld.':'.substr($filler,0,$c).str_replace("\r\n", "\n", $post)."\n";
		if ($feld && $art == "Mitteilungsfeld") $mail .= '<p><br>'.utf8_decode($desc).': &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#000;">'.nl2br($post).'</span><br/>&nbsp;<br/></p>
';
		elseif ($feld && $post) $mail .= '<p>'.utf8_decode($desc).': &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#000;">'.$post.'</span></p>
';
	}

	// formular einstellungen laden
	$query  	= "SELECT * FROM form WHERE fid=".$_POST["fid"];
	$result 	= safe_query($query);
	$row 		= mysqli_fetch_object($result);

	$fname 		= $row->fname;
	$Betreff 	= $row->betreff;

	$fname  	= 'Betreff:'.substr($filler,0,-7).$fname."\n\n";
	$mail_txt 	= email_style().$mail;

	$Empfaenger = array($row->post);

	$mailVonKunde = $_POST["email"];
	if(!$mailVonKunde) $mailVonKunde = $row->post;

	// $Empfaenger	= array("post@pixel-dusche.de");
	$kundemail 	= $morpheus["email"];			#$email; #"b.knetter@gmx.de";
	// $kundemail 	= "post@pixel-dusche.de";
	$name 		= $morpheus["emailname"]; 	#$email; #"b.knetter@gmx.de";
	$reply 		= $row->post;
	$replyNM 	= $morpheus["emailname"];
	$sender 	= $row->post;
	$sendername = $morpheus["emailname"];

	include("page/mail.php");

	#$output = nl2br($row->antwort).'<p>--------------------E M A I L---------------------------</p>'.$mail_txt;
	$output = '<p><strong>'.nl2br($row->antwort).'</strong></p>';

	global $popup;
	$popup='<p><strong>'.nl2br($row->antwort).'</strong></p>';
}

elseif ($absenden) {
	$output = '<p> &nbsp; </p> <p> &nbsp;</p> <p> &nbsp;</p> <p><strong style="color:#ff0000;">Wir konnten Ihre Anfrage leider nicht annehmen.</strong></p> <p> &nbsp;</p> <p>&nbsp; </p> <p> &nbsp;</p> <p> &nbsp;</p> ';
}

else {

// .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
// .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
// .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
// .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
// DESIGN DES FORMULARES
// .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
// .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
// .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
// .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .

	$design = '
		<div class="col-md-6">
			<div class="form-group">
				#cont#
			</div>
		</div>
	';

	$designFull = '
		<div class="col-md-12 mt2">
			<div class="form-group">
				#cont#
			</div>
		</div>
	';

	$designCheckbox = '
			<div class="row mt1 mb1">
				<div class="col-md-1 col-sm-1 col-xs-2">
					<div class="form-group">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-success blue-bg">
								#cont#
								<span class="glyphicon glyphicon-ok"></span>
							</label>
							<span class="formspan small"></span>
						</div>
					</div>
				</div>
				<div class="col-md-11 col-sm-11 col-xs-10">
					<span class="formspan" style="margin-left:0;">#desc#</span>
				</div>
			</div>
';


	$designschmal = '
		<div class="col-md-12 mt2">
		<div class="form-group">
			<label>#desc#</label> &nbsp; &nbsp;<br/>
			#cont#
		</div>
		</div>
	';


	$designTEXT = '
		<div class="col-md-12">
		<div class="form-group">
			<p>#desc#</p>
		</div>
		</div>
	';
	$designFETT = '
		<div class="col-md-12">
		<div class="form-group">
			<h3>#desc#</h3>
		</div>
		</div>
	';

// .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
// .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
// .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
// ENDE DESIGN
// .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
// .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .
// .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .




	$fid 	= $text;
	$query  = "SELECT * FROM form_field WHERE fid=$fid ORDER BY reihenfolge";
	$result = safe_query($query);

	$x = 0;

	while ($row    = mysqli_fetch_object($result)) {
		$nm 	= $row->fname;
		$text 	= $row->fform;

		$art 	= $row->art;
		$feld 	= $row->feld;
		$desc 	= ($row->desc);
		$hilfe 	= $row->hilfe;
		$email 	= $row->email;
		$size	= $row->size;
		$parent	= $row->parent;
		$fehler	= $row->fehler;
		$style  = $row->klasse;
		$cont	= $row->cont;
		$auswahl = ($row->auswahl);

		# if ($style) $style = ' style="'.$style.'"';
		if ($style) $style = ' '.$style;

		$star = ' *';
		$pflicht = '';

		if ($cont == "email" && $row->pflicht) 	{ $pflicht = ' required'; }
		elseif ($cont == "number" && $row->pflicht) 	{ $pflicht = ' required'; $rules .= $feld.': { required:true, number: true },
	'; }
		elseif ($cont == "number") 	{ $star = ''; $rules .= $feld.': { number: true },
	'; }
		elseif ($cont == "email") 	{ $pflicht = ' class="email"'; $star = ''; }
		elseif ($row->pflicht) 	{ $pflicht = ' required'; }
		else					{ $pflicht = ''; $star = ''; }

		$desc .= $star;

		if ($fehler) 	$messages .= $feld.': "'.$fehler.'"'.",\n";

		$data = "";

		// FELD IST ABHAENGIG DAVON; DASS EINE CHECKBOX AKTIVIERT WURDE
		if ($art == "Fieldset Start") $form .= '</table><fieldset id="'.$feld.'" style="">'.$table;

		elseif ($art == "Fieldset Ende") $form .= '</table></fieldset>'.$table;

		elseif (isin("^Ende", $art)) $form .= '<br style="clear:both;" />';

		elseif ($art == "Eingabefeld") {
			// $size = $size > 220 ? 220 : 0;
			$size = 220;
			$data = '<input id="'.$feld.'" name="'.$feld.'"'.$pflicht. ' placeholder="'.$desc.'" type="text" class="form-control" />';
			if ($style == " schmal") $form .= str_replace(array('#cont#', '#desc#', '#style#'), array($data, $desc, $style), $designschmal);
			else $form .= str_replace(array('#cont#', '#desc#', '#style#'), array($data, $desc, $style), $design);
		}

		elseif ($art == "Checkbox") {
			$x++;

			unset($value);
			if (isin("\|", $feld)) {
				$t	 = explode("|", $feld);
				$feld 	= $t[0];
				$value  = $t[1];
			}

			# $data = '<input type="checkbox"'. ($feld=="de"?' checked':'') .' class="checkbox" id="'.$feld.'" '. ($value ? ' value="'.$value.'"' : '') .' name="'.$feld.'"'.$pflicht.' /> ';
			# $data = '<input type="checkbox"'. ($feld=="de"?' checked':'') .' class="checkbox" id="'.$feld.'" '. ($value ? ' value="'.$value.'"' : ' value="ja"') .' name="'.$feld.'"'.$pflicht.' /> ';
			$data = '<input type="checkbox"'. ($feld=="de"?' checked':'') .' class="checkbox" id="'.$feld.'" '. ($value ? ' value="'.$value.'"' : ' value="'.$feld.'"') .' name="'.$feld.'"'.$pflicht.' /> ';

			$form .= str_replace(array('#cont#', '#desc#', '#style#', '#anz#'), array($data, $desc, $style, $x), $designCheckbox);

			// CHECKBOX SCHALTET FIELDSET FREI
			if ($parent) $optional .= '	var '.$feld.' = $("#'.$feld.'");
		var inital'.$feld.' = '.$feld.'.is(":checked");
		var topics'.$feld.' = $("#'.$parent.'")[inital'.$feld.' ? "removeClass" : "addClass"]("gray");
		var topicInputs'.$feld.' = topics'.$feld.'.find("input").attr("disabled", !inital'.$feld.');
		var topicText'.$feld.' = topics'.$feld.'.find("textarea").attr("disabled", !inital'.$feld.');
		'.$feld.'.click(function() {
			topics'.$feld.'[this.checked ? "removeClass" : "addClass"]("gray");
			topicInputs'.$feld.'.attr("disabled", !this.checked);
			topicText'.$feld.'.attr("disabled",  !this.checked);
		});
	';
		}

		elseif ($art == "Radiobutton") {
			$data .= fpd($feld, $auswahl, "radio", $pflicht);
			if ($pflicht) {
				// $data .= '<br style="clear:left;" /><label for="'.$feld.'" class="error" style="clear:left;">Bitte w&auml;hlen Sie eine Option</label>';
				// $data .= '<br style="clear:left;" /><label for="'.$feld.'" class="error" style="clear:left;">Bitte w&auml;hlen Sie eine Option</label>';
				$rules .= $feld.': "required",
	';
			}
			$form .= str_replace(array('#cont#', '#desc#', '#style#'), array($data, $desc, $style), $design);
		}

		elseif ($art == "Dropdown") {
			if ($style == " StSp1" || $style == " StSp2" || $style == " StSp3") $breite = 100;
			else $breite = 180;

			if (!isin("print.php", $uri)) 	$data .= fpd($feld, $auswahl, "sel", $pflicht, $breite).'</select>';
			else 							$data .= fpd($feld, $auswahl, "radio", $pflicht);

			if ($pflicht) {
				// $data .= '<label for="'.$feld.'" class="error">Bitte w&auml;hlen Sie eine Option</label>';
				$rules .= $feld.': "required",
	';
			}
			if ($style == " schmal") $form .= str_replace(array('#cont#', '#desc#', '#style#'), array($data, $desc, $style), $designschmal);
			else $form .= str_replace(array('#cont#', '#desc#', '#style#'), array($data, $desc, $style), $designschmal);
		}

		elseif ($art == "Mitteilungsfeld") {
			$data .= '<textarea id="'.$feld.'" name="'.$feld.'"'.$pflicht.' placeholder="'.$desc.'" class="form-control ta100"></textarea>';
			$form .= str_replace(array('#cont#', '#desc#', '#style#'), array($data, $desc, $style), $designFull);
		}

		elseif ($art == "Freitext Fett") {
			$form .= str_replace(array('#desc#', '#anz#'), array(nl2br($hilfe), $x), $designFETT);
		}

		elseif ($art == "Freitext") {
			$form .= str_replace(array('#desc#', '#anz#'), array(nl2br($hilfe), $x), $designTEXT);
		}



	}

	# $submit = str_replace(array('#cont#', '#desc#'), array('<input type="submit" name="absenden" value="absenden">', '&nbsp;'), $design);
	#

	if ($camp) 	$camp = str_replace(array('#desc#', '#anz#'), array(nl2br('<a href="javascript:history.back();">&laquo; zur¸ck</a><br /><input type="Hidden" name="buchungsname" value="'.str_replace(array("'", '"'), array("",""), $camp).'">Camp: '.$camp), $x), $designBuchung);

	if(in_array($cid, $ssl_arr)) $dirX = $ssl;
	else $dirX = $dir;

	$dsButton = '<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-success blue-bg">
						<input type="checkbox" class="checkbox" id="datenschutz" value="1" name="datenschutz" required>
						<span class="glyphicon glyphicon-ok"></span>
					</label>


';

/*
						<span class="formspan">Broschüre St. Katharinen- und Weißfrauenstift
				</span></div>
*/

	$dsText = '';
	if($lan == "de") $dsText = 'Ich stimme zu, dass meine Angaben aus dem Kontaktformular zur Beantwortung meiner Anfrage erhoben und verarbeitet werden. Die Daten werden nach abgeschlossener Bearbeitung Ihrer Anfrage gelöscht.<br>Hinweis: Sie können Ihre Einwilligung jederzeit für die Zukunft per E-Mail an <a href="mailto:'.$morpheus["email"].'">'.$morpheus["email"].'</a> widerrufen.<br/>
							Detaillierte Informationen zum Umgang mit Nutzerdaten finden Sie in unserer <u><a href="'.$dir.$navID[$morpheus["DSGVO"]].'" target="_blank">Datenschutzerklärung</a></u>';


	elseif($lan == "en") $dsText = '<p class="smaller"> I agree that my details from the contact form will be collected and processed to answer my request. The data will be deleted after processing your request.</p>
							<p class="smaller">Note: You can revoke your consent at any time in future by e-mail to '.$morpheus["email"].'.
Detailed information on handling user data can be found in our <a href="'.$dir.$lan.'/'.$navID[34].'" target="_blank">Data protection</a></p>';


	elseif($lan == "fr") $dsText = '<p class="smaller"> J\'accepte que mes données du formulaire de contact soient collectées et traitées pour répondre à ma demande. Les données seront supprimées après la fin du traitement de votre demande.</p>
							<p class="smaller">Remarque : Vous pouvez annuler votre accord à tout moment à l’avenir en envoyant un e-mail à '.$morpheus["email"].'.
Vous trouverez des informations détaillées sur le traitement des données dans notre <a href="'.$dir.$lan.'/'.$navID[59].'" target="_blank">Déclaration de confidentialité</a></p>';



	$bitteCode = '';
	if($lan == "de") $bitteCode = 'Bitte diesen Code einsetzen:';
	else if($lan == "en") $bitteCode = 'Please insert this code:';
	else if($lan == "fr") $bitteCode = 'Veuillez insérer ce code:';

	$senden = '';
	if($lan == "de") $senden = 'Senden';
	else if($lan == "en") $senden = 'send';
	else if($lan == "fr") $senden = 'envoyer';

	if (!isin("print.php", $uri)) $submit = '<button class="btn btn-info bg-blue w100" type="submit">'.$senden.'</button>';

	$js = str_replace(array('<!-- rules -->', '<!-- optional -->', '<!-- messages -->'), array($rules, $optional, $messages), $js);
	$output .= '
		</div>
		<div class="main_content">
			<div class="container">
				<div class="row">
					<div class="col-md-offset-1 col-md-10">

						<form class="frmContact leftalgn" role="form" id="kontaktformular" method="post" name="'.$_GET["sn2"].'">
							<input type="Hidden" name="fid" value="'.$fid.'">
							'.$form .'

							<div class="row">
							<div class="col-md-1 col-sm-1 col-xs-2">
								<div class="form-group">'.$dsButton.'<span class="formspan small"></span></div></div>
							</div>
							<div class="col-md-11 col-sm-11 col-xs-10">
								<span class="formspan small" style="margin-left:0;">'.$dsText.'</span>
							</div>
							</div>

							<div class="col-md-6">
								<div class="form-group mb2 pb2">
									<p>'.$bitteCode.'  <img src="'.$dir.'c.php" valign="middle" />
									<input type="text" name="eintrag" required  class="form-control" style="width:120px;" /></p>
								</div>
							</div>
							<div class="col-md-6 clearfix">
								&nbsp;
							</div>
							<div class="clearfix"></div>

							<div class="col-md-6">
							'.$submit .'
							</div>
							<div class="col-md-6 clearfix">
								&nbsp;
							</div>
							<div class="clearfix"></div>

							<!-- <button type="submit" class="btn btn-primary hidden-xl-down">Submit</button> -->

						</form>
					</div>
				</div>
			</div>

	';
}

	$morp = '<b>FORMULAR</b>';

?>