<?php
/* pixel-dusche.de */
global $hl, $design, $grIMG, $itext, $startDIV, $anker, $h1;

if($tref == 1 || !$tref) $template = '

    <div class="container-full content ohneHeaderBild">
#cont#
    </div>

';
elseif($tref == 2) $template = '
<section>
    <div class="container container-xl">
        <div class="row">
            <div class="col-xs-12">
#cont#

            </div>
        </div>
    </div>
</section>
';
elseif($tref == 3) $template = '
<section>

#cont#

</section>

';

$hl = '';
$farbe = '';
$class = '';
$grIMG = '';
$itext = '';


?>