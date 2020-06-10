<?php

	$headline = explode("\n",$text);
	$output .= '
					<div class="container">
						<div class="row">
							<div class="item col-md-12">
								<h1>'.$headline[0].'<br/><span>'.$headline[1].'</span></h1>
							</div>
						</div>
					</div>
';
	$morp = $text;
?>