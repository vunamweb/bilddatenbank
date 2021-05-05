<?php

global $img_pfad, $dir, $navID, $lan, $morpheus, $js;

# ========================================================================#
#  Requires : Requires PHP5, GD library.
#  Usage Example:
#                     include("resize_class.php");
#                     $resizeObj = new resize('images/cars/large/input.jpg');
#                     $resizeObj -> resizeImage(150, 100, 0);
#                     $resizeObj -> saveImage('images/cars/large/output.jpg', 100);
# ========================================================================#


class resize
{
    // *** Class variables
    private $image;
    private $width;
    private $height;
    private $imageResized;

    function __construct($fileName)
    {
        // *** Open up the file
        $this->image = $this->openImage($fileName);

        // *** Get width and height
        $this->width = imagesx($this->image);
        $this->height = imagesy($this->image);
    }

    ## --------------------------------------------------------

    private function openImage($file)
    {
        // *** Get extension
        $extension = strtolower(strrchr($file, '.'));

        switch ($extension)
        {
            case '.jpg':
            case '.jpeg':
                $img = @imagecreatefromjpeg($file);
                break;
            case '.gif':
                $img = @imagecreatefromgif($file);
                break;
            case '.png':
                $img = @imagecreatefrompng($file);
                break;
            default:
                $img = false;
                break;
        }
        return $img;
    }

    ## --------------------------------------------------------

    public function resizeImage($newWidth, $newHeight, $option = "auto")
    {
        // *** Get optimal width and height - based on $option
        $optionArray = $this->getDimensions($newWidth, $newHeight, $option);

        $optimalWidth = $optionArray['optimalWidth'];
        $optimalHeight = $optionArray['optimalHeight'];


        // *** Resample - create image canvas of x, y size
        $this->imageResized = imagecreatetruecolor($optimalWidth, $optimalHeight);
        imagecopyresampled($this->imageResized, $this->image, 0, 0, 0, 0, $optimalWidth,
            $optimalHeight, $this->width, $this->height);


        // *** if option is 'crop', then crop too
        if ($option == 'crop')
        {
            $this->crop($optimalWidth, $optimalHeight, $newWidth, $newHeight);
        }
    }

    ## --------------------------------------------------------

    private function getDimensions($newWidth, $newHeight, $option)
    {

        switch ($option)
        {
            case 'exact':
                $optimalWidth = $newWidth;
                $optimalHeight = $newHeight;
                break;
            case 'portrait':
                $optimalWidth = $this->getSizeByFixedHeight($newHeight);
                $optimalHeight = $newHeight;
                break;
            case 'landscape':
                $optimalWidth = $newWidth;
                $optimalHeight = $this->getSizeByFixedWidth($newWidth);
                break;
            case 'auto':
                $optionArray = $this->getSizeByAuto($newWidth, $newHeight);
                $optimalWidth = $optionArray['optimalWidth'];
                $optimalHeight = $optionArray['optimalHeight'];
                break;
            case 'crop':
                $optionArray = $this->getOptimalCrop($newWidth, $newHeight);
                $optimalWidth = $optionArray['optimalWidth'];
                $optimalHeight = $optionArray['optimalHeight'];
                break;
        }
        return array('optimalWidth' => $optimalWidth, 'optimalHeight' => $optimalHeight);
    }

    ## --------------------------------------------------------

    private function getSizeByFixedHeight($newHeight)
    {
        $ratio = $this->width / $this->height;
        $newWidth = $newHeight * $ratio;
        return $newWidth;
    }

    private function getSizeByFixedWidth($newWidth)
    {
        $ratio = $this->height / $this->width;
        $newHeight = $newWidth * $ratio;
        return $newHeight;
    }

    private function getSizeByAuto($newWidth, $newHeight)
    {
        if ($this->height < $this->width)
            // *** Image to be resized is wider (landscape)
        {
            $optimalWidth = $newWidth;
            $optimalHeight = $this->getSizeByFixedWidth($newWidth);
        } elseif ($this->height > $this->width)
        // *** Image to be resized is taller (portrait)
        {
            $optimalWidth = $this->getSizeByFixedHeight($newHeight);
            $optimalHeight = $newHeight;
        } else // *** Image to be resizerd is a square
        {
            if ($newHeight < $newWidth)
            {
                $optimalWidth = $newWidth;
                $optimalHeight = $this->getSizeByFixedWidth($newWidth);
            } else
                if ($newHeight > $newWidth)
                {
                    $optimalWidth = $this->getSizeByFixedHeight($newHeight);
                    $optimalHeight = $newHeight;
                } else
                {
                    // *** Sqaure being resized to a square
                    $optimalWidth = $newWidth;
                    $optimalHeight = $newHeight;
                }
        }

        return array('optimalWidth' => $optimalWidth, 'optimalHeight' => $optimalHeight);
    }

    ## --------------------------------------------------------

