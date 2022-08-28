-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: hydr1d
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `seller_id` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'catalog1','3','2022-08-28 08:14:52'),(2,'catalog2','4','2022-08-28 08:14:52'),(3,'catalog','5','2022-08-28 08:14:52'),(4,'catalog','3','2022-08-28 08:14:52'),(5,'name_catalog','3','2022-08-28 09:07:46'),(6,'name_catalog','3','2022-08-28 09:08:29'),(7,'name_catalog','3','2022-08-28 09:09:02'),(8,'name_catalog','5','2022-08-28 18:16:59'),(9,'name_catalog','5','2022-08-28 18:18:07'),(10,'name_catalog','5','2022-08-28 18:18:26');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `seller_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
INSERT INTO `product_order` VALUES (1,1,2000,2,3,'2022-08-28 08:55:38'),(2,4,2000,2,5,'2022-08-28 18:31:38');
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `catalog_id` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'product1','1','2022-08-28 08:32:03'),(2,'product2','1','2022-08-28 08:32:03'),(3,'product3','2','2022-08-28 08:32:03'),(4,'product4','3','2022-08-28 18:30:47');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(445) DEFAULT NULL,
  `email` varchar(445) DEFAULT NULL,
  `password` varchar(2445) DEFAULT NULL,
  `typeof_user` varchar(465) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abc','abcd@gmail.com','599fed9e23e6f546f59182bc04cb52396b62e97ac3bac193de1f13604c0ee3992b7ba6d19c2e01099604f76d6be4447e073f6c51a823cfe03302ea830420dbfbfb3293e896a90b56e4b3df7196f80ecd7c4b6bd7d8a13d99c189ede84a4eec62b8d2f1',NULL,'2022-08-26 02:45:14'),(2,'xyz','xyz@gmail.com','617a4d430858cec92b7c7409df3eba3f738e82f62a6e095fdbaf48711a319f778e1582bd0f681b01643b3f72240a07e6da7164b96184d7725dadcc1061870fae12d3d38efcdf55740f74af63447d9c6abd8cc786e9e4940ba828e89e4c4b8af9e6310ffc5b','buyer','2022-08-27 12:13:59'),(3,'qwerty','qwerty@gmail.com','1cbd9f4ee9a6075df7302be018ae90fc56c1b747d2a1efb7d27db77ea233cc71968ebca23824e81682056ab15964cc5927f4fe586abca39b7b59a984caf8df75a624d02ef2cd8ac55b5ce622eec4194f150e53b820a417772a49386c5a64a651f9fe52b57e8542','seller','2022-08-27 12:15:13'),(4,'qwerty123','qwerty123@gmail.com','$2b$10$lvrVZ/8nH2T4Z1tYnkYNM.5.FIiMGheebPIH6vfYRLl32bo.OH7Ta','seller','2022-08-27 12:24:37'),(5,'qwerty123','qwerty123@gmail.com','$2b$10$.vHfyQZcp8JI3OaYBtbZoOsnsy4H7BTWWfwDoCKtMujQYsSy33hou','seller','2022-08-28 07:47:27');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-29  0:25:59
