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
///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////

global $sorting_col, $show_col, $table, $primary;

$sorting_col 	= "id";
$show_col 		= "name";
$table 			= 'morp_tags_category';
$primary 		= "id";

$ordering    	= " ORDER BY name";

if($del && !$stop)
{
   $db="morp_tags_category";
   $sql="delete FROM $db WHERE id=".$del."";
   $res = safe_query($sql);
   $output .= '<div class="alert alert-success" role="alert">gelöscht</div>';
   $output .= liste_DIV(); 
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

else if($update && !$stop)
{
   $db = 'morp_tags_category';
   $sql="UPDATE $db SET name='".$name."' WHERE id=".$update."";
   $res = safe_query($sql); 
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
	    $db="morp_tags_category";
	    $sql = "insert into $db(name,id_user)values('".$name."',".$_SESSION['mid'].")";
	    //echo $sql;die();
		$res = safe_query($sql);		
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
 $output .= liste_DIV($ordering);

/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

function edit($edit)
{
  $db = 'morp_tags_category';   
  $id = "id";
  $sql = "SELECT * FROM $db WHERE $id=".$edit."";
  $res = safe_query($sql);
  $row = mysqli_fetch_object($res);
  
   return '
   <form method="post">
   		<input type="text" class="form-control" name="name" value="'.$row->name.'" /> <br /><br />
   		<input type="hidden" name="ubdate" value="'.$edit.'" />
   		<button type="submit" value="Update" class="btn btn-info">Speichern</button>
		<button name="stopit" value="stopit" class="btn btn-danger">abbrechen</button>
   	</form>';
}

?>
