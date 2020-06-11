<?php
global $img_pfad, $dir, $druckversion, $navID, $lan, $morpheus, $galHR, $galLR, $cid, $js;
global $justMine, $galerie, $filterButton;

$galerie = isset($_GET["nid"]) ? $_GET["nid"] : 0;

if($galerie) {
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

<div class="sortGal" id="z_'.$gid.'">
    <div class="hovereffect">
        <img class="img-responsive" src="'.$dir.'mthumb.php?w=400&amp;zc=1&amp;src=Galerie/'.$morpheus["GaleryPath"].'/'.$ordner.'/'.$img.'">
        <div class="overlay">
        		<p><i class="fa fa-eraser delete tool" ref="'.$gid.'" id="e'.$gid.'"></i></p>
        		<p><i class="fa fa-check tool invisible delYes chk'.$gid.'" ref="'.$gid.'"></i></p>
        		<p><i class="fa fa-close tool invisible delNo chk'.$gid.'" ref="'.$gid.'"></i></p>
        </div>
    </div>
    <div class="relative">
	    <textarea class="galedit form-control" name="t'.$gid.'" id="t'.$gid.'" ref="s'.$gid.'" placeholder="Description Image">'.$textde.'</textarea>
    		<button class="btn btn-info saveText" ref="'.$gid.'" id="s'.$gid.'"><i class="fa fa-save"></i></button>
    	</div>';
   $output .= $select;
   $output .='     
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