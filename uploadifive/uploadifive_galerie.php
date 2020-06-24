<?php

/*
UploadiFive
Copyright (c) 2012 Reactive Apps, Ronnie Garcia
*/
global $mylink, $morpheus;

include ("../nogo/config.php");
include ("../nogo/funktion.inc");
include ("../nogo/db.php");
include ("../page/gallery_functions.php");
dbconnect();


// *****************************************
// print_r($_POST);
// *****************************************

$gnid = $_POST["gnid"];
$keyword = $_POST['keyword'];
$hashtags = $_POST['hashtags'];

if (!$gnid)
    exit();

// *****************************************
// Set the uplaod directory
// *****************************************
echo $uploadDir = $_POST["dir"];
// $uploadDir = 'img/';

// *****************************************
// allowed files
// *****************************************
$imgTypes = array(
    'jpg',
    'jpeg',
    'png'); // Allowed file extensions
$docFiles = array("gif", "svg", 'psd', 'pdf', 'eps', 'ai');
$fileTypes = array_merge($imgTypes, $docFiles);

// *****************************************
/*** TOKEN *****/
// *****************************************
$verifyToken = md5('pixeld' . $_POST['timestamp']);


if (!empty($_FILES) && $_POST['token'] == $verifyToken)
{
    $tempFile = $_FILES['Filedata']['tmp_name'];
    
    $im = new Imagick($tempFile);
    
    $width = $im->getImageWidth();
    $height = $im->getImageHeight();
    $size = $im->getImageSize()/1024;
    $filetime = date("Y-m-d", filectime($tempFile));
    $imagecolor = $im->getImageColorspace();
    $imageprops = $im->getImageProperties();
    $file_type = getFileTypeImage($tempFile);
    
    //echo 'w ' . $width . 'h ' . $height . 's ' . $size . 'time ' . $filetime . 'color ' . $imagecolor . 'type ' . $file_type;
    //die();
    
    $file_infor = new stdClass;

    $file_infor->type = $file_type;
    $file_infor->width = $width;
    $file_infor->height = $height;
    $file_infor->mb = $size;
    $file_infor->date = $filetime;
    $file_infor->color = $imagecolor;
    $file_infor->props = $imageprops;
    
    $file = $_FILES['Filedata']['name'];

    $filesize = filesize($tempFile);
    $filetime = date("Y-m-d", filectime($tempFile));

    // Validate the filetype
    $fileParts = pathinfo($_FILES['Filedata']['name']);

    // print_r($fileParts);
    if (in_array(strtolower($fileParts['extension']), $fileTypes))
    {
        setData($hashtags, $keyword, $file, $uploadDir, $gnid, json_encode($file_infor));

        $insert_id = $mylink->insert_id;
        
        $targetFile = $uploadDir . $insert_id . '/' . $morpheus['Original'];
        $thumbFile = $uploadDir . $insert_id . '/' . $morpheus['thumb'];
        $largeFile = $uploadDir . $insert_id . '/' . $morpheus['large'];
        
        $widthThumbResize = $morpheus['thumb_width'];
        $widthLargeResize = $morpheus['large_width'];
        
        mkdirr($targetFile, 0777);
        mkdirr($thumbFile, 0777);
        mkdirr($largeFile, 0777);
        
        $targetFile .= '/' . $_FILES['Filedata']['name'];
        $thumbFile .= '/'; //. $_FILES['Filedata']['name'];
        $largeFile .= '/'; //. $_FILES['Filedata']['name'];
        
        
        if (!move_uploaded_file($tempFile, $targetFile))
            echo ":( -- $tempFile -- " . $targetFile;
            
        $file_type = getFileTypeImage($targetFile);
        
        //echo $thumbFile; die();
        makeImage($targetFile, $thumbFile, $widthThumbResize, false);
        makeImage($targetFile, $largeFile, $widthLargeResize, false);
        
        //reSizeImage($targetFile, $thumbFile, $file_type, $widthThumbResize, 'crop');
        //reSizeImage($targetFile, $largeFile, $file_type, $widthLargeResize, 'crop');
    } else
    {
        // The file type wasn't allowed
        echo 'Invalid file type.';
    }
}


function setdata($hashtags, $keyword, $file, $uploadDir, $gnid, $file_infor)
{
    /*$file_dir = $uploadDir . '' . $file;

    $file_type = getFileTypeImage($file_dir);
    //$file_rgb = getRGBImage($file_dir, $file_type); //echo($file_rgb) ; die();
    $file_width = getWidthImage($file_dir, $file_type);
    $file_height = getHeightImage($file_dir, $file_type);
    $file_mb = getSizeMbImage($file_dir);
    $file_date = getDateImage($file_dir);*/

    /*$file_infor = new stdClass;

    $file_infor->type = $file_type;
    //$file_infor->rgb = $file_rgb;
    $file_infor->width = $file_width;
    $file_infor->height = $file_height;
    $file_infor->mb = $file_mb;
    $file_infor->date = $file_date;

    $file_infor = json_encode($file_infor);*/


    if (!$date)
        $date = date(Y . "-" . m . "-" . d);

    $sql = "SELECT gid FROM morp_cms_galerie WHERE gname='$file' AND gnid=$gnid";
    $res = safe_query($sql);
    $edit = mysqli_num_rows($res);

    $sql = "SELECT gid FROM morp_cms_galerie WHERE gnid=$gnid";
    $res = safe_query($sql);
    $anz = mysqli_num_rows($res);
    $anz++;

    if ($edit)
        $sql = "UPDATE ";
    else
        $sql = "INSERT into ";

    $sql .= " morp_cms_galerie SET tags='$hashtags', keyword='$keyword', gnid=$gnid, gname='$file', another_infor='$file_infor', `sort`=$anz, gdatum='$date'";

    echo $sql;
    if ($edit)
        $sql .= " WHERE imgname='$file' AND gnid=$gnid";

    safe_query($sql);
}

?>