<?php
	$uri	 = $_SERVER["REQUEST_URI"];

	$footer_navid_arr = array(22,2,3,11);
?>

<footer class="pt4 pb4 mt6">
    <div class="container-full">
        <div class="row">
<?php
	foreach($footer_navid_arr as $key) {
		if($navarrayFULL[$key] != '') {
		  echo '            <div class="col-md-2 col-xs-6">
	            <p><a class="nav-link" href="'.$dir.$navID[$key].'" alt="'.$navarrayFULL[$key].'">'.$navarrayFULL[$key].'</a></p>
	            <ul>
';
		echo set_nav('<li><a class="nav-link" href="url">name</a></li>', $key, 2, 0);

		echo ' 
	            </ul>
            </div>
';
		}
    }
?>
			<div class="col-md-2 col-xs-6">
	            <p><a class="nav-link" href="<?php echo $dir.$navID[4]; ?>"><?php echo $navarrayFULL[4]; ?></a></p>
	            <p><a class="nav-link" href="<?php echo $dir.$navID[12]; ?>" alt="Galerien"><?php echo $navarrayFULL[12]; ?></a></p>

            </div>

            <div class="col-md-2 col-xs-6">
	            <ul class="versal">
		            	<li><a class="nav-link" href="<?php echo $dir; ?>">STARTSEITE</a></li>
<?php echo $nav_meta; ?>
	            </ul>
	            <ul class="versal">
<?php echo $nav_footer; ?>
	            </ul>
            </div>
        </div>
    </div>
    <div class="container copyright">
        	<p><?php echo date("Y"); ?> 2020 Frankfurter Kinderbüro, Konzept und Gestaltung: Konzept fünf, <a href="www.konzept-fuenf.de" target="_blank">www.konzept-fuenf.de</a></p>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>!-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.0-beta/js/bootstrap-select.min.js"></script>
