<?php
session_start();

global $mylink;

// echo "here";

include("../nogo/config.php");
include("../nogo/config_morpheus.inc");
include("../nogo/db.php");
dbconnect();
include("login.php");
include("../nogo/funktion.inc");


$data = $_POST["data"];
$z = explode(",", $data);

$table = $_POST["table"];
$tid = $_POST["tid"];

$sprache = $_POST["sprache"];

#$dat = $_POST["dat"];

#$dat = us_dat($dat);

print_r($_POST);
// der erste Wert kommt in data // alle folgenden Werte kommen im Array Z


if($data) {
	$x = 0;
	foreach($z as $val) {
		if($val) {
			$x++;
			echo $sql	= "UPDATE `$table` set `sort`=$x WHERE $tid=$val";
			 echo "\n";
			safe_query($sql);
		}
	}

}

?>