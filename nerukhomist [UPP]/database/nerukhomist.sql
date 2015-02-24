-- phpMyAdmin SQL Dump
-- version 4.0.10.6
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 22 2015 г., 22:21
-- Версия сервера: 5.5.41-log
-- Версия PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `nerukhomist`
--

-- --------------------------------------------------------

--
-- Структура таблицы `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(10) unsigned NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `address`
--

INSERT INTO `address` (`id`, `city`, `district`, `street`) VALUES
(0, 'Kiev', 'Holosiyivsky', 'Gorky'),
(1, 'Kiev', 'Desnianskyi', 'Artema'),
(2, 'Kiev', 'Shevchenkivskyi', 'Khreschatyk');

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id`, `name`) VALUES
(1, 'LOL');

-- --------------------------------------------------------

--
-- Структура таблицы `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rooms_quantity` smallint(5) unsigned DEFAULT NULL,
  `total_area` decimal(10,2) unsigned DEFAULT NULL,
  `item_class` enum('low-priced','middle-priced','luxury') DEFAULT NULL,
  `price` decimal(50,2) DEFAULT NULL,
  `floor` tinyint(4) DEFAULT NULL,
  `type` enum('residental','non-residental') DEFAULT NULL,
  `item_type` enum('rent','sale') DEFAULT NULL,
  `begin` datetime DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `address_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address_id` (`address_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `item`
--

INSERT INTO `item` (`id`, `rooms_quantity`, `total_area`, `item_class`, `price`, `floor`, `type`, `item_type`, `begin`, `status`, `end`, `address_id`) VALUES
(1, 3, '100.00', 'middle-priced', '12000.00', 1, 'residental', 'sale', '2015-02-18 15:43:16', 'active', '2015-02-18 15:43:14', 0),
(2, 5, '300.00', 'luxury', '99000.00', 5, 'residental', 'sale', '2015-02-18 15:43:16', 'active', '2015-02-18 15:43:14', 2),
(3, 2, '67.00', 'low-priced', '30000.00', 0, 'non-residental', 'rent', '2014-02-18 15:47:50', 'canceled', '2014-02-18 15:47:51', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `rent_deal`
--

CREATE TABLE IF NOT EXISTS `rent_deal` (
  `id` int(11) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `months` smallint(5) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rent_deal`
--

INSERT INTO `rent_deal` (`id`, `client_id`, `months`, `item_id`) VALUES
(0, 1, 12, 2);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`);

--
-- Ограничения внешнего ключа таблицы `rent_deal`
--
ALTER TABLE `rent_deal`
  ADD CONSTRAINT `client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