    private function getOptimalCrop($newWidth, $newHeight)
    {

        $heightRatio = $this->height / $newHeight;
        $widthRatio = $this->width / $newWidth;

        if ($heightRatio < $widthRatio)
        {
            $optimalRatio = $heightRatio;
        } else
        {
            $optimalRatio = $widthRatio;
        }

        $optimalHeight = $this->height / $optimalRatio;
        $optimalWidth = $this->width / $optimalRatio;

        return array('optimalWidth' => $optimalWidth, 'optimalHeight' => $optimalHeight);
    }

    ## --------------------------------------------------------

    private function crop($optimalWidth, $optimalHeight, $newWidth, $newHeight)
    {
        // *** Find center - this will be used for the crop
        $cropStartX = ($optimalWidth / 2) - ($newWidth / 2);
        $cropStartY = ($optimalHeight / 2) - ($newHeight / 2);

        $crop = $this->imageResized;
        //imagedestroy($this->imageResized);

        // *** Now crop from center to exact requested size
        $this->imageResized = imagecreatetruecolor($newWidth, $newHeight);
        imagecopyresampled($this->imageResized, $crop, 0, 0, $cropStartX, $cropStartY, $newWidth,
            $newHeight, $newWidth, $newHeight);
    }

    ## --------------------------------------------------------

    public function saveImage($savePath, $imageQuality = "100")
    {
        // *** Get extension
        $extension = strrchr($savePath, '.');
        $extension = strtolower($extension);

        switch ($extension)
        {
            case '.jpg':
            case '.jpeg':
                if (imagetypes() & IMG_JPG)
                {
                    imagejpeg($this->imageResized, $savePath, $imageQuality);
                }
                break;

            case '.gif':
                if (imagetypes() & IMG_GIF)
                {
                    imagegif($this->imageResized, $savePath);
                }
                break;

            case '.png':
                // *** Scale quality from 0-100 to 0-9
                $scaleQuality = round(($imageQuality / 100) * 9);

                // *** Invert quality setting as 0 is best, not 9
                $invertScaleQuality = 9 - $scaleQuality;

                if (imagetypes() & IMG_PNG)
                {
                    imagepng($this->imageResized, $savePath, $invertScaleQuality);
                }
                break;

                // ... etc

            default:
                // *** No extension - No save.
                break;
        }

        imagedestroy($this->imageResized);
    }


    ## --------------------------------------------------------

}


function set_name_image($img) {
    $replace = array('JPG', 'PNG', 'png', 'psd', 'PSD', 'pdf', 'PDF', 'ai', 'AI', 'eps', 'EPS', 'tif', 'TIF', 'tiff', 'TIFF', 'GIF', 'gif');

    return str_replace($replace, 'jpg', $img);
}

function sort_array_gallery() {
    $result = array();

    $que  	= "SELECT * FROM `morp_cms_galerie_name`";
	$res 	= safe_query($que);

    while ($row = mysqli_fetch_object($res)) {
       $result[$row->gnid] = $row->gnname;
    }

    return $result;
}

function orginalDate($date) {
    $date = str_replace(':', '-', $date);

    return euro_dat($date);
}

function get_total_search($seach_value, $hashtags, $category_id) {
    if($category_id == 0)
     $que = "SELECT * FROM `morp_cms_galerie` g where (g.gtextde like '%".$seach_value."%' OR g.keyword like '%".$seach_value."%') AND (g.tags ";
    else
     $que = "SELECT * FROM `morp_cms_galerie` g where g.gnid = ".$category_id." AND (g.gtextde like '%".$seach_value."%' OR g.keyword like '%".$seach_value."%') AND (g.tags ";

    for($i = 0; $i < count($hashtags) -1; $i++){
        if($i < count($hashtags) - 2)
            $que .= 'like "%'.$hashtags[$i].'%" AND g.tags ';
        else
            $que .= 'like "%'.$hashtags[$i].'%"';

    }

    $que .= ')';

    $res 	= safe_query($que);

    return mysqli_num_rows($res);
}

