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

//print_r($_GET); die();


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
	<h2><a href="'.$dir.$navID[$hn_id].'" class="btn btn-info"><i class="fa fa-chevron-left"></i></a> &nbsp;  Anzahl Fotos: '.$x.' '.($likes == "all" ? '// beliebteste Bilder' : '// Mein Favoriten').'</h2>
		<hr>

    <div class="grid">
';

	$output .= set_thumb_gallery($res, 1, false);
	$output .= '
	</div>
';

$filterButton = '';

} else if($galerie && $galerie == 'search') {
    $seach_value = $_GET['search_value'];
    $page = (isset($_GET['page'])) ? $_GET['page'] : 1;

    $number = (isset($_GET['number'])) ? $_GET['number'] : 20;
    $_SESSION['number_per_page'] = $number;


    $category_id = ($_GET['category_id'] != '') ? $_GET['category_id'] : 0;

    $hashtags = ($_GET['hashtags'] != null && $_GET['hashtags'] != '') ? $_GET['hashtags'] : '';
    $hashtags = ($hashtags != '') ? explode(',', $hashtags) : array();

    /*$total_search = get_total_search($seach_value, $hashtags, $category_id);
    $number = ($number > $total_search) ? $total_search : $number;

    $count_page = ($total_search > 0) ? ceil($total_search/$number) : 1;
    $page = ($page < $count_page) ? $page : $count_page;

    $start = $number * ($page - 1);*/
    //echo $count_page;

    $sort_gallery = sort_array_gallery();

    if($category_id == 0)
     $que = "SELECT * FROM `morp_cms_galerie` g where (g.gtextde like '%".$seach_value."%' OR g.keyword like '%".$seach_value."%') ";
    else
     $que = "SELECT * FROM `morp_cms_galerie` g where g.gnid = ".$category_id." AND (g.gtextde like '%".$seach_value."%' OR g.keyword like '%".$seach_value."%') ";

	if(count($hashtags)>0) {
		$que .= " AND ("; 
    	for($i = 0; $i < count($hashtags) -1; $i++){
        	// if($i < count($hashtags) - 2)
			if($i < 1)
            	$que .= '(g.tags like "%,'.$hashtags[$i].',%" OR g.tags like "'.$hashtags[$i].',%")';
        	else
            	$que .= ' AND (g.tags like "%,'.$hashtags[$i].',%" OR g.tags like "'.$hashtags[$i].',%")';
	
    	}
		$que .= " )"; 
		
    }
    
    // get total search, number page
    $res 	= safe_query($que);
    $total_search = mysqli_num_rows($res);
    $number = ($number > $total_search) ? $total_search : $number;

    $count_page = ($total_search > 0) ? ceil($total_search/$number) : 1;
    $page = ($page < $count_page) ? $page : $count_page;

    $start = $number * ($page - 1);
    // end


    $que .= ' LIMIT '.$start.','.$number.'';
    // echo $que;
    $res 	= safe_query($que);
    //$total_search= mysqli_num_rows($res);

    //echo $start . '/' . $number . '/' . $total_search;
    $start_number = ($start + $number > $total_search) ? $total_search : ($start + $number);
    //$start_number = ($start + $number > $total_search) ? ($start + $countItem) : ($start + $number);

    $output = '<br><a href="#" class="btn btn-info show_folder" data-toggle="modal" data-target="#myModal_add_folder">+ Selektierte persönlichen Ordner hinzufügen</a>';

    $output .= '<a href="#" class="btn btn-info add_keyword_search" data-toggle="modal" data-target="#myModal_change_keyword">Add keyword</a>';
    
    $output .= '<a href="#" class="btn btn-info add_hashtags_image mb15" data-toggle="modal" data-target="#myModal_add_hashtags_image"> Suchbegriffe hinzufugen <i class="fa fa-plus"></i></a>';

    
    //$output .= '<div class="infor_number col-md-6">'.($start + 1).'-'.$start_number.' of '.$total_search.'</div>';

    /*$output .= '<div class="infor_pagination">';

    $output .= '<a href="#" class="previous_pagination"><</a>';

    for($i = 1; $i <= $count_page; $i++){
        //$active = '';

        //if($i == $page)
          //$active = 'active';
        
        $output .= ($i == $page) ? '<a class="number_pagination active"><input type="text" value="'.$i.'"/></a>' :
        '<a href="#'.$i.'" class="number_pagination">'.$i.'</a>'; 

        //$output .= '<a href="#'.$i.'" class="number_pagination '.$active.'">'.$i.'</a>';
        //$output .= '<a href="#'.$i.'" class="number_pagination '.$active.'"><input type="text" value="'.$i.'"/></a>';
        
    }


    $output .= '<a href="#" class="next_pagination">></a>';

    $output .= '<a class="number_page">insgesamt '.$count_page.' Seiten</a>';
    

    $output .= '</div><br>'; */

    $output .= showPageSelection($count_page, $page, $start, $start_number, $total_search);

    $output .= '
    <div class="grid">
	';

    $output .= set_thumb_gallery_search($res, $sort_gallery);

    $output .= '
		<input type="hidden" name="category_id" id="category_id" value='.$category_id.' />
        </div>';

    $output .= showPageSelection($count_page, $page, $start, $start_number, $total_search);

    $output = ($total_search > 0) ? $output : '<br> <input type="hidden" name="category_id" id="category_id" value='.$category_id.' />  Keine Daten';

    echo $output; die();
} else if($galerie && $galerie == 'update') {
    $text = $_GET["myText"];
    $keyWord = $_GET["keyWord"];
    $hashtags= $_GET["hashtags"];
    $pos_1 = 'gtextde';
    $pos_2 = 'tags';	
    $pos_3 = 'keyword';
    $feld = $_GET["feld"];
    $table = $_GET["table"];
    $id = $_GET["id"];

    if($table && $feld && $id) {
    	$sql = "UPDATE $table set $pos_1='$text', $pos_2='$hashtags', $pos_3='$keyWord' WHERE $feld=$id";
        //echo $sql; die();
        safe_query($sql);
    }
} else if($galerie && $galerie == 'modal') {
    $output = '<div class="row show_infor">';

    $output .= '<div class="col-md-12">
                  <a class="edit_" href="javascript:void(0)"><i class="fa fa-edit"></i></a>
                  <br>
                  <div class="alert alert-success hide" role="alert">... gespeichert update</div>
                </div>';

    $output .= '<div class="content">';

    $output .= '<div class="col-md-5">';

    $data = $_GET['data'];
    $data = explode(',', $data);

    $que  	= "SELECT * FROM `morp_cms_galerie_name` n, `morp_cms_galerie` g WHERE g.gid=".$data[0]." AND g.gnid=n.gnid ORDER BY g.sort";
	//$que  	= "SELECT * FROM `morp_cms_galerie` g WHERE g.gid = ".$data[0]." ORDER BY g.sort";
    $res 	= safe_query($que);

    while ($row = mysqli_fetch_object($res)) {
        $textde = $row->gtextde;
        $hashtags = $row->tags;
        $keyWord = $row->keyword;
        $author = $row->author;
        

        $src = $dir . 'Galerie/' . $morpheus['GaleryPath'] . '/' . $data[1] . '/' . $data[0] . '/' . $morpheus['large'] . '/' . set_name_image($row->gname);

        $output .= '<img class="img-responsive" src="'.$src.'" />';

        $output .= '<a href="' . $dir . 'download-img.php?dfile=Galerie/' . $morpheus["GaleryPath"] .
            '/' . $data[1]  . '/'.$data[0] .'/'.$morpheus["Original"].'/' . urlencode($row->gname) .
            '" class="bild_her">Bild herunterladen</a>';

        $output .= '</div>';

        $output .= '<div class="col-md-7">';

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

        $output .= '<p class="lead">Bildname: ';
        $output .= '<b>'.str_replace('.jpg', '', $row->gname).'</b></p>';

        $output .= '<div class="image_information">';

        $output .= '<div class="infor_row"><p class="property">Autor:</p> <p class="value"> '.$author.' </p></div>';
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


        $output .= '</div></div></div>';

        $output .=
            '
            <div class="row relative show_edit hide">
        	    <div class="col-md-12"><a href="javascript:void(0)" class="arrow-back"><i class="fa fa-arrow-left" aria-hidden="true"></i></a></div>
                <br><br>
                <div class="col-md-6">
                  <textarea class="galedit form-control" name="t'.$data[0].'" id="t'.$data[0].'" ref="s'.$data[0].'" placeholder="Bild Beschreibung">'.$textde.'</textarea>
                  <input id="keyword'.$data[0].'" placeholder="Keyword" value="'.$keyWord.'" />
                </div>
            ';

        $output .= '<div class="col-md-6">' . listHashtagsGalery($hashtags) . '</div>'.'
                    <br><div class="col-md-12"><button class="btn btn-info saveText" ref="'.$data[0].'" id="s'.$data[0].'"><i class="fa fa-save"></i></button></div>';

        $output .= '</div>';


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
        $output .= '<div class="col-md-3"><div class="folder"><input type="radio" name="folder" value="'.$row->folderID .'">'.$row->folder_name .'<a href="#'.$row->folderID .'" class="delete_folder hide"><i class="fa fa-window-close" aria-hidden="true"></i></a><a href="#'.$row->folderID .'" class="delete_folder_confirm"><i class="fa fa-close" aria-hidden="true"></i></a></div></div>';
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

} else if($galerie && $galerie == 'save_keyword_search') {
    $galeries_id = $_GET['galeries_id'];
    $galeries_id = explode(',', $galeries_id);

    $keyword = $_GET['keyword'];

    foreach($galeries_id as $item) {
        $sql = 'update morp_cms_galerie set keyword = "'.$keyword.'" where gid = '.$item.' ';
        safe_query($sql);
    }

    die();

} else if($galerie && $galerie == 'save_hashtags_image') {
    $hashtags = $_GET['hashtags'];
    $hashtags = explode(',', $hashtags);

    $galeries_id = $_GET['galeries_id'];
    $galeries_id = explode(',', $galeries_id);

    foreach($galeries_id as $item) {
        if($item != '') {
            $que  	= "SELECT * FROM `morp_cms_galerie` g WHERE g.gid = ".$item."";
            $res 	= safe_query($que);
            $row = mysqli_fetch_object($res);
            $tags = $row->tags;
            
            //echo $tags; die();
            
            foreach($hashtags as $hashtag) {
                if($hashtag != '') {
                 if($tags == str_replace($hashtag, '', $tags))
                   $tags .= ',' . $hashtag . ','; 
                }
            }
            
            $sql = "UPDATE `morp_cms_galerie` set tags = '".$tags."' WHERE gid = ".$item."";
            //echo $sql; die();
            safe_query($sql);
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

    $output .= '<div class="grid">';

    while ($row = mysqli_fetch_object($res)) {
       $que  	= "SELECT * FROM `morp_cms_galerie_name` n, `morp_cms_galerie` g WHERE g.gid=".$row->gid." AND g.gnid = n.gnid ORDER BY g.sort";
	   $res_1 	= safe_query($que);

       //$output .= set_thumb_gallery($res_1, 0);
       $output .= show_gallery_folder($res_1, $row->imagesID);
    }

    $output .= '</div>';

    $output .= '</div>';

    $output .= '</div>';

    $output = ($x !=0) ? $output : 'Keine Daten';
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

    $output = ($x !=0) ? $output : 'Keine Daten';

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
} else if($galerie && $galerie == 'add_hashtags_image') {
    $table = 'morp_tags_category';
    $primary = 'id';
    $show_col = "name";
    $sorting_col = "name";
    //print_r($_GET); die();
    
    $select = '<div id="sel-cont" class="sel-cont"><select name="select" class="ui selection dropdown bbb" multiple="">';
    
    $sql = "SELECT * FROM $table order by $sorting_col";
    $res = safe_query($sql);
    //$row = mysqli_fetch_object($res);
    
    $num_rows = mysqli_num_rows($res);
    
    $count = 0;
    
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
        
        while ($row_1 = mysqli_fetch_object($res_1))
        {
            $select .= '<option value="' . $row_1->$primary_1 . '">' . $row_1->$show_col_1 .
                '</option>';
        }
    
        $count++;
    
        $select .= ($count < $num_rows) ?
            '</select><select name="select" class="ui selection dropdown vvvv" multiple="">':
        '</select>';
    }
    
        echo $select; die(); 
    
} else if($galerie && $galerie == 'guest') {
    $folder_id = $_GET['folder_id'];
    $data = json_decode($_GET['data']);
    $send_mail = $_GET['send_mail'];

    $response = '';

    foreach($data as $item) {
        $que  	= "SELECT * FROM `morp_cms_galerie_guests` g WHERE g.email = '".$item->email."'";
        //echo $que; die();
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

            //send mail
            if($send_mail == 'true') {
                $subject = 'Login information';

                $headers = "MIME-Version: 1.0" . "\r\n";
                $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

                $message = $morpheus["mail_start"].'<p>Anbei senden wir Ihnen eine Einladung zur Bilddatenbank des Frankfurter Kinderbüro</p>
				<p>Url: ' . $morpheus["url"] . '</p>';
                $message .= '<p>Login: ' . $item->email . '<br>' . 'Pass: ' . $item->password.'</p>';
				$message .= '<p>Start: ' . euro_dat($item->start_date) . '<br>Ende: ' . euro_dat($item->end_date).'</p>';
				$message .= $morpheus["mail_end"];
				
                mail($item->email, $subject, $message, $headers);

                $response = 'Save and send login successfully';
            } else {
                $response = 'Save successfully';
            }

        } else {
            $row = mysqli_fetch_object($res);

            $folder_ids = $row->folder_ids;

            if($folder_ids == str_replace($folder_id, '', $folder_ids))
              $folder_ids .= ',' . $folder_id;

            $sql = "UPDATE morp_cms_galerie_guests set folder_ids='$folder_ids' WHERE username = '".$item->email."'";
            safe_query($sql);

            $response = 'Update successfully';
        }
    }

    echo $response; die();
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
				Sichern
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
} else if($galerie && $galerie == 'setfolder') {
    $data = $_GET['data'];
    $data = explode(',', $data);
    
    $table = 'morp_cms_galerie_guests';
    $field = 'folder_ids';
    $primary = 'guestID';
    
    $que  	= "SELECT $field FROM $table WHERE $primary = ".$data[0];
    $res 	= safe_query($que);
	$row 	= mysqli_fetch_object($res);
    
    $folder_ids = $row->$field;
    $folder_ids = str_replace($data[1], '', $folder_ids);
    
    $que = "update $table set $field = '".$folder_ids."' where $primary = ".$data[0]."";
    safe_query($que);
    
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
    //start add 
    $page = (isset($_GET['page'])) ? $_GET['page'] : 1;
    
    //$number = (isset($_GET['number'])) ? $_GET['number'] : 20;
    $number = (isset($_SESSION['number_per_page'])) ? $_SESSION['number_per_page'] : 20;
    //$_SESSION['number_per_page'] = $number;

    $total_search = get_total_search('', '', $galerie);
    $number = ($number > $total_search) ? $total_search : $number;

    $count_page = ($total_search > 0) ? ceil($total_search/$number) : 1;
    $page = ($page < $count_page) ? $page : $count_page;

    $start = $number * ($page - 1);

    $start_number = ($start + $number > $total_search) ? $total_search : ($start + $number);
    //end
    
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
    //add
    $que .= " LIMIT ".$start.",".$number."";
    //end
	$res 	= safe_query($que);
    $x		= mysqli_num_rows($res);
    
    $tagListButtons = array();

	$output .= '


		<a href="#" class="btn btn-info show_folder mb15" data-toggle="modal" data-target="#myModal_add_folder"> Selektierte persönlichen Ordner hinzufügen <i class="fa fa-plus"></i></a>
        <a href="#" class="btn btn-info add_hashtags_image mb15" data-toggle="modal" data-target="#myModal_add_hashtags_image"> Suchbegriffe hinzufugen <i class="fa fa-plus"></i></a>
        <a href="'.$dir.$navID[10].'edit+'.$galerie.'/" class="btn btn-info mb15">Bilder hochladen <i class="fa fa-plus"></i> </a>
                  
        <input type="hidden" name="category_id" id="category_id" value='.$galerie.' />
    ';
    
    //start add 
    $pagination .= '<br><div class="infor_number col-md-6">'.($start + 1).'-'.$start_number.' of '.$total_search.'</div>';

    /*$output .= '<select class="number_page form-control" data-show-content="true">';
    $output .= ($_SESSION["number_per_page"] == 5) ? '<option selected value="20">20</option>' : '<option value="20">20</option>';
    $output .= ($_SESSION["number_per_page"] == 40) ? '<option selected value="40">40</option>' : '<option value="40">40</option>';
    $output .= ($_SESSION["number_per_page"] == 60) ? '<option selected value="60">60</option>' : '<option value="60">60</option>';
    $output .= ($_SESSION["number_per_page"] == 80) ? '<option selected value="80">80</option>' : '<option value="80">80</option>';
    $output .= '</select>';*/

    $pagination .= '<div class="infor_pagination">';

    $pagination .= ($page == 1) ? '<a href="#" class="previous_pagination gallery"><</a>' : '<a href="'.$dir.'home/galerie+'.$galerie.'/?page='.($page - 1).'" class="previous_pagination gallery"><</a>';

    for($i = 1; $i <= $count_page; $i++){
        $pagination .= ($i == $page) ? '<a href="#home/galerie" class="number_pagination gallery active"><input type="text" value="'.$i.'"/></a>' :
        '<a href="#'.$i.'" class="number_pagination gallery">'.$i.'</a>'; 
    }

    $pagination .= ($page == $count_page) ? '<a href="#" class="next_pagination gallery">></a>' : '<a href="'.$dir.'home/galerie+'.$galerie.'/?page='.($page + 1).'" class="next_pagination show_gallery">></a>' ;

    $pagination .= '<a class="number_page">insgesamt '.$count_page.' Seiten</a>';
    
    $pagination .= '</div><br><br>';
    //end
    $output .= $pagination;
    $output .='<div class="grid">';
    $output .= set_thumb_gallery($res, 1);
    $output .= '</div>'.$pagination;

$filterButton = '';
/*$filterButton = '
	<p class="mb6">&nbsp</p>
	<a href="'.$dir.$navID[10].'edit+'.$galerie.'/" class="btn btn-info"><i class="fa fa-plus"></i> Add Photos / Files</a>
';*/
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
    if(!get_permission_guest()) {
        $output = 'you are expired to access resource';
        return;
    }

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

    $filterButton = '';

}
else {
	$output .= '<div class="row">
    ';

    $que = "SELECT * FROM `morp_cms_galerie_name` n WHERE sichtbar=1 ORDER BY n.gnname";
    //echo $que; die();
    $res 	= safe_query($que);

    while ($row = mysqli_fetch_object($res)) {
       $que = "SELECT * FROM `morp_cms_galerie` g WHERE  g.gnid=".$row->gnid." order by RAND() LIMIT 0,1";
	   // 	echo "$que <br>";
        //echo $que; die();
    $res_ 	= safe_query($que);
	$x		= mysqli_num_rows($res_);
	$n = 0;
	$galerie = 1;

    $ordner = $row->gnname;
	$gnid 	= $row->gnid;

	$textde = $row->textde;
	$hl = $row->gntextde;

    if($x > 0) {
       while ($row_ = mysqli_fetch_object($res_)) {
    		$n++;
    		$img = $row_->gname;
            $gid = $row_->gid;

    		$besitzer = $row_->mid;
    		$profile = getProfile($besitzer);

    		$output .= '
    				<div class="col-md-3 col-sm-6 linkbox mb2" ref="'.$dir.$navID[$cid].'galerie+'.$gnid.'/">
    				    <div class="hovereffect">
    				        <img class="img-responsive" src="'.$dir.'mthumb.php?w=300&amp;h=400&amp;q=100&amp;src=Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["thumb"] . '/' . urlencode(set_name_image($img)).'">
    			            <div class="overlay">
    			                <h2>'.$hl.'</h2>
    							<p>'.$textde.'</p>
    							<!--<p><a href="'.$dir.$navID[8].'edit+'.$gnid.'/"><i class="fa fa-pencil tool mb2"></i></a></p>-->
    							<p><a href="'.$dir.$navID[8].'edit+'.$gnid.'/"><i class="fa fa-eraser tool"></i></a></p>
    			            </div>
    				    </div>
    				</div>
    		';
	   }
    } else {
        $hl = $row->gnname;
        $output .= '
    				<div class="col-md-3 col-sm-6 linkbox mb2" ref="'.$dir.$navID[$cid].'galerie+'.$gnid.'/">
    				    <div class="hovereffect">
    				        <img class="img-responsive no-upload" src="'.$dir.'mthumb.php?w=300&amp;h=400&amp;q=100&amp;src=Galerie/no_upload.jpg">
    			            <div class="overlay">
    			                <h2>'.$hl.'</h2>
    							<p>'.$textde.'</p>
    							<!--<p><a href="'.$dir.$navID[8].'edit+'.$gnid.'/"><i class="fa fa-pencil tool mb2"></i></a></p>-->
    							<p><a href="'.$dir.$navID[8].'edit+'.$gnid.'/"><i class="fa fa-eraser tool"></i></a></p>
    			            </div>
    				    </div>
    				</div>
    		';
    }

  }
    $output .= '</div>';


	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	// HASHTAGS // FAVOURITE PHOTOS
	$tagList = getAllTags($id, $art='image');
	ksort($tagList);
	/*$filterButton = '
                     <a class="left_bottom icon_start" href="'.$dir.'?likes=all" class="btn btn-default mb1"> MY favourite photos</a>
	        		<a class="left_bottom icon_heart" href="'.$dir.'?likes=my" class="btn btn-default mb1">most favourite photos</a>';*/

	/*foreach($tagList as $arr) {
		$filterButton .= '<a href="'.$dir.'?hashtagid='.$arr[0].'&hashtag='.$arr[1].'" class="btn btn-info hashtagGal">#'.$arr[2].'</a>
';
	}*/
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
	    var onoff = !obj.hasClass("lightBlue");

	    request = $.ajax({
	        url: "'.$dir.'morpheus/UpdateLikes.php",
	        type: "post",
	        data: "onoff="+onoff+"&mid='.$mid.'&id="+id+"&feld=gid&table=morp_cms_galerie_likes",
	        success: function(data) {
				if(onoff == true) { obj.addClass("lightBlue"); console.log(1); }
				else { obj.removeClass("lightBlue"); console.log(0); }
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