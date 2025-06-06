<?php
$id = 0;
$name = '';
$image = '';
$date = '';
$enddate = '';
$day = '';
$start_time = '';
$end_time = '';
$color = 1;
$invite = 0;
$inviteText = '';
$event = '';
$description = '';


if (isset($timetable)) {
	if ($timetable) {
		$id = $timetable['id'];
		$name = $timetable['name'];
		$image = $timetable['image'];
		$date = $timetable['date'];
		$enddate = $timetable['enddate'];
		$day = $timetable['day'];
		$start_time = $timetable['start_time'];
		$end_time = $timetable['end_time'];
		$color = $timetable['color'];
		$invite = $timetable['invite'];
		$inviteText = $timetable['inviteText'];
		$event = $timetable['event'];
		$description = $timetable['description'];
	}
}

if (isset($_POST) && $_POST) {
	$name = $_POST['name'];
	if ($_FILES['image']['name']) {
		$image = $_FILES['image']['name'];
	}
	$date = $_POST['date'];
	$enddate = $_POST['enddate'];
	$day = $timetable['day'];
	$start_time = $timetable['start_time'];
	$end_time = $timetable['end_time'];
	$color = $timetable['color'];
	$invite = $timetable['invite'];
	$inviteText = $timetable['inviteText'];
	$event = $timetable['event'];
	$description = $timetable['description'];
}
?>

<?php if (isset($_SESSION['save_success'])) { ?>
	<div class="alert alert-success">
		<button data-dismiss="alert" class="close close-sm" type="button">
			<i class="fa fa-times"></i>
		</button>
		Timetable successfully saved.
	</div>
	<?php unset($_SESSION['save_success']); ?>
<?php } ?>

