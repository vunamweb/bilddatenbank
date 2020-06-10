<?php
	global $bgImage;
?>

	<section class="bg_page" <?php if($bgImage) echo ' style="'.$bgImage.'"'; ?>>
		<div class="container">


<?php echo $output; $bgImage = ''; ?>


		</div>
	</section>