function set_thumb_gallery_search($res, $sort_gallery)
{
    global $dir, $morpheus, $js, $mid;
    global $filter, $tagListButtons, $filterButton;

    $gallery_list = '';

    while ($row = mysqli_fetch_object($res))
    {
        $img = $row->gname;
        //$img = set_name_image($img);

        $tn = $row->tn;
        $gnid = $row->gnid;
        $ordner = $sort_gallery[$gnid];
        $gid = $row->gid;
        $textde = $row->gtextde;
        $hl = $row->gtexten;

        $tagList = $row->tags;
        $tagList = explode(',', $tagList);
        // print_r($tagList);
        $filter = '';

        foreach ($tagList as $arr)
         if($arr != '')
          $filter .= 'tag_' . $arr . ' ';

        $noOfComments = '';
        if ($mid)
            $hasLike = isLike($mid, "morp_cms_galerie_likes", "gid", $gid);
        $noOfLikes = countLikes("morp_cms_galerie_likes", "gid", $gid);
        $hasComment = hasComment("morp_cms_galerie_comments", "gid", $gid);
        $noOfComments = countComments("morp_cms_galerie_comments", "gid", $gid);

        check_image($ordner, $gid, $img);

        $gallery_list .= '

	<div class="grid-item grid-sizer tag ' . $filter . '">
	    <div class="gal-item item_image">
            <div class="edit_delete_image max_view">
              <a href="#" data-target="#demoLightbox'.$gid.'" data-toggle="modal"  class="tool"><img src="'.$dir.'images/1x/close.png" /></a>
              <a class="delete_galerie_folders_images hide" href="'.$gid.'"><img src="images/1x/close.png"></a>
              <a class="delete_galerie_folders_images_confirm tool" href="#'.$gid.'"><i class="fa fa-trash-o"></i></a>
              </div>
            <div class="modal" id="demoLightbox'.$gid.'" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
                                <!-- Modal Header -->
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                              </div>
								<!-- Modal body -->
								<div class="modal-body">
								  <img class="img-fluid not-opacity" src="'.$dir.'Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["large"] . '/' . set_name_image($img).'">

                                </div>
							</div>
						</div>
             </div>
             <div class="favourite_image">
                  <a href="' . $dir . 'download-img.php?dfile=Galerie/' . $morpheus["GaleryPath"] . '/' . $ordner . '/'.$gid.'/'.$morpheus["Original"].'/' . urlencode($img) . '" class="galIcons i4 tool hide"><i class="fa fa-download tool"></i></a>
                  <a ref="' . $gid . '" class="tool loveit ' . ($hasLike ? 'lightBlue' :
                '') . '" href="#'.$gid.'"><i class="fa fa-heart" aria-hidden="true"></i></a>
                  <a class="tool hide" href="#'.$gid.'"><img src="'.$dir.'images/1x/heart_favourite.png" /></a>
                  <div class="btn-group btn-group-gallery '.$showCb.'" data-toggle="buttons">
						<label class="btn btn-default btn-transp"><input type="checkbox" class="checkbox hide" value="'.$gid.'" name="add_to_folder">
							<div class="rahmen"><span class="fa fa-check"></span></div>
						</label>
	              </div>
                </div>
	        <a class="show_galery" href="#'.$gid.','.$ordner.'" data-toggle="modal" data-target="#myModal">
              <img alt="'.$img.'" title="'.$img.'" class="img-responsive" src="'.$dir.'Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["thumb"] . '/' . set_name_image($img).'">
            </a>

	        <div class="inner">
	            <div class="gal-Desc hide">
		            <h2>' . $hl . '</h2>
					<p>' . $textde . '</p>
				</div>

	            <div class="gal-Icons">
					<a href="' . $dir . 'download-img.php?dfile=Galerie/' . $morpheus["GaleryPath"] .
            '/' . $ordner . '/'.$gid.'/'.$morpheus["Original"].'/' . urlencode($img) .
            '" class="galIcons i4 hide"><i class="fa fa-download tool"></i></a>
	            	<span class="galIcons hide"><i class="fa fa-heart' . ($hasLike ? '' :
            '-o lightBlue') . ' tool loveit" ref="' . $gid .
            '"></i> <span class="noOfLikes hide">' . $noOfLikes . '</span></span>
					<span class="galIcons hide"><a href="' . $dir .
            '?hn=galerien&cont=gallery-comment&sn2=gallery-comment&galerie=' . $gnid .
            '&foto=' . $gid . '"><i class="fa fa-comments' . ($hasComment ? '' :
            '-o lightBlue') . ' tool"></i>  <span class="noOfLikes">' . $noOfComments .
            '</span></a></span>

					<div class="btn-group btn-group-gallery hide '.$showCb.'" data-toggle="buttons">
						<label class="btn btn-default btn-transp"><input type="checkbox" class="checkbox hide" value="'.$gid.'" name="add_to_folder">
							<div class="rahmen"><span class="fa fa-check"></span></div>
						</label>
					</div>

				</div>
	        </div>

	    </div>
	</div>';

    }

    if ($setFilter)
    {
        $filterButton = '
		<div id="" class="button-group filter-button-group">
			<button class="btn btn-info is-checked" data-filter="*">All Photos</button>
';

        foreach ($tagListButtons as $key => $val)
        {
            $filterButton .= '			<button class="btn btn-info" data-filter=".' . $key .
                '"># ' . $val . '</button>
';
        }

        $filterButton .= '
		</div>
';
    }


    return $gallery_list;
}

