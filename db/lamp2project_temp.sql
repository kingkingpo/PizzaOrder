-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- 생성 시간: 18-04-02 13:29
-- 서버 버전: 5.7.19
-- PHP 버전: 7.1.10

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
(1, 'Vincent', NULL, '1966 hansuld', 'London', 'ON', '1y1 i3i', 'kingkingpo@naver.com', '226-378-3333');

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
(47, 1, '2018-04-01 19:26:18', '1651 Dale', '', 'London', 'ON', '1y3 2i2', NULL, NULL);

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
(23, 47, 'Classic', 'L', 'stiffDough', 'exquisiteSauce', 'mozzarella', '', NULL, NULL);

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
  MODIFY `CustId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 테이블의 AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderId` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- 테이블의 AUTO_INCREMENT `order_details`
--
ALTER TABLE `order_details`
  MODIFY `Order_detail_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
