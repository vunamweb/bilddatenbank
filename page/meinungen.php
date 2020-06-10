<?php
global $dir, $cid, $morpheus, $table, $mid, $profile, $navID, $jsFunc, $cid, $navID;
global $arr_form, $table, $tid, $mylink, $topic;


$show = 1;

$meinungen = isset($_GET["nid"]) ? $_GET["nid"] : 0;
$topic = isset($_GET["topic"]) ? $_GET["topic"] : 0;
$edit = isset($_GET["edit"]) ? $_GET["edit"] : 0;
$neu = isset($_GET["neu"]) ? $_GET["neu"] : 0;
$save = isset($_GET["save"]) ? $_GET["save"] : 0;

$del = isset($_GET["del"]) ? $_GET["del"] : 0;
$delete = isset($_GET["delete"]) ? $_GET["delete"] : 0;

$back = isset($_POST["back"]) ? $_POST["back"] : 0;

include('meinungen_arr.php');
// print_r($profile);
// print_r($_REQUEST);


if($delete) {
	$sql = "DELETE FROM `$table` WHERE $tid=$delete AND mid=$mid";
	safe_query($sql);
}

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


if($del) {
	$output .= '<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2>Wollen Sie Ihre Mitteilung wirklich löschen?</h2>

			<a href="'.$dir.'?hn=meinungen&cont=meinungen&delete='.$del.'" class="btn btn-danger"><i class="fa fa-trash"></i> &nbsp; Ja</a>
			<a href="'.$dir.'?hn=meinungen&cont=meinungen" class="btn btn-default"><i class="fa fa-remove"></i> &nbsp; Nein / Abbruch</a>

		</div>
	</div>
';
}

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


else if($edit) {

	$form = '';
	$meinungen = $edit;

	$sql = "SELECT * FROM `$table` WHERE $tid=$meinungen AND mid=$mid";
	$res = safe_query($sql);
	$checkit = mysqli_num_rows($res);
	$row = mysqli_fetch_object($res);

	foreach($arr_form as $arr) {
	 	$form .= setMorpheusForm($row, $arr, "", $meinungen, 0, "tid");
	}


	$output .= '
<div class="container">
	<div class="row">
		<div class="col-md-12">

			<form method="post" action="'.$dir.'?hn=meinungen&cont=meinungen&save=1">
				<input type="hidden" value="1" name="save" />
				<input type="hidden" value="'.$meinungen.'" name="edit" />
				<input type="hidden" value="0" name="back" id="back" />

				'.$form.'

				<button type="submit" id="savebtn2" value="hier" class="btn btn-success"><i class="fa fa-save"></i> &nbsp; meinungen speichern und zurück</button>
				<button type="submit" id="savebtn" class="btn btn-success"><i class="fa fa-save"></i> &nbsp; meinungen speichern / aktualisieren</button>
				<a href="'.$dir.'?hn=meinungen&cont=meinungen&del='.$edit.'" class="btn btn-default"><i class="fa fa-trash"></i> &nbsp; meinungen löschen</a>
			</form>

		</div>
	<div class="row">

	</div>
</div>

';

	$jsFunc .= '
	  $(".form-control").on("change", function() {
	  	$("#savebtn").addClass("btn-danger");
	  	$("#savebtn2").addClass("btn-danger");
	  });
	  $("#savebtn2").on("click", function() {
	  	$("#back").val(1);
	  });


	';
}



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


else if($save) {

	$neu = isset($_POST["neu"]) ? $_POST["neu"] : 0;
	$meinungen = isset($_POST["edit"]) ? $_POST["edit"] : 0;
	$meinungen = saveMorpheusForm($meinungen, $neu);



	if($back) {
		header('Location: '.$dir.$navID[31]);
		exit;
	}


	$form = '';

	$sql = "SELECT * FROM `$table` WHERE $tid=$meinungen AND mid=$mid";
	$res = safe_query($sql);
	$checkit = mysqli_num_rows($res);
	$row = mysqli_fetch_object($res);

	foreach($arr_form as $arr) {
	 	$form .= setMorpheusForm($row, $arr, "", $meinungen, 0, "tid");
	}


	$output .= '
<div class="container">
	<div class="row">
		<div class="col-md-12">

			<form method="post" action="'.$dir.'?hn=meinungen&cont=meinungen&save=1">
				<input type="hidden" value="1" name="save" />
				<input type="hidden" value="'.$meinungen.'" name="edit" />
				<input type="hidden" value="0" name="back" id="back" />

				'.$form.'

				<button type="submit" id="savebtn2" value="hier" class="btn btn-success"><i class="fa fa-save"></i> &nbsp; meinungen speichern und zurück</button>
				<button type="submit" id="savebtn" class="btn btn-success"><i class="fa fa-save"></i> &nbsp; meinungen speichern / aktualisieren</button>
			</form>

		</div>
	<div class="row">

	</div>
</div>

';

	$jsFunc .= '
	  $(".form-control").on("change", function() {
	  	$("#savebtn").addClass("btn-danger");
	  	$("#savebtn2").addClass("btn-danger");
	  });
	  $("#savebtn2").on("click", function() {
	  	$("#back").val(1);
	  });


	';
}



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *



else if($neu) {

	$form = '';

	foreach($arr_form as $arr) {
	 	$form .= setMorpheusForm($row, $arr, "", $tid, 0, "tid");
	}


	$output .= '
<div class="container">
	<div class="row">
		<div class="col-md-12">

			<form method="post" action="'.$dir.'?hn=meinungen&cont=meinungen&save=1">
				<input type="hidden" value="1" name="neu" />
				<input type="hidden" value="1" name="save" />
				'.$form.'
				<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> &nbsp; Anlegen</button>
			</form>

		</div>
	<div class="row">

	</div>
</div>

';

}

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


else {
	if($cid == 32) $where = " mid=$mid ";
	else $where = 'sichtbar=1 ';

	if($topic) $where .= " AND topicID=$topic ";

	// $sql = "SELECT * FROM `$table` WHERE $where ORDER BY $tid DESC";
	$sql = "SELECT t1.tid, t1.mid, topicID, tTitle, tText, sichtbar, datum, max(dat) AS dat FROM `$table` t1 LEFT JOIN morp_cms_meinungen_comments t2 ON t1.tid=t2.tid WHERE $where GROUP BY t1.tid ORDER BY dat DESC, datum DESC";
	$res = safe_query($sql);
	$anzahl = mysqli_num_rows($res);


	$output .= '
	<div class="container meinungen ">

		<div class="neu2"><a href="'.$dir.'?hn=meinungen&cont=meinungen&neu=1"><button class="btn btn-info"><i class="fa fa-plus"></i> neues Topic / Thema </button></a></div>

		<div class="row downloads">
			<div class="col-md-9">
				<hr class="hr2" />
';

	$x=0;


	while($row = mysqli_fetch_object($res)) {
		$x++;
		$images = '';
		$anzahlImages = 0;

		$sichtbar = $row->sichtbar;

		$noOfComments = '';
		$comments = '';

		$hasComment = hasComment("morp_cms_meinungen_comments", $tid, $row->$tid);
		if($hasComment) {
			$comments = getComments2("morp_cms_meinungen_comments", "commentsID", $tid, $row->$tid, $mid, 3);
			$noOfComments = countComments("morp_cms_meinungen_comments", "tid", $row->tid);
		}

		$hasLike = isLike($mid, "morp_cms_meinungen_likes", "tid", $row->tid);
		$noOfLikes = countLikes("morp_cms_meinungen_likes", "tid", $row->tid);

		// $img = $row->img1 ? '<img src="'.$dir.'mthumb.php?w=500&amp;src=images/angebote/'.urlencode($row->img1).'" class="img-responsive" />' : '';

		$output .= '
				<div class="'.($sichtbar ? '' : ' bg-gray2 pt2 pb2').'">
					<h1 class="mb1">'.($sichtbar ? '' : '<i class="fa fa-eye-slash"></i> &nbsp; ').''.$row->tTitle.'</h1>
					<p class="mb1">'.nl2br($row->tText).'</p>
					'.($row->mid == $mid ? '<p class="ra"><a href="'.$dir.'?hn=meinungen&cont=meinungen&edit='.$row->$tid.'"><button class="btn btn-info"><i class="fa fa-edit"></i></button></a></b></p>' : '').'
					'.($hasComment ? ''.$comments.'' : '').'
					<span class="commentUser mr3">Erstellt am: '.euro_dat($row->datum).'</span>
            		<span class="galIcons i1"><i class="fa fa-heart'.($hasLike ? '' : '-o').' tool transparent loveit" ref="'.$row->tid.'"></i> <span class="noOfLikes">'.$noOfLikes.'</span></span>
					<span class="meinungen"><a href="'.$dir.'?hn=meinungen&amp;cont=meinungen-comment&amp;sn2=meinungen-comment&amp;meinungen='.$row->$tid.'&topic='.$topic.'"><i class="fa fa-comments'.($hasComment ? '' : '-o').' tool"></i> <span class="noOfLikes">'.$noOfComments.'</span></a></span>
				</div>

				<hr class="hr2" />

';

/*
		<div class="col-md-3'.($sichtbar ? '' : ' bg-gray pt2 pb2').'">
			<!--<p class="zeile"><em class="leftcol">Kontakt: </em> <b class="rightcol"><a href="mailto:'.$row->mail.'?subject=meinungen&body='.$row->tTitle.'"><i class="fa fa-envelope"></i> &nbsp; '.$row->mail.'</a></b></p>
			'.($row->fon ? '<p class="zeile"><em class="leftcol">Telefon: </em> <b class="rightcol"><a href="tel:'.$row->fon.'">'.$row->fon.'</a></b></p>' : '').'-->
		</div>
*/

	}

	// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
	// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

	$zielSeite = "meinungen";
	$topics = getCommentsTopics($topic, $zielSeite);

	$output.='
			</div>
			<div class="col-md-3 themen">
				<h4 class="hl">Themen</h4>
				<a href="'.$dir.'?hn='.$zielSeite.'&cont='.$zielSeite.'&topic='.$rw->topicID.'"'.($topic < 1 ? ' class="active"' : '').'><i class="fa fa-chevron-right"></i> Alle</a>
				'.$topics.'
			</div>

		</div>
	</div>



<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="beispielModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Schließen"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
	        <h4 class="modal-title" id="beispielModalLabel">Wollen Sie Ihren Kommentar wirklich löschen?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Schließen</button>
        <button type="button" class="btn btn-primary delComment">Kommentar löschen</button>
      </div>
    </div>
  </div>
</div>

<input type="hidden" class="form-control" id="delete-id">

	';

	$jsFunc = '

    $(".loveit").click(function () {
	    var obj = $(this);
	    id = obj.attr("ref");
	    var onoff = obj.hasClass("fa-heart-o");

	    request = $.ajax({
	        url: "'.$dir.'morpheus/UpdateLikes.php",
	        type: "post",
	        data: "onoff="+onoff+"&mid='.$mid.'&id="+id+"&feld=tid&table=morp_cms_meinungen_likes",
	        success: function(data) {
				if(onoff == true) { obj.removeClass("fa-heart-o lightBlue"); obj.addClass("fa-heart"); console.log(1); }
				else { obj.removeClass("fa-heart");  obj.addClass("fa-heart-o lightBlue"); console.log(0); }
  			}
	    });
    });

	$(\'#deleteModal\').on(\'show.bs.modal\', function (event) {
	  var button = $(event.relatedTarget)
	  var recipient = button.data(\'todel\')
	  var modal = $(this)
	  modal.find(\'.modal-body input\').val(recipient);
	  $("#delete-id").val(recipient);
	})


    $(".saveText").click(function () {
	    id = $(this).attr("ref");
	    myText = $("#comment").val();

		// console.log(myText+\' # \'+id);

	    request = $.ajax({
	        url: "'.$dir.'page/UpdateComments.php",
	        type: "post",
	        data: "comment="+myText+"&id="+id+"&feld=tid&table=morp_cms_meinungen_comments&mid='.$mid.'",
	        success: function(data) {
				$(\'#s\'+id).removeClass(\'btn-danger\');
				// console.log(data);
				location.reload();
  			}
	    });
    });

    $(".upd").click(function () {
	    id = $(this).attr("ref");
	    myText = $("#c"+id).val();

		// console.log(myText+\' #\'+id);

	    request = $.ajax({
	        url: "'.$dir.'page/UpdateComments.php",
	        type: "post",
	        data: "update=\'+id+\'&comment="+myText+"&id="+id+"&feld=commentsID&table=morp_cms_meinungen_comments&mid='.$mid.'",
	        success: function(data) {
				// console.log(data);
				location.reload();
  			}
	    });
    });

    $(".delComment").click(function () {
	    id = $("#delete-id").val();
	    // console.log(id);
	    request = $.ajax({
	        url: "'.$dir.'page/UpdateComments.php",
	        type: "post",
	        data: "update=\'+id+\'&delc=1&id="+id+"&feld=commentsID&table=morp_cms_meinungen_comments&mid='.$mid.'",
	        success: function(data) {
				// console.log(data);
				location.reload();
  			}
	    });
    });


    $(".editComment").click(function () {
	    editID = $(this).attr("ref");

		$("#t"+editID).hide();
		$("#c"+editID).fadeIn();
		$("#b"+editID).fadeIn();
		$("#a"+editID).fadeIn();
		$("#d"+editID).fadeIn();

		// console.log(editID);
    });
    $(".abbruch").click(function () {
	    editID = $(this).attr("ref");

		$("#t"+editID).fadeIn();
		$("#c"+editID).hide();
		$("#b"+editID).hide();
		$("#a"+editID).hide();
		$("#d"+editID).hide();

		// console.log(editID);
    });

';
}

?>