function check_image($ordner, $gid, $img) {
    global $morpheus;

    $targetFile = $_SERVER['DOCUMENT_ROOT'].'/Galerie/'.$morpheus["GaleryPath"].'/' . $ordner. '/' . $gid . '/' . $morpheus['Original'] . '/' . $img;
    $ImgThumb = $_SERVER['DOCUMENT_ROOT'].'/Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["thumb"] . '/' . set_name_image($img);
    $ImgLarge = $_SERVER['DOCUMENT_ROOT'].'/Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["large"] . '/' . set_name_image($img);

    $im = new Imagick($targetFile);
    $width = $im->getImageWidth();
    $height = $im->getImageHeight();

    $widthThumbResize = $morpheus['thumb_width'];
    $heighThumbResize = round(($height * $widthThumbResize)/$width);

    $widthLargeResize = $morpheus['large_width'];
    $heighLargeResize = round(($height * $widthLargeResize)/$width);

    /*if($gid == 816) {
        echo $ImgThumb . '<br/>' . $ImgLarge . '<br/>';
        echo file_exists($ImgThumb) . '<br/>' . file_exists($ImgLarge);
    }*/

    // if(!file_exists($ImgThumb)) {
    if(!file_exists($ImgThumb)) {
        $thumbFile = $_SERVER['DOCUMENT_ROOT'].'/Galerie/'.$morpheus["GaleryPath"].'/' . $ordner. '/' . $gid . '/' . $morpheus['thumb'] . '/';
        //echo $ImgThumb . '<br/>';
        makeImage($targetFile, $thumbFile, $widthThumbResize, $heighThumbResize, false);
	}

    //if(!file_exists($ImgLarge)) {
    if(!file_exists($ImgLarge)) {
        $largeFile = $_SERVER['DOCUMENT_ROOT'].'/Galerie/'.$morpheus["GaleryPath"].'/' . $ordner. '/' . $gid . '/' . $morpheus['large'] . '/';
        //echo $ImgLarge . '<br/>';
        makeImage($targetFile, $largeFile, $widthLargeResize, $heighLargeResize, false);
    }
}

function check_image_exists($ordner, $gid, $img) {
    global $morpheus;

    $targetFile = $_SERVER['DOCUMENT_ROOT'].'/Galerie/'.$morpheus["GaleryPath"].'/' . $ordner. '/' . $gid . '/' . $morpheus['Original'] . '/' . $img;
    $ImgThumb = $_SERVER['DOCUMENT_ROOT'].'/Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["thumb"] . '/' . set_name_image($img);
    $ImgLarge = $_SERVER['DOCUMENT_ROOT'].'/Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["large"] . '/' . set_name_image($img);
    $ImgOriginal = $_SERVER['DOCUMENT_ROOT'].'/Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["Original"] . '/' . set_name_image($img);

    if(file_exists($ImgOriginal)) 
      
	    if(!file_exists($ImgThumb)  || !file_exists($ImgLarge)) {
		    // echo "no file / ";
		    $im = new Imagick($targetFile);
		    $width = $im->getImageWidth();
		    $height = $im->getImageHeight();
		
		    $widthThumbResize = $morpheus['thumb_width'];
		    $heighThumbResize = round(($height * $widthThumbResize)/$width);
		
		    $widthLargeResize = $morpheus['large_width'];
		    $heighLargeResize = round(($height * $widthLargeResize)/$width);
		
		    /*if($gid == 816) {
		        echo $ImgThumb . '<br/>' . $ImgLarge . '<br/>';
		        echo file_exists($ImgThumb) . '<br/>' . file_exists($ImgLarge);
		    }*/
		
		    // if(!file_exists($ImgThumb)) {
		    if(!file_exists($ImgThumb)) {
		        $thumbFile = $_SERVER['DOCUMENT_ROOT'].'/Galerie/'.$morpheus["GaleryPath"].'/' . $ordner. '/' . $gid . '/' . $morpheus['thumb'] . '/';
		        // echo $ImgThumb . '<br/>';
		        makeImage($targetFile, $thumbFile, $widthThumbResize, $heighThumbResize, false);
			}
		
		    //if(!file_exists($ImgLarge)) {
		    if(!file_exists($ImgLarge)) {
		        $largeFile = $_SERVER['DOCUMENT_ROOT'].'/Galerie/'.$morpheus["GaleryPath"].'/' . $ordner. '/' . $gid . '/' . $morpheus['large'] . '/';
		        // echo $ImgLarge . '<br/>';
		        makeImage($targetFile, $largeFile, $widthLargeResize, $heighLargeResize, false);
		    }
	    }
}


