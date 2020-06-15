<h4>
	Area Folder to work with
</h4>
<ul>
<?php
$que = "SELECT * FROM morp_cms_galerie_folders WHERE mid=$mid";
$res = safe_query($que);
while ($row = mysqli_fetch_object($res))
{
    echo '<li class="btn btn-info btn-folder"><a href="' . $morpheus["url"] .
        'home/galerie+areafolder/?id=' . $row->folderID . '">' . $row->folder_name . '
		</a>
		<br>
		</li>
		<a href="#' . $row->folderID .
        '" class="area_folder hide" data-toggle="modal" data-target="#myModal_area_folder">edit</a>
		';
}

?>
</ul>
<div class="invite_partner">
  <a href="#" class="invite_partner"><i class="fa fa-user-plus" aria-hidden="true"></i></a>
</div>

<hr>
<?php

if ($_GET['nid'] == 'areafolder')
{
?>
	<div class="content hide">
		<div class="alert alert-error hide" role="alert">Please check mandatory fields</div>
        <div class="form-group">
			<input type="text" class="form-control setform" name="username" id="username" placeholder="Username" />
		</div>
		<div class="form-group">
			<input type="text" class="form-control setform" name="password" id="password" placeholder="password" />
		</div>
        <div class="form-group">
			<input type="text" class="form-control setform" name="email" id="email" placeholder="Email" />
		</div>
		<div class="form-group">
			<label for="start">
				Start date access
			</label>
			<input type="date" class="form-control setform" name="start_dat" id="start_dat" />
		</div>
		<div class="form-group">
			<label for="start">
				End date access
			</label>
			<input type="date" class="form-control setform" name="end_dat" id="end_dat"  />
		</div>
		<p>
			<button class="btn btn-success allowedtosend" ref="">
				<i class="fa fa-envelope">
				</i>
				&nbsp; Send Mail to grantee with access data
			</button>
		</p>
	<input type="hidden" name="folder_id" id="folder_id" value="<?php echo $_GET['id'] ?>" />
    </div>
	<?php
}
?>