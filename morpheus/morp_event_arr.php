<?php

	$arr_form = array(

#			array("", "CONFIG", '<div class="col-md-12 mb2">'),
#			array("", "CONFIG", '</div><div class="row mt2"><div class="col-md-6">'),

		array("eventName", "Titel Event", '<input type="Text" value="#v#" class="form-control" name="#n#" required />'),
		array("eventText", "Beschreibung", '<textarea class="form-control" name="#n#" />#v#</textarea>'),
		array("eventOrt", "Ort", '<input type="Text" value="#v#" class="form-control" name="#n#" />'),
		array("eventDatum", "Datum", '<input type="Text" value="#v#" class="form-control" name="#n#" />', 'date'),

		array("eventAnzahlTeilnehmer", "Anzahl Teilnehmer", '<input type="Text" value="#v#" class="form-control" name="#n#" />'),
		array("eventBegleitung", "Wieviel Begleiter", '<input type="Text" value="#v#" class="form-control" name="#n#" />'),

//		array("datumende", "End Datum", '<input type="Text" value="#v#" class="form-control" name="#n#" required />'),

#			array("", "CONFIG", '</div><div class="col-md-6">'),

		array("eventStartZeit", "Uhrzeit Beginn", '<input type="Text" value="#v#" class="form-control" name="#n#" />'),
		array("eventText", "Beschreibung", '<input type="Text" value="#v#" class="form-control" name="#n#" />'),

//			array("", "CONFIG", '</div><div class="col-md-12 mb3 mt2">'),

//		array("img1", "Foto 1", 'img'),

//		array("", "CONFIG", '</div></div>'),

	);


$table 	= 'morp_event';
$tid 	= 'eventid';


?>