function set_thumb_gallery($res, $setFilter = 0, $showcheckbox = true)
{
    global $dir, $morpheus, $js, $mid;
    global $filter, $tagListButtons, $filterButton;

    $gallery_list = '';

    $showCb = (!$showcheckbox) ? 'hide' : '';

    while ($row = mysqli_fetch_object($res))
    {
        $img = $row->gname;
        //$img = set_name_image($img);

        $tn = $row->tn;
        $ordner = $row->gnname;
        $gnid = $row->gnid;
        $gid = $row->gid;
        $textde = $row->gtextde;
        $hl = $row->gtexten;

        $tagList = $row->tags;
        $tagList = explode(',', $tagList);
        // print_r($tagList);
        $filter = '';

        foreach ($tagList as $arr)
         if($arr != '')
          $filter .= 'tag_' . $arr . ' ';

        $noOfComments = '';
        if ($mid)
            $hasLike = isLike($mid, "morp_cms_galerie_likes", "gid", $gid);
        $noOfLikes = countLikes("morp_cms_galerie_likes", "gid", $gid);
        $hasComment = hasComment("morp_cms_galerie_comments", "gid", $gid);
        $noOfComments = countComments("morp_cms_galerie_comments", "gid", $gid);

        // check_image($ordner, $gid, $img); /// Bjoern
        check_image_exists($ordner, $gid, $img);

        $ImgOriginal = $_SERVER['DOCUMENT_ROOT'] . '/Galerie/' . $morpheus["GaleryPath"] . '/' . $ordner . '/' . $gid . '/' . $morpheus["Original"] . '/' . $img;
       if (file_exists($ImgOriginal)) {
            $src_large = $dir . 'Galerie/' . $morpheus["GaleryPath"] . '/' . $ordner . '/' . $gid . '/' . $morpheus["large"] . '/' . set_name_image($img);
            $src_thumb = $dir . 'Galerie/' . $morpheus["GaleryPath"] . '/' . $ordner . '/' . $gid . '/' . $morpheus["thumb"] . '/' . set_name_image($img);
      } else {
            $src_large = $dir . 'Galerie/' . 'no_upload.jpg';
            $src_thumb = $dir . 'Galerie/' . 'no_upload.jpg';
        }
          
         
        $gallery_list .= '

	<div class="grid-item grid-sizer tag ' . $filter . '">
	    <div class="gal-item item_image">
	        <div class="edit_delete_image max_view">
              <a href="#" data-target="#demoLightbox'.$gid.'" data-toggle="modal"  class="tool"><img src="'.$dir.'images/1x/close.png" /></a>
            </div>
            <div class="modal" id="demoLightbox'.$gid.'" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
								<!-- Modal body -->
								<div class="modal-body">
								  <img class="img-fluid not-opacity" src="'.$src_large.'">

                                </div>
							</div>
						</div>
              </div>
            <div class="favourite_image">
              <a href="' . $dir . 'download-img.php?dfile=Galerie/' . $morpheus["GaleryPath"] . '/' . $ordner . '/'.$gid.'/'.$morpheus["Original"].'/' . urlencode($img) . '" class="galIcons i4 tool hide"><i class="fa fa-download tool"></i></a>
              <a ref="' . $gid . '" class="tool loveit ' . ($hasLike ? 'lightBlue' :
            '') . '" href="#'.$gid.'"><i class="fa fa-heart" aria-hidden="true"></i></a>
              <a class="tool hide" href="#'.$gid.'"><img src="'.$dir.'images/1x/heart_favourite.png" /></a>
              <div class="btn-group btn-group-gallery '.$showCb.'" data-toggle="buttons">
						<label class="btn btn-default btn-transp"><input type="checkbox" class="checkbox hide" value="'.$gid.'" name="add_to_folder">
							<div class="rahmen"><span class="fa fa-check"></span></div>
						</label>
	          </div>
            </div>
            <a class="show_galery" href="#'.$gid.','.$ordner.'" data-toggle="modal" data-target="#myModal">
            	<img class="img-responsive" src="'.$src_thumb.'">
            </a>

	        <div class="inner">
	            <div class="gal-Desc hide">
		            <h2>' . $hl . '</h2>
					<p>' . $textde . '</p>
				</div>


                <div class="gal-Icons">
					<a href="' . $dir . 'download-img.php?dfile=Galerie/' . $morpheus["GaleryPath"] .
            '/' . $ordner . '/'.$gid.'/'.$morpheus["Original"].'/' . urlencode($img) .
            '" class="galIcons i4 hide"><i class="fa fa-download tool"></i></a>
	            	<span class="galIcons hide"><i class="fa fa-heart' . ($hasLike ? '' :
            '-o lightBlue') . ' tool loveit" ref="' . $gid .
            '"></i> <span class="noOfLikes hide">' . $noOfLikes . '</span></span>
					<span class="galIcons hide"><a href="' . $dir .
            '?hn=galerien&cont=gallery-comment&sn2=gallery-comment&galerie=' . $gnid .
            '&foto=' . $gid . '"><i class="fa fa-comments' . ($hasComment ? '' :
            '-o lightBlue') . ' tool"></i>  <span class="noOfLikes">' . $noOfComments .
            '</span></a></span>

					<div class="btn-group btn-group-gallery hide '.$showCb.'" data-toggle="buttons">
						<label class="btn btn-default btn-transp"><input type="checkbox" class="checkbox hide" value="'.$gid.'" name="add_to_folder">
							<div class="rahmen"><span class="fa fa-check"></span></div>
						</label>
					</div>

				</div>
	        </div>

	    </div>
	</div>';

    }

    if ($setFilter)
    {
        $filterButton = '
		<div id="" class="button-group filter-button-group">
			<button class="btn btn-info is-checked" data-filter="*">All Photos</button>
';

        foreach ($tagListButtons as $key => $val)
        {
            $filterButton .= '			<button class="btn btn-info" data-filter=".' . $key .
                '"># ' . $val . '</button>
';
        }

        $filterButton .= '
		</div>
';
    }


    //return 'test';
    return $gallery_list;
}

