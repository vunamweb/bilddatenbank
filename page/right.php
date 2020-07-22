<a href="#" class="right_menu"><i class='fa fa-angle-double-left'></i></a>
<div class="right_content">
<h4>
	Area Folder to work with
</h4>
<ul>
<?php
$que = "SELECT * FROM morp_cms_galerie_folders WHERE mid=$mid";
$res = safe_query($que);
while ($row = mysqli_fetch_object($res))
{
    $class = ($row->folderID == $_GET['id']) ? 'active user' : '';
    
    echo '<li class="btn btn-info btn-folder '.$class.'"><a href="' . $morpheus["url"] .
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
<?php

if ($_GET['nid'] == 'areafolder')
{
    $output = '<div class="row areafolder">';
    
    $folder_id = $_GET['id'];
    
    $table = 'morp_cms_galerie_guests';
    $col = 'folder_ids';
    $primary = 'guestID';
    $show_col = 'username';
    
    $que  	= "SELECT * FROM $table where $col like '%".$folder_id."%'";
    $res 	= safe_query($que);
    
    $output .= '<div class="panel panel-default">
                 <div class="panel-heading">
                   <h4 class="panel-title">
                      <a data-toggle="collapse" data-target="#guest_area">Guest management</a>
                   </h4> 
                 </div>
                  
    ';
    
    $output .= '<div id="guest_area" class="collapse"><div id="area_edit_guest"></div><div class="alert alert-success hide" role="alert">gespeichert</div>
        ';
    
    $output .= '<table class="table mt2">';
    
    while ($row = mysqli_fetch_object($res))
    {
        $edit = $row->$primary;
        
        $username = $row->$show_col;
        $username = explode('@', $username);
        
        $output .= '<tr class=tr_'.$edit.'>
			<td><a id="user_'.$edit.'" href="#' . $edit . '" class="edit_guest">' . $username[0] . '</a></td>
            <td><a href="#' . $edit .
            '" class="btn btn-info btn-small edit_guest"><i class="fa fa-pencil-square-o"></a></td>
			<td><a href="#' . $edit . '" class="btn btn-danger btn-small delete_guest"><i class="fa fa-trash-o"></a></td>
		</tr>';
    }
    
    $output .= '</table>';
    
    $output .= '</div>'; 
    
    $output .= '</div>'; 
    
    $output .= '</div>';
    
?>
	
     <?php echo $output ?>
     <div class="panel panel-default">
        <div class="panel-heading">
           <h4 class="panel-title">
            <a href="#" data-toggle="collapse" data-target="#access_area">Setting access</a>
           </h4>
        </div>
        <div class="content collapse" id="access_area">
    		<div class="alert alert-error hide" role="alert">Please check mandatory fields</div>
            <div class="alert alert-success alert-success-1 hide" role="alert">Save successfully</div>
            <div class="form-group">
    			<input type="text" class="form-control setform hide" name="username" id="username" placeholder="Username" />
    		</div>
    		<div class="form-group">
    			<input type="text" class="form-control setform" name="email" id="email" placeholder="Email" />
    		</div>
            <div class="form-group">
    			<input type="password" class="form-control setform" name="password" id="password" value="" placeholder="password" />
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
    			<button class="btn btn-success allowedtosave" ref="">
    				Save
    			</button>
                <button class="btn btn-success allowedtosend" ref="">
    				 Save & Send Login
    			</button>
    		</p>
    	<input type="hidden" name="folder_id" id="folder_id" value="<?php echo $_GET['id'] ?>" />
    </div>
        
     </div>
    <?php
}
?>
</div>

