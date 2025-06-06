<?php

$v = Imagick::getVersion();
print_r($v);
preg_match('/ImageMagick ([0-9]+\.[0-9]+\.[0-9]+)/', $v['versionString'], $v);
if(version_compare($v[1],'6.2.8')<=0){
   print "Your ImageMagick Version {$v[1]} is '6.2.8' or older, please upgrade!";
}




$images = new Imagick(glob('*.jpg'));

?>
<pre>
<?php
print_r(glob('*.jpg'));

$path = "/www/htdocs/w0118b8d/_pixel-dusche/anigif"; // your image directory

$files = scandir($path);

# print_r($files);
?>



<?php


$fileTypes = array('jpg', 'jpeg', 'png', 'pdf', 'swf', 'ai', 'eps', 'tif', 'tiff', 'psd', 'svg'); // Allowed file extensions
$x = 1;

foreach( $files as $f )
{
	$fileParts = pathinfo($f);
	// print_r($fileParts);
	$x++;

	$thisFileTyp = strtolower($fileParts['extension']);

	if (in_array($thisFileTyp, $fileTypes)) {
		echo "<hr>".$f.'<br>';
	    $im = new Imagick($f);
	    $imageprops = $im->getImageProperties();
	    print_r($imageprops);

	    $width = $im->getImageWidth();
		$height = $im->getImageHeight();
		$noOfPagesInPDF = $im->getNumberImages();

		echo 'number of pages: '.$noOfPagesInPDF.'<br>';

		$newImageName = "new_".$f;

		if($thisFileTyp == "eps")	{
			exec("/usr/bin/convert convert -density 300 $f -resize 240x240 eps/eps-$f.jpg");
			echo '<img src="eps/eps-'.$f.'.jpg" ><br>';
		}
		elseif($thisFileTyp == "ai")	{
			exec("/usr/bin/convert convert -density 300 $f -resize 240x240 eps/ai-$f.png");
			echo '<img src="eps/ai-'.$f.'.png" ><br>';
			// for($i=1; $i<$noOfPagesInPDF; $i++) echo '<img src="eps/ai-'.$f.'-'.$i.'.jpg" ><br>';
		}
		elseif($thisFileTyp == "pdf")	{
//			exec("/usr/bin/convert convert -colorspace sRGB -density 300 $f -resize 240x240 eps/$f.jpg");
			exec("/usr/bin/convert convert  -limit thread 1 -colorspace RGB $f -background white -alpha deactivate -resize 400x400 -colorspace sRGB -scene 1 eps/pdf-0".$x.".jpg");
//			for($i=0; $i<$noOfPagesInPDF; $i++) echo '<img src="eps/'.$f.'-'.$i.'.jpg" ><br>';
			for($i=1; $i<=$noOfPagesInPDF; $i++) echo '<img src="eps/pdf-0'.$x.'-'.$i.'.jpg" ><br>';
		}
		elseif($thisFileTyp == "psd")	{
			exec("/usr/bin/convert convert -colorspace sRGB -density 300 $f -resize 500x500 eps/psd-$f.jpg");
			if($noOfPagesInPDF > 1) for($i=0; $i<$noOfPagesInPDF; $i++) echo '<img src="eps/psd-'.$f.'-'.$i.'.jpg" ><br>';
			else echo '<img src="eps/psd-'.$f.'.jpg" ><br>';
		}
		else {
			exec("/usr/bin/convert convert -colorspace sRGB -density 300 $f -resize 600x600 eps/".$thisFileTyp."-$f.jpg");
			echo '<img src="eps/'.$thisFileTyp.'-'.$f.'.jpg" ><br>';
		}


		// else echo '<img src="'.$f.'" ><br>'.$f .' - '. $width. ' - ' . $height;


	    echo "<br><br>";

	 #   $auxIMG->readImage($mytifspath."/".$files[$i]);

  #  $multiTIFF->addImage($auxIMG);
	}
}

//file multi.TIF
// $multiTIFF->writeImages('multi423432.gif', true); // combine all image into one single image

//files multi-0.TIF, multi-1.TIF, ...
// $multiTIFF->writeImages('multi.gif', false);

?>