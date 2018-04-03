drop database if exists lamp2project;
create database if not exists lamp2project;

drop user if exists 'lamp2project'@'localhost';
grant all privileges on lamp2project.* to 'lamp2project'@'localhost' identified by 'lamp2project';

use lamp2project;

CREATE TABLE `Customers` (
  `CustId` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(50) NOT NULL,
  `UnitNum` varchar(10) NULL,  
  `StreetAddress` varchar(50) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Province` varchar(20) NOT NULL,
  `PostCode` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,

  PRIMARY KEY (`CustId`)
);

CREATE TABLE `Orders`
(
    `OrderId` int(8) NOT NULL AUTO_INCREMENT,
    `CustId` int(11) NOT NULL,
    `OrderDate` DATETIME NOT NULL,
   `DeliveryStreetAddress`varchar(50) NOT NULL,
   `DeliveryUnitNum` varchar(10) NULL,  
   `DeliveryCity` varchar(20) NOT NULL,
   `DeliveryProvince` varchar(20) NOT NULL,
   `DeliveryPostCode` varchar(10) NOT NULL,
   `EDT` DATETIME NOT NULL,
   `TotalPaid` float(5,2) NOT NULL,
    PRIMARY KEY (`OrderId`),
    FOREIGN KEY (`CustId`) REFERENCES Customers(`CustId`)

        
 );

CREATE TABLE `Order_Details` (
 `Order_detail_Id`  int(11) NOT NULL AUTO_INCREMENT,
 `OrderId` int(8) NOT NULL,
 `PizzaType` varchar(50) NOT NULL,
 `SizeType` varchar(15) NOT NULL,
 `DoughType` varchar(15) NOT NULL,
 `SauceType` varchar(15) NOT NULL,
 `CheeseType` varchar(20),
 `Toppings` varchar(100),
 `Price` float(5,2) NOT NULL,
 `Quantity` int(3) NOT NULL, 

 PRIMARY KEY (`Order_detail_Id`),
 FOREIGN KEY (`OrderId`) REFERENCES Orders(`OrderId`)
);





