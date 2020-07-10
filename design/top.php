<?php
	include("nogo/nav_".$lan.".inc");
	if($sn2_id) $nav = preg_replace(array("/n".$hn_id."n/", "/s".$cid."/", "/s".$sn2_id."/"), array("aktiv", "aktiv", "aktiv"), $nav);
	else $nav = preg_replace(array("/n".$hn_id."n/", "/s".$cid."/"), array("aktiv", "aktiv", "aktiv"), $nav);

	global $galerie, $news, $hashtag;

?>

<?php
	$uri	 = $_SERVER["REQUEST_URI"];
?>

    <!-- Statische Navbar -->
<nav class="navbar navbar-expand-lg navbar-default navbar-dark">
        <a class="navbar-brand logo" href="<?php echo $dir; ?>">
           <img src="<?php echo $dir; ?>images/kinderbuero_logo.png" alt="Logo" class="logo" />
        </a>
        <div id="navbarMeta" class="">
            <form class="navbar-form" role="search" method="get" action="<?php echo $dir; ?>index.php">
                        <div class="form-group">
        							<input type="text" class="form-control" name="suche" id="suche" placeholder=""<?php echo isset($_GET["suche"]) ? ' value="'.$_GET["suche"].'"' : ''; ?>>
        				</div>
                        <div class="form-group next">
        				   <input type="submit" value="Search" class="submit" />
                           <!--<select id="type_photo" data-show-content="true" class="form-control">
                                <option data-content=" Alle"></option>
                                
                                <option data-content="<i class='fa fa-camera'></i> Fotos"></option>
                                <option data-content="<i class='fa fa-play'></i> Videos"></option>
                                <option data-content="<i class='fa fa-paint-brush'></i> Vektoren"></option>
                           </select> !-->
                        </div>
        				 <button type="submit" class="btn btn-default pull-right"><i class="fa fa-search" aria-hidden="true"></i></button>
             </form>
             
             <div class="pull-left form-group parent_div">
                  <select class="number_page form-control" data-show-content="true">
                                  <option <?php if($_SESSION['number_per_page'] == 2) echo 'selected' ?>  value="2">2</option>
                                  <option <?php if($_SESSION['number_per_page'] == 3) echo 'selected' ?> value="3">3</option>
                                  <option <?php if($_SESSION['number_per_page'] == 4) echo 'selected' ?> value="4">4</option>
                                  <option <?php if($_SESSION['number_per_page'] == 5) echo 'selected' ?> value="5">5</option>
                                  <option <?php if($_SESSION['number_per_page'] == 6) echo 'selected' ?> value="6">6</option>
                                  <option <?php if($_SESSION['number_per_page'] == 10) echo 'selected' ?> value="10">10</option>
                                  <option <?php if($_SESSION['number_per_page'] == 20) echo 'selected' ?> value="20">20</option>
                                  <option <?php if($_SESSION['number_per_page'] == 30) echo 'selected' ?> value="30">30</option>
                  </select> 
             </div>
             <div class="next_1">
                  <label class="">Anzahl Bilder/Videos</label>
             </div>
         </div>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navb">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="container-full navbarMeta collapse navbar-collapse" id="navb">
	            <ul class="nav navbar-nav navbar-right">
		                <?php echo $nav; ?>
						<?php echo $nav_meta; ?>
						<li><a class="nav-link meta-nav end" href="<?php echo $dir; ?>?logout=1"><?php echo substr($profile["vname"],0,1).''.substr($profile["nname"],0,1) ?> abmelden</a></li>
                 </ul>
	            
        </div>
        

<!-- Bereich Naviagtion dynamisch -->

<?php if(false) { ?>
        <div class="container-full navbarButtons">
	        <div class="container">
	            <div class="navbar-collapse collapse">
					<div class="dropdown pull-left">
                          <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Categories
                          <span class="caret"></span></button>
                          <ul class="dropdown-menu">
                            <li><a href="<?php echo $dir.$navID[9]; ?>">Go to Categories</a></li>
                            <li><a href="<?php echo $dir ?>kategorien/group/">Manager Group</a></li>
                            <li><a href="<?php echo $dir ?>kategorien/kategorien/">Manager Category</a></li>
                          </ul>
                   </div>
                   
                   <div class="dropdown pull-left">
                          <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">HasTag
                          <span class="caret"></span></button>
                          <ul class="dropdown-menu">
                            <li><a href="<?php echo $dir ?>tag/group/">Manager Group</a></li>
                            <li><a href="#">Manager Hastag</a></li>
                          </ul>
                   </div>
                    
                    <!--<ul class="nav navbar-nav navbar-right">
						<li class="btn btn-default">
                          <a href="<?php echo $dir.$navID[9]; ?>"><i class="fa fa-plus"></i> Categories</a>
                        </li>
						<li class="btn btn-default"><a href="<?php echo $dir.$navID[7]; ?>"><i class="fa fa-plus"></i> Add new category</a></li>
	                </ul> !-->
	            </div>
	        </div>
        </div>
<?php } else if($hn_id == 2) { ?>
        <div class="container-full navbarButtons">
	        <div class="container">
	            <div class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
 						<li class="btn btn-default"><a href="<?php echo $dir.$navID[2]; ?>"> Alle <?php echo $navarrayFULL[2]; ?></a></li>
<?php echo $nav_s; ?>
	                </ul>
	            </div>
	        </div>
        </div>
<?php } ?>

    </nav>
    
    <div class="container-full navbar-main">
	            <div class="navbar-header hide">
	                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	                	<span class="sr-only">Navigation ein-/ausblenden</span>
	                	<span class="icon-bar"></span>
	                	<span class="icon-bar"></span>
	                	<span class="icon-bar"></span>
	                </button>
	            </div>

	            <div id="navbar" class="navbar-collapse">
	                <ul class="nav navbar-nav pull-right">
		                <li><a href="<?php echo $dir; ?>">All</a></li>
<?php
	$que  	= "SELECT gntextde, gnid FROM `morp_cms_galerie_name` WHERE 1";
	$res 	= safe_query($que);
	while($row = mysqli_fetch_object($res)) {
		echo '						<li><a href="'.$dir.'home/galerie+'.$row->gnid.'/">'.$row->gntextde.'</a></li>
';
	}
?>
	                    <li class="mobileOn"><hr></li>
	                    <?php echo $nav_meta_mobile; ?>
	                </ul>

	            </div>
        </div>
