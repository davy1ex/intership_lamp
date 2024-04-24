<?php
date_default_timezone_set("Asia/Novosibirsk");
echo "Текущее время в Новосибирске: " . date("H:i:s");

$lat = "55.01";
$lon = "82.94";
$city = "Novosibirsk";

require_once "../weatherMaker.php";