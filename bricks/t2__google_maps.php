<?php

	global $maps, $dir;

	$maps = '

<script src="https://maps.google.com/maps/api/js?key=AIzaSyAfmD52PUtO9UH4-uCrMymLlSdXT8aEoPs" type="text/javascript"></script>

<script type="text/javascript">
	function createMap(lat, lng, zoomVal) {
	    var mapOptions ={
	        center: new google.maps.LatLng(lat, lng),
	        zoom: zoomVal,
	        scrollwheel: false,
	        zoomControl: true,
	        zoomControlOptions: {
	            position: google.maps.ControlPosition.LEFT_CENTER
	        },
	//        mapTypeId: google.maps.MapTypeId.SATELLITE,
	        mapTypeId: google.maps.MapTypeId.ROADMAP,
	//        mapTypeId: google.maps.MapTypeId.HYBRID,
	//        mapTypeId: google.maps.MapTypeId.TERRAIN,
	        styles : [{featureType:\'all\',stylers:[{hue:"#92a0bc" },{saturation:-50},{gamma:0}]

	        }]
	    };

	    map = new google.maps.Map(document.getElementById("google-map"), mapOptions);

		var image = "'.$dir.'images/map-icon.png";
		var marker = new google.maps.Marker({
	      position: new google.maps.LatLng(lat, lng),
	      map: map,
	      icon: image
		});

	}
	var map;

	function initialize() {
	  createMap('.$text.');
	  // console.log("here");

	}

	google.maps.event.addDomListener(window, \'load\', initialize);

</script>
';



	$output .= '<section id="google-map" class="gmap slider-parallax"></section>';


$morp= "Google MAP";

?>