<?php
global $filterButton;

$table = 'morp_tags_category';
$primary = 'id';
$show_col = "name";
$sorting_col = "name";

$select = '<select name="select" class="ui selection search" multiple="">';

$sql = "SELECT * FROM $table order by $sorting_col";
$res = safe_query($sql);
$row = mysqli_fetch_object($res);

$num_rows = mysqli_num_rows($res);

$count = 1;

while ($row = mysqli_fetch_object($res))
{
    $select .= '<option value="">' . $row->$show_col . '</option>';

    $tags_category_id = $row->$primary;

    $table = 'morp_tags';
    $primary_1 = 'tagID';
    $show_col_1 = "tag";
    $sorting_col_1 = "tag";

    $sql = "SELECT * FROM $table where category_id =" . $tags_category_id .
        "  order by $sorting_col_1";
    $res_1 = safe_query($sql);
    $row_1 = mysqli_fetch_object($res_1);

    while ($row_1 = mysqli_fetch_object($res_1))
    {
        $select .= '<option value="' . $row_1->$primary_1 . '">' . $row_1->$show_col_1 .
            '</option>';
    }

    $count++;

    $select .= ($count < $num_rows) ?
        '</select><select name="select" class="ui selection search" multiple="">':
    '</select>';
}
?>
<form class="navbar-form navbar-right" role="search" method="get" action="<?php echo $dir; ?>index.php">
						<div class="form-group">
							<input type="text" class="form-control" name="suche" id="suche" placeholder="Suche..."<?php echo isset($_GET["suche"]) ? ' value="'.$_GET["suche"].'"' : ''; ?>>
						    <select class="number_page">
                              <option <?php if($_SESSION['number_per_page'] == 2) echo 'selected' ?>  value="2">2</option>
                              <option <?php if($_SESSION['number_per_page'] == 3) echo 'selected' ?> value="3">3</option>
                              <option <?php if($_SESSION['number_per_page'] == 4) echo 'selected' ?> value="4">4</option>
                              <option <?php if($_SESSION['number_per_page'] == 5) echo 'selected' ?> value="5">5</option>
                              <option <?php if($_SESSION['number_per_page'] == 6) echo 'selected' ?> value="6">6</option>
                              <option <?php if($_SESSION['number_per_page'] == 10) echo 'selected' ?> value="10">10</option>
                              <option <?php if($_SESSION['number_per_page'] == 20) echo 'selected' ?> value="20">20</option>
                              <option <?php if($_SESSION['number_per_page'] == 30) echo 'selected' ?> value="30">30</option>
                            </select> 
                            <label>How manny images/page</label>
                        </div>
						
                        <button type="submit" class="btn btn-default pull-right"><i class="glyphicon glyphicon-search"></i></button>
                        
                        <?php echo $select; ?>
					</form>

<h4 class="mt2">Tools 1 / Hashtags / Search</h4>

<?php echo $filterButton; ?>

