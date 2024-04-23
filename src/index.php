<?php
// !!!!!! DEBUG
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
// !!!!!! DEBUG


$requested_url = trim($_SERVER['REQUEST_URI'], '/');

// echo "<pre>";
// print_r($requested_url);    
// echo "</pre>";

switch ($requested_url) {
    case 'l-a':
        header("Location: /la/index.php");
        break;
    case 'nsk':
        header("Location: /nsk/index.php");
        break;
    default:
        header("Location: /nsk/index.php");
        exit;
}




