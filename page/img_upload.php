<?php
session_start();
# # # # # # # # # # # # # # # # # # # # # # # # # # #
# www.pixel-dusche.de                               #
# björn t. knetter                                  #
# start 12/2003                                     #
#                                                   #
# post@pixel-dusche.de                              #
# frankfurt am main, germany                        #
# # # # # # # # # # # # # # # # # # # # # # # # # # #

global $upload, $morpheus, $dir, $mid;
$upload = 1;

include("../nogo/config.php");
include("../nogo/funktion.inc");
include("../nogo/db.php");
dbconnect();

$root = $morpheus["url"];

?>

<link rel="stylesheet" type="text/css" href="<?php echo $root; ?>uploadifive/uploadifive.css">
<script src="<?php echo $root; ?>uploadifive/jquery.min.js" type="text/javascript"></script>
<script src="<?php echo $root; ?>uploadifive/jquery.uploadifive.min.js" type="text/javascript"></script>

<?php

$table 	= isset($_REQUEST["tbl"])		? $_REQUEST["tbl"] 		: '';
$id		= isset($_REQUEST["id"])		? $_REQUEST["id"] 		: '';
$imgrow	= isset($_REQUEST["imgid"])	? $_REQUEST["imgid"] 		: '';
$folder	= isset($_REQUEST["folder"])	? $_REQUEST["folder"]		: '';
$tid		= isset($_REQUEST["setid"])	? $_REQUEST["setid"]		: '';
$imgSize	= isset($_REQUEST["imgSize"])	? $_REQUEST["imgSize"]	: '';

$path =  str_replace('/page', "", dirname(__FILE__)).'/images/'.$folder.'/';

/*
UploadiFive
Copyright (c) 2012 Reactive Apps, Ronnie Garcia
*/

$timestamp = time();

echo '
<style>
.uploadifive-button {
	float: left;
	margin-right: 10px;
    height: 32px !important;
    line-height: 34px !important;
    width: 124px !important;
    border-radius: 6px !important;
    font-size: .9em !important;
   }
#queue {
	border: 1px solid #E5E5E5;
	height: 377px;
	overflow: auto;
	margin-bottom: 10px;
	padding: 0 3px 3px;
	width: 500px;
}
p { font-size:14px; }
</style>

	<p><a href=""><i class="fa fa-refresh fa-spin fa-3x fa-fw"></i> Fertig und Reload Seite</a></p>

	<form>
		<div id="queue"></div>
		<input id="file_upload" name="file_upload" type="file" multiple="true" class="btn btn-info ">
		<a href="javascript:$(\'#file_upload\').uploadifive(\'upload\')" class="btn btn-info ">Upload Files</a>

	</form>

<script>
	$(function() {
		$(\'#file_upload\').uploadifive({
			\'auto\'             : true,
			\'formData\'         : {
								   \'timestamp\' : \''.$timestamp.'\',
								   \'token\'     : \''.md5('pixeld'.$timestamp).'\',
								   \'table\'	   	: \''.$table.'\',
								   \'tid\'	   	: \''.$tid.'\',
								   \'id\'	   	: \''.$id.'\',
								   \'imgrow\'   	: \''.$imgrow.'\',
								   \'imgSize\'  	: \''.$imgSize.'\',
								   \'mid\'  		: \''.$mid.'\',
								   \'dir\'	   	: \''.$path.'\'
			                     },
			\'queueID\'          : \'queue\',
			\'uploadScript\'     : \''.$morpheus["url"].'uploadifive/uploadifive_img.php\',
			\'onUploadComplete\' : function(file, data) { console.log(data); location.reload();  }
		});
	});
</script>
';

// location.reload();
?>