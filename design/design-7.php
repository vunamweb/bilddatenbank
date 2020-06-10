<div style="padding: 20px;">
<?php if($_GET['nid'] != '') { ?>
  <label>Name</label><input type="text" /><br />
  <label>Group</label><select><option>group1</option><option>group2</option></select><br />
  <input type="button" value="save" />
<?php } else { ?>
<h2>Categories Add</h2>
		<p>
			<a href="edit+1" class="button"><i class="fa fa-plus"></i> NEUE Category/a>
		</p>

		<p>&nbsp;</p>

		<div class="container-full">
			<div id="sortable" class="grid muuri" style="height: 220px;">

		<div class="zeile item row col1 muuri-item muuri-item-shown" id="1" style="left: 0px; top: 0px; transform: translateX(0px) translateY(0px); display: block; touch-action: none; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
			<div class="col-md-1 col-xs-1" style="opacity: 1; transform: scale(1);">1</div>
			<div class="col-md-4 col-xs-5"><a href="edit+1" title="oeffne oberrad" class="btn btn-info bt4">oberrad | Oberrad</a></div>
			<div class="col-md-1 col-xs-1"><a name="deldir" href="bild_galerie.php?deldir=1&amp;ggid=1&amp;db=morp_cms_galerie" title="deldir" class="btn btn-danger"><i class="fa fa-trash-o"></i></a></div>
		</div>
		
		<div class="zeile item row col1 muuri-item muuri-item-shown" id="1" style="left: 0px; top: 0px; transform: translateX(0px) translateY(0px); display: block; touch-action: none; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
			<div class="col-md-1 col-xs-1" style="opacity: 1; transform: scale(1);">1</div>
			<div class="col-md-4 col-xs-5"><a href="edit+1" title="oeffne oberrad" class="btn btn-info bt4">oberrad | Oberrad</a></div>
			<div class="col-md-1 col-xs-1"><a name="deldir" href="bild_galerie.php?deldir=1&amp;ggid=1&amp;db=morp_cms_galerie" title="deldir" class="btn btn-danger"><i class="fa fa-trash-o"></i></a></div>
		</div>
		
		
		</div></div><p>&nbsp;</p><!--<p style="clear:left;"><a href="bild_galerie.php?neu=1&db=morp_cms_galerie_name&ggid=1&gnid=&upload=1" title="Neue Bildergalerie erstellen" class="button"><i class="fa fa-plus"></i> Neue Bilder hochladen</a></p>-->

<?php } ?>
</div>