<?php
$pdo = new PDO('pgsql:host=db;dbname=mydatabase', 'myuser', 'mypassword');

$url = $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
$userIp = $_SERVER['REMOTE_ADDR'];

$stmt = $pdo->prepare("INSERT INTO site_visits (url, user_ip) VALUES (?, ?)");
$stmt->execute([$url, $userIp]);



$stmt = $pdo->prepare("SELECT * FROM site_visits");
$stmt->execute();

$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo "<pre>";
foreach ($results as $res) {
    print_r($res['visit_time']);
    echo "[ " . $res['visit_time'] . " ]: " . $res['user_ip'] . " | " . $res['url'] . "<hr>";
}
print_r($result);
echo "</pre>";