<aside class="left-side sidebar-offcanvas">
	<section class="sidebar">
		<!-- Menu -->
		<ul class="sidebar-menu">
			<li <?php echo $page == 'timetable' ? 'class="active"' : ''; ?>>
				<a href="<?php echo $relative_path; ?>timetable/list.php">
					<i class="fa fa-calendar"></i> <span>Timetables</span>
				</a>
			</li>
			<li <?php echo $page == 'user' ? 'class="active"' : ''; ?>>
				<a href="<?php echo $relative_url; ?>morpheus/index.php">
					<i class="fa fa-database"></i> <span>Morpheus</span>
				</a>
			</li>
		</ul>
	</section>
</aside>