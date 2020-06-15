<?php global $filterButton; $morpheus; ?>
	<section>
		<div class="container-xl">
			<!-- <div class="row row-flex row-flex-wrap"> -->
			<div class="row">
				<div class="col-md-3 left-board">
					<?php include( 'page/left.php') ?>
				</div>
				<div class="">
					<div class="col-md-7 main content">
						<i class="fa fa-spinner" aria-hidden="true">
						</i>
						<?php echo $output; ?>
					</div>
					<div class="col-lg-2 right-board">
						<?php include( 'page/right.php') ?>
					</div>
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
					<div class="modal" id="myModal_edit_image">
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
					<input type="hidden" id="url" value="<?php echo $morpheus['url'] ?>" />
				</div>
			</div>
		</div>
	</section>
	<div class="clearfix endFrame">
	</div>