function set_thumb_gallery_guest($res, $setFilter = 0)
{
    global $dir, $morpheus, $js, $mid;
    global $filter, $tagListButtons, $filterButton;

    $gallery_list = '';

    while ($row = mysqli_fetch_object($res))
    {
        //print_r($row); die();
        $img = $row->gname;
        $tn = $row->tn;
        $ordner = $row->gnname;
        $gnid = $row->gnid;
        $gid = $row->gid;
        $textde = $row->gtextde;
        $hl = $row->gtexten;

        $tagList = $row->tags;
        $tagList = explode(',', $tagList);
        // print_r($tagList);
        $filter = '';

        foreach ($tagList as $arr)
         if($arr != '')
          $filter .= 'tag_' . $arr . ' ';

        $noOfComments = '';
        if ($mid)
            $hasLike = isLike($mid, "morp_cms_galerie_likes", "gid", $gid);
        $noOfLikes = countLikes("morp_cms_galerie_likes", "gid", $gid);
        $hasComment = hasComment("morp_cms_galerie_comments", "gid", $gid);
        $noOfComments = countComments("morp_cms_galerie_comments", "gid", $gid);

        $gallery_list .= '

	<div class="grid-item grid-sizer tag ' . $filter . '">
	    <div class="gal-item">
	        <a class="show_galery" href="#'.$gid.','.$ordner.'" data-toggle="modal" data-target="#myModal">
                 <img class="img-responsive" src="'.$dir.'Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["thumb"] . '/' . urlencode(set_name_image($img)).'">
           </a>

	        <div class="inner">
	            <div class="gal-Desc">
		            <h2>' . $hl . '</h2>
					<p>' . $textde . '</p>
				</div>
	        </div>
	    </div>
	</div>';
}

    if ($setFilter)
    {
        $filterButton = '
		<div id="" class="button-group filter-button-group">
			<button class="btn btn-info is-checked" data-filter="*">All Photos</button>
';

        foreach ($tagListButtons as $key => $val)
        {
            $filterButton .= '			<button class="btn btn-info" data-filter=".' . $key .
                '"># ' . $val . '</button>
';
        }

        $filterButton .= '
		</div>
';
    }


    return $gallery_list;
}

function show_gallery_folder($res, $galerie_folders_images_id)
{
    global $dir, $morpheus, $js, $mid;
    global $filter, $tagListButtons, $filterButton;

    $gallery_list = '';

    while ($row = mysqli_fetch_object($res))
    {
        //print_r($row); die();
        $img = $row->gname;
        $img = set_name_image($img);

        $tn = $row->tn;
        $ordner = $row->gnname;
        $gnid = $row->gnid;
        $gid = $row->gid;
        $textde = $row->gtextde;
        $hl = $row->gtexten;

        $gallery_list .= '

	    <div class="grid-item grid-sizer">
			 <div class="gal-item item_image">
				 <div class="edit_delete_image max_view">
                   <a href="#" data-target="#demoLightbox'.$gid.'" data-toggle="modal"  class="tool"><img src="'.$dir.'images/1x/close.png" /></a>
                   	<a class="delete_galerie_folders_images_ hide" href="#'.$galerie_folders_images_id.'"><i class="fa fa-minus-circle" aria-hidden="true"></i></a>
				    <a class="delete_galerie_folders_images_confirm_ tool"><i class="fa fa-trash-o"></i></a>
			     </div>
				 <div class="modal" id="demoLightbox'.$gid.'" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal body -->
								<div class="modal-body">
								  <img class="img-fluid" src="'.$dir.'Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["large"] . '/' . urlencode(set_name_image($img)).'">

                                </div>
							</div>
						</div>
                 </div>
				 <a class="show_galery" href="#'.$gid.','.$ordner.'" data-toggle="modal" data-target="#myModal">
				   <img class="img-responsive" src="'.$dir.'Galerie/'.$morpheus["GaleryPath"].'/' . $ordner . '/' . $gid . '/' . $morpheus["thumb"] . '/' . urlencode($img).'">
				 </a>
			</div>
		</div>
    ';

    }

    return $gallery_list;
}

function get_guest_id_of_intranet_user()
{
    $table = 'morp_intranet_user';
    $primary = 'mid';
    $col = 'guestID';

    $que  	= "SELECT * FROM $table where $primary = ".$_SESSION['mid']."";
    $res 	= safe_query($que);

    while ($row = mysqli_fetch_object($res)) {
      return $row->$col;
    }
}

function get_permission_guest()
{
    $table = 'morp_intranet_user';
    $primary = 'mid';
    $col = 'guestID';

    $que  	= "SELECT * FROM $table where $primary = ".$_SESSION['mid']."";
    $res 	= safe_query($que);

    $row = mysqli_fetch_object($res);
    $guestID = $row->$col;

    $que  	= "SELECT * FROM morp_cms_galerie_guests where guestID = ".$guestID."";
    $res 	= safe_query($que);

    $row = mysqli_fetch_object($res);

    $start_date = $row->start_dat;
    $end_date = $row->end_dat;

    $current_date = date("Y-m-d");
    //echo (strtotime($current_date) - strtotime($end_date)) ;die();

    if((strtotime($current_date) < strtotime($start_date)) || (strtotime($current_date) > strtotime($end_date)))
      return false;

    return true;

}

