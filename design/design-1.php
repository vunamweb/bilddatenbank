<?php global $filterButton; ?>

<section>
    <div class="container-xl">
        <!-- <div class="row row-flex row-flex-wrap"> -->
        <div class="row">
		    <div class="col-md-3 left-board">
                    <?php include('page/left.php') ?>

		    </div>
            <div class="">
              <div class="col-md-7 main content">
                 <i class="fa fa-spinner" aria-hidden="true"></i>
                 <?php echo $output; ?>
              </div>
              
              <div class="col-lg-2 right-board">

<h4>Area Folder to work with</h4>

<ul>
<?php
	$que = "SELECT * FROM morp_cms_galerie_folders WHERE mid=$mid";
	$res = safe_query($que);
	while($row = mysqli_fetch_object($res)) {
		echo '<li class="btn btn-info btn-folder"><a href="">'.$row->folder_name.'</a></li>';
	}
	
?>	
</ul>
<p>&nbsp;</p>
<p>after click => <i>morp_cms_galerie_folders_images</i></p>

	<hr>

				<h4 class="mt2 mb3"><b>Settings for the external access</b></h4>
				<p>just display after selecting folder and click invite partner // table <em>morp_cms_galerie_guests</em></p>
				<div class="form-group">
					<input type="text" class="form-control setform" name="username" id="username" ref="" col="username" value="<?php echo $row->username; ?>" placeholder="Username" />
				</div>

				<div class="form-group">
					<input type="text" class="form-control setform" name="password" id="password" ref="" col="password" value="<?php echo $row->password; ?>" placeholder="password" />
				</div>

				<div class="form-group">
					<label for="start">Start date access</label>
					<input type="text" class="form-control setform" name="start_dat" id="start_dat" ref="" col="start_dat" value="<?php echo $row->start_dat; ?>" />
				</div>

				<div class="form-group">
					<label for="start">End date access</label>
					<input type="text" class="form-control setform" name="end_dat" id="end_dat" ref="" col="end_dat" value="<?php echo $row->end_dat; ?>" />
				</div>

				<div class="form-group">
					<textarea class="form-control setform" name="email" id="email" ref="" col="email" placeholder="comma seperated e-Mail adresses"><?php echo $row->email; ?></textarea>
				</div>

				<p><button class="btn btn-success allowedtosend" ref=""><i class="fa fa-envelope"></i> &nbsp; Send Mail to grantee with access data</button></p>


		    </div>
               
            </div>
		</div>
    </div>
</section>

<div class="clearfix endFrame"></div>

