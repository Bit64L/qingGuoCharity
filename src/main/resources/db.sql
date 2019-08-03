-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 47.95.4.158    Database: qing_guo_db
-- ------------------------------------------------------
-- Server version	5.6.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `intro` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `type_id` varchar(20) DEFAULT NULL,
  `theme` varchar(45) DEFAULT NULL,
  `period` varchar(45) DEFAULT NULL,
  `credit` varchar(45) DEFAULT NULL,
  `first_class_name` varchar(45) DEFAULT NULL,
  `second_class_name` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_id_UNIQUE` (`type_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'牙刷123',4,'洗漱','2017-02-01 00:00:00','/qingguo/upload/1121/1/1179340293','1','12','123123','123123','文房四宝','毛笔',1121,'待审核'),(4,'123456123',124,'123',NULL,'/qingguo/upload/1121/6/-1191842081',NULL,'123','123','123','文房四宝','毛笔',1121,'待审核'),(5,'123',123,'123',NULL,'/qingguo/upload/1121/6/-1191842081',NULL,'123','123','123','文房四宝','毛笔',1121,'待审核'),(6,'123',22,'123',NULL,'/qingguo/upload/1121/6/-1191842081',NULL,'123','123','123','文房四宝','毛笔',1121,'待审核'),(7,'123',123,'123',NULL,'/qingguo/upload/1121/7/-1192765602',NULL,'123','123','123','文房四宝','毛笔',1121,'待审核'),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_type`
--

DROP TABLE IF EXISTS `goods_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intro` varchar(100) DEFAULT NULL,
  `first_class_name` varchar(45) DEFAULT NULL,
  `second_class_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_type`
--

LOCK TABLES `goods_type` WRITE;
/*!40000 ALTER TABLE `goods_type` DISABLE KEYS */;
INSERT INTO `goods_type` VALUES (1,'练字','文房四宝','毛笔'),(2,'书房用品','文房四宝','墨'),(3,'写字','文房四宝','纸'),(4,'文房四宝','文房四宝','砚'),(5,'服装','旗袍 汉服 唐装','唐装'),(6,'书籍','旗袍 汉服 唐装','汉服'),(7,'电子产品','旗袍 汉服 唐装','旗袍'),(8,'服饰','文化艺术','木刻'),(9,'手机','文化艺术','陶器'),(10,NULL,'文化艺术','玉器'),(11,NULL,'书法 国画 油画','楷书'),(12,NULL,'书法 国画 油画','牡丹画'),(13,NULL,'书法 国画 油画','仕女图'),(14,NULL,'书法 国画 油画','风景画'),(15,NULL,'红色文化','建国初期'),(16,NULL,'红色文化','红军时期'),(17,NULL,'红色文化','抗战时期'),(18,NULL,'红色文化','解放战争时期'),(19,'演奏美妙的音乐','乐器','口风琴');
/*!40000 ALTER TABLE `goods_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,7,1,10),(2,7,4,1),(3,8,1,1),(4,9,1,1),(5,9,7,1),(6,10,1,5),(8,12,1,1),(9,12,6,3);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pay_or_not` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (7,1001,0,164),(8,1001,0,4),(9,1001,0,127),(10,1001,1,20),(12,1001,1,70);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay`
--

DROP TABLE IF EXISTS `pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay` (
  `payee_id` varchar(20) NOT NULL,
  `payer_id` varchar(20) NOT NULL,
  `goods_count` varchar(20) NOT NULL,
  `paytime` datetime DEFAULT NULL,
  `goodsintro` varchar(100) NOT NULL,
  `order_price` varchar(20) NOT NULL,
  `id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`payee_id`),
  UNIQUE KEY `payer_id_UNIQUE` (`payer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay`
--

LOCK TABLES `pay` WRITE;
/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `total_money` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (1,1001,2,136),(2,NULL,NULL,NULL),(42,NULL,NULL,NULL),(43,NULL,22,327);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_detail`
--

DROP TABLE IF EXISTS `shopping_cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_cart_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopping_cart_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_count` int(11) DEFAULT NULL,
  `goods_money` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcartdetail1_idx` (`shopping_cart_id`),
  CONSTRAINT `shoppingcartdetail1` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_detail`
--

LOCK TABLES `shopping_cart_detail` WRITE;
/*!40000 ALTER TABLE `shopping_cart_detail` DISABLE KEYS */;
INSERT INTO `shopping_cart_detail` VALUES (1,1,1,5,20),(2,1,1,5,20),(3,NULL,1,5,20),(4,NULL,1,5,20),(5,NULL,1,5,20);
/*!40000 ALTER TABLE `shopping_cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(255) NOT NULL,
  `account` varchar(20) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `wechat` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `headUrl` varchar(255) DEFAULT NULL,
  `deposit_status` varchar(45) DEFAULT NULL,
  `field` varchar(45) DEFAULT NULL,
  `ps` varchar(2550) DEFAULT NULL,
  `id_card` varchar(45) DEFAULT NULL,
  `shopping_cart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `usershoppingcart1_idx` (`shopping_cart_id`),
  CONSTRAINT `usershoppingcart1` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'123','0','2018-12-31 23:59:59','','0','0.00','2018-12-31 23:59:59','123','123','女','123','123','2018-04-11',NULL,'未缴费',NULL,NULL,NULL,NULL),(12,'123','32',NULL,'e10adc3949ba59abbe56e057f20f883e','管理员','0',NULL,'123','123','女','123','123','2018-04-11',NULL,'未缴费',NULL,NULL,NULL,NULL),(1001,'1234','123','2018-12-21 00:00:00','admin12345','管理员','0.00','2018-09-03 00:00:00','123','123','女','123','123','2018-04-11',NULL,'未缴费',NULL,NULL,NULL,NULL),(1111,'123','111','2018-12-31 23:59:59','123','123','0.00','2018-12-31 23:59:59','123','123','女','123','123','2018-04-11',NULL,'未缴费',NULL,NULL,NULL,NULL),(1118,'123','4',NULL,'123','',NULL,NULL,'123','123','女','123','123','2018-04-11',NULL,'未缴费',NULL,NULL,NULL,NULL),(1119,'123','5',NULL,'123','',NULL,NULL,'123','123','女','123','123','2018-04-11',NULL,'未缴费',NULL,NULL,NULL,NULL),(1121,'123123','7',NULL,'123','导师',NULL,NULL,'123123','123123','男','123123','123123','2018-04-11','/qingguo/upload/1121/599202745','未缴费',NULL,'9',NULL,43);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-09 15:47:56
