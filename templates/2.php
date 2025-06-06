<?php
/* pixel-dusche.de */
global $design, $cid, $tref;
global $lasttref, $linkbox, $template2count, $templateTotal, $lastUsedTemplateID, $templateIsClosed, $templateCloseNow;
global $farbe, $class, $tende, $tabstand, $tpos, $DoNotCloseTemplate, $anzahlOffenerDIV, $anker, $BoxLink;

$template = '';

$fileID = basename(__FILE__, '.php');

if(!$template2count || $template2count < 1) {
	$sql = "SELECT cid FROM morp_cms_content WHERE tid=$fileID AND navid=$cid AND ton=1 ORDER by tpos";
	$res = safe_query($sql);
	$templateTotal = mysqli_num_rows($res);

	$template2count = 1;
}
else $template2count++;



if($lastUsedTemplateID && $lastUsedTemplateID != $fileID && !$templateIsClosed) {
	for($i=1; $i<=$anzahlOffenerDIV; $i++) $template .= '					</div>
';

	$template .= '
				</section>
';
	$templateIsClosed=1;
}


if($template2count == 1 || $templateIsClosed) { 
	$template .= '
        <div class="row">';
	$templateIsClosed=0;
}



if($tref == 1 || !$tref) $template .= '
	    <div class="col-lg-4 col-md-4 col-sm-6 mb1'.($BoxLink ? ' cta-container' : '').'"'.($BoxLink ? ' ref="'.$BoxLink.'"' : '').'>
		    <div class="'.($class ? $class.' bg-color' : '').'"'.($farbe ? ' style="background:#'.$farbe.'"' : '').'">
#cont#
		    </div>
	    </div>
';
elseif($tref == 2) $template .= '
	    <div class="col-lg-3 col-md-4 col-sm-6 mb1'.($BoxLink ? ' cta-container' : '').'"'.($BoxLink ? ' ref="'.$BoxLink.'"' : '').'>
		    <div class="'.($class ? $class.' bg-color' : '').'"'.($farbe ? ' style="background:#'.$farbe.'"' : '').'">
#cont#
		    </div>
	    </div>
';
elseif($tref == 3) $template .= '
	    <div class="col-md-6 mb1'.($BoxLink ? ' cta-container' : '').'"'.($BoxLink ? ' ref="'.$BoxLink.'"' : '').'>
		    <div class="'.($class ? $class.' bg-color' : '').'"'.($farbe ? ' style="background:#'.$farbe.'"' : '').'">
#cont#
		    </div>
	    </div>
';
elseif($tref == 4) $template .= '
	    <div class="col-md-8 mb1'.($BoxLink ? ' cta-container' : '').'"'.($BoxLink ? ' ref="'.$BoxLink.'"' : '').'>
		    <div class="'.($class ? $class.' bg-color' : '').'"'.($farbe ? ' style="background:#'.$farbe.'"' : '').'">
#cont#
		    </div>
	    </div>
';
elseif($tref == 5) $template .= '

';

if(($template2count == $templateTotal || $tende) && !$templateIsClosed) {
	for($i=1; $i<=$anzahlOffenerDIV; $i++) $template .= '					</div>
';

	$template .= '

';
	$template2count = 0;
	$templateTotal = 0;
	$templateIsClosed = 1;
	$tende = 0;
}

$lastUsedTemplateID = $fileID;
$anzahlOffenerDIV = 1;


$farbe = '';
$class = '';
$tref = '';
$BoxLink = '';

?>