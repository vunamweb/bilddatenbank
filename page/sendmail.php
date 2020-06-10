<?php
session_start();
/**
* Filename.......: example.1.php
* Project........: HTML Mime Mail class
* Last Modified..: 15 July 2002
*/

//  error_reporting(E_ALL);
//	print_r($_POST);

$pixel = isset($_POST["pixel"]) ? $_POST["pixel"] : 0;
$checkit = isset($_SESSION['evC']) ? $_SESSION['evC'] : '';
$send = 0;

if ($checkit) {
	$checkit = explode("-", $checkit);
	$checkit = $checkit[1];
	$send = $pixel == $checkit ? 1 : 0;
}

$checkMySec = md5("pixeldusche".date("ymd"));
$sec = isset($_POST["mystring"]) ? $_POST["mystring"] : 0;

$data = json_decode($_POST['data'],true);

$fid = $data[0];
$fid = $fid["value"];

$x = count($data);
$mail_txt = '';

for($i=1; $i<($x-1); $i++) {
	$mail_txt .= '<p><b>'.utf8_decode($data[$i]["name"]).'</b>: '.utf8_decode(nl2br($data[$i]["value"])).'</p>';

}

if( $sec && ($sec == $checkMySec) && $send ) {
	include("../nogo/config.php");
	include("../nogo/db.php");
	dbconnect();

	$sql = "SELECT * FROM morp_settings WHERE 1";
	$res = safe_query($sql);
	while($row = mysqli_fetch_object($res)) {
		$morpheus[$row->var] = $row->value;
	}

	$query  	= "SELECT * FROM morp_cms_form WHERE fid=".$fid;
	$result 	= safe_query($query);
	$row 		= mysqli_fetch_object($result);
	$betreff 	= $row->betreff;
	$Empfaenger = array($row->post);

	// $Empfaenger	= array("post@pixel-dusche.de");
	$kundemail 	= $morpheus["email"];
	// $kundemail 	= "post@pixel-dusche.de";
	$name 		= utf8_decode($morpheus["emailname"]); 	#$email; #"b.knetter@gmx.de";

        include_once('htmlMimeMail.php');

        $mail = new htmlMimeMail();
        $mail->setHtml($mail_txt, strip_tags($mail_txt));
        #$mail->setText($mbody);
		#$mail->addHtmlImage($background, 'background.gif', 'image/gif');
		// $mail->setReturnPath($Empfaenger);
		// $mail->setReturnPath($mailVonKunde);
        // $mail->setReply($mailVonKunde);

		$mail->setFrom('"' .$name .'" <' .$kundemail .'>');
//		if ($bcc) $mail->setBcc( $bcc.' <'.$bcc.'>' );
//		$mail->setReply($em);
		$mail->setSubject($betreff);
		$mail->setHeader('X-Mailer', 'HTML Mime mail class (http://www.phpguru.org)');

		/**
        * Send it using SMTP. If you're using Windows you should *always* use
		* the smtp method of sending, as the mail() function is buggy.
        */
		# $result = $mail->send(array($Empfaenger), 'smtp');

		$result = $mail->send($Empfaenger);

		// These errors are only set if you're using SMTP to send the message
		if (!$result) {
			echo "NOT SENT :(";
			print_r($mail->errors);
		} else {
			echo $row->antwort;
			// echo 1; //'Mail sent!';
		}
}
else echo false;

?>