<?php

$apiKey = "";

if (!isset($GLOBALS['city'])) {
    $city = "Los%20Angeles";
}

// Формирование URL для запроса к API
//$url = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey";
$url = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

// Инициализация cURL сессии
$ch = curl_init();

// Настройка опций cURL
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_URL, $url);

// Выполнение cURL запроса
$response = curl_exec($ch);
//print_r($response);

$data = json_decode($response, true);

//echo "<br><code><pre>";
//print_r($data);
//
//if (isset($data['cod']) && $data['cod'] == 400) {
//    echo "not found";
//}
//else {
////    echo "</code></pre><br>";
//    echo ($data['main']['temp']);
//}
echo ("<br> Temp in city $city: " . $data['main']['temp']);


// Закрытие cURL сессии
curl_close($ch);