function show_gallery_folder_modal($res, $galerie_folders_images_id)
{
    global $dir, $morpheus, $js, $mid;
    global $filter, $tagListButtons, $filterButton;

    $gallery_list = '';

    while ($row = mysqli_fetch_object($res))
    {
        //print_r($row); die();
        $img = $row->gname;
        $tn = $row->tn;
        $ordner = $row->gnname;
        $gnid = $row->gnid;
        $gid = $row->gid;
        $textde = $row->gtextde;
        $hl = $row->gtexten;

        $gallery_list .= '

	    <div class="col-md-6 CCC">
               <img class="img-responsive" src="' . $dir .
            'mthumb.php?w=400&amp;zc=1&amp;src=Galerie/' . $morpheus["GaleryPath"] . '/' . $ordner .
            '/' . $img . '">
               <a class="delete_galerie_folders_images hide" href="#'.$galerie_folders_images_id.'"><i class="fa fa-minus-circle" aria-hidden="true"></i></a>
               <a class="delete_galerie_folders_images_confirm" href="#"><i class="fa fa-minus-circle" aria-hidden="true"></i></a>
            </div>
    ';

    }

    return $gallery_list;
}


function liste($ordering="")
{
    global $sorting_col, $show_col, $table, $primary, $ASC;

    $echo .= '<p><a href="?neu=1" class="btn btn-info"><i class="fa fa-plus"></i> NEU</a></p>';
    $echo .= '<table class="table mt2">';

    $old = '';

    $sql = "SELECT * FROM $table WHERE 1".$ordering;
    $res = safe_query($sql);

    while ($row = mysqli_fetch_object($res))
    {
        $edit = $row->$primary;
        $echo .= '<tr>
			<td><a href="?edit=' . $edit . '">' . $row->$show_col . '</a></td>
            <td><a href="?edit=' . $edit .
            '" class="btn btn-info btn-small"><i class="fa fa-pencil-square-o"></i></a></td>
			<td><a href="?del=' . $edit .
            '" class="btn btn-danger btn-small"><i class="fa fa-trash-o"></i></a></td>
		</tr>';
    }

    $echo .= '</table>
	<p><a href="?neu=1" class="btn btn-info"><i class="fa fa-plus"></i> NEU</a></p>';

    //return $_GET['neu'];
    return $echo;
}


function liste_DIV($ordering="")
{
    global $sorting_col, $show_col, $table, $primary, $ASC;

    $echo .= '<p class="mb2"><a href="?neu=1" class="btn btn-info"><i class="fa fa-plus"></i> NEU</a></p>';
    $echo .= '<div class="row mt2 liste">';

    $old = '';

    $sql = "SELECT * FROM $table WHERE 1".$ordering;
    $res = safe_query($sql);

    while ($row = mysqli_fetch_object($res))
    {
        $edit = $row->$primary;
        $echo .= '<div class="col-sm-4 col-md-3 border1">
			<span class="tbl_name"><a href="?edit='.$edit.'">' . $row->$show_col . '</a></span>
            <span class="tbl_edit"><a href="?edit='.$edit.'" class="btn btn-info btn-small"><i class="fa fa-pencil-square-o"></i></a></span>
			<span class="tbl_delete"><a href="#'.$edit.'" class="btn btn-danger btn-small delete_2"><i class="fa fa-trash-o"></i></a></span>
		</div>';
    }

    $echo .= '</div>
	<p class="mt4"><a href="?neu=1" class="btn btn-info"><i class="fa fa-plus"></i> NEU</a></p>';

    //return $_GET['neu'];
    return $echo;
}

function listHashtagsGalery($hashtags) {
    $table = 'morp_tags_category';
    $primary = 'id';
    $show_col = "name";
    $sorting_col = "name";

    $hashtags = explode(',', $hashtags);

    $select = '<div id="sel-cont" class="sel-cont"><select name="select" class="ui selection dropdown" multiple="">';

    $sql = "SELECT * FROM $table order by $sorting_col";
    $res = safe_query($sql);

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
        //$row_1 = mysqli_fetch_object($res_1);

        while ($row_1 = mysqli_fetch_object($res_1))
        {
            $selected = (in_array($row_1->$primary_1, $hashtags)) ? 'selected' : '';
            $select .= '<option '.$selected.' value="' . $row_1->$primary_1 . '">' . $row_1->$show_col_1 . '</option>';
        }

        $count++;

        $select .= ($count < $num_rows) ?
            '</select><select name="select" class="ui selection dropdown" multiple="">':
        '</select>';
    }

    $select .= '</div>';

    return $select;
}

