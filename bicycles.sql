-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 31 2023 г., 15:40
-- Версия сервера: 5.7.33
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bicycles`
--

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `idp` int(11) NOT NULL COMMENT 'id продукта',
  `prodname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Наименование продукта',
  `color` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Цвет продукта',
  `costpday` decimal(10,0) NOT NULL COMMENT 'Стоимость проката в день'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`idp`, `prodname`, `color`, `costpday`) VALUES
(1, 'STELS', 'Black', '1000'),
(2, 'STERN', 'Green', '1200'),
(3, 'STELS', 'Yellow', '1300');

-- --------------------------------------------------------

--
-- Структура таблицы `rental`
--

CREATE TABLE `rental` (
  `rentid` int(11) NOT NULL,
  `idclient` int(11) NOT NULL,
  `idprod` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `daysofrental` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `rental`
--

INSERT INTO `rental` (`rentid`, `idclient`, `idprod`, `startdate`, `daysofrental`) VALUES
(1, 1, 1, '2023-05-31', '3'),
(2, 2, 2, '2023-05-30', '5'),
(3, 3, 3, '2023-05-22', '15');

-- --------------------------------------------------------

--
-- Структура таблицы `userid`
--

CREATE TABLE `userid` (
  `id` int(11) NOT NULL COMMENT 'id клиента',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя клиента',
  `surname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Фамилия клиента',
  `dateofbd` date NOT NULL COMMENT 'Дата рождения клиента',
  `passport` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Серия и номер паспорта'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `userid`
--

INSERT INTO `userid` (`id`, `name`, `surname`, `dateofbd`, `passport`) VALUES
(1, 'Егор', 'Свиридович', '1996-10-22', '6916727769'),
(2, 'Леонид', 'Попов', '1996-05-15', '6161787899'),
(3, 'Антон', 'Леонидов', '2003-05-12', '9191505050');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`idp`);

--
-- Индексы таблицы `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`rentid`),
  ADD KEY `idclient` (`idclient`),
  ADD KEY `idprod` (`idprod`);

--
-- Индексы таблицы `userid`
--
ALTER TABLE `userid`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `idp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id продукта', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `rental`
--
ALTER TABLE `rental`
  MODIFY `rentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `userid`
--
ALTER TABLE `userid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id клиента', AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`idclient`) REFERENCES `userid` (`id`),
  ADD CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`idprod`) REFERENCES `products` (`idp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
