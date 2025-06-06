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
        $img = set_name_image($img);

		$tn 	= $row->tn;
		$ordner = $row->gnname;
		$gid 	= $row->gid;
		$textde = $row->gtextde;
		$hl = $row->gtexten;
        $hashtags = $row->tags;
        $keyWord = $row->keyword;


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
                            <a class="edit_" href="javascript:void(0)"><i class="fa fa-edit"></i></a>
                            <br><br>
                            <div class="alert alert-success hide" role="alert">gespeichert update</div>
                           </div>
                          <div class="col-md-5 FFF">
                            <img class="img-responsive" src="'.$dir.'Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["large"] . '/' . $img.'">
                            <a href="' . $dir . 'download-img.php?dfile=Galerie/' . $morpheus["GaleryPath"] .
            '/' . $ordner . '/'.$gid.'/'.$morpheus["Original"].'/' . urlencode($row->gname) .
            '" class="bild_her">Bild herunterladen</a>
                          </div>';

        $infor = json_decode($row->another_infor);

        $copy = 'icc:copyright';
        $copy = str_replace('Copyright (c)', '', $infor->props->$copy);

        $orginalDate = 'exif:DateTimeOriginal';
        if($infor->props->$orginalDate != '') {
          $orginalDate = explode(' ', $infor->props->$orginalDate);
          $orginalDate = orginalDate($orginalDate[0]);
        } else {
            $orginalDate = 'photoshop:DateCreated';
            $orginalDate = orginalDate($infor->props->$orginalDate);
        }


        $ID = ($infor->color == 13) ? 'RGB' : 'CMYK';

        $width_cm = $infor->width * 2.54 / 300;
        $width_cm = number_format($width_cm, 2, ',', ' ');

        $height_cm = $infor->height * 2.54 / 300;
        $height_cm = number_format($height_cm, 2, ',', ' ');

        $output .= '<div class="col-md-7">';

        $output .= '<p class="lead">Bildname: ';
        $output .= '<b>'.str_replace('.jpg', '', $row->gname).'</b></p>';

        $output .= '<div class="image_information">';

        $output .= '<div class="infor_row"><p class="property">Autor:</p> <p class="value"> '.$_SESSION["author"].' </p></div>';
        $output .= '<div class="infor_row"><p class="property">Datum Update:</p> <p class="value"> '.euro_dat($infor->date).'</p></div>';
        $output .= '<div class="infor_row"><p class="property">Datum Orginal:</p> <p class="value"> '.$orginalDate.'</p></div>';
        $output .= '<div class="infor_row"><p class="property">Größe:</p> <p class="value"> '.$infor->width.' * '.$infor->height.' Pixel / '.$width_cm.' cm * '.$height_cm.' cm   </p></div>';
        $output .= '<div class="infor_row"><p class="property">Auflösung:</p> <p class="value"> 300 dpi </p></div>';
        $output .= '<div class="infor_row"><p class="property">Type:</p> <p class="value"> '.$infor->type.' </p></div>';
        $output .= '<div class="infor_row"><p class="property">Farben:</p> <p class="value"> '.$ID.' </p></div>';

        $output .= '</div>';

        $output .= '<div class="image_des_hash">';

        $output .= '<p><b>Beschreibung</b> <p>'.$textde.'</p></p><br>';
        $output .= '<p><b>Hashtags</b> <p> '.HashtagsGalery($hashtags).'</p></p>';

        $output .= '</div>';

        $output .= '</div>';

        $output .= '</div>';

        $output .=

            '
            <div class="row relative show_edit hide">
        	    <div class="col-md-12"><a href="javascript:void(0)" class="arrow-back"><i class="fa fa-arrow-left" aria-hidden="true"></i></a></div>
                <br><br>
                <div class="col-md-6 GGG">
                  <textarea class="galedit form-control" name="t'.$gid.'" id="t'.$gid.'" ref="s'.$gid.'" placeholder="Description Image">'.$textde.'</textarea>
                  <input id="keyword'.$gid.'" placeholder="Key word" value="'.$keyWord.'" />
                </div>
            ';

        $output .= '<div class="col-md-6 YYY">' . listHashtagsGalery($hashtags) . '</div>'.'
                    <br><div class="col-md-12"><button class="btn btn-info saveText" ref="'.$gid.'" id="s'.$gid.'"><i class="fa fa-save"></i></button></div>';

        $output .='
        </div></div></div>
        ';
  }

  echo $output; die();
}
else if($galerie) {
  //start add 
  $page = (isset($_GET['page'])) ? $_GET['page'] : 1;
    
  $number = (isset($_GET['number'])) ? $_GET['number'] : 20;
  $_SESSION['number_per_page'] = $number;

  $total_search = get_total_search('', '', $galerie);
  $number = ($number > $total_search) ? $total_search : $number;

  $count_page = ($total_search > 0) ? ceil($total_search/$number) : 1;
  $page = ($page < $count_page) ? $page : $count_page;

  $start = $number * ($page - 1);

  $start_number = ($start + $number > $total_search) ? $total_search : ($start + $number);
  //end
  
  $que  	= "SELECT * FROM `morp_cms_galerie_name` n, `morp_cms_galerie` g WHERE g.gnid=".$galerie." AND g.gnid=n.gnid ORDER BY g.sort";
  //add
  $que .= " LIMIT ".$start.",".$number."";
  //end
  $res 	= safe_query($que);
	$x		= mysqli_num_rows($res);
	$n = 0;

	$jsList = '';
	$setOptions = '';

    $output .= '<div class="row">
                  <div class="col-md-12 upload">
                    <a href="'.$dir.$navID[10].'edit+'.$galerie.'/" class="btn btn-info">Bilder hochladen <i class="fa fa-plus"></i></a>
                  </div>
                  <input type="hidden" name="category_id" id="category_id" value='.$galerie.' />
                  ';

    //start add 
    $output .= '<br><div class="infor_number col-md-6">'.($start + 1).'-'.$start_number.' of '.$total_search.'</div>';

    /*$output .= '<select class="number_page form-control" data-show-content="true">';
    $output .= ($_SESSION["number_per_page"] == 5) ? '<option selected value="20">20</option>' : '<option value="20">20</option>';
    $output .= ($_SESSION["number_per_page"] == 40) ? '<option selected value="40">40</option>' : '<option value="40">40</option>';
    $output .= ($_SESSION["number_per_page"] == 60) ? '<option selected value="60">60</option>' : '<option value="60">60</option>';
    $output .= ($_SESSION["number_per_page"] == 80) ? '<option selected value="80">80</option>' : '<option value="80">80</option>';
    $output .= '</select>';*/

    $output .= '<div class="infor_pagination">';

    $output .= ($page == 1) ? '<a href="#" class="previous_pagination gallery"><</a>' : '<a href="'.$dir.'kategorien/kategorien-edit/edit+'.$galerie.'/?page='.($page - 1).'" class="previous_pagination gallery"><</a>';

    for($i = 1; $i <= $count_page; $i++){
        $output .= ($i == $page) ? '<a href="#kategorien/kategorien-edit/edit" class="number_pagination gallery active"><input type="text" value="'.$i.'"/></a>' :
        '<a href="#'.$i.'" class="number_pagination gallery">'.$i.'</a>'; 
    }

    $output .= ($page == $count_page) ? '<a href="#" class="next_pagination gallery">></a>' : '<a href="'.$dir.'kategorien/kategorien-edit/edit+'.$galerie.'/?page='.($page + 1).'" class="next_pagination show_gallery">></a>' ;

    $output .= '<a class="number_page">insgesamt '.$count_page.' Seiten</a>';
    
    $output .= '</div><br><br>';
    //end

    $output .= '<div class="col-md-12">
                    <div class="grid">
                  ';

	while ($row = mysqli_fetch_object($res)) {
		$n++;
		$img 	= $row->gname;
        $img = set_name_image($img);

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

<div class="grid-item grid-sizer">
    <div class="gal-item item_image">
         <img class="img-fluid" src="'.$dir.'Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["thumb"] . '/' . $img.'">
         <div class="edit_delete_image">
          <a href="#'.$gid.'" class="edit_image tool" data-toggle="modal" data-target="#myModal_edit_image"><i class="fa fa-edit"></i></a>
          <a class="delete_galerie_folders_images hide" href="#'.$gid.'"><img src="images/1x/close.png" /></a>
          <a class="delete_galerie_folders_images_confirm tool" href="#'.$gid.'"><i class="fa fa-trash-o"></i></a>
          <a href="#" data-target="#demoLightbox'.$gid.'" data-toggle="modal"  class="tool large_image"><img src="'.$dir.'images/1x/close.png" /></a>
          <div class="modal" id="demoLightbox'.$gid.'" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
                               <!-- Modal Header -->
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                              </div>

								<!-- Modal body -->
								<div class="modal-body">
								  <img class="img-fluid not-opacity" src="'.$dir.'Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["large"] . '/' . $img.'">

                                </div>
							</div>
						</div>
					</div>
         </div>
         <div class="favourite_image">
          <a class="tool" href="#'.$gid.'"><img src="'.$dir.'images/1x/start_favourite.png" /></a>
          <a class="tool hide" href="#'.$gid.'"><img src="'.$dir.'images/1x/heart_favourite.png" /></a>
         </div>
    </div>
    <div class="hashtag_display">
	    <label class="des_'.$gid.'">'.$textde.'</label><br>
    		';
  $output .= '<div class="hashtag_'.$gid.'">' . HashtagsGalery($hashtags) . '</div>';

  $output .= '</div>';

  $output .= '
</div>
';
}

$output .= '</div></div></div>';

	$filterButton = '
	<a href="'.$dir.$navID[10].'edit+'.$galerie.'/" class="btn btn-info btn-upload-left">Bild/Video hinzufügen <i class="fa fa-plus"></i> </a>
';


	$js = '
    var $grid = $(\'.grid\').isotope({
      itemSelector: \'.grid-item\',
      masonry: {
    	columnWidth: \'.grid-sizer\',
	    percentPosition: true
      }
    });

    $grid.imagesLoaded().progress( function() {
       $grid.isotope(\'layout\');
    });

    var $items = $grid.find(\'.grid-item\');
    $grid.addClass(\'is-showing-items\');
    // .isotope( \'revealItemElements\', $items );

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