<?php global $filterButton; $morpheus; ?>
	<section>
		<div class="container-xl">
			<!-- <div class="row row-flex row-flex-wrap"> -->
			<div class="row" id="main">
				<div class="col-md-3 left-board sidenav" id="mySidenav">
					<?php include( 'page/left.php') ?>
                </div>
				<div class="col-md-12 main content">
						<i class="fa fa-spinner" aria-hidden="true">
						</i>
						<?php echo $output; ?>
				</div>
				<div class="right-board">
						<?php if(get_guest_id_of_intranet_user() == 0) { ?>
                         <?php include( 'page/right.php') ?>
                        <?php } ?>
			    </div> 
                    
            </div>
		</div>
	</section>
	<div class="clearfix endFrame">
	</div>
    <input type="hidden" id="url" value="<?php echo $morpheus['url'] ?>" />
    <input type="hidden" id="page" value="1" />
    
    <div class="modal" id="myModal_area_folder">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- Modal Header -->
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										&times;
									</button>
								</div>
								<!-- Modal body -->
								<div class="modal-body">
								</div>
							</div>
						</div>
	</div>
    
    <div class="modal_new modal" id="myModal_edit_image">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- Modal Header -->
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										&times;
									</button>
								</div>
								<!-- Modal body -->
								<div class="modal-body">
									edut
								</div>
							</div>
						</div>
					</div>
                    
                    <div class="modal modal_new" id="myModal">
                          <div class="modal-dialog">
                            <div class="modal-content">
                        
                              <!-- Modal Header -->
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                              </div>
                        
                              <!-- Modal body -->
                              <div class="modal-body">
                                Modal body..
                              </div>
                        
                            </div>
                          </div>
                  </div>
                  
                  <div class="modal" id="myModal_add_folder">
                          <div class="modal-dialog">
                            <div class="modal-content">
                        
                              <!-- Modal Header -->
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <div class="header">
                                   <a href="#" class="btn btn-info add_folder">+ Neuen Ordner hinzufügen</a>
                                   <div class="area_add">
                                     <input type="text" name="name" id="name" placeholder="enter folder" />
                                     <a href="#" class="add_button"><i class="fa fa-check" aria-hidden="true"></i></a>
                                     <input type="button" value="Add" class="add_button hide" />
                                   </div>
                                </div>
                              </div>
                        
                              <!-- Modal body -->
                              <div class="modal-body">
                                     <div class="content">
                                       <div class="row">
                                       </div>
                                     <a href="#" class="btn btn-info save_button">Save</a>
                                     </div>
         
                              </div>
                        
                            </div>
                          </div>
                  </div>
                  
                  <div class="modal" id="myModal_add_hashtags_image">
                          <div class="modal-dialog">
                            <div class="modal-content">
                        
                              <!-- Modal Header -->
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                              </div>
                        
                              <!-- Modal body -->
                              <div class="modal-body">
                                     <div class="alert alert-success hide" role="alert">gespeichert update</div>
                                     <div class="content">
                                       <div class="row">
                                       </div>
                                     <a href="#" class="btn btn-info save_hashtags_image">Save</a>
                                     </div>
         
                              </div>
                        
                            </div>
                          </div>
                  </div>
    
    