<?php
session_start();

global $mylink;

include("../nogo/config.php");
include("../nogo/config_morpheus.inc");
include("../nogo/db.php");
dbconnect();
//include("login.php");
include("../nogo/funktion.inc");

$ichbins = $_SESSION["mid"];

$table = $_POST["table"];
$feld = $_POST["feld"];
$id = $_POST["id"];
$mid = $_POST["mid"];
$onoff = $_POST["onoff"];

// echo "$ichbins != $mid";

if($ichbins != $mid) die();

// print_r($_POST);
//echo 'dd'; die();
if($table && $feld && $id) {
	if($onoff == "true") {
		//echo "INSERT `$table` SET mid=$mid, $feld=$id"; die();
        $ins = "INSERT `$table` SET mid=$mid, $feld=$id";
		safe_query($ins);
	}
	else {
		$ins = "DELETE FROM `$table` WHERE $feld=".$id." AND mid=$mid";
		safe_query($ins);
	}
}

// echo $ins;
?>