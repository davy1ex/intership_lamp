<?php
date_default_timezone_set("America/Los_Angeles");
echo "Current time in Los Angeles: " . date("H:i:s");

$lat = 34.03;
$lon = 118.15;
$city = "Los%20Angeles";

require_once "../weatherMaker.php";