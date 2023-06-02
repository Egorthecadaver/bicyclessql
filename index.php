<?php
require __DIR__ . '/vendor/autoload.php'; //загрузка всех установленных библиотек
use Dotenv\Dotenv;                        //импорт класса Dotenv из пространства имен dotenv
if (file_exists(__DIR__."/.env"))
{
    $dotenv = Dotenv::createImmutable(__DIR__);
    $dotenv->load(); //все параметры окружения помещаются в массив $_ENV
}
