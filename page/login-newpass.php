<?php
// print_r($_SESSION);

global $dir, $navID, $mid;

$pw = isset($_POST["pwd"]) ? $_POST["pwd"] : '';
$un = isset($_POST["unr"]) ? $_POST["unr"] : '';

$pwA = isset($_POST["pw1"]) ? $_POST["pw1"] : '';
$pwB = isset($_POST["pw2"]) ? $_POST["pw2"] : '';
$sec = isset($_POST["sec"]) ? $_POST["sec"] : '';

$nolog = 1;
$warn = '';
$min = 6;


	if($pwA || $pwB) {
		$mid = holeID($sec);
		if($pwA != $pwB) $output .= '<div class="alert alert-danger" role="alert"><i class="fa fa-warning"></i> Die Passwörter stimmen nicht überein</div>'.newPW($min, $mid);
		elseif(strlen($pwA) < $min) $output .= '<div class="alert alert-info" role="alert"><i class="fa fa-warning"></i> Das Passwort muss aus mind. '.$min.' Zeichen bestehen.</div>'.newPW($min, $mid);
		else {
			$zahl = 0;
			$zeichen = 0;
			if(preg_match("/\d/", $pwA)) $zahl = 1;
			if(preg_match("/[a-zA-Z]/", $pwA)) $zeichen = 1;
			if(!$zahl) $output .= '<div class="alert alert-info" role="alert"><i class="fa fa-warning"></i> Das Passwort muss mind. eine Zahl enthalten.</div>'.newPW($min, $mid);
			elseif(!$zeichen) $output .= '<div class="alert alert-info" role="alert"><i class="fa fa-warning"></i> Das Passwort muss mind. einen Buchstaben enthalten.</div>'.newPW($min, $mid);
			else {
				echo $sql = "UPDATE `morp_intranet_user` set kontrolle='1', pw='".md5($pwA)."', newpass=0 WHERE mid='".$mid."'";
				$res = safe_query($sql);
				$output .= '<h2>Das Passwort wurde erfolgreich geändert.</h2><p>&nbsp;</p>';
				$_SESSION["pd"] = md5($pwA);
			}
		}
	}
	else {
		$output .= newPW($min, $mid);
	}


$output = $warn.$output;

?>