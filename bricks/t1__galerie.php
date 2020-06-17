<?php
global $img_pfad, $dir, $druckversion, $navID, $lan, $morpheus, $galHR, $galLR, $cid, $js, $hn_id, $mid;
global $justMine, $galerie;

global $filterButton, $filter, $tagListButtons;

global $mylink;


$galerie = isset($_GET["nid"]) ? $_GET["nid"] : 0;
$likes = isset($_GET["likes"]) ? $_GET["likes"] : 0;
$search = isset($_GET["search"]) ? $_GET["search"] : '';

$hashtag = isset($_GET["hashtag"]) ? $_GET["hashtag"] : '';
$hashtagid = isset($_GET["hashtagid"]) ? $_GET["hashtagid"] : 0;


#echo '##mid: '.$mid.'##';
#print_r($_REQUEST);
#print_r($_SESSION);


// + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + 
// + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + 
// + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + 
// SHOW IMAGES WITH LIKES / MY LIKES OR MOST LIKES
//$output = 'dff'; return;
if($likes) {
	$profile = getProfile($besitzer);
	$max = 40;
	
	if($likes=="all") 	$que = "SELECT * , COUNT(likesID) as countLikes FROM `morp_cms_galerie` g, `morp_cms_galerie_likes` l, `morp_cms_galerie_name` n WHERE g.gnid=n.gnid AND l.gid=g.gid  GROUP BY g.gid ORDER BY COUNT(likesID) DESC, g.sort LIMIT 0,$max";
	elseif($likes=="my") $que = "SELECT * FROM `morp_cms_galerie` g, `morp_cms_galerie_likes` l, `morp_cms_galerie_name` n WHERE g.gnid=n.gnid AND l.gid=g.gid AND l.mid=$mid ORDER BY g.sort";
	$res 	= safe_query($que);
	$x		= mysqli_num_rows($res);
	$n = 0;

	$tagListButtons = array();
	$galerie = 1;

	$output .= '
	<h2><a href="'.$dir.$navID[$hn_id].'" class="btn btn-info"><i class="fa fa-chevron-left"></i></a> &nbsp;  Anzahl Fotos: '.$x.' '.($likes == "all" ? '// most favourite photos' : '// my favourites').'</h2>
		<hr>

    <div class="grid">
';

	$output .= set_thumb_gallery($res, 1);	
	$output .= '
	</div>
';

} else if($galerie && $galerie == 'search') {
    $seach_key = $_GET['search_value'];
    
    $output = '
    <div class="grid">
	';
    
    $que  	= "SELECT * FROM `morp_cms_galerie_name` n ORDER BY n.gnname";
	$res 	= safe_query($que);
    
    while ($row = mysqli_fetch_object($res)){
        $que  	= "SELECT * FROM `morp_cms_galerie_name` n, `morp_cms_galerie` g WHERE (g.gtextde like '%".$seach_key."%' OR g.keyword like '%".$seach_key."%' ) AND g.gnid=".$row->gnid." AND g.gnid=n.gnid ORDER BY g.sort";
	    //echo $que; die();
        $res_1 	= safe_query($que);
	
        $x		= mysqli_num_rows($res_1);

	$tagListButtons = array();

	$output .= set_thumb_gallery($res_1, 1);
	}
    
    $output .= '
		</div>
';
 
 echo $output; die(); 
} else if($galerie && $galerie == 'update') {
    $text= $_GET["myText"];
    $hashtags= $_GET["hashtags"];
    $pos_1 = 'gtextde';
    $pos_2 = 'tags';
    $feld = $_GET["feld"];
    $table = $_GET["table"];
    $id = $_GET["id"];
    
    if($table && $feld && $id) {
    	$sql = "UPDATE $table set $pos_1='$text', $pos_2='$hashtags' WHERE $feld=$id";
        safe_query($sql);
    }
} else if($galerie && $galerie == 'modal') {
    $output = '<div class="row">';
    $output .= '<div class="col-md-6">';
    
    $data = $_GET['data'];
    $data = explode(',', $data);
    
    $que  	= "SELECT * FROM `morp_cms_galerie` g WHERE g.gid = ".$data[0]." ORDER BY g.sort";
    $res 	= safe_query($que);
    
    while ($row = mysqli_fetch_object($res)) {
        $src = $dir . 'Galerie/' . $morpheus['GaleryPath'] . '/' . $data[1] . '/' . $data[0] . '/' . $morpheus['Original'] . '/' . $row->gname;
        
        $output .= '<img class="img-responsive" src='.$src.' />';
        
        $output .= '</div>';
        
        $output .= '<div class="col-md-6">';
        
        $infor = json_decode($row->another_infor);
        
        $output .= '<p>Type: '.$infor->type.'</p>';
        $output .= '<p>Width: '.$infor->width.'</p>';
        $output .= '<p>Height: '.$infor->height.'</p>';
        $output .= '<p>Size: '.$infor->mb.'</p>';
        $output .= '<p>Date: '.$infor->date.'</p>';
        
        $output .= '</div></div>';
    }
	    
  echo $output; die();   
} else if($galerie && $galerie == 'addfolder') {
    $name = $_GET['name'];
    $table = 'morp_cms_galerie_folders';
    
    $sql = "insert into $table(mid,folder_name)values(".$_SESSION['mid'].",'".$name."')";
    safe_query($sql);
    
    $id = $mylink->insert_id;
    
    $output = '<div class="col-md-4"><input type="radio" name="folder" value="'.$id.'">'.$name.'<a href="#'.$id.'" class="delete_folder"><i class="fa fa-minus-circle" aria-hidden="true"></i></a></div>';
    
    echo $output; die();
} else if($galerie && $galerie == 'showfolder') {
    $output = '';
    
    $que  	= "SELECT * FROM `morp_cms_galerie_folders` f WHERE f.mid = ".$_SESSION['mid']." ORDER BY f.folder_name";
    $res 	= safe_query($que);
    
    while ($row = mysqli_fetch_object($res)) {
        $output .= '<div class="col-md-4"><input type="radio" name="folder" value="'.$row->folderID .'">'.$row->folder_name .'<a href="#'.$row->folderID .'" class="delete_folder hide"><i class="fa fa-minus-circle" aria-hidden="true"></i></a><a href="#'.$row->folderID .'" class="delete_folder_confirm"><i class="fa fa-minus-circle" aria-hidden="true"></i></a></div>';
    }
    
    echo $output; die();
} else if($galerie && $galerie == 'save_folder_galeries') {
    $folder_id = $_GET['folder_id'];
    
    $galeries_id = $_GET['galeries_id'];
    $galeries_id = explode(',', $galeries_id);
    
    foreach($galeries_id as $item) {
        if($item != '') {
            $que  	= "SELECT * FROM `morp_cms_galerie_folders_images` f WHERE f.foldersID = ".$folder_id." AND f.gid = ".$item."";
            $res 	= safe_query($que);
            
            $x		= mysqli_num_rows($res);
            
            //if not exist, then insert, so not double
            if($x <= 0) {
              $sql = "insert into morp_cms_galerie_folders_images(foldersID,gid)values(".$folder_id.",'".$item."')";
              safe_query($sql);   
            }
        }
    }
    
} else if($galerie && $galerie == 'delfolder') {
    $id = $_GET['id'];
    
    $sql = "delete from morp_cms_galerie_folders where folderID = ".$id."";
    safe_query($sql);
    
    die();
} else if($galerie && $galerie == 'areafolder') {
    $output = '<div class="row areafolder">';
    
    $folder_id = $_GET['id'];
    
    $table = 'morp_cms_galerie_guests';
    $col = 'folder_ids';
    $primary = 'guestID';
    $show_col = 'username';
    
    $que  	= "SELECT * FROM $table where $col like '%".$folder_id."%'";
    $res 	= safe_query($que);
    
    $output .= '<div id="images_area">';
    
    
    
    $table = 'morp_cms_galerie_folders_images';
    $primary = 'foldersID'; 
    
    
    
    $que  	= "SELECT * FROM $table where $primary = ".$folder_id."";
    $res 	= safe_query($que);
    
    $x		= mysqli_num_rows($res);
    
    while ($row = mysqli_fetch_object($res)) {
       $que  	= "SELECT * FROM `morp_cms_galerie_name` n, `morp_cms_galerie` g WHERE g.gid=".$row->gid." AND g.gnid = n.gnid ORDER BY g.sort";
	   $res_1 	= safe_query($que);
       
       $output .= show_gallery_folder($res_1, $row->imagesID);
    }
    
    $output .= '</div>';
    
    $output .= '</div>';
    
    $output = ($x !=0) ? $output : 'No data';
} else if($galerie && $galerie == 'areafoldermodal') {
    $folder_id = $_GET['id'];
    $table = 'morp_cms_galerie_folders_images';
    $primary = 'foldersID'; 
    
    $output = '<div class="row">';
    
    $que  	= "SELECT * FROM $table where $primary = ".$folder_id."";
    $res 	= safe_query($que);
    
    $x		= mysqli_num_rows($res);
    
    while ($row = mysqli_fetch_object($res)) {
       $que  	= "SELECT * FROM `morp_cms_galerie_name` n, `morp_cms_galerie` g WHERE g.gid=".$row->gid." AND g.gnid = n.gnid ORDER BY g.sort";
	   $res_1 	= safe_query($que);
       
       $output .= show_gallery_folder_modal($res_1, $row->imagesID);
    }
    
    $output .= '</div>';
    
    $output = ($x !=0) ? $output : 'No data';
    
    echo $output; die();
} else if($galerie && $galerie == 'delareafolderimg') {
    $id = $_GET['id'];
    
    $table = 'morp_cms_galerie';
    $primary = 'gid';
    
    $sql = "delete from $table where $primary = ".$id."";
    safe_query($sql);
    
    die();
} else if($galerie && $galerie == 'del_folder_img') {
    $id = $_GET['id'];
    
    $table = 'morp_cms_galerie_folders_images';
    $primary = 'imagesID';
    
    $sql = "delete from $table where $primary = ".$id."";
    safe_query($sql);
    
    die();
} else if($galerie && $galerie == 'guest') {
    $folder_id = $_GET['folder_id'];
    $data = json_decode($_GET['data']);
    
    foreach($data as $item) {
        $que  	= "SELECT * FROM `morp_cms_galerie_guests` g WHERE g.username = '".$item->username."'";
        $res 	= safe_query($que);
        
        $x		= mysqli_num_rows($res);
        
        //if user not exist
        if($x <= 0) {
            $sql = "insert into morp_cms_galerie_guests(username, password ,start_dat, end_dat, email, folder_ids)
            values('".$item->email."', '".md5($item->password)."', '".$item->start_date."', '".$item->end_date."', '".$item->email."', '".$folder_id."')";
            safe_query($sql);
            
            $insert_id = $mylink->insert_id;
            
            $sql = "insert into morp_intranet_user(uname, pw , email, guestID )
            values('".$item->email."', '".md5($item->password)."', '".$item->email."', ".$insert_id.")";
            safe_query($sql);
        } else {
            $row = mysqli_fetch_object($res);
            
            $folder_ids = $row->folder_ids;
            
            if($folder_ids == str_replace($folder_id, '', $folder_ids))
              $folder_ids .= ',' . $folder_id;
            
            $sql = "UPDATE morp_cms_galerie_guests set folder_ids='$folder_ids' WHERE username = '".$item->username."'";
            safe_query($sql);
        }
    }
    
    die();
} else if($galerie && $galerie == 'editguest') {
    $id = $_GET['id'];
    
    $table = 'morp_cms_galerie_guests';
    $primary = 'guestID';
    
    $que  	= "SELECT * FROM $table WHERE $primary = ".$id."";
    $res 	= safe_query($que);
    
    $row = mysqli_fetch_object($res);
    
    echo '<div class="content">
		<a href="javascript:void(0)" class="arrow-back-guest"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
        <br>
        <div class="form-group">
    			<input type="text" class="form-control setform" name="email" id="email" value='.$row->email.' placeholder="Email" />
		</div>
        <div class="form-group">
    			<input type="password" class="form-control setform" name="password" id="password" value='.$row->password.' placeholder="Password" />
		</div>
        <div class="form-group">
			<label for="start">
				Start date access
			</label>
			<input type="date" class="form-control setform" name="start_dat" id="start_dat" value='.$row->start_dat.' />
		</div>
		<div class="form-group">
			<label for="start">
				End date access
			</label>
			<input type="date" class="form-control setform" name="end_dat" id="end_dat" value='.$row->end_dat.'  />
		</div>
		<p>
			<button ref='.$id.' class="btn btn-success save_guest">
				Save
			</button>
        </p>
	
    </div>
    
    ';    
    
    die();
} else if($galerie && $galerie == 'updateguest') {
    $id = $_GET['id'];
    $start_date = $_GET['start_date'];
    $end_date = $_GET['end_date'];
    $email = $_GET['email'];
    $pass = $_GET['pass'];
    
    $sql = "UPDATE morp_cms_galerie_guests set username = '$email', email = '$email', password = '$pass', start_dat = '$start_date', end_dat = '$end_date' WHERE guestID = ".$id."";
    safe_query($sql);
    
    $sql = "UPDATE morp_intranet_user set uname ='$email', email = '$email', pw = '$pass' WHERE guestID = ".$id."";
    safe_query($sql);
    
    die();
} else if($galerie && $galerie == 'delguest') {
    $id = $_GET['id'];
    
    $sql = "delete from morp_cms_galerie_guests where guestID = ".$id."";
    safe_query($sql);
    
    $sql = "delete from morp_intranet_user where guestID = ".$id."";
    safe_query($sql);
     
    die();
}





// + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + 
// + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + 
// + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + 
// SHOW IMAGES OF CATEGORY
else if($galerie) {
	$que  	= "SELECT mid, besucher, gntextde, textde FROM `morp_cms_galerie_name` WHERE gnid=".$galerie;
	$res 	= safe_query($que);
	$row 	= mysqli_fetch_object($res);
	$x		= $row->besucher;
	$x		= $x+1;

	// TRACKING
	// COUNT VISITORS SELECT THIS CATEGORY
	$que  	= "UPDATE `morp_cms_galerie_name` set besucher=$x WHERE gnid=".$galerie;
	safe_query($que);

	$galerieName = $row->gntextde;
	$galerieDesc = $row->textde;

	// OWNER / UPLOADER OF IMAGES
/*
	$besitzer = $row->mid;
	$profile = getProfile($besitzer);
*/

	$que  	= "SELECT * FROM `morp_cms_galerie_name` n, `morp_cms_galerie` g WHERE g.gnid=".$galerie." AND g.gnid=n.gnid ORDER BY g.sort";
	$res 	= safe_query($que);
	$x		= mysqli_num_rows($res);

	$tagListButtons = array();

	$output .= '


		<a href="#" class="btn btn-info show_folder" data-toggle="modal" data-target="#myModal_add_folder">+ Add selected to folder</a>
			<hr>

        <div class="grid">
	';
	
	$output .= set_thumb_gallery($res, 1);
    $output .= '<div class="modal" id="myModal_add_folder">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
         <div class="header">
           <a href="#" class="btn btn-info add_folder">+ Add new folder</a>
           <div class="area_add">
             <input type="text" name="name" id="name" />
             <input type="button" value="Add" class="add_button" />
           </div>
         </div>
         <div class="content">
           <div class="row">
           </div>
         <a href="#" class="btn btn-info save_button">Save</a>
         </div>
         
      </div>

    </div>
  </div>
</div>';
	$output .= '
		</div>
';

}

// + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + 
// + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + 
// + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + 
// SHOW SELECTION OF SELECTED HASHTAG
else if($hashtag) {
	$que  	= "SELECT tagID FROM `morp_tags` WHERE tag='$hashtag'";
	$res 	= safe_query($que);
	$row 	= mysqli_fetch_object($res);
	$hashtagID = $row->tagID;

	// $galerie to start CSS for grid * * * * * * * * * * * * * * * * * * * * * * * *
	$galerie = 1;

 	$que  	= "SELECT * FROM `morp_cms_galerie_name` n, `morp_cms_galerie` g, `morp_tags_list` tl WHERE tl.tagID=$hashtagID AND art='image' AND targetID=g.gid AND g.gnid=n.gnid ORDER BY g.sort";
	$res 	= safe_query($que);
	$x		= mysqli_num_rows($res);
	$n = 0;

	$output .= '
		<h2><a href="'.$dir.$navID[$hn_id].'" class="btn btn-info"><i class="fa fa-chevron-left"></i></a></h2>
		<hr>
        <div class="grid">';

	$output .= set_thumb_gallery($res, 1);
	$output .= '
		</div>
';


}

// + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + 
// + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + 
// + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + 
// SHOW CATEGORY ON START
else if(get_guest_id_of_intranet_user() != 0) {
    $table = 'morp_cms_galerie_guests';
    $primary = 'guestID';
    
    
    $que  	= "SELECT folder_ids FROM $table WHERE $primary=".get_guest_id_of_intranet_user()."";
	$res 	= safe_query($que);
	$row 	= mysqli_fetch_object($res);
	$folder_ids = $row->folder_ids;
    
    $que  	= "SELECT * FROM `morp_cms_galerie_folders_images` f, `morp_cms_galerie_name` n, `morp_cms_galerie` g WHERE f.foldersID = ".$folder_ids." AND f.gid = g.gid AND g.gnid=n.gnid ORDER BY g.sort";
	$res 	= safe_query($que);
	$x		= mysqli_num_rows($res);

	$tagListButtons = array();

	$output .= '
        <div class="grid">
	';
	
	$output .= set_thumb_gallery_guest($res, 1);
}
else {
	
    $que = "SELECT * FROM `morp_cms_galerie_name` n, `morp_cms_galerie` g WHERE sichtbar=1 AND g.gnid=n.gnid GROUP BY g.gnid ORDER BY n.date DESC";

	$res 	= safe_query($que);
	$x		= mysqli_num_rows($res);
	$n = 0;
	$galerie = 1;

	$output .= '
';

	while ($row = mysqli_fetch_object($res)) {
		$n++;
		$img 	= $row->gname;
		$ordner = $row->gnname;
		$gnid 	= $row->gnid;

		$textde = $row->textde;
		$hl = $row->gntextde;

		$besitzer = $row->mid;
		$profile = getProfile($besitzer);

		$output .= '

				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6 col-xs-12 linkbox mb2" ref="'.$dir.$navID[$cid].'galerie+'.$gnid.'/">
				    <div class="hovereffect">
				        <img class="img-responsive" src="'.$dir.'mthumb.php?w=800&amp;h=400&amp;zc=1&amp;src=Galerie/'.$morpheus["GaleryPath"].'/'.$ordner.'/'.urlencode($img).'">
			            <div class="overlay">
			                <h2>'.$hl.'</h2>
							<p>'.$textde.'</p>
							<p><a href="'.$dir.$navID[8].'edit+'.$gnid.'/"><i class="fa fa-pencil tool mb2"></i></a></p>
							<p><a href="'.$dir.$navID[8].'edit+'.$gnid.'/"><i class="fa fa-eraser tool"></i></a></p>
			            </div>
				    </div>
				</div>
		';
	}


	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// HASHTAGS // FAVOURITE PHOTOS
	$tagList = getAllTags($id, $art='image');
	ksort($tagList);
	$filterButton = '<h2><b>#Hashtag & Likes</b></h2>
	        		<hr>

	        		<p><a href="'.$dir.'?likes=all" class="btn btn-default mb1"><i class="fa fa-heart-o"></i> most favourite photos</a></p>
	        		<p><a href="'.$dir.'?likes=my" class="btn btn-default mb1"><i class="fa fa-heart-o"></i> my favourite photos</a></p>';

	foreach($tagList as $arr) {
		$filterButton .= '<a href="'.$dir.'?hashtagid='.$arr[0].'&hashtag='.$arr[1].'" class="btn btn-info hashtagGal">#'.$arr[2].'</a>
';
	}
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

}


// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// JS JS JS  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


if($galerie || $likes || get_guest_id_of_intranet_user() != 0 )		$js = '
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
$grid.addClass(\'is-showing-items\')
// .isotope( \'revealItemElements\', $items );

// bind filter button click
$(\'.filter-button-group\').on( \'click\', \'button\', function() {
  var filterValue = $( this ).attr(\'data-filter\');
  $grid.isotope({ filter: filterValue });
  //$grid.masonry();
});

// change is-checked class on buttons
$(\'.button-group\').each( function( i, buttonGroup ) {
  var $buttonGroup = $( buttonGroup );
  $buttonGroup.on( \'click\', \'button\', function() {
    $buttonGroup.find(\'.is-checked\').removeClass(\'is-checked\');
    $( this ).addClass(\'is-checked\');
  });
});


    $(".loveit").click(function () {
	    var obj = $(this);
	    id = obj.attr("ref");
	    var onoff = obj.hasClass("fa-heart-o");

	    request = $.ajax({
	        url: "'.$dir.'morpheus/UpdateLikes.php",
	        type: "post",
	        data: "onoff="+onoff+"&mid='.$mid.'&id="+id+"&feld=gid&table=morp_cms_galerie_likes",
	        success: function(data) {
				if(onoff == true) { obj.removeClass("fa-heart-o lightBlue"); obj.addClass("fa-heart"); console.log(1); }
				else { obj.removeClass("fa-heart");  obj.addClass("fa-heart-o lightBlue"); console.log(0); }
  			}
	    });
    });


';


// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


$morp = "Galery $text";


?>