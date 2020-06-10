<?php
session_start();

global $mylink;

// echo "here";

define('DIR', dirname(__FILE__));
define('URL', substr($_SERVER['PHP_SELF'], 0, - (strlen($_SERVER['SCRIPT_FILENAME']) - strlen(DIR))));


include("../nogo/config.php");
include("../nogo/config_morpheus.inc");
include("../nogo/db.php");
dbconnect();
include("login.php");
include("../nogo/funktion.inc");

$todel = $_POST["todel"];
$table = $_POST["table"];
$tid = $_POST["tid"];

if($table == "morp_cms_galerie") {
	$que  	= "SELECT * FROM `morp_cms_galerie_name` n, `morp_cms_galerie` g WHERE g.gnid=n.gnid AND gid=".$todel."";
	$res 	= safe_query($que);
	$row 	= mysqli_fetch_object($res);

	$img 	= $row->gname;
	$ordner = $row->gnname;

	$delimg = str_replace("morpheus", "", DIR).'Galerie/'.$morpheus["GaleryPath"].'/'.$ordner.'/'.$img;

	unlink($delimg);
}

$sql  = "DELETE FROM $table WHERE $tid=$todel";

safe_query($sql);


?>