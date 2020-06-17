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
	            </div>
        </div>
</nav>

	<div class="abstand-start<?php echo $cid==1 ? '-2' : ''; ?>"></div>
