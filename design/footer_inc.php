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
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/core.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/md5.js"></script>

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
	 var timeOut = 50;
     
     function getHashtags() {
	   
        var result = '';
        
        $('a.transition').each(function(){
            result = result + $(this).attr('data-value') + ',';
        })
        
        return result;  
	 }
     
     function getfilter() {
	    var size = $('a.transition').length;
        if(size == 0)
          return '.tag';
          
        var count = 1;
        
        var result = '.';
        
        $('a.transition').each(function(){
            if(count < size)
              result = result + 'tag_' + $(this).attr('data-value') + ', .';
            else
              result = result + 'tag_' + $(this).attr('data-value');
              
            count++;  
        })
        
        return result;  
	 }
     
     function filter() {
        setTimeout(function(){ 
                var filter = getfilter();
                //alert(filter);
                
                var grid = $('.grid').isotope({
                  itemSelector: '.grid-item',
                  masonry: {
                 	columnWidth: '.grid-sizer',
                 	percentPosition: true
                  }
                });
                
               grid.isotope({ filter: filter }); 
            }, timeOut);
     }
     
     function setClickDeleteFolder() {
        $('.delete_folder'). click(function(){
                        var id = $(this).attr('href');
                        id = id.replace('#', '');
                        
                        var dom = this;
                        
                        var origin   = $('#url').val();
                        
                        request = $.ajax({
                	        url: ""+origin+"home/galerie+delfolder",
                	        type: "get",
                	        data: "id="+id+"",
                	        success: function(data) {
             			       $(dom).parent().hide();
                            }
                	    });
                   })
        
        $('.delete_folder_confirm'). click(function(){
          var r = confirm("Are you sure to delete?");
            
          if(r)
             $(this).parent().find('.delete_folder').click();             
          
        })           
     }
     
     function setClickDeleteGalerieFoldersImages(){
        $('.delete_galerie_folders_images').click(function(){
            var origin   = $('#url').val();
            
            var id = $(this).attr('href');
            id = id.replace('#', '');
            
            var dom = this;
            
            request = $.ajax({
    	        url: ""+origin+"home/galerie+delareafolderimg",
    	        type: "get",
                data: "id="+id+"",
    	        success: function(data) {
    				$(dom).parent().hide();
                }
    	    });
         })
         
         $('.delete_galerie_folders_images_confirm').click(function(){
            var r = confirm("Are you sure to delete?");
            
            if(r)
             $(this).parent().find('.delete_galerie_folders_images').click();
         })
     }
     
     function setTextAfterSave(select, text) {
        var data = '';
        
        $(select).each(function(){
            data = data + '<strong>#' + $(this).text() + '&nbsp;&nbsp</strong>';
        })
        
        $(text).html(data);
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
            alert('you need to fill hashtag');
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

   $(document).on('click', '[data-toggle="lightbox"]', function(event) {
	    event.preventDefault();
	    $(this).ekkoLightbox({
		    alwaysShowClose: true
	    });
	});

	$( document ).ready(function() {
		$('.selection.search').dropdown({maxSelections: 3});
        
        $('.search.dropdown .item').click(function() {
		    var dataValue = $(this).attr('data-value');
            
            filter();
            
            setTimeout(function(){ 
                $('.search.dropdown a.transition').each(function(){
                    var nowDataValue = $(this).attr('data-value');
                    
                    if(dataValue == nowDataValue)
                      $(this).click(function(){
                         filter();
                      })
                })
            }, timeOut);
         });
         
         $('.navbar-form').submit(function(e){
            e.preventDefault();
            
            $('.content .fa.fa-spinner').show();
            
            var origin   = $('#url').val();
            
            var search = $('#suche').val();
            
            //call ajax to changen content
                    $.ajax({
                        url: ''+origin+'/home/galerie+search',
                        type: 'get',
                        data: {
                          search_value: search
                        },
                        dataType: 'json',
                        beforeSend: function beforeSend() {},
                        complete: function complete(obj) {
                            $('.content .fa.fa-spinner').hide();
                            
                            $('.content').html(obj.responseText);
                            
                            $('.grid-item ').each(function(){
                                $(this).css('opacity', 1);
                            })
                        },
                        success: function success(result) {
                          //$('.content').html(result);
                        }
                    }); 
         })
         
         $('.show_galery').click(function(){
            var origin   = $('#url').val();
            
            var id = $(this).attr('href');
            data = id.replace('#', '');
            
            request = $.ajax({
    	        url: ""+origin+"home/galerie+modal",
    	        type: "get",
    	        data: "data="+data+"",
    	        success: function(data) {
    				$('#myModal .modal-body').html(data);
                }
    	    });
         })
         
         $('.add_folder'). click(function(){
            $('.area_add').show();
         })
         
         $('.add_button'). click(function(){
            var name = $('#name').val();
            
            var origin   = $('#url').val();
            
            request = $.ajax({
    	        url: ""+origin+"home/galerie+addfolder",
    	        type: "get",
    	        data: "name="+name+"",
    	        success: function(data) {
    				$("#myModal_add_folder .modal-body .content .row").append(data);
                    setClickDeleteFolder();
                }
    	    });
         })
         
         $('.show_folder').click(function(){
            var origin   = $('#url').val();
            
            var id = $(this).attr('href');
            data = id.replace('#', '');
            
            request = $.ajax({
    	        url: ""+origin+"home/galerie+showfolder",
    	        type: "get",
    	        success: function(data) {
    				$('#myModal_add_folder .modal-body .content .row').html(data);
                    
                    setClickDeleteFolder();
                }
    	    });
         })
         
         $('.area_folder').click(function(){
            var origin   = $('#url').val();
            
            var id = $(this).attr('href');
            id = id.replace('#', '');
            
            request = $.ajax({
    	        url: ""+origin+"home/galerie+areafoldermodal",
    	        type: "get",
                data: "id="+id+"",
    	        success: function(data) {
    				$('#myModal_area_folder .modal-body').html(data);
                    setClickDeleteGalerieFoldersImages();
                }
    	    });
         })
         
         $('.save_button').click(function(){
            var folder_id, galeries_id = '';
            
            var origin   = $('#url').val();
            
            var selected = $("input[type='radio'][name='folder']:checked");
            
            if (selected.length > 0) {
              folder_id = selected.val();
            } else {
                alert('you need choose at least one item');
            }
            
            $('input.checkbox').each(function(){
                var value = $(this).val();
                
                if($(this).is(":checked"))
                  galeries_id = galeries_id + value + ','
                  
            })
            
            request = $.ajax({
    	        url: ""+origin+"home/galerie+save_folder_galeries",
    	        type: "get",
                data: "folder_id="+folder_id+"&galeries_id="+galeries_id+"",
    	        success: function(data) {
    				$('#myModal_add_folder .close').click();
                }
    	    });
         })
         
         $('.edit_image').click(function(){
            var origin   = $('#url').val();
            
            var id = $(this).attr('href');
            id = id.replace('#', '');
            
            request = $.ajax({
    	        url: ""+origin+"kategorien/kategorien-edit/editgalery+"+id+"",
    	        type: "get",
    	        success: function(data) {
    				$('#myModal_edit_image .modal-body').html(data);
                    
                    $('.selection.dropdown').dropdown({maxSelections: 3});
                    
                    $('.show_infor a').click(function(){
                       $(this).parent().parent().hide();
                       $(this).parent().parent().parent().find('.show_edit').removeClass('hide');
                       $('.show_infor .alert-success').addClass('hide');
                    })
                
                    $('.show_edit a.arrow-back').click(function(){
                       $(this).parent().parent().addClass('hide');
                       $(this).parent().parent().parent().find('.show_infor').show();
                    })
                
                    $(".saveText").click(function () {
                	    var origin   = $('#url').val();
                        
                        id = $(this).attr("ref");
                	    myText = $("#t"+id).val();
                        var hashtags = getHashtags();
                
                		request = $.ajax({
                	        url: ""+origin+"home/galerie+update",
                	        type: "get",
                	        data: "myText="+myText+"&hashtags="+hashtags+"&id="+id+"&feld=gid&table=morp_cms_galerie",
                	        success: function(data) {
                				$('#s'+id).removeClass('btn-danger');
                                setTextAfterSave('.show_edit select option:selected', '.hashtag_'+id+'');
                                $('.des_'+id+'').html(myText);
                                $('.show_edit a.arrow-back').click();
                                $('.show_infor .alert-success').removeClass('hide');
                            }
                	    });
                   });
                }
    	    });
         })
         
         $('.invite_partner'). click(function(){
            $('.right-board .content').removeClass('hide');
         })
         
         $('.allowedtosend').click(function(){
            var origin   = $('#url').val();
            
            var validate = false;
            
            var username = $('#username');
            var password = $('#password');
            var email = $('#email');
            var start_date = $('#start_dat');
            var end_date = $('#end_dat');
            var folder_id = $('#folder_id').val();
            
            if(username.val() == '') {
                validate = true;
                username.addClass('error');
            } else {
                validate = false;
                username.removeClass('error'); 
            }
            
            if(password.val() == '') {
                validate = true;
                password.addClass('error');
            } else {
                validate = false;
                password.removeClass('error'); 
            }
            
            if(email.val() == '') {
                validate = true;
                email.addClass('error');
            } else {
                validate = false;
                email.removeClass('error'); 
            }
            
            if(start_date.val() == '') {
                validate = true;
                start_date.addClass('error');
            } else {
                validate = false;
                start_date.removeClass('error'); 
            }
            
            if(end_date.val() == '') {
                validate = true;
                end_date.addClass('error');
            } else {
                validate = false;
                end_date.removeClass('error'); 
            }
            
            if(validate)
              $('.alert-error').removeClass('hide');
            else {
              $('.alert-error').addClass('hide'); 
              
              request = $.ajax({
                	        url: ""+origin+"home/galerie+guest",
                	        type: "get",
                	        data: "username="+username.val()+"&password="+password.val()+"&email="+email.val()+"&start_date="+start_date.val()+"&end_date="+end_date.val()+"&folder_id="+folder_id+"",
                	        success: function(data) {
                				
                            }
                	    });  
            }
              
         })
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