<?php

$url = trim($_SERVER["REQUEST_URI"], "/");


switch ($url) {
    case 'l-a' :
        header("Location: /la/index.php");
        break;

    case 'nsk' :
        header("Location: /nsk/index.php");
        break;

}