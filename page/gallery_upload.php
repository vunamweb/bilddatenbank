<?php

global $upload, $dir, $navID, $js, $morpheus, $galerie, $mid;
$upload = 1;

?>

<?php

$table = 'morp_tags_category';
$primary = 'id';
$show_col = "name";
$sorting_col = "name";

$select = '<div id="sel-cont" class="sel-cont"><select name="select" class="ui selection dropdown" multiple="">';

$sql = "SELECT * FROM $table order by $sorting_col";
$res = safe_query($sql);
$row = mysqli_fetch_object($res);

$num_rows = mysqli_num_rows($res);

$count = 1;

while ($row = mysqli_fetch_object($res))
{
    $select .= '<option value="">' . $row->$show_col . '</option>';

    $tags_category_id = $row->$primary;

    $table = 'morp_tags';
    $primary_1 = 'tagID';
    $show_col_1 = "tag";
    $sorting_col_1 = "tag";

    $sql = "SELECT * FROM $table where category_id =" . $tags_category_id .
        "  order by $sorting_col_1";
    $res_1 = safe_query($sql);
    $row_1 = mysqli_fetch_object($res_1);

    while ($row_1 = mysqli_fetch_object($res_1))
    {
        $select .= '<option value="' . $row_1->$primary_1 . '">' . $row_1->$show_col_1 .
            '</option>';
    }

    $count++;

    $select .= ($count < $num_rows) ?
        '</select><select name="select" class="ui selection dropdown" multiple="">':
    '</select>';
}

$output .= '
	<div class="container">
		<div class="row">
			<div class="col-md-12">

';

$galerie = isset($_GET["nid"]) ? $_GET["nid"] : '';

if (!$galerie)
    die("Fehler");

$que = "SELECT * FROM `morp_cms_galerie_name` WHERE gnid=" . $galerie .
    " AND mid=" . $mid;
$res = safe_query($que);
$row = mysqli_fetch_object($res);

$img = $row->gname;
$ordner = $row->gnname;
//$path 	=  DIR.'/Galerie/'.$morpheus["GaleryPath"].'/'.$ordner.'/';
$path = 'D:/xampp-7-4/htdocs/bilddatenbank' . '/Galerie/' . $morpheus["GaleryPath"] .
    '/' . $ordner . '/';


/*
UploadiFive
Copyright (c) 2012 Reactive Apps, Ronnie Garcia
*/


$timestamp = time();
$uploadScript = $dir . 'uploadifive/uploadifive_galerie.php';

$output .= '

	<p><a href="' . $dir . $navID[8] . 'edit+' . $galerie .
    '/" class="btn btn-info"><i class="fa fa-chevron-left"></i> Zurück zur Galerie</a><br/>&nbsp;<br/></p>';

$output .= $select;

$output .= '<input type="text" name="keyword" id="keyword" placeholder="Keyword"  />';

$output .= '<form>
		<div id="queue"></div>
		<input id="file_upload" name="file_upload" type="file" multiple="true" class="btn btn-info ">
		<a href="javascript:void(0)" class="btn btn-info upload">Upload Files</a>
        
        <input type="hidden" id="timestamp" value=' . $timestamp . ' />
        <input type="hidden" id="token" value=' . md5('pixeld' . $timestamp) .
    ' />
        <input type="hidden" id="gnid" value=' . $galerie . ' />
        <input type="hidden" id="dir" value=' . $path . ' />
        <input type="hidden" id="uploadScript" value=' . $uploadScript . ' />
     </form>';

$js = '
		$(function() {
			$(\'.selection.dropdown\').dropdown({maxSelections: 3});
            
            $(\'#file_upload\').uploadifive({
				\'auto\'             : false,
				\'formData\'         : {
									   \'timestamp\' : \'' . $timestamp . '\',
									   \'token\'     : \'' . md5('pixeld' . $timestamp) . '\',
									   \'gnid\'	   	: \'' . $galerie . '\',
									   \'dir\'	   	: \'' . $path . '\'
				                     },
				\'queueID\'          : \'queue\',
				\'uploadScript\'     : \'' . $dir . 'uploadifive/uploadifive_galerie.php\',
				\'onUploadComplete\' : function(file, data) { console.log(data); }
			});
		});

';

$galerie = 1;

?>