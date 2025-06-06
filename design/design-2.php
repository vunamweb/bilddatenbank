
<div class="container">
	<div class="">
		<ol class="breadcrumb">
			<?php echo $breadcrumb; ?>
		</ol>
	</div>
</div>

<?php
	$blog_nav = '';
	$sql = "SELECT name, navid, datum, author FROM nav WHERE blog=1 AND sichtbar=1 AND ebene > 1 ORDER by datum DESC, navid DESC";
	$rs = safe_query($sql);
	while ($rw = mysqli_fetch_object($rs)) {
		$blog_nav .= '<li><a href="'.$dir.$navID[$rw->navid].'">'.$rw->name.', '.euro_dat($rw->datum).', '.$rw->author.'</a></li>';
	}

	echo $blog_nav;

?>


<?php echo $output; ?>

<div class="clearfix endFrame"></div>
