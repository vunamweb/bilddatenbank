<?php
session_start();

global $mylink;

include("../nogo/config.php");
include("../nogo/funktion.inc");
include("../nogo/db.php");
dbconnect();
include("login.php");


// der erste Wert kommt in data // alle folgenden Werte kommen im Array Z

$pruefe_mid = $_SESSION["mid"];

$comment = $_POST["comment"];
$feld = $_POST["feld"];
$table = $_POST["table"];
$id = $_POST["id"];
$mid = $_POST["mid"];
$update = $_POST["update"];
$delc = $_POST["delc"];


if($mid != $pruefe_mid) die();

// print_r($_POST);
$dat = date("y-m-d");

if($table && $delc && $feld && $id) {
	echo $sql = "DELETE FROM $table WHERE $feld=$id AND mid=$mid";
	safe_query($sql);
}
elseif($table && $comment && $feld && $id && $update) {
	echo $sql = "UPDATE $table set comment='$comment' WHERE $feld=$id AND mid=$mid";
	safe_query($sql);
}
else if($table && $comment && $feld && $id) {
	echo $sql = "INSERT $table set comment='$comment', $feld=$id, dat='$dat', mid=$mid";
	safe_query($sql);
}

?>