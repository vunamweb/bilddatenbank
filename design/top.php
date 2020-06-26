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

    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-full navbarMeta">
	            <div id="navbarMeta" class="navbar-collapse collapse">
<!--
                    <form class="navbar-form navbar-right" role="search" method="get" action="<?php echo $dir; ?>index.php">
						<div class="form-group">
							<input type="text" class="form-control" name="suche" placeholder="Suche..."<?php echo isset($_GET["suche"]) ? ' value="'.$_GET["suche"].'"' : ''; ?>>
						</div>
						<button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
					</form>
-->

					<ul class="nav navbar-nav navbar-right">
		                <li<?php echo $cid == 1 ? ' class="aktiv"' : ''; ?>><a href="<?php echo $dir; ?>"><i class="fa fa-home"></i></a></li>
						<?php echo $nav; ?>
						<?php echo $nav_meta; ?>
						<li><a href="<?php echo $dir; ?>?logout=1"><?php echo substr($profile["vname"],0,1).''.substr($profile["nname"],0,1) ?> abmelden</a></li>
	                </ul>
	            </div>
        </div>
        <div class="container-full navbar-main">
	            <div class="navbar-header">
	                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	                	<span class="sr-only">Navigation ein-/ausblenden</span>
	                	<span class="icon-bar"></span>
	                	<span class="icon-bar"></span>
	                	<span class="icon-bar"></span>
	                </button>
	                <a class="navbar-brand logo" href="<?php echo $dir; ?>">
		                <img src="<?php echo $dir; ?>images/kinderbuero_logo.png" alt="Logo" class="logo" />
	                </a>
	            </div>

	            <div id="navbar" class="navbar-collapse collapse">
	                <ul class="nav navbar-nav navbar-right">
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

	<div class="abstand-start<?php echo $cid==1 ? '-2' : ''; ?>"></div>
