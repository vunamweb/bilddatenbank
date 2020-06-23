<?php
$save	= $_REQUEST["save"];
$edit	= $_REQUEST["edit"];
$update	= $_REQUEST["ubdate"];
$del	= $_REQUEST["del"];
$id		= $_REQUEST["id"];
$item	= $_REQUEST["item"];
$neu	= $_REQUEST["neu"];
$name	= $_REQUEST["name"];
$stop	= $_REQUEST["stopit"];
$category_tag = $_REQUEST["category_tag"];

print_r($_REQUEST);
///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////

global $sorting_col, $show_col, $table, $primary;

$sorting_col 	= "tagID";
$show_col 		= "tag";
$table 			= 'morp_tags';
$primary 		= "tagID";
    
$ordering    	= " ORDER BY tag";

/*$output .=  '<div id=vorschau>
	<h2>'.$titel.'</h2> 

	'. ($edit || $neu ? '<p><a href="?pid='.$pid.'">&laquo; zur&uuml;ck</a></p>' : '') . 
     '
    
';*/
if($del && !$stop)
{
   $db="morp_tags";
   $sql="delete FROM $db WHERE tagID = ".$del."";
   $res = safe_query($sql);
   $output .= '<div class="alert alert-success" role="alert">gelöscht</div>';
   $output .= liste_DIV($ordering); 
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

else if($update && !$stop)
{
   // die();
   $db = 'morp_tags';
   $sql="UPDATE $db SET tag='".$name."' WHERE $primary=".$update."";
   // echo $sql; die();
   $res = safe_query($sql); 
   //return;
   $output .= '<div class="alert alert-success" role="alert">gespeichert update</div>';
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
    if($name && $category_tag) {
		$output .= '<div class="alert alert-success" role="alert">gespeichert save</div>';
		$db="morp_tags";
	    $sql = "insert into $db(tag_long,tag,category_id)values('".$name."','".$name."',".$category_tag.")";
		echo $sql;die();
		$res = safe_query($sql);
	}
    $output .= liste_DIV($ordering);
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

else if($neu)
{
    $db = 'morp_tags_category';
    
    $select = '<select name="category_tag" class="form-control">';
    
    $sql = "SELECT * FROM $db";
    $res = safe_query($sql);
    $row = mysqli_fetch_object($res);
    while ($row = mysqli_fetch_object($res)) {
		$select .= '<option value='.$row->id.'>'.$row->name.'</option>';
	}
    
    $select .= '</select><br />';
    
    $output .='
    <form method="post">
    	<div class="form-group">
    		<input type="text" name="name" class="form-control" placeholder="Enter Name" />
    	</div>
    	<div class="form-group">
	    	<label class="">Bitte Wählen Sie die zugehörige Kategorie aus</label>
			' . $select . '
		</div>
    	<div class="form-group">
	    	<input type="hidden" name="save" value="save" />
	    </div>
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
	global $sorting_col, $show_col, $table, $primary;
      
    $sql = "SELECT * FROM $table WHERE $primary=".$edit."";
    $res = safe_query($sql);
    $row = mysqli_fetch_object($res);
    $category_id = $row->category_id;
    $tag_id = $row->id;
    $name = $row->tag;
    
    $db = 'morp_tags_category';
    
    $select = '<select name="category_tag" class="form-control">';
    
    $sql = "SELECT * FROM $db";
    $res = safe_query($sql);
    $row = mysqli_fetch_object($res);
    while ($row = mysqli_fetch_object($res)) {
		if($row->id == $category_id)
         $select .= '<option selected value='.$row->id.'>'.$row->name.'</option>';
        else
         $select .= '<option value='.$row->id.'>'.$row->name.'</option>'; 
	}
    
    $select .= '</select><br />';
  
    return '
    <form method="post">
    	<div class="form-group">
    		<input type="text" class="form-control" name="name" value="'.$name.'" /> 
    	</div>
    	<div class="form-group">
	    	<label class="">Bitte Wählen Sie die zugehörige Kategorie aus</label>
			' . $select .'
    	</div>
    	<input type="hidden" name="ubdate" value="'.$edit.'" />
		<button type="submit" value="Update" class="btn btn-info" />Speichern</button>
		<button name="stopit" value="stopit" class="btn btn-danger">abbrechen</button>
	</form>';
}

?>
