<?php

// Check session login
/*
if (empty($_SESSION['log'])) {
	// If not login, redirect to the index page
	header('Location: ../morpheus/index.php');
	EXIT;
} else {
*/
/*
	if (isset($_SESSION['login_time'])){
		$login_session_duration = 900; // 15 minutes
		$current_time = time();
		if (((time() - $_SESSION['login_time']) > $login_session_duration)) { // Timeover
			// Unset session
			unset($_SESSION['user']);
			unset($_SESSION['login_time']);

			// Redirect to the index page
			header('Location: ' . $relative_path . 'index.php');
			EXIT;
		} else {
			$_SESSION['login_time'] = time();
		}
	}

}
*/
?>

