-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- 생성 시간: 18-04-13 20:34
-- 서버 버전: 5.7.19
-- PHP 버전: 7.1.10

drop database if exists lamp2project;
create database if not exists lamp2project;

drop user if exists 'lamp2project'@'localhost';
grant all privileges on lamp2project.* to 'lamp2project'@'localhost' identified by 'lamp2project';

use lamp2project;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `lamp2project`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `customers`
--

CREATE TABLE `customers` (
  `CustId` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `UnitNum` varchar(10) DEFAULT NULL,
  `StreetAddress` varchar(50) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Province` varchar(20) NOT NULL,
  `PostCode` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `customers`
--

INSERT INTO `customers` (`CustId`, `FullName`, `UnitNum`, `StreetAddress`, `City`, `Province`, `PostCode`, `Email`, `PhoneNumber`) VALUES
(1, 'Vincent', NULL, '1966 hansuld', 'London', 'ON', '1y1 i3i', 'kingkingpo@naver.com', '226-378-3333'),
(2, 'aa', 'aa', 'aaaaa', 'aa', 'aa', 'aaa', 'bbb@naver.com', 'aaa'),
(3, 'aaa@n', 'aaaaaa@n@n', 'aaa@n', 'aaa@n', 'aaa@n', 'aaa@n', 'aaa@n', 'aaa@n'),
(4, 'cccc@n', 'cccc@n', 'cccc@n', 'cccc@n', 'cccc@n', 'cccc@n', 'cccc@n', 'cccc@n'),
(5, 'bb@n', 'bb@n', 'bb@n', 'bb@n', 'bb@n', 'bb@n', 'bb@n', 'bb@n'),
(6, 'ee@n', 'ee@n', 'ee@n', 'ee@n', 'ee@n', 'ee@n', 'ee@n', 'ee@n'),
(7, 'ee@n', 'ee@n', 'ee@n', 'ee@n', 'ee@n', 'ee@n', 'ee@n', 'ee@n'),
(8, 'ff@n', '1', '1', '1', 'Ontario', 'N5V1Y5', 'ff@n', 'ff@n'),
(9, 'hh@n', '1', '1', 'London', 'Ontario', 'hh@n', 'hh@n', '1'),
(10, 'ii@n', 'ii@n', 'ii@n', 'ii@n', 'ii@n', 'ii@n', 'ii@n', 'ii@n'),
(11, 'zzzz@n', 'zzzz@n', 'zzzz@n', 'zzzz@n', 'zzzz@n', 'zzzz@n', 'zzzz@n', 'zzzz@n'),
(12, 'korea@n', 'korea@n', 'korea@n', 'korea@n', 'korea@n', 'korea@n', 'korea@n', 'korea@n');

-- --------------------------------------------------------

--
-- 테이블 구조 `orders`
--

CREATE TABLE `orders` (
  `OrderId` int(8) NOT NULL,
  `CustId` int(11) DEFAULT NULL,
  `OrderDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DeliveryStreetAddress` varchar(50) NOT NULL,
  `DeliveryUnitNum` varchar(10) DEFAULT NULL,
  `DeliveryCity` varchar(20) DEFAULT NULL,
  `DeliveryProvince` varchar(20) DEFAULT NULL,
  `DeliveryPostCode` varchar(10) DEFAULT NULL,
  `EDT` datetime DEFAULT NULL,
  `TotalPaid` float(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `orders`
--

INSERT INTO `orders` (`OrderId`, `CustId`, `OrderDate`, `DeliveryStreetAddress`, `DeliveryUnitNum`, `DeliveryCity`, `DeliveryProvince`, `DeliveryPostCode`, `EDT`, `TotalPaid`) VALUES
(2, 1, '2018-03-21 03:10:10', '1651 Dale', NULL, 'London', 'ON', '1y3 2i2', '2018-03-22 10:25:25', 0.00),
(3, 1, '2018-03-16 00:00:00', '1651 Dale', NULL, 'London', 'ON', '1y3 2i2', NULL, 0.00),
(5, 1, '2018-03-16 00:00:00', '1961 hansuld', NULL, 'London', 'ON', '1y3 2i2', '2018-03-18 00:00:00', 22.00),
(6, 1, '2018-03-26 16:45:19', '1234 gg', NULL, 'Toronto', 'ON', NULL, NULL, NULL),
(7, 1, '2018-03-26 16:45:32', '1234 gg', NULL, 'Toronto', 'ON', NULL, NULL, NULL),
(8, 1, '2018-03-26 16:47:41', ' 1961 hansuld', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 1, '2018-03-26 17:31:41', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(10, 1, '2018-03-27 16:34:03', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(11, 1, '2018-04-01 16:20:54', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(12, 1, '2018-04-01 16:49:53', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(13, 1, '2018-04-01 16:52:15', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(14, 1, '2018-04-01 17:14:56', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(15, 1, '2018-04-01 17:33:04', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(16, 1, '2018-04-01 17:35:03', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(17, 1, '2018-04-01 17:43:14', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(18, 1, '2018-04-01 17:43:16', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(19, 1, '2018-04-01 17:43:17', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(20, 1, '2018-04-01 17:43:53', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(21, 1, '2018-04-01 17:45:40', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(22, 1, '2018-04-01 17:45:41', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(23, 1, '2018-04-01 17:51:16', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(24, 1, '2018-04-01 17:52:07', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(25, 1, '2018-04-01 17:53:12', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(26, 1, '2018-04-01 17:53:57', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(27, 1, '2018-04-01 17:54:56', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(28, 1, '2018-04-01 17:55:37', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(29, 1, '2018-04-01 17:56:26', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(30, 1, '2018-04-01 17:59:07', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(31, 1, '2018-04-01 18:03:06', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(32, 1, '2018-04-01 18:04:01', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(33, 1, '2018-04-01 18:04:40', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(34, 1, '2018-04-01 18:11:38', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(35, 1, '2018-04-01 18:13:44', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(36, 1, '2018-04-01 19:03:48', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(37, 1, '2018-04-01 19:06:25', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(38, 1, '2018-04-01 19:08:03', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(39, 1, '2018-04-01 19:09:33', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(40, 1, '2018-04-01 19:14:29', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(41, 1, '2018-04-01 19:17:08', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(42, 1, '2018-04-01 19:19:31', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(43, 1, '2018-04-01 19:20:28', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(44, 1, '2018-04-01 19:21:51', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(45, 1, '2018-04-01 19:23:04', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(46, 1, '2018-04-01 19:24:12', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(47, 1, '2018-04-01 19:26:18', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(48, 1, '2018-04-02 16:36:32', ' 1961 hansuld', '', 'null', 'null', 'null', NULL, NULL),
(49, 1, '2018-04-02 16:46:12', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(50, 1, '2018-04-02 16:50:46', '1234 gg', '', 'Toronto', 'ON', 'null', NULL, NULL),
(51, 1, '2018-04-03 00:15:41', '1234 gg', 'null', 'Toronto', 'ON', 'null', NULL, NULL),
(52, 1, '2018-04-03 02:50:23', ' 1961 hansuld', 'null', 'null', 'null', 'null', NULL, NULL),
(53, 1, '2018-04-03 12:26:58', ' 1961 hansuld', 'null', 'null', 'null', 'null', NULL, NULL),
(54, 1, '2018-04-03 13:09:21', ' 1961 hansuld', 'null', 'null', 'null', 'null', NULL, NULL),
(55, 1, '2018-04-05 15:28:42', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL),
(56, 1, '2018-04-09 11:11:37', 'www', 'www', 'www', 'www', 'www', NULL, NULL),
(57, 1, '2018-04-09 11:12:29', ' 1961 hansuld', 'null', 'null', 'null', 'null', NULL, NULL),
(58, 1, '2018-04-09 11:17:50', 'ggg', 'ggg', 'ggg', 'ggg', 'ggg', NULL, NULL),
(59, 1, '2018-04-09 14:16:58', '1651 Dale', 'null', 'London', 'ON', '1y3 2i2', NULL, NULL),
(60, 1, '2018-04-09 14:22:46', ' 1961 hansuld', '', 'null', 'null', 'null', NULL, NULL),
(61, 1, '2018-04-09 14:27:05', 'aaaaa', 'aa', 'aa', 'aa', 'aaa', NULL, NULL),
(62, 1, '2018-04-09 14:34:28', '1651 Dale', 'null', 'London', 'ON', '1y3 2i2', NULL, NULL),
(63, 1, '2018-04-09 14:34:47', '1651 Dale', 'null', 'London', 'ON', '1y3 2i2', NULL, NULL),
(64, 1, '2018-04-09 14:34:59', '1651 Dale', 'null', 'London', 'ON', '1y3 2i2', NULL, NULL),
(65, 1, '2018-04-09 14:39:30', '1592 Hansuld', 'www', 'London', 'Ontario', 'N5V1Y5', NULL, NULL),
(66, 1, '2018-04-09 14:47:35', 'www', 'www', 'www', 'www', 'www', NULL, NULL),
(67, 1, '2018-04-09 18:15:07', 'aaa@n', 'aaaaaa@n@n', 'aaa@n', 'aaa@n', 'aaa@n', NULL, NULL),
(68, 3, '2018-04-09 20:26:12', 'cccc@n', 'cccc@n', 'cccc@n', 'cccc@n', 'cccc@n', NULL, NULL),
(69, 3, '2018-04-09 20:42:20', 'cccc@n', 'cccc@n', 'cccc@n', 'cccc@n', 'cccc@n', NULL, NULL),
(70, 6, '2018-04-12 20:56:16', 'ee@n', 'ee@n', 'ee@n', 'ee@n', 'ee@n', NULL, NULL),
(71, 7, '2018-04-12 21:03:45', 'ee@n', 'ee@n', 'ee@n', 'ee@n', 'ee@n', NULL, NULL),
(72, 7, '2018-04-12 21:04:48', '121', 'ee@n', '12', '12', '12', NULL, NULL),
(73, 7, '2018-04-12 21:04:59', '121', 'ee@n', '12', '12', '12', NULL, NULL),
(74, 7, '2018-04-12 21:09:16', '121', 'ee@n', '12', '12', '12', NULL, NULL),
(75, 7, '2018-04-12 21:23:53', '1', '1', '1', 'Ontario', 'N5V1Y5', NULL, NULL),
(76, 1, '2018-04-12 23:06:25', '1651 Dale', 'null', 'London', 'ON', '1y3 2i2', NULL, NULL),
(77, 9, '2018-04-12 23:09:41', '1', '1', 'London', 'Ontario', 'hh@n', NULL, NULL),
(78, 9, '2018-04-12 23:10:14', 'a', 'www', 'a', 'a', 'a', NULL, NULL),
(79, 9, '2018-04-12 23:10:41', 'a', 'www', 'a', 'a', 'a', NULL, NULL),
(80, 10, '2018-04-12 23:13:55', 'ii@n', 'ii@n', 'ii@n', 'ii@n', 'ii@n', NULL, NULL),
(81, 10, '2018-04-12 23:14:42', '2', '2', '2', '2', '2', NULL, NULL),
(82, 10, '2018-04-12 23:14:52', '2', '2', '2', '2', '2', NULL, NULL),
(83, 10, '2018-04-12 23:15:59', '3', '3', '3', '3', '3', NULL, NULL),
(84, 10, '2018-04-12 23:16:25', 'ii@n', 'ii@n', 'ii@n', 'ii@n', 'ii@n', NULL, NULL),
(85, 1, '2018-04-13 17:29:30', '1234 gg', 'null', 'Toronto', 'ON', 'null', NULL, NULL),
(86, 3, '2018-04-13 17:31:43', 'cccc@n', 'cccc@n', 'cccc@n', 'cccc@n', 'cccc@n', NULL, NULL),
(87, 11, '2018-04-13 17:34:02', 'zzzz@n', 'zzzz@n', 'zzzz@n', 'zzzz@n', 'zzzz@n', NULL, NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `order_details`
--

CREATE TABLE `order_details` (
  `Order_detail_Id` int(11) NOT NULL,
  `OrderId` int(8) NOT NULL,
  `PizzaType` varchar(50) NOT NULL,
  `SizeType` varchar(15) NOT NULL,
  `DoughType` varchar(15) NOT NULL,
  `SauceType` varchar(15) NOT NULL,
  `CheeseType` varchar(20) DEFAULT NULL,
  `Toppings` varchar(100) DEFAULT NULL,
  `Price` float(5,2) DEFAULT NULL,
  `Quantity` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `order_details`
--

INSERT INTO `order_details` (`Order_detail_Id`, `OrderId`, `PizzaType`, `SizeType`, `DoughType`, `SauceType`, `CheeseType`, `Toppings`, `Price`, `Quantity`) VALUES
(1, 2, '하와이얀', 'M', '빵', '케첩', '모짜랠라', '양파,올리브,당근,감자,파인애플,닭고기', 40.50, 2),
(2, 2, '클래식', 'L', 'nomal', 'hot', '', NULL, 20.00, 1),
(3, 34, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Zucchini', NULL, NULL),
(4, 34, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Zucchini', NULL, NULL),
(5, 34, 'Pepperoni', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Zucchini, Onions, Garlic, Broccoli', NULL, NULL),
(6, 34, 'Pepperoni', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Zucchini, Onions, Garlic, Broccoli', NULL, NULL),
(7, 35, 'Hawaiian', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Zucchini, Onions', NULL, NULL),
(8, 35, 'Chicken', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'GreenOlives, GreenPeppers', NULL, NULL),
(9, 36, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Garlic, Mushrooms', NULL, NULL),
(10, 36, 'Pepperoni', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Garlic, Mushrooms, Pineapple, Broccoli, Tomatoes', NULL, NULL),
(11, 37, 'Hawaiian', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Onions, Garlic, Mushrooms', NULL, NULL),
(12, 37, 'Pepperoni', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Onions, Garlic, Mushrooms, Pineapple, Broccoli, Tomatoes', NULL, NULL),
(13, 38, 'Hawaiian', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Mushrooms, Pineapple', NULL, NULL),
(14, 38, 'Veggie', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Mushrooms, Pineapple, Broccoli', NULL, NULL),
(15, 39, 'Hawaiian', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Onions, Garlic', NULL, NULL),
(16, 40, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Mushrooms, Pineapple', NULL, NULL),
(17, 41, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Spinach', NULL, NULL),
(18, 42, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(19, 43, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(20, 44, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(21, 45, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(22, 46, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(23, 47, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(24, 48, 'Pepperoni', 'L', 'stiffDough', 'exquisiteSauce', 'cheddar', 'Onions, Garlic, Mushrooms, Pineapple', NULL, NULL),
(25, 48, 'Chicken', 'L', 'stiffDough', 'exquisiteSauce', 'cheddar', 'Broccoli, Tomatoes, GreenPeppers', NULL, NULL),
(26, 50, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Garlic, Mushrooms', NULL, NULL),
(27, 50, 'Pepperoni', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Garlic, Mushrooms', NULL, NULL),
(28, 51, 'Hawaiian', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Garlic, Mushrooms', NULL, NULL),
(29, 51, 'Pepperoni', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Garlic, Mushrooms, Spinach', NULL, NULL),
(30, 52, 'Hawaiian', 'M', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Garlic, Mushrooms', NULL, NULL),
(31, 53, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Garlic', NULL, NULL),
(32, 54, 'Hawaiian', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Broccoli', NULL, NULL),
(33, 55, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Broccoli, Tomatoes', NULL, NULL),
(34, 57, 'Hawaiian', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Pineapple', NULL, NULL),
(35, 57, 'Pepperoni', 'L', 'stiffDough', 'exquisiteSauce', 'parmesan', 'Broccoli', NULL, NULL),
(36, 59, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Garlic', NULL, NULL),
(37, 59, 'Pepperoni', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Garlic, Pineapple', NULL, NULL),
(38, 60, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Pineapple', NULL, NULL),
(39, 61, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Broccoli', NULL, NULL),
(40, 62, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'GreenPeppers', NULL, NULL),
(41, 63, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'GreenPeppers', NULL, NULL),
(42, 64, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'GreenPeppers', NULL, NULL),
(43, 67, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(44, 68, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(45, 69, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(50, 70, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(51, 71, 'Classic', 'M', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(52, 73, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(53, 74, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(54, 75, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(55, 76, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(56, 77, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(57, 79, 'Veggie', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', 'Mushrooms', NULL, NULL),
(58, 80, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(59, 82, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(60, 84, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(61, 85, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(62, 86, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL),
(63, 87, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL);

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustId`);

--
-- 테이블의 인덱스 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderId`),
  ADD KEY `CustId` (`CustId`);

--
-- 테이블의 인덱스 `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`Order_detail_Id`),
  ADD KEY `OrderId` (`OrderId`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `customers`
--
ALTER TABLE `customers`
  MODIFY `CustId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 테이블의 AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderId` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- 테이블의 AUTO_INCREMENT `order_details`
--
ALTER TABLE `order_details`
  MODIFY `Order_detail_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustId`) REFERENCES `customers` (`CustId`);

--
-- 테이블의 제약사항 `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`OrderId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
