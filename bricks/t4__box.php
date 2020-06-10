<?php
	global $box_count;

	$tmp = explode("|", $text);

	if(!$box_count) $box_count = 1;
	else $box_count++;

	$output .= '
				<li'.($box_count % 2 ? '' : ' class="timeline-inverted"').'>
					<div class="timeline-badge"></div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h4 class="timeline-title">'.$tmp[0].'</h4>
						</div>
						<div class="timeline-body">
							<p>'.nl2br(trim($tmp[1])).'</p>
						</div>
					</div>
				</li>
';

	$morp = "Box Zeitreise";

?>