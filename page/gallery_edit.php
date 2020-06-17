<?php
global $img_pfad, $dir, $druckversion, $navID, $lan, $morpheus, $galHR, $galLR, $cid, $js;
global $justMine, $galerie, $filterButton;

$galerie = isset($_GET["nid"]) ? $_GET["nid"] : 0;
$func = isset($_GET["func"]) ? $_GET["func"] : 0;
//print_r($_GET); die();

if($func == 'editgalery') {
    
    $que  	= "SELECT * FROM `morp_cms_galerie_name` n, `morp_cms_galerie` g WHERE g.gid=".$galerie." AND g.gnid=n.gnid ORDER BY g.sort";
	$res 	= safe_query($que);
	$x		= mysqli_num_rows($res);
	$n = 0;

	$jsList = '';
	$setOptions = '';

	while ($row = mysqli_fetch_object($res)) {
		$n++;
		$img 	= $row->gname;
		$tn 	= $row->tn;
		$ordner = $row->gnname;
		$gid 	= $row->gid;
		$textde = $row->gtextde;
		$hl = $row->gtexten;
        $hashtags = $row->tags;

		$sql = "SELECT tagID FROM `morp_tags_list` WHERE art='image' AND targetID=$gid";
		$rs = safe_query($sql);
		$tagList = array();

		$setOptions .= '
					 var control = $select_'.$gid.'[0].selectize;
					 control.addOption({
					 	value: data,
					 	title: value
					 });
';

		while ($rw = mysqli_fetch_object($rs)) {
			$tagList[]=$rw->tagID;
		}

		$tagCount = count($tagList);
		$tagList = implode(",", $tagList);

		$output .= '

        <div class="row">
        <div class="col-md-12">
                     <div class="show_infor row">
                          <div class="col-md-12">
                            <a href="javascript:void(0)"><i class="fa fa-edit"></i></a>
                            <br><br>
                            <div class="alert alert-success hide" role="alert">gespeichert update</div>
                           </div>
                          <div class="col-md-6">
                            <img class="img-responsive" src="'.$dir.'Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["large"] . '/' . urlencode($img).'">
                          </div>';
         
         $output .= '<div class="col-md-6"><label class="des_'.$gid.'">'.$textde.'</label><br>' . '<div class="hashtag_'.$gid.'">' . HashtagsGalery($hashtags). '</div>' .'</div>';
         
         $output .= '</div>';
         
         $output .=                                  
                                
            '
            <div class="row relative show_edit hide">
        	    <div class="col-md-12"><a href="javascript:void(0)" class="arrow-back"><i class="fa fa-arrow-left" aria-hidden="true"></i></a></div>
                <br><br>
                <div class="col-md-6"><textarea class="galedit form-control" name="t'.$gid.'" id="t'.$gid.'" ref="s'.$gid.'" placeholder="Description Image">'.$textde.'</textarea></div>
            ';
           
        $output .= '<div class="col-md-6">' . listHashtagsGalery($hashtags) . '</div>'.'
                    <br><div class="col-md-12"><button class="btn btn-info saveText" ref="'.$gid.'" id="s'.$gid.'"><i class="fa fa-save"></i></button></div>';
        
        $output .='     
        </div></div></div>
        ';
  }
  
  echo $output; die();
} 
else if($galerie) {
	$que  	= "SELECT * FROM `morp_cms_galerie_name` n, `morp_cms_galerie` g WHERE g.gnid=".$galerie." AND g.gnid=n.gnid ORDER BY g.sort";
	$res 	= safe_query($que);
	$x		= mysqli_num_rows($res);
	$n = 0;

	$jsList = '';
	$setOptions = '';

	while ($row = mysqli_fetch_object($res)) {
		$n++;
		$img 	= $row->gname;
		$tn 	= $row->tn;
		$ordner = $row->gnname;
		$gid 	= $row->gid;
		$textde = $row->gtextde;
		$hl = $row->gtexten;
        $hashtags = $row->tags;

		$sql = "SELECT tagID FROM `morp_tags_list` WHERE art='image' AND targetID=$gid";
		$rs = safe_query($sql);
		$tagList = array();

		$setOptions .= '
					 var control = $select_'.$gid.'[0].selectize;
					 control.addOption({
					 	value: data,
					 	title: value
					 });
';

		while ($rw = mysqli_fetch_object($rs)) {
			$tagList[]=$rw->tagID;
		}

		$tagCount = count($tagList);
		$tagList = implode(",", $tagList);

		$output .= '

<div class="col-md-6">
    <div class="item_image">
         <img class="img-responsive" src="'.$dir.'Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["thumb"] . '/' . urlencode($img).'">
         <div class="edit_delete_image">
          <a href="#'.$gid.'" class="edit_image" data-toggle="modal" data-target="#myModal_edit_image"><i class="fa fa-edit"></i></a>
          <a class="delete_galerie_folders_images hide" href="#'.$gid.'"><i class="fa fa-minus-circle" aria-hidden="true"></i></a>
          <a class="delete_galerie_folders_images_confirm" href="#'.$gid.'"><i class="fa fa-minus-circle" aria-hidden="true"></i></a> 
         </div>
    </div>
    <div class="">
	    <label class="des_'.$gid.'">'.$textde.'</label><br>
    		';
  $output .= '<div class="hashtag_'.$gid.'">' . HashtagsGalery($hashtags) . '</div>';
        
  $output .= '</div>';
   
  $output .= '	     
</div>
';
}

	$filterButton = '
	<p class="mb6">&nbsp</p>
	<a href="'.$dir.$navID[10].'edit+'.$galerie.'/" class="btn btn-info"><i class="fa fa-plus"></i> Add Photos / Files</a>
';


	$js = '

	$(\'.selection.dropdown\').dropdown({maxSelections: 3});
    
    function setOptions(data, value) {
		'.$setOptions.'
	}

    $(".delete").click(function () {
	    id = $(this).attr("ref");
		$(this).addClass("invisible");
		$(".chk"+id).removeClass("invisible");
    });
    $(".delNo").click(function () {
	    id = $(this).attr("ref");
		$(".chk"+id).addClass("invisible");
		$("#e"+id).removeClass("invisible");
    });
    $(".delYes").click(function () {
	    id = $(this).attr("ref");
		// console.log(id);

	    request = $.ajax({
	        url: "'.$dir.'morpheus/UpdateDelete.php",
	        type: "post",
	        data: "todel="+id+"&tid=gid&table=morp_cms_galerie",
	        success: function(data) {
				$(\'#z_\'+id).hide();
				// console.log(data);
  			}
	    });
    });
    
    $(".galedit").on("input",function () {
	    id = $(this).attr("ref");
	    $(\'#\'+id).addClass(\'btn-danger\');
    });


';
}

//$galerie = 1;

$morp = "Galery $text";

?>