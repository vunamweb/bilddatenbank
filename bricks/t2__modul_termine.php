<?php
	global $morpheus, $dir, $navID, $mid;

	$oneday  = 60*60*24;
	$oneweek = $oneday * 7;
	$heute = date("d-m-Y");
	$heuteTime = strtotime($heute);

	$weekdays = array("sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday");


	$max = 8;
	$maxdb = 100;
	$cid = 2;

	$sql 	= "SELECT * FROM `timetables` WHERE state=1 AND date >= '$heute' OR ( day != '' AND enddate >= '$heute' ) ORDER BY date DESC";
	$res 	= safe_query($sql);

	$timetable = array();

	while ($row = mysqli_fetch_object($res)) {
		$ntitle = utf8_decode($row->name);
		$nabstr = utf8_decode($row->description);
		$img 	= $row->image;

		$date = strtotime($row->date);
		$sTime = $row->start_time;
		$eTime = $row->end_time;

		$event = $row->event;
		if($event) {
			$eventDetails = getEventDetails($event);
			if($confirmed = getEventConfirmed($event, $mid)) $event = '<i class="fa fa-check"></i> Sie haben diesen Termin bestätigt.';
			else $event = '<a href="'.$dir.'?hn=termine&sn2=gaesteliste&cont=gaesteliste&event='.$event.'"><i class="fa fa-handshake-o"></i> Ich möchte mich anmelden</a>';
			// echo $event;
			// print_r($eventDetails);
		}

		$day = $row->day;

		$lnk = $dir.$navID[$cid].'news+'.$nid.'/';
		// $lnk = $dir.$navID[$newsID].'#n'.$row->nid;

		// woechentliche Wiederholung
		if(	$day ) {
			if($row->enddate) {

				$enddate = strtotime($row->enddate);
				$startdate = strtotime($row->date);

				if($day != $weekdays[date('w', ($startdate))]) {
					$tempdate = '';

					for($y=1; $y<=6; $y++) {
						$startdate = $startdate + ($oneday*$y);

						if($day == $weekdays[date('w', $startdate)]) {
							// echo date("Y-m-d",$startdate);
							break;
						}
					}
				}

				// echo '<br>'.$startdate;
				// echo "$enddate - $startdate) / $oneweek \n";

				$x = round(($enddate - $startdate) / $oneweek) + 1;
			}
			else $x=1;

			for($i=0; $i<=$x; $i++) {
				$nextDay = $startdate + ($oneweek * $i);
				// $nextDay = date("Y-m-d", $nextDay);

				if($nextDay >= $heuteTime) $timetable[$nextDay] = array($nextDay, $ntitle, $nabstr, $sTime, $eTime, $img, $event);
			}

		}
		else if ($date >= $heuteTime) $timetable[$date] = array($date, $ntitle, $nabstr, $sTime, $eTime, $img, $event);

//		 echo $x."\n";

	}

	ksort($timetable);
	// print_r($timetable);
	$x = 0;

	foreach($timetable as $arr) {
		$x++;
		if($x <= $max) $output .= '
						<div class="modul termine">
							'.($arr[5] ? '<img src="'.$dir.'mthumb.php?w=600&amp;h=200&amp;zc=1&amp;src=admin/timetable/images/'.urlencode($arr[5]).'" alt="'.$arr[1].'" class="img-responsive" />' : '').'
							<p class="datum">'.date("d.m.Y", $arr[0]).' / '.$arr[3].' - '.$arr[4].'</p>
							<h2>'.$arr[1].'</h2>
							<p>'.$arr[2].'</p>
							'.($arr[6] ? '<p><span class="confirmed">'.$arr[6].'</span></p>' : '').'
						</div>
';
	}



?>