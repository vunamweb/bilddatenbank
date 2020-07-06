<?php
global $filterButton, $morpheus;

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
  <?php echo $select; ?>
</form>
<a class="open_close_menu"><img src="<?php echo $morpheus["url"] ?>images/1x/close_open_menu.png"/></a>
<a class="open_close_menu navbar_menu"><img src="<?php echo $morpheus["url"] ?>images/1x/navbar_menu.png"/></a>
<a class="left_bottom icon_start" href="'.$dir.'?likes=all" class="btn btn-default mb1"> MY favourite photos</a>
<a class="left_bottom icon_heart" href="'.$dir.'?likes=my" class="btn btn-default mb1">most favourite photos</a>

<?php echo $filterButton; ?>

