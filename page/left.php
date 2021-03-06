<?php
global $filterButton, $morpheus;

$count = 0;

$table = 'morp_tags_category';
$primary = 'id';
$show_col = "name";
$sorting_col = "name";

$select = '<select name="select" class="ui selection search search_'.$count.'" multiple="">';

$sql = "SELECT * FROM $table order by $sorting_col";
$res = safe_query($sql);

$num_rows = mysqli_num_rows($res);

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
        '</select><a class="minimize" href="#'.($count -1).'"><img src="'.$morpheus['url'].'images/1x/edit_'.($count - 2).'.png" /></a><select name="select" class="ui selection search search_'.$count.'" multiple="">':
    '</select><a class="minimize" href="#'.($count -1).'"><img src="'.$morpheus['url'].'images/1x/edit_'.($count - 2).'.png" /></a>';
}
?>
<form class="navbar-form navbar-right" role="search" method="get" action="<?php echo $dir; ?>index.php">
  <?php echo $select; ?>
</form>
<div class="filter_search">
          <a href="<?php echo $morpheus["url"] ?>?likes=all">Beliebteste Fotos</a>
          <a href="<?php echo $morpheus["url"] ?>?likes=my">Meine Lieblingsfotos</a>
          <a href="javascript:void(0)" class="clear_filter">Alle Filter löschen</a>
</div>
<a class="open_close_menu arrow"><i class="fa fa-angle-double-left"></i></a>
<a class="open_close_menu navbar_menu"><img src="<?php echo $morpheus["url"] ?>images/1x/navbar_menu.png"/></a>
<a class="left_bottom icon_start" href="<?php echo $morpheus["url"] ?>?likes=my" class="btn btn-default mb1"> Meine Lieblingsfotos</a>
<a class="left_bottom icon_heart" href="<?php echo $morpheus["url"] ?>?likes=all" class="btn btn-default mb1">Beliebteste Fotos</a>
<br />
<a class="left_bottom clear_filter" href="javascript:void(0)" class="btn btn-default mb1">Alle Filter löschen</a>

<?php echo $filterButton; ?>

