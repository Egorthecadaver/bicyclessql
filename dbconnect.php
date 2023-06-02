<?php
require __DIR__ . '/vendor/autoload.php'; //загрузка всех установленных библиотек
use Dotenv\Dotenv;                        //импорт класса Dotenv из пространства имен dotenv
if (file_exists(__DIR__."/.env"))
{
    $dotenv = Dotenv::createImmutable(__DIR__);
    $dotenv->load(); //все параметры окружения помещаются в массив $_ENV
}
try {
    $conn = new PDO("mysql:host=".$_ENV['localhost'].";dbname=".$_ENV['bicycles'].";charset=utf8mb4", $_ENV['root'], $_ENV['dbpassword']);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

}
catch(PDOException $e) {
    echo "Ошибка подключения к БД: " . $e->getMessage(), $e->getCode( );
    die();
}
