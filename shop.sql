/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.24-log : Database - shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `shop`;

/*Table structure for table `admintable` */

DROP TABLE IF EXISTS `admintable`;

CREATE TABLE `admintable` (
  `aname` varchar(50) NOT NULL,
  `apwd` varchar(50) NOT NULL,
  PRIMARY KEY (`aname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admintable` */

insert  into `admintable`(`aname`,`apwd`) values ('admin','123456');

/*Table structure for table `carttable` */

DROP TABLE IF EXISTS `carttable`;

CREATE TABLE `carttable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busertable_id` int(11) NOT NULL,
  `goodstable_id` int(11) NOT NULL,
  `shoppingnum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `busertable_id` (`busertable_id`),
  KEY `goodstable_id` (`goodstable_id`),
  CONSTRAINT `carttable_ibfk_1` FOREIGN KEY (`busertable_id`) REFERENCES `consumertable` (`id`),
  CONSTRAINT `carttable_ibfk_2` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `carttable` */

insert  into `carttable`(`id`,`busertable_id`,`goodstable_id`,`shoppingnum`) values (2,2,5,13);

/*Table structure for table `consumertable` */

DROP TABLE IF EXISTS `consumertable`;

CREATE TABLE `consumertable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bemail` varchar(50) NOT NULL,
  `bpwd` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `consumertable` */

insert  into `consumertable`(`id`,`bemail`,`bpwd`) values (1,'tom','123456'),(2,'zbs','123456'),(3,'jerry','123456');

/*Table structure for table `focustable` */

DROP TABLE IF EXISTS `focustable`;

CREATE TABLE `focustable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodstable_id` int(11) NOT NULL,
  `busertable_id` int(11) NOT NULL,
  `focustime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goodstable_id` (`goodstable_id`),
  KEY `busertable_id` (`busertable_id`),
  CONSTRAINT `focustable_ibfk_1` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`),
  CONSTRAINT `focustable_ibfk_2` FOREIGN KEY (`busertable_id`) REFERENCES `consumertable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `focustable` */

insert  into `focustable`(`id`,`goodstable_id`,`busertable_id`,`focustime`) values (1,1,2,'2019-02-26 00:00:00'),(2,5,2,'2019-03-02 12:47:00');

/*Table structure for table `goodstable` */

DROP TABLE IF EXISTS `goodstable`;

CREATE TABLE `goodstable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(50) NOT NULL,
  `goprice` double NOT NULL,
  `grprice` double NOT NULL,
  `gstore` int(11) NOT NULL,
  `gpicture` varchar(50) DEFAULT NULL,
  `goodstype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goodstype_id` (`goodstype_id`),
  CONSTRAINT `goodstable_ibfk_1` FOREIGN KEY (`goodstype_id`) REFERENCES `goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `goodstable` */

insert  into `goodstable`(`id`,`gname`,`goprice`,`grprice`,`gstore`,`gpicture`,`goodstype_id`) values (1,'Apple',5,9,1000,'apple.jpg',1),(2,'Banana',3,5,1000,'banana.jpg',1),(3,'Melon',6,5,500,'melon.jpg',1),(4,'Grape',4,3,600,'grape.jpg',1),(5,'Watermelon',3,2,4993,'watermelon.jpg',1);

/*Table structure for table `goodstype` */

DROP TABLE IF EXISTS `goodstype`;

CREATE TABLE `goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `goodstype` */

insert  into `goodstype`(`id`,`typename`) values (1,'fruit'),(2,'Vegetable'),(3,'Home'),(4,'Iphone'),(5,'Ipad'),(6,'Ipod'),(7,'Galaxy'),(8,'ASUS'),(9,'DELL'),(10,'TOSHIBA');

/*Table structure for table `noticetable` */

DROP TABLE IF EXISTS `noticetable`;

CREATE TABLE `noticetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(100) NOT NULL,
  `ncontent` varchar(1000) NOT NULL,
  `ntime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `noticetable` */

insert  into `noticetable`(`id`,`ntitle`,`ncontent`,`ntime`) values (1,'Welcome to the ECommerce','We are updating the commerce platform','2019-02-25 00:00:00'),(4,'notice_test','this is a test file','2019-03-02 16:03:15'),(5,'Beluga whales hold farewell performance in Shanghai','Two female beluga whales, \"Little White\" and \"Little Grey,\" perform with trainers during their final performance at the Changfeng Ocean World in Shanghai on Feb 28, 2019, before their move to a sanctuary in Iceland','2019-03-02 16:05:26');

/*Table structure for table `orderbasetable` */

DROP TABLE IF EXISTS `orderbasetable`;

CREATE TABLE `orderbasetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busertable_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(4) NOT NULL,
  `orderdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `busertable_id` (`busertable_id`),
  CONSTRAINT `orderbasetable_ibfk_1` FOREIGN KEY (`busertable_id`) REFERENCES `consumertable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `orderbasetable` */

insert  into `orderbasetable`(`id`,`busertable_id`,`amount`,`status`,`orderdate`) values (1,2,14,1,'2019-03-02 13:02:58');

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderbasetable_id` int(11) NOT NULL,
  `goodstable_id` int(11) NOT NULL,
  `shoppingnum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderbasetable_id` (`orderbasetable_id`),
  KEY `goodstable_id` (`goodstable_id`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`orderbasetable_id`) REFERENCES `orderbasetable` (`id`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `orderdetail` */

insert  into `orderdetail`(`id`,`orderbasetable_id`,`goodstable_id`,`shoppingnum`) values (1,1,5,7);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
