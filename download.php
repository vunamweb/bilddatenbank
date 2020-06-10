<?php
session_start();
include("nogo/config.php");
include("nogo/funktion.inc");
include("nogo/db.php");
dbconnect();
$mid = $_SESSION["mid"];
include("page/login.php");

if(!isset($_GET["dfile"]) ) exit;

$pid   		= $_GET["dfile"];
$file_path	= "pdf/";

$sql  = "SELECT pname, counter, psize FROM morp_cms_pdf WHERE pid=$pid";
$res = safe_query($sql);
$row = mysqli_fetch_object($res);
$nm = $row->pname;
$size = $row->psize;
$ct = $row->counter;
$ct++;

set_time_limit(0);

$pi = pathinfo($file_path.$nm);
// print_r($pi);
// echo $pi['extension'];


output_file($file_path.$nm, $nm, $pi['extension'], $pid, $mid, $ct);


/*function to set your files*/
function output_file($file, $name, $mime_type='', $pid, $mid, $ct)
{
    if(!is_readable($file)) die('File not found or inaccessible!');
    $size = filesize($file);
    $name = rawurldecode($name);
    $known_mime_types=array(
        "htm" => "text/html",
        "exe" => "application/octet-stream",
        "zip" => "application/zip",
        "doc" => "application/msword",
        "jpg" => "image/jpg",
        "php" => "text/plain",
        "xls" => "application/vnd.ms-excel",
        "ppt" => "application/vnd.ms-powerpoint",
        "gif" => "image/gif",
        "pdf" => "application/pdf",
        "txt" => "text/plain",
        "html"=> "text/html",
        "png" => "image/png",
        "jpeg"=> "image/jpg"
    );

    if($mime_type==''){
        $file_extension = strtolower(substr(strrchr($file,"."),1));
        if(array_key_exists($file_extension, $known_mime_types)){
            $mime_type=$known_mime_types[$file_extension];
        } else {
            $mime_type="application/force-download";
        };
    };
    @ob_end_clean();
    if(ini_get('zlib.output_compression'))
    ini_set('zlib.output_compression', 'Off');
    header('Content-Type: ' . $mime_type);
    header('Content-Disposition: attachment; filename="'.$name.'"');
    header("Content-Transfer-Encoding: binary");
    header('Accept-Ranges: bytes');

    if(isset($_SERVER['HTTP_RANGE']))
    {
        list($a, $range) = explode("=",$_SERVER['HTTP_RANGE'],2);
        list($range) = explode(",",$range,2);
        list($range, $range_end) = explode("-", $range);
        $range=intval($range);
        if(!$range_end) {
            $range_end=$size-1;
        } else {
            $range_end=intval($range_end);
        }

        $new_length = $range_end-$range+1;
        header("HTTP/1.1 206 Partial Content");
        header("Content-Length: $new_length");
        header("Content-Range: bytes $range-$range_end/$size");
    } else {
        $new_length=$size;
        header("Content-Length: ".$size);
    }

    $chunksize = 8*(1024*1024);
    $bytes_send = 0;
    if ($file = fopen($file, 'r'))
    {
        if(isset($_SERVER['HTTP_RANGE']))
        fseek($file, $range);

        while(!feof($file) &&
            (!connection_aborted()) &&
            ($bytes_send<$new_length)
        )
        {
            $buffer = fread($file, $chunksize);
            echo($buffer);
            flush();
            $bytes_send += strlen($buffer);
        }
        fclose($file);

		// TRACKING
		$sql  = "INSERT morp_cms_pdf_count SET pid='$pid' , mid='$mid'";
		safe_query($sql);

		$sql  = "UPDATE morp_cms_pdf SET counter=$ct WHERE pid=$pid";
		safe_query($sql);


    } else
        die('Error - can not open file.');
    die();
}


?>