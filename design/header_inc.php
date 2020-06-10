<!DOCTYPE html>
<html lang="<?php echo $lan; ?>">
<head>

<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->

<title><?php echo $title; ?></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="<?php echo $description; ?>" />
<meta name="keywords" content="<?php echo $keyw; ?>" />

<meta property="og:url" content="<?php echo substr($dir,0,(strlen($dir)-1)).$uri; ?>" />
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:description" content="<?php echo $desc; ?>"/>
<link href="<?php echo $dir; ?>css/font-awesome.min.css" media="screen" rel="stylesheet" type="text/css">
<link href="<?php echo $dir; ?>css/bootstrap.min.css" media="screen" rel="stylesheet" type="text/css">
<link href="<?php echo $dir; ?>css/swiper.min.css" media="screen" rel="stylesheet" type="text/css">
<link href="<?php echo $dir; ?>css/ekko-lightbox.css" media="screen" rel="stylesheet" type="text/css">
<link href="<?php echo $dir; ?>css/screen.css?v=<?php echo $zufall; ?>" media="screen, projection" rel="stylesheet" type="text/css">
<!-- <link href="<?php echo $dir; ?>css/zusatz.css" media="screen, projection" rel="stylesheet" type="text/css"> -->
<link rel="stylesheet" href="<?php echo $dir; ?>css/selectize.css">
<link href="<?php echo $dir; ?>css/print.css" media="print" rel="stylesheet" type="text/css">
<!-- semantic for dropdownmenu !--> 
<link href="https://semantic-ui.com/dist/semantic.css" media="screen, projection" rel="stylesheet" type="text/css">
<!--[if IE]>
<link href="/stylesheets/ie.css" media="screen, projection" rel="stylesheet" type="text/css" />
<![endif]-->
<link rel="stylesheet" href="<?php echo $dir; ?>css/animate.css" type="text/css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<?php if ($hn_id == 3) { ?>
<link rel="stylesheet" href="<?php echo $dir; ?>assets/css/magnific-popup.css">
<link rel="stylesheet" href="<?php echo $dir; ?>assets/css/style.css">
<?php }

global $galerie, $news, $hashtag;
if($galerie || $news || $hashtag) { ?>
<style>
.grid-item {
	opacity: 0;
}
.is-showing-items .grid-item {
	opacity: 1;
}
.grid-sizer, .grid-item { width: 25%; }
@media screen and (max-width: 1200px) {
	.grid-sizer, .grid-item { width: 33.33%; }
}
@media screen and (max-width: 900px) {
	.grid-sizer, .grid-item { width: 50%; }
}
@media screen and (max-width: 500px) {
	.grid-sizer, .grid-item { width: 100%; }
}
</style>
<?php } ?>

</head>
<body>
