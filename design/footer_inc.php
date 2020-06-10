<?php
	$uri	 = $_SERVER["REQUEST_URI"];

	$footer_navid_arr = array(22,2,3,11);
?>

<footer class="pt4 pb4 mt6">
    <div class="container-full">
        <div class="row">
<?php
	foreach($footer_navid_arr as $key) {
		echo '            <div class="col-md-2 col-xs-6">
	            <p><a href="'.$dir.$navID[$key].'" alt="'.$navarrayFULL[$key].'">'.$navarrayFULL[$key].'</a></p>
	            <ul>
';
		echo set_nav('<li><a href="url">name</a></li>', $key, 2, 0);

		echo '
	            </ul>
            </div>
';
	}
?>
			<div class="col-md-2 col-xs-6">
	            <p><a href="<?php echo $dir.$navID[4]; ?>"><?php echo $navarrayFULL[4]; ?></a></p>
	            <p><a href="<?php echo $dir.$navID[12]; ?>" alt="Galerien"><?php echo $navarrayFULL[12]; ?></a></p>

            </div>

            <div class="col-md-2 col-xs-6">
	            <ul class="versal">
		            	<li><a href="<?php echo $dir; ?>">STARTSEITE</a></li>
<?php echo $nav_meta; ?>
	            </ul>
	            <ul class="versal">
<?php echo $nav_footer; ?>
	            </ul>
            </div>
        </div>
    </div>
</footer>


<div class="container copyright">
    <div class="row">
        <div class="col-md-12 center">
			<p><?php echo date("Y"); ?> Frankfurter Kinderbüro</p>
        </div>
    </div>
</div>


<script src="<?php echo $dir; ?>js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="<?php echo $dir; ?>js/jquery-ui.js"></script>
<script src="<?php echo $dir; ?>js/bootstrap.min.js" type="text/javascript"></script>
<script src="<?php echo $dir; ?>js/swiper.min.js" type="text/javascript"></script>
<script src="<?php echo $dir; ?>js/ekko-lightbox.min.js" type="text/javascript"></script>
<script src="<?php echo $dir; ?>js/isotope.pkgd.js" type="text/javascript"></script>
<script src="<?php echo $dir; ?>js/selectize.js"></script>
<script src="<?php echo $dir; ?>js/imagesloaded.pkgd.min.js"></script>
<script src="https://semantic-ui.com/dist/semantic.js" type="text/javascript"></script>

<?php if ($hn_id == 3) { ?>
<script src="<?php echo $dir; ?>assets/js/jquery.magnific-popup.js"></script>
<script src="<?php echo $dir; ?>assets/js/timetable.js"></script>
<?php } ?>

<?php global $upload;
	if($upload) {
?>

<link rel="stylesheet" type="text/css" href="<?php echo $dir; ?>uploadifive/uploadifive.css">
<!-- <script src="<?php echo $dir; ?>uploadifive/jquery.min.js" type="text/javascript"></script> -->
<script src="<?php echo $dir; ?>uploadifive/jquery.uploadifive.min.js" type="text/javascript"></script>

<?php } ?>

<?php global $maps, $js, $jsFunc; echo $maps; ?>


<!-- Initialize Swiper + Ekko -->
<script type="text/javascript">
	 function getHashtags() {
	   
        var result = '';
        
        $('a.transition').each(function(){
            result = result + '#' + $(this).attr('data-value') + ',';
        })
        
        return result;  
	 }
     
     $('.linkbox, .cta-container').on("click", function() {
		ref = $(this).attr("ref");
		location.href=ref;
  		// console.log(ref);
  	});


	$(window).scroll(function(event){
	  var st = $(this).scrollTop();
	  if (st > 10){
	    if (!$('body').hasClass('down')) {
	      $('body').addClass('down');
	    }
	   } else {
	     $('body').removeClass('down');
	   }
	});

	  $('.dropdown-toggle').on('click', function() {
	      if ($(this).next().is(':visible')) {
	        location.href = $(this).attr('href');

	     }
	  });
      
      $('.upload').click(function(){
         var timestamp = $('#timestamp').val();
         var token = $('#token').val();
         var gnid = $('#gnid').val();
         var dir = $('#dir').val();
         var uploadScript = $('#uploadScript').val();
         
         var keyword = $('#keyword').val();
         var hashtags = getHashtags();
         
         if(hashtags == '') {
            alert('you need to fill keyword and hashtag');
            return;
         }
         
         
         $('#file_upload').data('uploadifive').settings.formData =
            {
                'timestamp' : ''+timestamp+'',
                'token'     : ''+token+'',
                'gnid'	   	: ''+gnid+'',
                'dir'	   	: ''+dir+'',
                'hashtags'	   	: ''+hashtags+'',
                'keyword'	   	: ''+keyword+''
            },
            $('#file_upload').uploadifive('upload');
      })

/*
	$('.overlay').click(function () {
		go = $(this).attr("ref");
		document.location.href=go;
	});
*/

	$(document).on('click', '[data-toggle="lightbox"]', function(event) {
	    event.preventDefault();
	    $(this).ekkoLightbox({
		    alwaysShowClose: true
	    });
	});

	$( document ).ready(function() {
		$('.selection.search').dropdown({maxSelections: 3});
        // console.log("ready");

	});
	$(window).on("load", function() {
      <?php echo $js; ?>
  });

<?php echo $jsFunc; ?>

	var wasmobile;

	function setSlider() {

		ssw = $(".swiper-slide").width();

		if(ssw < 769) {
			if(wasmobile >= 769) location.reload();
			wasmobile = ssw;
			// console.log(wasmobile);
			if(ssw < 500) {
				ssh = 300;
				mch = ssh+130;
			}
			else if(ssw < 769) {
				ssh = 350;
				mch = ssh+120;
			}
			$(".swiper-slide").css({ "height" : ssh+"px" });
			$("#myCarousel").css({ "height" : mch+"px" });
			// console.log(ssw+' # '+ssh);

			// location.reload();
		}
		else {
			if(wasmobile < 769) location.reload();
			wasmobile = ssw;
		}
	}


	$(window).on('resize', function(){
		setSlider();
	});


<?php
$sql = "SELECT * FROM morp_tags WHERE 1 ORDER BY tag";
$res = safe_query($sql);
$tag_list = '';
while ($row = mysqli_fetch_object($res)) {
	$tag_list .= '{value:'.$row->tagID.' , title: "'.$row->tag_long.'" },
';
}


?>
	var options = [
	 {id:'' , title: 'All' },
<?php echo $tag_list; ?>
	];


</script>

<!-- Matomo -->
<script type="text/javascript">
  var _paq = window._paq || [];
  /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//php7.pixeldusche.com/intranet/matomo/";
    _paq.push(['setTrackerUrl', u+'matomo.php']);
    _paq.push(['setSiteId', '1']);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'matomo.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<!-- End Matomo Code -->

</body>
</html>