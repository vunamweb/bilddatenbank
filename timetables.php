<?php
include_once('config/database.php');

// Get daily report
$pdo = Database::connect();
$sql = 'SELECT * FROM timetables WHERE state = 1';
$db_timetables  = $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);

Database::disconnect();

//fetch tha data from the database
$timetables = array();

$oneday = 60*60*24;
$oneweek = $oneday * 7;

$weekdays = array("sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday");

foreach ($db_timetables as $db_timetable) {

	// woechentliche Wiederholung
	if(	$db_timetable['day'] ) {
		if($db_timetable['enddate']) {
			$day = $db_timetable['day'];

			$enddate = strtotime($db_timetable['enddate']);
			$startdate = strtotime($db_timetable['date']);

			if($day != $weekdays[date('w', ($startdate))]) {
				$tempdate = '';

				for($y=1; $y<=6; $y++) {
					$startdate = $startdate + ($oneday*$y);

					if($day == $weekdays[date('w', $startdate)]) {
						break;
					}
				}
			}

			// echo '<br>'.$startdate;

			$x = round(($enddate - $startdate) / $oneweek) + 1;
		}
		else $x=1;


	}
	else $x = 1;

	$setArray = 1;

	for($i=1; $i<=$x; $i++) {
		$timetable = new stdClass();
		$timetable->name = $db_timetable['name'];
		$timetable->image = $db_timetable['image'];

		if($i > 1) {
			$newDate = $startdate + (($i - 1) * $oneweek);

			if($newDate > $enddate) $setArray = 0;

			$timetable->date = date('j', ($newDate));
			$timetable->month = date('n', ($newDate));
			$timetable->year = date('Y', ($newDate));
		}
		else {
			$timetable->date = date('j', strtotime($db_timetable['date']));
			$timetable->month = date('n', strtotime($db_timetable['date']));
			$timetable->year = date('Y', strtotime($db_timetable['date']));
		}

		$timetable->day = $db_timetable['day'];
		$timetable->start_time = $db_timetable['start_time'] ? date('H:i', strtotime($db_timetable['start_time'])) : '';
		$timetable->end_time = $db_timetable['end_time'] ? date('H:i', strtotime($db_timetable['end_time'])) : '';
		$timetable->color = $db_timetable['color'];
		$timetable->description = nl2br($db_timetable['description']);
		$timetable->invite = $db_timetable['invite'];
		$timetable->inviteText = $db_timetable['inviteText'];
		$timetable->event = $db_timetable['event'];

		if($setArray) array_push($timetables, $timetable);
	}
}

echo json_encode($timetables);
?>