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

global $sorting_col, $show_col, $table, $primary;

$sorting_col 	= "sort";
$show_col 		= "gnname";
$table 			= 'morp_cms_galerie_name';
$primary 		= "gnid";


if($del && !$stop)
{
   $sql="delete FROM $table WHERE $primary = ".$del."";
   $res = safe_query($sql);
   $output .= '<div class="alert alert-success" role="alert">gelöscht</div>';
   $output .= liste(); 
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

else if($update && !$stop)
{
   $sql="UPDATE $table SET $show_col ='".$name."',textde = '".$textde."' WHERE $primary=".$update."";
   $res = safe_query($sql); 
   //return;
   $output .= '<div class="alert alert-success" role="alert">gespeichert</div>';
   $output .= liste();
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
	}
    $output .= liste();
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
 $output .= liste();

/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

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
