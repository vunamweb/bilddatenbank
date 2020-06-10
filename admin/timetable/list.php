<?php
session_start();

include_once('controllers/timetable_controller.php');

// Variables
$relative_url = '../../';
$relative_path = '../';
$page = 'timetable';

// Get controller
$timetable = new TimetableController();
?>

<!DOCTYPE html>
<html>
<!-- Header -->
<?php include $relative_path . 'header.php'; ?>

<body class="admin-panel">
	<!-- Navbar -->
	<?php include $relative_path . 'navbar.php'; ?>

	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Sidebar -->
		<?php include $relative_path . 'sidebar.php'; ?>

		<aside class="right-side">
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<section class="panel">
							<div class="panel-body">
								<?php $timetable->displayTimetableList(); ?>
							</div>
						</section>
					</div>
				</div>
			</section>

			<!-- Footer -->
			<?php include $relative_path . 'footer.php'; ?>
		</aside>
	</div>
</body>
</html>