<script src="<?php echo $dir; ?>js/jquery-ui.js"></script>
<script src="<?php echo $dir; ?>js/swiper.min.js" type="text/javascript"></script>
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
	 var timeOut = 50, invitation = [], countInvite = 0, widthOpenMenu = 250, widthCloseMenu = 50;
     
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
                $('.navbar-form').submit();
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
    				$(dom).parent().parent().parent().hide();
                }
    	    });
         })
         
         $('.delete_galerie_folders_images_').click(function(){
            var origin   = $('#url').val();
            
            var id = $(this).attr('href');
            id = id.replace('#', '');
            
            var dom = this;
            
            request = $.ajax({
    	        url: ""+origin+"home/galerie+del_folder_img",
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
         
         $('.delete_galerie_folders_images_confirm_').click(function(){
            var r = confirm("Are you sure to delete?");
            
            if(r)
             $(this).parent().find('.delete_galerie_folders_images_').click();
         })
     }
     
     function setShowGallery() {
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
                    setJsEditButtonModal();
                }
    	    });
         })
     }
     
     function setTextAfterSave(select, text) {
        var data = '';
        
        $(select).each(function(){
            data = data + '<strong>#' + $(this).text() + '&nbsp;&nbsp</strong>';
        })
        
        $(text).html(data);
     }
     
     function setJsEditButtonModal() {
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
                        keyWord = $("#keyword"+id).val();
                        var hashtags = getHashtags();
                
                		request = $.ajax({
                	        url: ""+origin+"home/galerie+update",
                	        type: "get",
                	        data: "myText="+myText+"&keyWord="+keyWord+"&hashtags="+hashtags+"&id="+id+"&feld=gid&table=morp_cms_galerie",
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
     
     function validateEmail(email) {
       const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
       return re.test(String(email).toLowerCase());
     }
     
     function openNav() {
      document.getElementById("mySidenav").style.width = ''+widthOpenMenu+'px';
      document.getElementById("main").style.marginLeft= ''+widthOpenMenu+'px';
      
      $('.selection.search').show();
      $('.minimize').css('display', 'none');
      $('.right-board .right_content').hide();
      $('.open_close_menu').show();
      $('.open_close_menu.navbar_menu').hide();
      $('.navbar-form').css('padding-left', '15px');
      $('.open_close_menu.navbar_menu').css('left', '35px');
      $('.left_bottom').show();
      $('.filter_search').hide();
      
      $('.right_menu').html('<i class="fa fa-angle-double-left"></i>');
      
      
      
      
      /*document.getElementById("mySidenav").style.width = ""+widthOpenMenu+"px";
      document.getElementById("main").style.marginLeft = ""+widthOpenMenu+"px";
      
      $('.left-board .navbar-form').show();
      $('.open_close_menu').show();
      $('.open_close_menu.navbar_menu').hide();
      $('.left_bottom').show();
      $('.left_galleri').show();
      $('.left-board').css('background', '#ececec');
      $('.btn-upload-left').css('display', 'block');*/
    }

    function closeNav() {
      document.getElementById("mySidenav").style.width = ''+widthCloseMenu+'px';
      document.getElementById("main").style.marginLeft= ''+widthCloseMenu+'px';
      
      $('.selection.search').hide();
      $('.minimize').css('display', 'block');
      $('.right-board .right_content').show();
      $('.open_close_menu').hide();
      $('.open_close_menu.navbar_menu').show();
      $('.navbar-form').css('padding-left', '0');
      $('.open_close_menu.navbar_menu').css('left', '8px');
      $('.left_bottom').hide();
      $('.filter_search').show();
      
      $('.right_menu').html('<i class="fa fa-angle-double-right"></i>');
      /*$('.left-board .navbar-form').hide();
      $('.open_close_menu').hide();
      $('.open_close_menu.navbar_menu').show();
      $('.left_bottom').hide();
      $('.left-board').css('background', 'none');
      $('.btn-upload-left').hide();
      $('.left_galleri').hide();*/
   }
     
     function setSelectIcon() {
        $('#type_photo').selectpicker();
        $('.number_page').selectpicker();
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

   /*$(document).on('click', '[data-toggle="lightbox"]', function(event) {
                event.preventDefault();
                $(this).ekkoLightbox();
   });*/

	$( document ).ready(function() {
		$('.selection.search').dropdown({maxSelections: 3});
        
        setClickDeleteGalerieFoldersImages();
        setShowGallery();
        //setSelect();
        setSelectIcon();
        
        /*$('.selection.search').mouseout(function(){
            $('.selection.search').hide();
        })*/
        
        $('#suche').focus(function(){
            $('.btn.btn-default.pull-right').hide();
        })
        $('.minimize').hover(function(){
            var parent_class = $(this).attr('href');
            parent_class = parent_class.replace('#', '');
            
            $('.selection.search').hide();
            
            //alert($('.search_'+parent_class+'.dropdown').offset().top);
            $('.search_'+parent_class+'.dropdown').show();
        })
        
        /*$('.minimize').mouseout(function(){
            var parent_class = $(this).attr('href');
            parent_class = parent_class.replace('#', '');
            
            $('.search_'+parent_class+'.dropdown').hide();
        })*/
        
        $('.right_menu').click(function(){
           var width = $('#mySidenav').width();
           
           if(width >= widthCloseMenu)
             closeNav();
           else 
             openNav();     
        })
        
        $('.search.dropdown .item').click(function() {
		    var dataValue = $(this).attr('data-value');
            
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
        
        $('.number_page').change(function(){
            $('.navbar-form').submit();
         })
         
         $('.navbar-form').submit(function(e){
            e.preventDefault();
            
            //$('.content').html('');
            $('.content .fa.fa-spinner').show();
            
            var page = $('#page').val();
            var number = $('.number_page').val();
            
            $('.content .fa.fa-spinner').show();
            
            var origin   = $('#url').val();
            
            var search = $('#suche').val();
            
            var category_id = $('#category_id').val();
            
            //call ajax to changen content
                    $.ajax({
                        url: ''+origin+'/home/galerie+search',
                        type: 'get',
                        data: {
                          search_value: search,
                          page: page,
                          number: number,
                          hashtags: getHashtags(),
                          category_id: category_id
                        },
                        dataType: 'json',
                        beforeSend: function beforeSend() {},
                        complete: function complete(obj) {
                            $('.content .fa.fa-spinner').hide();
                            
                            $('.content').html(obj.responseText);
                            
                            setShowGallery();
                            
                            $('.grid-item ').each(function(){
                                $(this).css('opacity', 1);
                            })
                            
                            $grid = $('.grid').isotope({
                              itemSelector: '.grid-item',
                              masonry: {
                             	columnWidth: '.grid-sizer',
                             	percentPosition: true
                              }
                            });
                            $grid.imagesLoaded().progress( function() {
                              $grid.isotope('layout');
                            });
                            
                            $('.number_pagination').click(function(){
                                var currentPage = $('#page').val();
                                
                                var page = $(this).attr('href');
                                page = page.replace('#', '');
                                
                                if(currentPage != page) {
                                   $('#page').val(page);
                                
                                   $('.navbar-form').submit(); 
                                }
                           })
                           
                           $('.previous_pagination').click(function(){
                              var page = $('#page').val();
                              
                              if(page > 1) {
                                 $('#page').val(parseInt(page) - 1);
                                 
                                 $('.navbar-form').submit();
                              }
                           })
                           
                           $('.next_pagination').click(function(){
                              var page = $('#page').val();
                              
                              var totalPage = $('.infor_pagination .number_pagination').length;
                              
                              if(page < totalPage) {
                                 $('#page').val(parseInt(page) + 1);
                                 
                                 $('.navbar-form').submit();
                              }
                           })
                        },
                        success: function success(result) {
                          
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
                    setJsEditButtonModal();
                }
    	    });
         })
         
         $('.invite_partner'). click(function(){
            $('.right-board .content').removeClass('hide');
         })
         
         $('.allowedtosend').click(function(){
            var origin   = $('#url').val();
            
            var folder_id = $('#folder_id').val();
            
            request = $.ajax({
                	        url: ""+origin+"home/galerie+guest",
                	        type: "get",
                	        data: "folder_id="+folder_id+"&data="+JSON.stringify(invitation)+"",
                	        success: function(data) {
                			  $('.alert-success').html('Save and send login successfully');	
                            }
                	    });  
         })
         
         $('.edit_guest').click(function(){
            var origin   = $('#url').val();
            
            var id = $(this).attr('href');
            id = id.replace('#', '');
            
            request = $.ajax({
                	        url: ""+origin+"home/galerie+editguest",
                	        type: "get",
                	        data: "id="+id+"",
                	        success: function(data) {
                			  $('#area_edit_guest').show();
                              $('#area_edit_guest').html(data);
                              
                              $('.areafolder .mt2').hide();
                              
                              $('.arrow-back-guest').click(function(){
                                 $('.areafolder .mt2').show();
                                 $('#area_edit_guest').hide();
                                 
                                 $('.alert-success').addClass('hide');
                                 
                              })
                              
                              $('.save_guest').click(function(){
                                    var origin   = $('#url').val();
                                    
                                    var id = $(this).attr('ref');
                                    var start_date = $('#start_dat').val();
                                    var end_date = $('#end_dat').val();
                                    var email = $('#email').val();
                                    var pass = $('#password').val();
                                    
                                    request = $.ajax({
                                        	        url: ""+origin+"home/galerie+updateguest",
                                        	        type: "get",
                                        	        data: "id="+id+"&email="+email+"&pass="+pass+"&start_date="+start_date+"&end_date="+end_date+"",
                                        	        success: function(data) {
                                        			  $('.areafolder .mt2').show();
                                                      $('#area_edit_guest').hide();
                                                      
                                                      $('.alert-success').removeClass('hide');
                                                      
                                                      email = email.split('@');
                                                      $('#user_'+id+'').html(email[0]);
                                                    }
                               	    }); 
                           })
                            }
                	    });  
         })
         
         $('.delete_guest').click(function(){
            var origin   = $('#url').val();
                                    
            var id = $(this).attr('href');
            id = id.replace('#', '');
            
            request = $.ajax({
   	         url: ""+origin+"home/galerie+delguest",
   	         type: "get",
             data: "id="+id+"",
             success: function(data) {
       			  $('.tr_'+id+'').hide();
              }
       	    }); 
            
         })
         
         
         $('.right-board .content input').click(function(){
            $('.alert-success').addClass('hide');
            $('.alert-error').addClass('hide');
         })
         
         $('.allowedtosave').click(function(){
            var origin   = $('#url').val();
            
            var username = $('#username');
            var password = $('#password');
            var email = $('#email');
            var start_date = $('#start_dat');
            var end_date = $('#end_dat');
            var folder_id = $('#folder_id').val();
            
            if(!validateEmail(email.val())) {
                email.addClass('error');
            } else {
                email.removeClass('error'); 
            }
            
            if(password.val() == '') {
                password.addClass('error');
            } else {
                password.removeClass('error'); 
            }
            
            if(start_date.val() == '') {
                start_date.addClass('error');
            } else {
                start_date.removeClass('error'); 
            }
            
            if(end_date.val() == '') {
                end_date.addClass('error');
            } else {
                end_date.removeClass('error'); 
            }
            
            if(!validateEmail(email.val()) || password.val() == '' || start_date.val() == '' || end_date.val() == '') {
                $('.alert-error').removeClass('hide');
                $('.alert-success').addClass('hide');
            }
            else {
              $('.alert-error').addClass('hide');
              $('.alert-success').removeClass('hide');
              
              invitation[countInvite] = {};
              invitation[countInvite].username = username.val();
              invitation[countInvite].password = password.val();
              invitation[countInvite].email = email.val();
              invitation[countInvite].start_date = start_date.val();
              invitation[countInvite].end_date = end_date.val();
              
              countInvite++;
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
</body>
</html>