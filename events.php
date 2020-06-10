<?php
include("nogo/config.php");
include("nogo/db.php");
dbconnect();

$sql = "SELECT * FROM morp_events WHERE 1 ORDER BY eventDatum DESC";
$res = safe_query($sql);
	// echo mysqli_num_rows($res);

echo '<option value="">Event</option>';

while ($row = mysqli_fetch_object($res)) {
	echo '<option value="'.$row->eventid.'"'.($event == $row->eventid ? ' selected' : '').'>'.$row->eventName.' / '.$row->eventDatum.' / '.$row->eventOrt.'</option>';
}
?>