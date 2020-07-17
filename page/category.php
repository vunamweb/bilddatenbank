<?php
$save	= $_REQUEST["save"];
$edit	= $_REQUEST["edit"];
$update	= $_REQUEST["ubdate"];
$del	= $_REQUEST["del"];
$id	= $_REQUEST["id"];
$item	= $_REQUEST["item"];
$neu	= $_REQUEST["neu"];
$name= $_REQUEST["name"];
$stop	= $_REQUEST["stopit"];
$textde = $_REQUEST['textde'];
///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////

global $sorting_col, $show_col, $table, $primary, $morpheus;

$sorting_col 	= "sort";
$show_col 		= "gnname";
$table 			= 'morp_cms_galerie_name';
$primary 		= "gnid";

$ordering    	= " ORDER BY gnname";

if($del && !$stop)
{
   $sql="delete FROM $table WHERE $primary = ".$del."";
   $res = safe_query($sql);
   $output .= '<div class="alert alert-success" role="alert">gelöscht</div>';
   $output .= liste_DIV($ordering); 
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

else if($update && !$stop)
{
   $sql="UPDATE $table SET $show_col ='".$name."',textde = '".$textde."' WHERE $primary=".$update."";
   $res = safe_query($sql);
   
   $old_dir = 'Galerie/'. $morpheus["GaleryPath"]. '/'. $_GET['folder'];
   $new_dir = 'Galerie/'. $morpheus["GaleryPath"]. '/'. $name;
   
   
   rename($old_dir, $new_dir); 
   //return;
   $output .= '<div class="alert alert-success" role="alert">gespeichert</div>';
   $output .= liste_DIV($ordering);
} 
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

else if($edit && !$stop)
{
   $output .= edit($edit); 
} 
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

else if ($save && !$stop) {
	if($name) {
		$output = '<div class="alert alert-success" role="alert">gespeichert</div>';
	    
        $sql = "insert into $table($show_col)values('$name')";
	    //echo $sql;die();
		$res = safe_query($sql);
        
        $dir = 'Galerie/'. $morpheus["GaleryPath"]. '/'. $name;
        mkdir($dir); 
	}
    $output .= liste_DIV($ordering);
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

else if($neu && !$stop)
{
    $output .='
    <form method="post">
    	<input type="text" class="form-control" name="name" placeholder="Enter Name" /> <br /><br />
    	<input type="hidden" name="save" value="save" />
		<button type="submit" value="Save" class="btn btn-info">Hinzufügen</button>
		<button name="stopit" value="stopit" class="btn btn-danger">abbrechen</button>
	</form>';
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

else
 $output .= liste_DIV_folder($ordering);

/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

function liste_DIV_folder($ordering="")
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
        $echo .= '<div class="col-md-4 border1">
			<span class="tbl_name"><a href="?edit='.$edit.'&folder='.$row->$show_col.'">' . $row->$show_col . '</a></span>
            <span class="tbl_edit"><a href="?edit='.$edit.'&folder='.$row->$show_col.'" class="btn btn-info btn-small"><i class="fa fa-pencil-square-o"></i></a></span>
			<span class="tbl_delete"><a href="?del='.$edit.'" class="btn btn-danger btn-small"><i class="fa fa-trash-o"></i></a></span>
		</div>';
    }

    $echo .= '</div>
	<p class="mt4"><a href="?neu=1" class="btn btn-info"><i class="fa fa-plus"></i> NEU</a></p>';

    //return $_GET['neu'];
    return $echo;
}

function edit($edit)
{
  global $sorting_col, $show_col, $table, $primary;
  
  $sql = "SELECT * FROM $table WHERE $primary=".$edit."";
  $res = safe_query($sql);
  $row = mysqli_fetch_object($res);
  
   return '
   <form method="post">
   		<input type="text" class="form-control" name="name" value="'.$row->$show_col.'" /> <br /><br />
   		<input type="text" class="form-control" name="textde" value="'.$row->textde.'" /> <br /><br />
        <input type="hidden" name="ubdate" value="'.$edit.'" />
   		<button type="submit" value="Update" class="btn btn-info">Speichern</button>
		<button name="stopit" value="stopit" class="btn btn-danger">abbrechen</button>
   	</form>';
}

?>