<form class="form-horizontal" action="edit.php<?php echo $id ? ('?id=' . $id) : ''; ?>" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label class="col-lg-3 col-sm-3 control-label">Name<span class="star">&nbsp;*</span></label>
		<div class="col-sm-6">
			<input type="text" name="name" class="form-control" value="<?php echo $name; ?>" required />
		</div>
	</div>

	<div class="form-group">
		<label class="col-lg-3 col-sm-3 control-label">Image</label>
		<div class="col-sm-6">
			<input type="file" name="image" class="filestyle" data-placeholder="<?php echo $image ? $image : 'No image'; ?>">
		</div>
	</div>

	<div class="form-group date-picker-wrap">
		<label class="col-lg-3 col-sm-3 control-label">Datum (Start)</label>
		<div class="col-sm-6">
			<div class="input-group date">
				<input type="text" name="date" class="form-control date-picker" placeholder="Select Date" value="<?php echo $date; ?>">
				<span class="input-group-addon">
					<span class="glyphicon glyphicon-calendar"></span>
				</span>
			</div>
		</div>
	</div>

	<div class="form-group">
		<label class="col-lg-3 col-sm-3 control-label">Tag</label>
		<div class="col-sm-6">
			<select name="day" class="form-control">
				<option value="">-- Select --</option>
				<option value="monday" <?php echo ($day == 'monday') ? 'selected' : ''; ?> >Montag</option>
				<option value="tuesday" <?php echo ($day == 'tuesday') ? 'selected' : ''; ?> >Dienstag</option>
				<option value="wednesday" <?php echo ($day == 'wednesday') ? 'selected' : ''; ?> >Mittwoch</option>
				<option value="thursday" <?php echo ($day == 'thursday') ? 'selected' : ''; ?> >Donnerstag</option>
				<option value="friday" <?php echo ($day == 'friday') ? 'selected' : ''; ?> >Freitag</option>
				<option value="saturday" <?php echo ($day == 'saturday') ? 'selected' : ''; ?> >Samstag</option>
				<option value="sunday" <?php echo ($day == 'sunday') ? 'selected' : ''; ?> >Sonntag</option>
			</select>
		</div>
	</div>

	<div class="form-group date-picker-wrap">
		<label class="col-lg-3 col-sm-3 control-label">End-Datum bei wiederholenden Ereignissen</label>
		<div class="col-sm-6">
			<div class="input-group date">
				<input type="text" name="enddate" class="form-control date-picker" placeholder="Select Date" value="<?php echo $enddate; ?>">
				<span class="input-group-addon">
					<span class="glyphicon glyphicon-calendar"></span>
				</span>
			</div>
		</div>
	</div>


	<div class="form-group date-picker-wrap">
		<label class="col-lg-3 col-sm-3 control-label">Start Zeit</label>
		<div class="col-sm-6">
			<div class="input-group date">
				<input type="text" name="start_time" class="form-control time-picker" placeholder="Select Time" value="<?php echo $start_time; ?>">
				<span class="input-group-addon">
					<span class="glyphicon glyphicon-time"></span>
				</span>
			</div>
		</div>
	</div>

	<div class="form-group date-picker-wrap">
		<label class="col-lg-3 col-sm-3 control-label">End Zeit</label>
		<div class="col-sm-6">
			<div class="input-group date">
				<input type="text" name="end_time" class="form-control time-picker" placeholder="Select Time" value="<?php echo $end_time; ?>">
				<span class="input-group-addon">
					<span class="glyphicon glyphicon-time"></span>
				</span>
			</div>
		</div>
	</div>

	<div class="form-group">
		<label class="col-lg-3 col-sm-3 control-label">Farbe</label>
		<div class="col-sm-6">
			<select name="color" class="form-control">
				<option value="1" <?php echo ($color == '1') ? 'selected' : ''; ?> >Farbe 1 noch zu beschreiben</option>
				<option value="2" <?php echo ($color == '2') ? 'selected' : ''; ?> >Farbe 2 noch zu beschreiben</option>
				<option value="3" <?php echo ($color == '3') ? 'selected' : ''; ?> >Farbe 3 noch zu beschreiben</option>
				<option value="4" <?php echo ($color == '4') ? 'selected' : ''; ?> >Farbe 4 noch zu beschreiben</option>
			</select>
		</div>
	</div>

	<div class="form-group">
		<label class="col-lg-3 col-sm-3 control-label">Beschreibung</label>
		<div class="col-sm-6">
			<textarea name="description" class="description-field"><?php echo $description; ?></textarea>
		</div>
	</div>

	<div class="form-group">
		<label class="col-lg-3 col-sm-3 control-label">Einladung</label>
		<div class="col-sm-6">
			<select name="invite" class="form-control">
				<option value="0" <?php echo ($invite == '0') ? 'selected' : ''; ?> >Keine Einladung</option>
				<option value="1" <?php echo ($invite == '1') ? 'selected' : ''; ?> >Mit Einladung bitte Anmelden</option>
			</select>
		</div>
	</div>

	<div class="form-group">
		<label class="col-lg-3 col-sm-3 control-label">Einladungs-Text</label>
		<div class="col-sm-6">
			<textarea name="inviteText" class="description-field"><?php echo $inviteText; ?></textarea>
		</div>
	</div>

	<div class="form-group">
		<label class="col-lg-3 col-sm-3 control-label">Event ID</label>
		<div class="col-sm-6">
			<select name="event" class="form-control">
<?php include("../../events.php"); ?>
			</select>
		</div>
	</div>


	<div class="form-group m-t-20">
		<div class="col-lg-offset-2 col-lg-8">
			<button name="save" type="submit" class="btn btn-info"><i class="fa fa-edit"></i> Speichern</button>
			<button name="save-close" type="submit" class="btn btn-success"><i class="fa fa-floppy-o"></i> Speichern & Schließen</button>
			<button name="save-new" type="submit" class="btn btn-primary"><i class="fa fa-plus"></i> Speichern & Neuer Termin</button>
			<a class="btn btn-default" href="list.php"><i class="fa fa-times"></i> Abbruch</a>
		</div>
	</div>

	<input type="hidden" class="type-value" value="<?php echo $type; ?>">
	<input type="hidden" class="time-value" value="<?php echo $time; ?>">
</form>