function HashtagsGalery($hashtags) {
    $table = 'morp_tags_category';
    $primary = 'id';
    $show_col = "name";
    $sorting_col = "name";

    $hashtags = explode(',', $hashtags);

    $select = '';

    $sql = "SELECT * FROM $table order by $sorting_col";
    $res = safe_query($sql);

    $num_rows = mysqli_num_rows($res);

    $count = 1;

    while ($row = mysqli_fetch_object($res))
    {
        $tags_category_id = $row->$primary;

        $table = 'morp_tags';
        $primary_1 = 'tagID';
        $show_col_1 = "tag";
        $sorting_col_1 = "tag";

        $sql = "SELECT * FROM $table where category_id =" . $tags_category_id .
            "  order by $sorting_col_1";
        $res_1 = safe_query($sql);
        //$row_1 = mysqli_fetch_object($res_1);

        while ($row_1 = mysqli_fetch_object($res_1))
        {
            if(in_array($row_1->$primary_1, $hashtags))
            //if(($hashtags != str_replace($row_1->$primary_1, '', $hashtags)))
               $select .= '<strong>#'.$row_1->$show_col_1.'&nbsp;&nbsp</strong>';
        }

        $count++;
    }

    return $select;
}

function HashtagsGalery_($hashtags) {
    $hashtags = explode(',', $hashtags);

    foreach($hashtags as $item) {
        if($item != '') {
            $table = 'morp_tags';
            $primary = 'tagID';
            $show_col_1 = "tag";
            $sorting_col_1 = "tag";

            $sql = "SELECT * FROM $table where $primary = " . $item . "";
            $res = safe_query($sql);
            //$row = mysqli_fetch_object($res);

            while ($row_1 = mysqli_fetch_object($res_1))
            {
                if(($hashtags != str_replace($row_1->$primary_1, '', $hashtags)))
                   $select .= '<strong>#'.$row_1->$show_col_1.'&nbsp;&nbsp</strong>';
            }
        }
    }



    $table = 'morp_tags_category';
    $primary = 'id';
    $show_col = "name";
    $sorting_col = "name";

    $select = '';

    $sql = "SELECT * FROM $table order by $sorting_col";
    $res = safe_query($sql);
    $row = mysqli_fetch_object($res);

    $num_rows = mysqli_num_rows($res);

    $count = 1;

    while ($row = mysqli_fetch_object($res))
    {
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
            if(($hashtags != str_replace($row_1->$primary_1, '', $hashtags)))
               $select .= '<strong>#'.$row_1->$show_col_1.'&nbsp;&nbsp</strong>';
        }

        $count++;
    }

    return $select;
}

function getRGBImage($file_dir, $file_type)
{
    $image = ($file_type == 'jpeg') ? imagecreatefromjpeg($file_dir) :
        imagecreatefrompng($file_dir); // imagecreatefromjpeg/png/

    $width = imagesx($image);
    $height = imagesy($image);
    $colors = array();

    $count = 0;

    for ($y = 0; $y < $height; $y++)
    {
        for ($x = 0; $x < $width; $x++)
        {
            $rgb = imagecolorat($image, $x, $y);
            $r = ($rgb >> 16) & 0xFF;
            $g = ($rgb >> 8) & 0xFF;
            $b = $rgb & 0xFF;

            $x_array = array(
                $r,
                $g,
                $b);

            $colors[$count] = new stdClass;
            $colors[$count]->r = $r;
            $colors[$count]->g = $g;
            $colors[$count]->b = $b;

            $count++;
        }
    }

    return json_encode($colors);
}

function getWidthImage($image, $file_type)
{
    $image = ($file_type == 'jpeg') ? imagecreatefromjpeg($image) :
        imagecreatefrompng($image); // imagecreatefromjpeg/png/

    return imagesx($image);
}

function getHeightImage($image, $file_type)
{
    $image = ($file_type == 'jpeg') ? imagecreatefromjpeg($image) :
        imagecreatefrompng($image); // imagecreatefromjpeg/png/

    return imagesy($image);
}

function getSizeMbImage($file_dir)
{
    return filesize($file_dir) / 1024 * 1024;
}

function getFileTypeImage($file_dir)
{
    $file_type = (mime_content_type($file_dir) == 'image/jpeg') ? 'jpeg' : 'png';

    return $file_type;
}

function getDateImage($file_dir)
{
    //echo $file_dir; die();
    $exif_data = exif_read_data($file_dir);
    return $file_dir['FileDateTime'];
}

function reSizeImage($targetFile, $destinationFile, $fileType, $widthResize, $resizeType)
{
    $width = getWidthImage($targetFile, $fileType);
    $height = getHeightImage($targetFile, $fileType);

    //echo $width . '/' . $height; die();

    $heightResize = round(($widthResize * $height) / $width);

    //echo $width . '/' . $height . '/' . $widthResize . '/' . $heightResize; die();

    $resizeObj = new resize($targetFile);
    $resizeObj->resizeImage($widthResize, $heightResize, $resizeType);
    $resizeObj->saveImage($destinationFile, 1000);
}
