-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: giuaki
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--



--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Tops'),(2,'Bottoms'),(3,'Bags'),(4,'Outerwear');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothes`
--

DROP TABLE IF EXISTS `clothes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `imagehover` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2rl6c2snvans2lkpnc5loxkn9` (`brand_id`),
  CONSTRAINT `FK2rl6c2snvans2lkpnc5loxkn9` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothes`
--

LOCK TABLES `clothes` WRITE;
/*!40000 ALTER TABLE `clothes` DISABLE KEYS */;
INSERT INTO `clothes` VALUES (1,'Áo thun nam tay ngắn, thoải mái','Sản phẩm chất lượng cao, phù hợp cho mùa hè.','1fc8da09c70b6155381a_9d82d6f2ed3f498f90114c0311ec7ec7.webp','hades0072_638e374330534a9ba1d4bf33d8b6599f.webp','Cotton','Áo thun nam đẹp pro',250000,170,1,'2024-10-31 15:30:41.000000'),(2,'Áo sơmi tay ngắn unisex','Chi tiết hoa được thêu trên toàn bộ thân áo','hades4381_f3a4cdd6c052415cb389231ff250298e.webp','5.webp','Cotton','HADES LOVELESS STRIPED SHIRT',500000,100,1,'2024-11-13 15:30:56.000000'),(3,'Form basic mới','Thiết kế cổ áo cách điệu ','hades_15sp6444_26e950d6b7a9430c8841adad694c35cc.webp','2.webp','Cotton 2 chiều','ABYSS SS24 STARRY PINK TEE',490000,100,1,'2024-11-12 15:31:02.000000'),(4,'Cổ áo polo nút bấm ẩn','Vải thoáng mát, đứng form','hades1575_837fd4f89fab4872b80194e1ca98dcd8.webp','7.webp','Vải chân cua','HADES SPLICE POLO',520000,100,1,'2024-11-06 15:31:08.000000'),(5,'Form basic mới','Logo Hades thêu nổi ở tay áo','z5692826774275_a35a8557c62f5954917ad3fcd2ec2165_301916a8c5de4c77a9512f3e86b56460.webp','hd_t70398_4043d95a4b844e7bacd50a8c7c8d2814.webp','Cotton 2 chiều','HADES DOODLE DUO TEE',450000,100,1,'2024-11-04 15:31:12.000000'),(6,'Áo thun Jersey thiết kế unisex','Vải thoáng mát, đứng form','hades_15sp6459_f56b1b52184547be948ca85de8c6945b.webp','untitled_capture1950_788ee480e88f432c8965cfc415536a9e.webp','Vải lưới','HADES SELECAO JERSEY',490000,100,1,'2024-11-14 15:31:17.000000'),(7,'Form basic mới','Logo Hades thêu nổi ở tay áo','hades4395_077ba9adef624184a275125766c951a8.webp','hd_t6.webp','Cotton 2 chiều','HADES LOVE HARDER TEE',450000,100,1,'2024-11-12 15:31:22.000000'),(8,'Form basic mới','Các đường line vắt xổ ở cổ và tay áo tạo điểm nhấn','dsc05936_7200b33e148f40a5b51c75c108838e9f.webp','img_1222_16ad5ec573a34043bc49c34012471656.webp','Cotton 2 chiều','HADES FLORIE TEE',450000,100,1,'2024-11-04 15:31:25.000000'),(9,'Áo thun Jersey thiết kế unisex','Các chi tiết hoa được may đắp vải ở mặt trước áo','dsc04558_101c4c22222d430aae84c3f4da2b36a0.webp','hd_t21481_f667701ed931479c8bfe073b506cab67.webp','Vải lưới','RICAD MESH JERSEY',570000,100,1,'2024-11-03 15:31:28.000000'),(10,'Form áo tank top','Thiết kế phần tay áo rộng rãi, thoải mái','dsc09825_5bfd1c357e244cb09f9e764802226c89.webp','img_1226_839c8fc5e4054fe0bf6a16fca84a4210.webp','Cotton 2 chiều','SONOROUS TANK TOP',350000,100,1,'2024-11-07 15:31:31.000000'),(11,'Form basic mới','Logo Hades thêu cùng màu ở tay áo','untitled_capture4374_46f97fc1c0bb42d4a303bdd1e64568ea.webp','hda_dt6.webp','Cotton 2 chiều','HADES TRIUMPH TEE',460000,100,1,'2024-11-13 15:31:34.000000'),(12,'Áo có các đường line chạy dọc mặt trước và mặt sau','Các chi tiết trên áo sử dụng kỹ thuật in kéo lụa','allyson_athete_jersy10_502373975075422fa0ce27f9f0681961.webp','hades.webp','Thun lạnh','ALLYSON ATHLETE JERSEY',420000,100,1,'2024-11-05 15:31:38.000000'),(13,'Quần short lưng thun có dây rút','Typo \"H\" được thêu ở mặt trước quần','hades4134_e21501a09a2a4de28997a799ef5a35b2.webp','hades8236_b54a0c90bdd3432b9e7584f18f38a75e.webp','Cotton','HADES STANDARD STRIPLE SHORTS',280000,100,2,'2024-11-10 15:31:47.000000'),(14,'Dáng regular fit','Graphic chữ Hades in kéo lụa ở mặt sau quần','untitled_capture1135_5220199b654246fbb286ef5b29453804.webp','untitled_capture1978_720eda78fc7d47ddad9a77be917d3933_b78e66215c684a77818f5e1e94086e26.webp','Chân cua','ABYSS SS24 ECHINIDERM PANTS',690000,100,2,'2024-11-11 15:31:50.000000'),(15,'Dáng regular fit','Các chi tiết rã và đường ly xẻ dọc ở mặt trước và sau quần','hades0097_12db902901f74837a31a277067358285.webp','hd_t70962_1bb44278d6e24fa6b23b683db04d9755.webp','Chân cua','HADES SYMMETRY PANTS',700000,100,2,'2024-11-04 15:31:55.000000'),(16,'Quần boxer lưng thun kèm mạc logo HADES ','Graphic chữ in kéo lụa to bản ở mặt sau quần','hades_15sp0285_6b1fcfceb47c478285463fa71063e13e.webp','hd_t70543_1_faad16d3b6264e05b96ab93a7309713e.webp','Cotton','HADES STRIPED BOXERS',250000,100,2,'2024-11-04 15:31:58.000000'),(17,'Quần jeans lửng thiết kế unisex, độ dài qua gối, ống rộng','Hoạ tiết chữ được thêu viền ở túi sau quần','hd_t21120_b4ee1be19b714797be823f8d728b4b94.webp','hd_t21044_d4b63f64c00f48a6a46411e4cf931117.webp','Jean','HADES WASH JEANS SHORT',560000,100,2,'2024-11-06 15:32:02.000000'),(18,'Nameplate inox được đính ở mặt trước balo','Chống thấm nước','untitled_capture1199_7d95868437ce4511affebf6e1f7ad512.webp','untitled_capture1228_0a9bc51c3a504ad3bbbfeda028cdf9c7.webp','Dù lạnh phối da','JUMBLE PRIME BACKPACK',785000,100,3,'2024-11-13 15:32:05.000000'),(19,'Logo Hades bằng kim loại','Chống thấm nước','z5423912627963_73128c420eccecfc5fe2e86113e59334_273e27b606004b19aceba5f77849be77.webp','dsc02532_c1edbb00bbb04deb9b19d0ea2069f545.webp','Dù','MOTIVATION GRUNGE BACKPACK',750000,100,3,'2024-11-03 15:32:12.000000'),(20,'Logo Hades bằng kim loại','Nhiều ngăn chứa đồ rộng rãi','dsc02422_94b87132902c47f9a362f4c3ce45ad0d.webp','dsc02473_2da67a9002c745aeab68e24a407dd11d.webp','Canvas','NEOPRENE UTILITY BACKPACK - ĐEN',800000,100,3,'2024-10-02 15:32:14.000000'),(21,'Áo khoác da khoá kéo zip full thân','Các chi tiết rả trên toàn bộ thân áo tạo các mảng màu làm điểm nhấn','untitled_capture1066_f59c6bb3b46d4b9e899b07424f909096.webp','hd_t71237_9be135cafd9c498dbfa51e6c4f09ef85.webp','Da PU','HADES 911 LEATHER JACKET',1200000,100,4,'2024-11-05 15:32:20.000000'),(22,'Hoodie zip full thân','Logo Hades được thêu ở nón','hades8172_fb58f0d2f00d492d8aaec0a18fa99244.jpg','6.1_c1af6d12f84848989853037b542f49d8.jpg','Chân cua','HADES CELLULE WAY HOODIE ZIP',900000,100,4,'2024-10-15 15:32:23.000000'),(23,'Áo khoác da khoá kéo zip full thân','Áo có 2 túi zip phía trước','hades_15sp9026_ec8d570de1384e218bb5295c0f08df67.webp','_578_10ea121fa6c24105b57406fb7c293cc3.webp','Da PU','HADES BROWN WAX BIKER JACKET',1000000,100,4,'2024-09-11 15:32:26.000000'),(24,'Graphic kết hợp giữa 2 kỹ thuật thêu xù và thêu thường','Nút bấm dọc áo','var1_1e60f3df53744137a96de078f53bd08a.jpg','hd_t70620_81398c8ce80e4f7d9f3e2e16da97bcf9.jpg','Da phối','HADES OBSTREPEROUS VARSITY JACKET',1200000,100,4,'2024-11-04 15:32:31.000000');
/*!40000 ALTER TABLE `clothes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color_code` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_color` varchar(255) DEFAULT NULL,
  `clothes_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1i618t0m31sbfkhx1xdoyl32u` (`clothes_id`),
  CONSTRAINT `FK1i618t0m31sbfkhx1xdoyl32u` FOREIGN KEY (`clothes_id`) REFERENCES `clothes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'#ee8aa1 ','hades0040_6e3e09600e0c430d980a561acd8361aa.webp','tan','Hồng nhạt',1),(2,'#2870c4','1fc8da09c70b6155381a_9d82d6f2ed3f498f90114c0311ec7ec7.webp','xanh-duong','Xanh dương',1),(3,'#949494','hades4381_f3a4cdd6c052415cb389231ff250298e.webp','xam','Xám',2),(4,'#ee8aa1 ','2a.webp','tan','Hồng nhạt',3),(5,'#949494','a7.webp','xam','Xám',4),(6,'#000000','hd_t70429_be0da9f4221344378df09604d0e19ad7.webp','den','Đen',5),(7,'#dbd590','untitled_capture1968_5fde3111cb1445d2a1af6a87e0ac0955.webp','vang','Vàng',6),(8,'#2870c4','hd_t70222_2bcfc289353c4b349cc6e13cb8658ee7.webp','xanh-duong','Xanh dương',6),(9,'#000000','hda_t6.webp','den','Đen',7),(10,'#2870c4','hd_dt6.webp','xanh-duong','Xanh dương',7),(11,'#ee8aa1 ','img_1219_fa607731fb714339b739976509825b35.webp','tan','Hồng nhạt',8),(12,'#000000','hd_t21453_ef8287b8d3e0419286d84db73ac5c096.webp','den','Đen',9),(13,'#949494','img_1223_bf9efc2cec48401dab3a4b51c3a59a88.webp','xam','Xám',10),(14,'#000000','hdaa_t6.webp','den','Đen',11),(15,'#854014','hd_act6.webp','nau','Nâu',11),(16,'#000000','hadesdd.webp','den','Đen',12),(17,'#eecdb7','hadses.webp','tan','Be',12),(18,'#2870c4','hades4137_8951f1ef5ebf41f8a961153a61adea30.webp','xanh-duong','Xanh dương',13),(19,'#ee8aa1','hades1556_68307da61e6d4e22b93818495698d5f6.webp','hong','Hồng',13),(20,'#949494','hades2333_903f9b6ca16840aeaf457dcf2da690aa.webp','xam','Xám',13),(21,'#949494','5_6439274b8b914e009680536acadf1dc6.webp','xam','Xám',14),(23,'#854014','hd_t71053_0f20d1d5bee742bc83a9e729ec3f971e.webp','nau','Nâu',15),(24,'#949494','hd_t70566_1_fe57d3add6be4c69ad8d1f1f1a7a32f0.webp','xam','Xám',16),(26,'#949494','hd_t21056_8f9b03ca6a094e70bb465d4497348e77.webp','xam','Xám',17),(27,'#000000','untitled_capture1199_7d95868437ce4511affebf6e1f7ad512.webp','den','Đen',18),(28,'#854014','dsc02516_9ddc3b2be3094e619f86ab9053bee881.jpg','nau','Nâu',19),(29,'#000000','dsc02422_94b87132902c47f9a362f4c3ce45ad0d.webp','den','Đen',20),(30,'#000000','hd_t71265_1481d7d2b6b44b15b52460274b73c1ed.webp','den','Đen',21),(31,'#949494','6.webp','xam','Xám',22),(32,'#854014','_719_fcbe1ac7ae994ce094e14061dcc78994.webp','nau','Nâu',23),(33,'#eecdb7','hd_t70666_91254b8d176f4115b259547d19563703.jpg','tan','Be',24);
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `process` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Chợ Sơn Hạ, Xã Sơn Hạ, Huyện Sơn Hà, Tỉnh Quảng Ngãi','ncaoky69@gmail.com','Thuy Nguyen','0948523110','2.890.000',1),(2,'Cổng 7, ĐH TÔN ĐỨC THẮNG, Phường Tân Phong, Quận 7, Thành phố Hồ Chí Minh','minhluandt1004@gmail.com','Luân','xxxxx','2.890.000',1),(3,'Chợ Sơn Hạ, Xã Sơn Hạ, Huyện Sơn Hà, Tỉnh Quảng Ngãi','ncaoky69@gmail.com','Thuy Nguyen','0948523110','3.140.000',1),(4,'T, Xã Cần Nông, Huyện Hà Quảng, Tỉnh Cao Bằng','davidthuy69@gmail.com','Thuy Nguyen','0948523110','3.140.000',1),(5,'Tân Phpng, Xã Minh Long, Huyện Hạ Lang, Tỉnh Cao Bằng','ncaoky69@gmail.com','Thuy Nguyen','0948523110','1.900.000',1),(6,'T, Phường Láng Thượng, Quận Đống Đa, Thành phố Hà Nội','ncaoky69@gmail.com','Thuy Nguyen','0948523110','3.200.000',1),(7,'T, Phường Hàng Mã, Quận Hoàn Kiếm, Thành phố Hà Nội','ncaoky69@gmail.com','Thuy Nguyen','0948523110','3.055.000',1),(8,'T, Phường Thượng Thanh, Quận Long Biên, Thành phố Hà Nội','ncaoky69@gmail.com','Thuy Nguyen','0948523110','2.110.000',1),(9,'Thôn Hà Bắc, Thị trấn Mèo Vạc, Huyện Mèo Vạc, Tỉnh Hà Giang','ncaoky69@gmail.com','Cao Kỳ Đẹp ZAI','0948523110','1.760.000',1),(10,'T, Xã Xín Cái, Huyện Mèo Vạc, Tỉnh Hà Giang','ncaoky69@gmail.com','Minh','0948523110','500.000',1),(11,'Thôn Hà Bắc, Xã Sơn Hạ, Huyện Sơn Hà, Tỉnh Quảng Ngãi','ncaoky69@gmail.com','Nguyễn Cao Kỳ','0948523110','2.270.000',1),(12,'tttt, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','ncaoky69@gmail.com','Thuy Nguyen','00000','3.750.000',1),(13,'121, Xã Thắng Mố, Huyện Yên Minh, Tỉnh Hà Giang','ncaoky69@gmail.com','Thuy Nguyen','0948523110','1.270.000',0),(14,'T, Xã Phú Lũng, Huyện Yên Minh, Tỉnh Hà Giang','davidthuy69@gmail.com','Thuy Nguyen','0948523110','420.000',1),(15,'T, Xã Cao Mã Pờ, Huyện Quản Bạ, Tỉnh Hà Giang','davidthuy69@gmail.com','Thuy Nguyen','0948523110','840.000',0),(16,'T, Phường Phú Thượng, Quận Tây Hồ, Thành phố Hà Nội','ncaoky69@gmail.com','Thuy Nguyen','0948523110','2.040.000',1),(17,'T, Xã Phú Lũng, Huyện Yên Minh, Tỉnh Hà Giang','ncaoky69@gmail.com','Thuy Nguyen','0948523110','1.530.000',1),(18,'T, Phường Mai Dịch, Quận Cầu Giấy, Thành phố Hà Nội','davidthuy69@gmail.com','Thuy Nguyen','0948523110','420.000',0),(19,'T, Xã Cần Yên, Huyện Hà Quảng, Tỉnh Cao Bằng','ncaoky69@gmail.com','Thuy Nguyen','0948523110','2.885.000',1),(20,'T, Xã Thượng Giáp, Huyện Na Hang, Tỉnh Tuyên Quang','davidthuy69@gmail.com','Thuy Nguyen','0948523110','1.750.000',0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr3aftk48ylvntpui7l04kbcc1` (`order_id`),
  CONSTRAINT `FKr3aftk48ylvntpui7l04kbcc1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Xám','HADES SPLICE POLO','520000.0',1,'XL',1),(2,'Hồng','HADES FLORIE TEE','450000.0',2,'S',1),(3,'Màu sắc không xác định','ABYSS SS24 STARRY PINK TEE','490000.0',3,'Kích thước không xác định',1),(4,'Xám','HADES SPLICE POLO','520000.0',1,'XL',2),(5,'Hồng','HADES FLORIE TEE','450000.0',2,'S',2),(6,'Màu sắc không xác định','ABYSS SS24 STARRY PINK TEE','490000.0',3,'Kích thước không xác định',2),(7,'Xám','HADES SPLICE POLO','520000.0',1,'XL',3),(8,'Hồng','HADES FLORIE TEE','450000.0',2,'S',3),(9,'Màu sắc không xác định','ABYSS SS24 STARRY PINK TEE','490000.0',3,'Kích thước không xác định',3),(10,'Hồng','HADES STRIPED BOXERS','250000.0',1,'M',3),(11,'Xám','HADES SPLICE POLO','520000.0',1,'XL',4),(12,'Hồng','HADES FLORIE TEE','450000.0',2,'S',4),(13,'Màu sắc không xác định','ABYSS SS24 STARRY PINK TEE','490000.0',3,'Kích thước không xác định',4),(14,'Hồng','HADES STRIPED BOXERS','250000.0',1,'M',4),(15,'Xám','HADES STRIPED BOXERS','250000.0',2,'M',5),(16,'Hồng nhạt','Áo thun nam','250000.0',1,'S',5),(17,'Xanh dương','Áo thun nam','250000.0',1,'M',5),(18,'Xanh dương','HADES LOVE HARDER TEE','450000.0',2,'XXL',5),(19,'Hồng','HADES FLORIE TEE','450000.0',1,'S',6),(20,'Xám','SONOROUS TANK TOP','350000.0',1,'S',6),(21,'Hồng','Áo thun nam','250000.0',1,'S',6),(22,'Xanh dương','Áo thun nam','250000.0',1,'M',6),(23,'Nâu','HADES SYMMETRY PANTS','700000.0',1,'M',6),(24,'Đen','HADES 911 LEATHER JACKET','1200000.0',1,'M',6),(25,'Xanh dương','HADES STANDARD STRIPLE SHORTS','280000.0',2,'L',7),(26,'Xám','HADES STANDARD STRIPLE SHORTS','280000.0',1,'L',7),(27,'Đen','JUMBLE PRIME BACKPACK','785000.0',1,'FS',7),(28,'Hồng nhạt','ABYSS SS24 STARRY PINK TEE','490000.0',1,'S',7),(29,'Hồng nhạt','ABYSS SS24 STARRY PINK TEE','490000.0',1,'XXL',7),(30,'Hồng','HADES FLORIE TEE','450000.0',1,'S',7),(31,'Hồng','Áo thun nam','250000.0',2,'S',8),(32,'Xám','SONOROUS TANK TOP','350000.0',1,'S',8),(33,'Đen','ALLYSON ATHLETE JERSEY','420000.0',2,'L',8),(34,'Đen','ALLYSON ATHLETE JERSEY','420000.0',1,'XL',8),(35,'Hồng','Áo thun nam','250000.0',2,'S',9),(36,'Đen','ALLYSON ATHLETE JERSEY','420000.0',2,'L',9),(37,'Đen','ALLYSON ATHLETE JERSEY','420000.0',1,'XL',9),(38,'Hồng','Áo thun nam','250000.0',2,'S',10),(39,'Xám','SONOROUS TANK TOP','350000.0',1,'S',11),(40,'Hồng','Áo thun nam','250000.0',2,'S',11),(41,'Đen','ALLYSON ATHLETE JERSEY','420000.0',1,'S',11),(42,'Nâu','HADES BROWN WAX BIKER JACKET','1000000.0',1,'XXL',11),(43,'Xanh dương','Áo thun nam','250000.0',1,'S',12),(44,'Xám','HADES CELLULE WAY HOODIE ZIP','900000.0',2,'L',12),(45,'Xám','HADES CELLULE WAY HOODIE ZIP','900000.0',1,'XL',12),(46,'Đen','NEOPRENE UTILITY BACKPACK - ĐEN','800000.0',1,'FS',12),(47,'Đen','ALLYSON ATHLETE JERSEY','420000.0',1,'S',13),(48,'Xám','SONOROUS TANK TOP','350000.0',1,'S',13),(49,'Hồng','Áo thun nam','250000.0',2,'S',13),(50,'Be','ALLYSON ATHLETE JERSEY','420000.0',1,'XL',14),(51,'Be','ALLYSON ATHLETE JERSEY','420000.0',1,'XL',15),(52,'Đen','ALLYSON ATHLETE JERSEY','420000.0',1,'S',15),(53,'Xám','SONOROUS TANK TOP','350000.0',2,'M',16),(54,'Xám','SONOROUS TANK TOP','350000.0',1,'S',16),(55,'Hồng','ABYSS SS24 STARRY PINK TEE','490000.0',1,'S',16),(56,'Xám','HADES LOVELESS STRIPED SHIRT','500000.0',1,'S',16),(57,'Be','ALLYSON ATHLETE JERSEY','420000.0',1,'XL',17),(58,'Đen','ALLYSON ATHLETE JERSEY','420000.0',1,'S',17),(59,'Xám','ABYSS SS24 ECHINIDERM PANTS','690000.0',1,'S',17),(60,'Be','ALLYSON ATHLETE JERSEY','420000.0',1,'XL',18),(61,'Be','ALLYSON ATHLETE JERSEY','420000.0',2,'XL',19),(62,'Đen','JUMBLE PRIME BACKPACK','785000.0',1,'S',19),(63,'Vàng','HADES SELECAO JERSEY','490000.0',1,'S',19),(64,'Xám','SONOROUS TANK TOP','350000.0',1,'S',19),(65,'Be','ALLYSON ATHLETE JERSEY','420000.0',1,'L',19),(66,'Xám','SONOROUS TANK TOP','350000.0',1,'S',20),(67,'Đen','ALLYSON ATHLETE JERSEY','420000.0',2,'S',20),(68,'Hồng','HADES STANDARD STRIPLE SHORTS','280000.0',1,'L',20),(69,'Xám','HADES STANDARD STRIPLE SHORTS','280000.0',1,'L',20);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `clothes_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6qhlnpvgq4fbxyf1ry4r3qjyq` (`clothes_id`),
  CONSTRAINT `FK6qhlnpvgq4fbxyf1ry4r3qjyq` FOREIGN KEY (`clothes_id`) REFERENCES `clothes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'M',1),(2,'S',1),(3,'L',1),(4,'L',2),(5,'M',2),(6,'XL',2),(7,'S',2),(8,'L',3),(9,'XXL',3),(10,'S',3),(11,'M',4),(12,'XL',4),(13,'S',5),(14,'L',5),(15,'XL',6),(16,'M',6),(17,'XXL',7),(18,'L',8),(19,'M',8),(20,'S',9),(21,'XL',9),(22,'L',10),(23,'M',10),(24,'S',10),(25,'S',11),(26,'L',11),(27,'L',12),(28,'XL',12),(29,'L',13),(30,'XL',13),(31,'S',14),(32,'M',14),(33,'M',15),(34,'L',15),(35,'XL',15),(36,'M',16),(37,'L',17),(38,'XL',17),(40,'FS',18),(41,'FS',19),(42,'FS',20),(43,'L',22),(44,'XL',22),(45,'M',23),(46,'XXL',23),(48,'L',24),(49,'M',21);
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-01 17:32:15
