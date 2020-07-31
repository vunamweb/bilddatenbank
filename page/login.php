<?php
// print_r($_SESSION);

global $dir, $navID, $acceptCookie, $countLogins;

$pw = isset($_POST["pwd"]) ? $_POST["pwd"] : '';
$un = isset($_POST["unr"]) ? $_POST["unr"] : '';
$setMeFree = isset($_POST["cls"]) ? $_POST["cls"] : '';

$pwA = isset($_POST["pw1"]) ? $_POST["pw1"] : '';
$pwB = isset($_POST["pw2"]) ? $_POST["pw2"] : '';
$sec = isset($_POST["sec"]) ? $_POST["sec"] : '';

// VORSICHT vor Attacken * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
if($pw != no_injection ($pw) || $un != no_injection ($un)) die();
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

$warn = '';
$min = 6;
$maxVersuche = 6;
$mitarbeiter = 0;

$sessMNR = isset($_SESSION["uname"]) ? $_SESSION["uname"] : '';
$sessPASS = isset($_SESSION["pd"]) ? $_SESSION["pd"] : '';
$countLogins = isset($_SESSION["cl"]) ? $_SESSION["cl"] : 0;

$_SESSION["cl"] = 0;

if($sessMNR && $sessPASS) {
	$sql = "SELECT * FROM `morp_intranet_user` WHERE pw='".$sessPASS."' AND uname='".$sessMNR."'";
	$res = safe_query($sql);
	$x = mysqli_num_rows($res);
	if($x > 0) $haslogin = 0;
	else { $_SESSION["uname"]='';$_SESSION["pd"]='';}
}
elseif($setMeFree && $un) {
	$sql = "SELECT * FROM `morp_intranet_user` WHERE setMeFree='".($setMeFree)."' AND uname='$un'";
	$res = safe_query($sql);
	$x = mysqli_num_rows($res);
	if($x>0) {
		$_SESSION["cl"] = 0;
		$countLogins = 0;

		$row = mysqli_fetch_object($res);
	 	$sql = "UPDATE `morp_intranet_user` set countLogins=0 WHERE mid='".$row->mid."'";
		safe_query($sql);

		$output .= '<p><br/><a href="?"><i class="fa fa-chevron-right"></i> Melden Sie sich bitte neu an</a></p>';
	}
}
else {
	if($pwA && $pwB) {
		$mid = holeID($sec);
		$nolog = 0;
		if($pwA != $pwB) $output .= '<h2>Die Passwörter stimmen nicht überein</h2><p>&nbsp;</p>'.newPW($min, $mid);
		elseif(strlen($pwA) < $min) $output .= '<h2>Das Passwort muss aus mind. '.$min.' Zeichen bestehen.</h2><p>&nbsp;</p>'.newPW($min, $mid);
		else {
			$zahl = 0;
			$zeichen = 0;
			if(preg_match("/\d/", $pwA)) $zahl = 1;
			if(preg_match("/[a-zA-Z]/", $pwA)) $zeichen = 1;
			if(!$zahl) $output .= '<h2>Das Passwort muss mind. eine Zahl enthalten.</h2><p>&nbsp;</p>'.newPW($min, $mid);
			elseif(!$zeichen) $output .= '<h2>Das Passwort muss mind. einen Buchstaben enthalten.</h2><p>&nbsp;</p>'.newPW($min, $mid);
			else {
				$sql = "UPDATE `morp_intranet_user` set kontrolle='1', pass='".md5($pwA)."', newpass=0 WHERE mid='".$mid."'";
				$res = safe_query($sql);
				#$sql = "SELECT mnr FROM `morp_intranet_user` WHERE `morp_intranet_user`=$mid";
				#$res = safe_query($sql);
				#$row = mysqli_fetch_object($res);
				$output .= '<h2>Das Passwort wurde erfolgreich geändert.</h2><p>&nbsp;</p>';
				$_SESSION["custname"] = $mid;
				$_SESSION["pd"] = md5($pwA);
			}
		}
	}
	elseif($pw && $un) {
#		$sql = "SELECT * FROM `morp_intranet_user` WHERE pw='".md5($pw)."' AND uname='$un' AND kontrolle=1";
		$sql = "SELECT * FROM `morp_intranet_user` WHERE pw='".md5($pw)."' AND uname='$un'";
		$res = safe_query($sql);
		$x = mysqli_num_rows($res);


		if($x > 0) {
			$row = mysqli_fetch_object($res);

			#$sql = "UPDATE `morp_intranet_user` set countLogins=0 WHERE mid='".$row->mid."'";
			#safe_query($sql);

			// echo " YOU ARE IN !!!!";

			if($row->newpass) {
				$nolog = 0;
				$output .= newPW($min, $row->mid);
			}
			else {
				$haslogin = 0;
				$_SESSION["uname"] = $row->uname;
				$_SESSION["vname"] = $row->vname;
				$_SESSION["nname"] = $row->nname;
				$_SESSION["pd"] = $row->pw;
				$_SESSION["mid"] = $row->mid;
				$_SESSION["cl"] = 0;
                
                $sql = "INSERT morp_intranet_user_track SET mid=".$row->mid;
				safe_query($sql);

				$lastlog = date("Y-m-d H:i");
				$sql = "UPDATE `morp_intranet_user` set lastlog='$lastlog' WHERE mid='".$row->mid."'";
				safe_query($sql);

				// $_SESSION["account"] = $row->testaccount ? 11 : 1;
				// $sprung = $_SESSION["wherefrom"];
				// $warn = '<p>Ihr Login war erfolgreich.<br><br>'.($sprung ? '<a href="'.$dir.$navID[$sprung].'"><i class="fa fa-external-link-square"></i> Weiter zur zuletzt besuchten Seite </p>' : '</p>');
				// $_SESSION["wherefrom"] = '';
				// $col = 'green';
			}
		}
		else {
			$_SESSION["cl"] = $countLogins+1;
			$sql = "SELECT countLogins, mid FROM `morp_intranet_user` WHERE uname='$un'";
			$res = safe_query($sql);
			$x = mysqli_num_rows($res);
			if($x>0) {
				$row = mysqli_fetch_object($res);
				$a = $row->countLogins;
				$a++;
			 	$sql = "UPDATE `morp_intranet_user` set countLogins=$a WHERE mid='".$row->mid."'";
				safe_query($sql);
			}
			$warn = '<div class="alert alert-danger" role="alert">Sie haben einen falschen Benutzernamen und/oder falsches Passwort eingegeben<br><br><a href="?loginreset=1">Ich habe mein Passwort vergessen</a></div>';
		}
	}

}



if($haslogin && $countLogins > $maxVersuche)

		$output .= '

<form name="golog" method="post">
	<div class="form-group">
		<label for="cls">Benutzername</label>
		<input type="text" class="form-control" id="unr" name="unr" placeholder="Benutzername" style="background:red; color:#fff;">
	</div>
	<div class="form-group">
		<label for="cls">Code vom Administrator</label>
		<input type="text" class="form-control" id="cls" name="cls" placeholder="Code" style="background:red; color:#fff;">
	</div>

	<button type="submit" class="btn btn-default">Freischalten</button>
</form>
	';
	elseif($haslogin)
		$output .= '
<form name="golog" method="post">
	<div class="form-group">
		<label for="unr">Benutzername</label>
		<input type="text" class="form-control" id="unr" name="unr" placeholder="Benutzername">
	</div>
	<div class="form-group">
		<label for="pwd">Passwort</label>
		<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Passwort">
	</div>

	<button type="submit" class="btn btn-default">Anmelden</button>
</form>
	';


	$output = $warn.$output;




?>