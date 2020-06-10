<?php

global $dir, $navID, $SID, $acceptCookie;

// print_r($_POST);

$newpass = isset($_POST["newpass"]) ? 1 : 0;
$uname = isset($_POST["uname"]) ? $_POST["uname"] : '';
$em = isset($_POST["mail"]) ? $_POST["mail"] : '';

$nolog = 1;
$warn = '';

if($newpass && $uname && $em) {
	$pruefe = email_check($em);
	if($pruefe) {
		$sql = "SELECT mid FROM `morp_intranet_user` WHERE uname='$uname' AND `email`='$em'";
		$res = safe_query($sql);
		$x = mysqli_num_rows($res);

		if($x > 0) {
			$nolog = 0;
			$row = mysqli_fetch_object($res);
			// echo " YOU ARE IN !!!!";

			$md5 = md5("Stift".$uname."-".date("Ymd"));
			$sql = "UPDATE `morp_intranet_user` SET secure='".$md5."' WHERE `mid`=".$row->mid;
			$res = safe_query($sql);
			if($res) {
				$output = '<div class="alert alert-success" role="alert">Antrag angenommen</div>
			<p>Sie erhalten eine E-Mail mit einem Aktivierungslink Ihres Konto.</p>';

				$footer = '';
				$mailto = $em;
				// $mailto = 'post@pixel-dusche.de';
				$mailsubject = "Aktivierungslink Intranet St. Katharinen- und Weißfrauenstift";
				$mailbody .= "Sie haben ein neues Passwort beantragt.\n\nBitte klicken Sie auf den folgenden Link oder kopieren den kompletten Link in die Adresszeile Ihres Internetbrowser.\n".$dir."?aktivierung=".$md5."&reset=1\n\n".utf8_decode(strip_tags(trim($footer)));

				$mailheaders = 'From: St. Katharinen- und Weißfrauenstift <post@pixel-dusche.de>';
				$checkmail = mail($mailto, $mailsubject, $mailbody, $mailheaders);
			}

		}
		else $output = '<div class="alert alert-danger" role="alert">Ihre Mitgliedsinformationen sind uns nicht bekannt.</div><p>&nbsp;</p>';
	}
	else $warn = '<div class="alert alert-danger" role="alert">Bitte geben Sie eine gültige E-Mail-Adresse an</div><p>&nbsp;</p>';
}
elseif($dat || $un || $em) { $warn = "<h2>Bitte füllen Sie alle Felder aus.</h2>"; }

if($nolog) {
	$output .= getform($uname, $em);
}


$output = $warn.$output;

?>