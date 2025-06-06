<?php
session_start();
# # # # # # # # # # # # # # # # # # # # # # # # # # #
# www.pixel-dusche.de                               #
# björn t. knetter                                  #
# start 12/2003                                     #
#                                                   #
# post@pixel-dusche.de                              #
# frankfurt am main, germany                        #
# # # # # # # # # # # # # # # # # # # # # # # # # # #

include("cms_include.inc");

$arr = array( 4=>"Kein Zugang Morpheus", 2=>"Redakteur", 1=>"Administrator");

$mid	= $_REQUEST["mid"];
$neu	= $_REQUEST["neu"];
$save	= $_REQUEST["save"];
$unm	= $_REQUEST["unm"];
$vnm	= $_REQUEST["vname"];
$nnm	= $_REQUEST["nname"];
$email	= $_REQUEST["email"];
$anrede	= $_REQUEST["anrede"];
$fon	= $_REQUEST["fon"];
$pwd	= $_REQUEST["pwd"];
$adm	= $_REQUEST["adm"];

$newpass= $_POST["newpass"];
$sendmail= $_POST["sendmail"];


$del	= $_REQUEST["del"];
$delete	= $_REQUEST["delete"];


echo "<div>";

if($newpass && $sendmail) {
	include("../page/mail-design.php");

	// $design
	// #MAIL#
	// mail2col
	// mail1col
	// mailH1
	// mailP

	$dir = $morpheus["url"];

	$mailText = mailH1("Ihre Zugangsdaten");
	$mailText .= br();
	$mailText .= $anrede.' '.$nnm.','.br(2).'anbei erhalten Sie Ihre Zugangsdaten zum Intranet des St. Katharinen- und Weißfrauenstift.'.br(2);
	$mailText .= 'Username: '.$unm.br().'Passwort: '.$pwd.br(2);
	$mailText .= 'Zum Login: <a href="'.$dir.'">'.$dir.'</a>'.br().''.br(2);

	$mailText = mail1col($mailText);

	$mail_txt 	= str_replace('#MAIL#', utf8_decode($mailText), $design);
	$Betreff 	= 'Zugangsdaten Intranet';
	$name		= $morpheus['emailname'];
	$kundemail	= $morpheus['email'];
	$mailVonKunde = $morpheus['email'];
	$Empfaenger	= $email;

	include("../page/mail.php");

}


if ($delete && $admin) {
	$sql = "DELETE FROM morp_intranet_user WHERE mid=$delete";
	$res = safe_query($sql);
}
elseif ($del) {
	$sql = "SELECT uname FROM morp_intranet_user WHERE mid=$del";
	$res = safe_query($sql);
	$row 	= mysqli_fetch_object($res);

	echo ('
		<p>M&ouml;chten Sie den morp_intranet_user <b>'.$row->uname .'</b> wirklich l&ouml;schen?</p>
		<p><a href="?delete='.$del.'" class="button">Ja</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href="?" class="button">Nein</a></p><br><br><br><br>
');
}


if ($save) {
	$ct = count($arr);

	$pwd = md5($pwd);
	$set .= "uname='$unm', vname='$vnm', email='$email', anrede='$anrede', fon='$fon', nname='$nnm'".($neu || $newpass ? ", pw='$pwd'" : '').", admin='$adm' ";

	if ($neu) 	$query = "insert morp_intranet_user ";
	else 		$query = "update morp_intranet_user ";

	$query .= "set " .$set;

	if (!$neu) $query .= " WHERE mid=$mid";
	safe_query($query);

	unset($neu);
	unset($mid);
}

if ($mid || $neu) {
	echo "<h2>Verwaltung Zugänge Intranet Mitarbeiter</h2>";

	if (!$neu) {
		$query  = "SELECT * FROM morp_intranet_user where mid=$mid";
		$result = safe_query($query);
		$row 	= mysqli_fetch_object($result);
	}

	foreach ($arr as $val) {
		if ($row->$val == 1) $$val = "checked";
	}

	$admin = $row->admin || $row->berechtigung == 1 ? " checked" : '';
	$bere = $neu ? " checked" : '';

	echo '<p><a href="?">' .backlink().' zur&uuml;ck</a></p><p>&nbsp;</p>';
	echo '<form method="post">
		<input type="hidden" name="neu" value="'.$neu.'">
		<input type="hidden" name="mid" value="'.$mid.'">
		<input type="hidden" name="save" value="1">
		<p><label>Login Name</label><input type="text" name="unm" value="'.$row->uname.'" class="form-control" placeholder=""></p>
		<p><label>Anrede</label><input type="text" name="anrede" value="'.$row->anrede.'" class="form-control" placeholder=""></p>
		<p><label>Vorname</label><input type="text" name="vname" value="'.$row->vname.'" class="form-control" placeholder=""></p>
		<p><label>Nachname</label><input type="text" name="nname" value="'.$row->nname.'" class="form-control" placeholder=""></p>
		<p><label>E-Mail</label><input type="text" name="email" value="'.$row->email.'" class="form-control" placeholder=""></p>
		<p><label>Telefon</label><input type="text" name="fon" value="'.$row->fon.'" class="form-control" placeholder=""></p>
		<p><label>Passwort</label><input type="text" name="pwd" value="'.$row->pw.'" class="form-control" placeholder="">
				<input type="checkbox" name="newpass" value="1" class="form-control" placeholder="" '.$bere .'> <b>Passwort speichern</b></p>
				<input type="checkbox" name="sendmail" value="1" class="form-control" placeholder="" '.$bere .'> <b>Zugangsdaten per Mail an Mitarbeiter senden (sinnvoll nur, sofern das Passwort neu gesetzt wird)</b></p>

';


	echo '
		<p>&nbsp;</p>
		<p><input type="submit" class="button" name="speichern" value="speichern"></p>
';

}

elseif ($admin) {
	echo "<h2>Liste berechtigter Mitarbeiter f&uuml;r das Intranet</h2><p>&nbsp;</p>";

	echo '<table border=0 cellspacing=1 cellpadding=0 class="autocol p20">';
	echo '<tr>
		<td><p>Benutzername</p></td>
		<td>Name</p>
		<td>E-Mail</td>
		<td>Telefon</td>
	</tr>';


	$query  = "SELECT * FROM morp_intranet_user WHERE uname != 'morpheus' order by uname";
	$result = safe_query($query);
	$ct 	= mysqli_num_rows($result);
	$change = $ct / 3;

	while ($row = mysqli_fetch_object($result)) {
		$c++;

		$auth = explode("|", $row->auths);
		$authliste = array();
		foreach($auth as $val) {
			$authliste[] = $auths_arr[$val];
		}

		echo '<tr>
			<td><a href="?mid='.$row->mid.'"><i class="fa fa-edit small"></i> &nbsp; '.$row->uname.'</a></td>
			<td>'.$row->vname.' '.$row->nname.'</td>
			<td>'.$row->email.'</td>
			<td>'.$row->fon.'</td>
			<td><a href="?del='.$row->mid.'"><i class="fa fa-trash-o small"></i></a></td>
		</tr>';
	}

	echo '</table><div style="clear:left;"><p>&nbsp;</p>
		<p><a href="?neu=1" class="button"><i class="fa fa-plus small"></i> NEU </a></p></div>';
}

else die('<p><strong>Keine Berechtigung</strong></p>');
?>

</div>

<?php
include("footer.php");
?>