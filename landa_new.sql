-- Adminer 4.8.1 MySQL 5.5.5-10.8.3-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(2,	'2022_02_04_024707_create_table_roles',	1),
(3,	'2022_02_06_040008_create_user_auth',	1),
(4,	'2022_02_28_141518_create_customers_models_table',	1),
(5,	'2022_02_28_155336_create_items_models_table',	1),
(6,	'2022_02_28_155920_create_item_det',	1),
(7,	'2022_06_29_072832_change_table_name',	1);

DROP TABLE IF EXISTS `m_answer`;
CREATE TABLE `m_answer` (
  `id_answer` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_review` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_at` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `is_deleted` int(11) DEFAULT 0,
  PRIMARY KEY (`id_answer`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `m_customer`;
CREATE TABLE `m_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `m_customer_nama_index` (`nama`),
  KEY `m_customer_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `m_customer` (`id`, `nama`, `email`, `is_verified`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1,	'Mochammad Syaifuddin Zuhri',	'mochammadsyaifuddinz@gmail.com',	'1',	'2022-07-05 04:21:05',	'2022-07-14 23:42:19',	NULL,	1,	1,	0),
(2,	'Farel Putra Hidayat',	'farel@gmail.com',	'1',	'2022-07-05 04:21:17',	'2022-07-05 04:21:17',	NULL,	1,	1,	0),
(3,	'Auful Kirom',	'auful@gmail.com',	'1',	'2022-07-05 04:21:29',	'2022-07-05 04:21:29',	NULL,	1,	1,	0),
(4,	'Test 1',	'test1@gmail.com',	'0',	NULL,	'2022-07-15 07:45:21',	'2022-07-15 07:45:21',	0,	0,	0),
(5,	'test 2',	'test2@gmail.com',	'0',	NULL,	'2022-07-15 07:46:57',	'2022-07-15 07:46:57',	0,	0,	0),
(6,	'Test 322',	'test3@gmail.com',	'0',	NULL,	'2022-07-15 07:48:40',	NULL,	0,	1,	0),
(7,	'Test 4',	'test4@gmail.com',	'0',	NULL,	NULL,	NULL,	0,	0,	0),
(8,	'Test 5',	'test5@gmail.com',	'1',	'2022-07-15 02:34:40',	'2022-08-01 16:58:42',	NULL,	1,	1,	0);

DROP TABLE IF EXISTS `m_diskon`;
CREATE TABLE `m_diskon` (
  `id_diskon` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_promo` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_diskon`) USING BTREE,
  KEY `id_user` (`id_user`) USING BTREE,
  KEY `id_promo` (`id_promo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `m_diskon` (`id_diskon`, `id_user`, `id_promo`, `status`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1,	1,	53,	1,	'2022-07-20 03:04:20',	'2022-07-20 03:04:20',	0),
(2,	2,	43,	0,	'2022-07-20 03:14:31',	'2022-07-20 03:14:49',	0),
(3,	2,	40,	1,	'2022-07-20 03:14:35',	'2022-07-20 03:14:35',	0),
(4,	15,	44,	1,	'2022-07-20 03:14:38',	'2022-07-20 03:14:38',	0),
(5,	16,	40,	1,	'2022-07-20 03:26:26',	'2022-07-20 03:26:26',	0),
(6,	15,	42,	1,	'2022-07-20 03:26:38',	'2022-07-20 03:26:38',	0),
(7,	2,	42,	1,	'2022-07-21 19:20:42',	'2022-07-21 19:20:42',	0),
(8,	1,	25,	1,	'2022-07-22 02:48:27',	'2022-07-22 02:48:27',	0),
(9,	1,	43,	1,	'2022-07-22 03:12:35',	'2022-07-22 19:19:41',	0),
(10,	3,	43,	0,	'2022-07-22 19:17:32',	'2022-07-22 19:17:35',	0),
(11,	17,	43,	1,	'2022-07-22 19:19:44',	'2022-07-22 19:19:44',	0),
(13,	18,	40,	0,	'2022-07-23 07:24:57',	'2022-07-23 07:25:08',	0),
(14,	18,	53,	0,	'2022-07-23 07:25:45',	'2022-07-23 07:25:55',	0),
(15,	3,	41,	1,	'2022-07-23 07:26:06',	'2022-07-23 07:26:06',	0),
(16,	18,	25,	1,	'2022-07-23 07:54:53',	'2022-07-23 08:00:00',	0),
(17,	3,	54,	1,	'2022-07-23 08:03:11',	'2022-07-23 08:03:11',	0),
(18,	2,	56,	0,	'2022-07-25 18:49:26',	'2022-07-25 18:49:31',	0),
(19,	18,	57,	1,	'2022-07-25 18:50:24',	'2022-07-25 18:50:24',	0),
(20,	19,	56,	0,	'2022-07-25 18:52:35',	'2022-07-25 18:52:45',	0);

DROP TABLE IF EXISTS `m_item`;
CREATE TABLE `m_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori` enum('food','drink','snack') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'food',
  `harga` double DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_available` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `m_item_nama_index` (`nama`),
  KEY `m_item_kategori_index` (`kategori`),
  KEY `m_item_harga_index` (`harga`),
  KEY `m_item_is_available_index` (`is_available`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `m_item` (`id`, `nama`, `kategori`, `harga`, `deskripsi`, `foto`, `is_available`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(2,	'Chicken Slam',	'food',	13000,	'Ayam geprek dengan bumbu khas yang pedas dan gurih',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(3,	'Iced Lemon Tea',	'drink',	6000,	'Kesegaran daun teh yang bercampur dengan irisan lemon dalam air es yang menyegarkan hausmu',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(12,	'Chicken Slam Noodles',	'food',	16000,	'Campuran mie dengan ayam geprek yang pedas dan gurih',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(13,	'Fried Rice',	'food',	11000,	'Nasi goreng dengan bumbu khas yang pastinya bikin kamu nagih',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(14,	'Fried Rice Noodles',	'food',	15000,	'Nasi goreng dengan campuran mie yang di goreng yang pastinya bisa bikin kenyang perutmu',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(15,	'Lalapan Bebek Madura',	'food',	26000,	'Lalapan bebek yang di goreng dengan bumbu khas madura bersama sambal hijau yang nendang abis',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(16,	'Lalapan Ayam Madura',	'food',	15000,	'Lalapan ayam yang di goreng dengan bumbu khas madura bersama sambal hijau yang nendang abis',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(17,	'Lalapan Puyuh Madura',	'food',	18000,	'Lalapan burung puyuh yang di goreng dengan bumbu khas madura bersama sambal hijau yang nendang abis',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(18,	'Frieno Java Code',	'food',	13000,	'Mie dangan campuran telur dan sayur dengan bumbu rahasia yang rasanya beda dari yang lainnya',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(19,	'Grilled Sausage',	'snack',	16000,	'Gurihnya Sosis Bakar Jumbo dengan bumbu barbeque beserta saus yang bikin tambah nikmat',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(20,	'French Fries',	'snack',	10000,	'Crunchynya kentang goreng dengan origano dan saus cocol yang mantab betul',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(22,	'Potato Wedges',	'snack',	12000,	'Racikan Kentang Dengan Bumbu Spesial yang digoreng dengan sempurna beserta saus cocol yang mantul',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(23,	'Sascram Eggs',	'snack',	15000,	'Pingin ngemil tapi diet? pas banget nih kombinasi sosis bakar dan sascram eggs yang mendukung program dietmu, pastinya ga banyak karbo dong',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(24,	'Beef Burger',	'snack',	13000,	'Mantab nih buat yang ga pingin makan berat tapi tetep bisa nahan laper, ini nih Burger Dengan Olahan Daging Sapi, Sayuran, Serta Keju',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(25,	'Nugget',	'snack',	12000,	'Pingin ngemil tapi gamau yang manis? ini nih nugget ayam yang gurih bisa jadi pilihanmu',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(26,	'Maryam',	'snack',	15000,	'Roti maryam yang juga dikenal sebagai roti cane/canai ini bisa disajikan jadi 2 variasi yaitu asin-gurih dan manis yang bikin lidahmu nanonano',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(27,	'V60',	'drink',	14000,	'Biji kopi arabika yang diolah menggunakan metode V60',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(28,	'Tubruk',	'drink',	6000,	'Nikmatnya Kopi Robusta yang digrilling langsung dengan aroma yang khas ',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(29,	'Iced Kopi Susu Strong',	'drink',	12000,	'Nikmatnya Minuman dengan Kopi Robusta yang bercampur dengan manisnya susu ',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(30,	'Iced Kopi Brown Sugar',	'drink',	12000,	'Nikmatnya perpaduan Kopi Robusta ,Brown Sugar, dan susu yang menyegarkan hausmu',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(31,	'Coffee Beer',	'drink',	13000,	'Segarnya Coffee dingin dengan beer yang menyegarkan dahagamu',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(32,	'Vietnam Drip',	'drink',	13000,	'Kopi Robusta, Kental Manis, Diolah Dengan metode khas Vietnam Drip',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(33,	'Vietnam Drip',	'drink',	13000,	'Kopi Robusta, Kental Manis, Diolah Dengan metode khas Vietnam Drip',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(34,	'Kopi Susu Creamy',	'drink',	12000,	'Nikmatnya Minuman dengan Kopi Robusta yang bercampur dengan manisnya susu ',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(35,	'Long Black',	'drink',	13000,	'Kopi Robusta dengan metode Manual Brewing',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(36,	'Iced Choco Coffee Creamy',	'drink',	13000,	'Pingin minum kopi? tapi juga pingin minum coklat? ini nih solusinya Iced Choco Coffee Creamy dengan perpaduan Kopi susu creamy dan Chocolate spesial',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(37,	'Iced Tea',	'drink',	4000,	'Segarnya daun teh pilihan dengan air es yang manis ',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(38,	'Matcha Hot',	'drink',	11000,	'Hangatnya susu dengan paduan matcha yang buat harimu makin berwarna',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(39,	'Iced Matcha Latte',	'drink',	14000,	'Perpaduan Greentea dengan Susu Dingin yang cocok buat kamu yang suka minuman creamy',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(40,	'Dark Chocolate Hot',	'drink',	10000,	'Chocolate original + Susu ',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(41,	'Iced Chocolate',	'drink',	14000,	'Segarnya Susu Coklat Dingin',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(42,	'Iced Strawberry Lava',	'drink',	14000,	'Manisnya Strawberry dipadukan dengan creamynya susu yang buat lidah kamu dimanjakan minuman ini nih',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(43,	'Susu Ovaltine',	'drink',	13000,	'Ovaltine+Susu',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(44,	'Lemon Tea',	'drink',	5000,	'Daun teh irisan lemon',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(45,	'Blue Blood Ocean',	'drink',	13000,	'Segarnya paduan soda yang dikombinasikan dengan lemon dan biji selasih yang bisa bikin hausmu hilang dalam sekejap',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(46,	'Blood Moon',	'drink',	13000,	'Seperti vampir yang kehausan darah, minuman ini juga bisa hilangin haus dari tenggorokanmu lo',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(47,	'Orange Squash',	'drink',	13000,	'Segarnya perpaduan lemon dengan soda dan biji selasih, pas sekali untuk menemani hausmu',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(48,	'Jahe Merah',	'drink',	5000,	'Jahe Merah Tumbuk Hot',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(52,	'Empon-Empon',	'drink',	8000,	'ee',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(53,	'Indomie',	'food',	6000,	'Mie Indomie dengan berbagai macam rasa beserta sayuran dan varian goreng maupun kuah',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(54,	'Rice Bowl BBQ',	'food',	15000,	'Paduan Nasi dan Ayam Crispy berbumbu BBQ dengan porsi yang akan membuat perutmu terasa kenyang',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(55,	'Rice Bowl  Sambal Matah',	'food',	15000,	'Paduan Nasi, Ayam Crispy dan Sambal Matah yang menyegarkan dengan porsi yang akan membuat perutmu terasa kenyang',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(56,	'Rice Bowl Salted Egg',	'food',	16000,	'Paduan Nasi dan Ayam Crispy berbumbu Salted Egg yang creamy dengan porsi yang akan membuat perutmu terasa kenyang',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(57,	'Cireng',	'snack',	10000,	'Snack yang asin gurih crunchy apa lagi kalo bukan cireng',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(58,	'tahu walik',	'snack',	11000,	'tw',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(59,	'Iced Thai Tea',	'drink',	10000,	'Kesegaran Teh bercampur susu, minuman ala thailand ini bisa bikin harimu menyenangkan lo',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(60,	'Iced Taro',	'drink',	12000,	'Taro adalah makanan yang sangat populer, bentuk aslinya merupakan tanaman mirip ubi & kentang, dengan rasa manis dan sedikit rasa kacang, dan warna ungunya menjadi ciri khas tersendiri nah taro dengan kombinasi susu yang creamy dan kesegaran ice buat harimu lebih manis',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(61,	'Iced Lychee Tea',	'drink',	12000,	'Bayangkan segarnya es teh yang nikmat tapi masih dipadukan dengan buah lychee, wah pastinya seger banget dan rasanya bikin lidah kamu nanonano',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(62,	'Iced Coffee Oreo',	'drink',	12000,	'Ini nih Ice Coffe yang dipadukan dengan crunchy nya oreo yang bikin kamu ketagihan',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(63,	'Iced Coffee Regal',	'drink',	12000,	'Betapa Nyummynya Iced Coffee dikombinasikan dengan regal yang bikin lidahmu jadi nanonano',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(64,	'Iced Orange',	'drink',	7000,	'Segarnya Orange yang dipadukan air dingin yang bisa langsung hempas hausmu',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(65,	'Small - Kopi Susu Strong',	'drink',	8000,	'Nikmatnya Minuman dengan Kopi Robusta yang bercampur dengan manisnya susu ',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(66,	'Small - Kopi Susu Creamy',	'drink',	8000,	'Nikmatnya Minuman dengan Kopi Robusta yang bercampur dengan manisnya susu ',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(67,	'Small - Kopi Susu Brown Sugar',	'drink',	8000,	'Nikmatnya perpaduan Kopi Robusta ,Brown Sugar, dan susu yang menyegarkan hausmu',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(68,	'Small - Iced Matcha Latte',	'drink',	10000,	'Perpaduan Greentea dengan Susu Dingin yang cocok buat kamu yang suka minuman creamy',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(69,	'Small - Iced Chocolate',	'drink',	10000,	'Segarnya Susu Coklat Dingin',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(70,	'Small - Iced Ovaltine',	'drink',	8000,	'ovltn',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(71,	'Small - Iced Strawberry Lava',	'drink',	10000,	'Manisnya Strawberry dipadukan dengan creamynya susu yang buat lidah kamu dimanjakan minuman ini nih',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(72,	'Small - Iced Choco Coffee Crea',	'drink',	10000,	'Pingin minum kopi? tapi juga pingin minum coklat? ini nih solusinya Iced Choco Coffee Creamy dengan perpaduan Kopi susu creamy dan Chocolate spesial',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(73,	'kopi brown sugar 12 Oz',	'drink',	8000,	'kbs',	NULL,	'1',	NULL,	'2022-07-16 02:17:35',	NULL,	0,	1,	0),
(74,	'Naga Kuning',	'food',	20000,	'Naga',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(75,	'Larutan Penyegar',	'drink',	6500,	'Penolong Panas Dalammu',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(76,	'Iso plus',	'drink',	3500,	'Isoplus',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(77,	'Vibe mini',	'drink',	7000,	'Vibemini',	NULL,	'1',	NULL,	NULL,	NULL,	0,	0,	0),
(78,	'UC 1000',	'drink',	8500,	'UC 1000',	'upload/fotoItem/LEZ356HwuUPQU5Xqlt4ant6kBNIlc5eKq3jDTKor.jpg',	'1',	NULL,	'2022-07-17 19:18:48',	NULL,	0,	1,	0),
(79,	'Club air mineral',	'drink',	3000,	'Clubairmineral',	'upload/fotoItem/F96KpcfAyJ2VqTjulugwdDhCSRLvlbNP4tEdAYKY.jpg',	'1',	NULL,	'2022-07-17 19:12:59',	NULL,	0,	1,	0),
(80,	'Pisang Coklat',	'snack',	15000,	'Paduan pisang dan crunchynya kulit yang digoreng apalagi ditambah toping keju oreo susu yang bikin tambah lumer',	'upload/fotoItem/jypFLu8WbUxe75HLKt9gn90ecM3ic1FEjrTV12XO.jpg',	'1',	NULL,	'2022-07-17 18:21:37',	NULL,	0,	1,	0),
(81,	'Sari Kacang Hijau',	'drink',	3500,	'Minuman yang membantu menjaga kesehatanmu dengan baiknya manfaat dari kacang hijau dikemas agar kamu bisa minum dimanapun kamu mau',	'upload/fotoItem/dm3tWiaFEEZQy10Q124WbekQ4g59qNOMCEXr0BYq.jpg',	'1',	NULL,	'2022-07-17 18:16:04',	NULL,	0,	1,	0),
(82,	'Hydro Coco',	'drink',	8000,	'Nikmatnya kesegaran air kelapa dingin yang bikin hausmu hilang dalam sekejap',	NULL,	'1',	NULL,	'2022-07-10 21:35:30',	'2022-07-10 21:35:30',	0,	1,	0),
(89,	'Menu Coba',	'food',	10,	'sddsfdf',	'upload/fotoItem/A83kCMuHCuv7x4etxSdveZzMD4q7YuXLCFYLC5kU.jpg',	'1',	'2022-07-17 20:10:00',	'2022-07-17 20:10:00',	NULL,	1,	1,	0),
(91,	'test 4',	'food',	220,	'ddfd',	'upload/fotoItem/7L12oWKZlJddImU8AdMJppjM25At5xZffDXy94W7.jpg',	'1',	'2022-07-18 00:29:58',	'2022-07-23 10:50:21',	NULL,	1,	1,	0),
(108,	'Test item',	'food',	10,	'ggg',	'upload/fotoItem/2uYkdsRlmZsEJtMVvr2gPHHPpLRRd1dtRqQZXcSL.jpg',	'1',	'2022-07-18 18:36:33',	'2022-07-18 18:36:33',	NULL,	1,	1,	0),
(109,	'My menu',	'snack',	12000,	'Snack',	'upload/fotoItem/KaLO39xVeLlXJjKKZZRiExTXVKoCz8bcdPHsDfVR.jpg',	'1',	'2022-07-22 03:19:51',	'2022-07-23 10:43:51',	NULL,	1,	1,	0),
(110,	'Menu baru',	'drink',	34000,	'ss',	'storage/upload/fotoItem/62e7fe2a9431f.png',	'1',	'2022-07-23 10:44:58',	'2022-08-01 09:24:10',	NULL,	1,	1,	0);

DROP TABLE IF EXISTS `m_item_det`;
CREATE TABLE `m_item_det` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `m_item_id` bigint(20) DEFAULT NULL,
  `keterangan` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` enum('level','topping') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'level',
  `harga` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `m_item_det_m_item_id_index` (`m_item_id`),
  KEY `m_item_det_tipe_index` (`tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `m_item_det` (`id`, `m_item_id`, `keterangan`, `tipe`, `harga`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1,	3,	'boba',	'topping',	2000,	NULL,	NULL,	NULL,	0,	0,	0),
(2,	3,	'oreo',	'topping',	2000,	NULL,	NULL,	NULL,	0,	0,	0),
(3,	3,	'1',	'level',	2000,	NULL,	NULL,	NULL,	0,	0,	0),
(4,	3,	'2',	'level',	2000,	NULL,	NULL,	NULL,	0,	0,	0),
(5,	2,	'1',	'level',	1000,	NULL,	NULL,	NULL,	0,	0,	0),
(6,	2,	'2',	'level',	2000,	NULL,	NULL,	NULL,	0,	0,	0),
(7,	2,	'3',	'level',	2500,	NULL,	NULL,	NULL,	0,	0,	0),
(97,	74,	'Perasan air terjun',	'topping',	1000,	NULL,	NULL,	NULL,	0,	0,	0),
(98,	74,	'1',	'level',	2000,	NULL,	NULL,	NULL,	0,	0,	0),
(99,	74,	'Bunga',	'topping',	2000,	NULL,	NULL,	NULL,	0,	0,	0),
(100,	74,	'2',	'level',	2000,	NULL,	NULL,	NULL,	0,	0,	0),
(101,	3,	'Test Topping 1',	'topping',	1000,	NULL,	NULL,	NULL,	0,	0,	0),
(102,	3,	'Test Topping 2',	'topping',	10000,	NULL,	NULL,	NULL,	0,	0,	0),
(103,	3,	'Level 1',	'level',	1000,	NULL,	NULL,	NULL,	0,	0,	0),
(104,	3,	'Level 2',	'level',	1000,	NULL,	NULL,	NULL,	0,	0,	0),
(105,	2,	'1',	'level',	0,	NULL,	NULL,	NULL,	0,	0,	0),
(106,	2,	'2',	'level',	0,	NULL,	NULL,	NULL,	0,	0,	0),
(107,	2,	'3',	'level',	0,	NULL,	NULL,	NULL,	0,	0,	0),
(108,	84,	'Keterangan',	'topping',	100,	NULL,	'2022-07-15 20:12:08',	NULL,	0,	1,	0),
(109,	84,	'Sambel',	'level',	2000,	NULL,	NULL,	NULL,	0,	0,	0),
(110,	85,	NULL,	'topping',	0,	NULL,	NULL,	NULL,	0,	0,	0),
(111,	86,	'keju',	'topping',	10,	NULL,	NULL,	NULL,	0,	0,	0),
(112,	87,	NULL,	'topping',	0,	NULL,	NULL,	NULL,	0,	0,	0),
(113,	88,	NULL,	'topping',	0,	NULL,	NULL,	NULL,	0,	0,	0),
(114,	89,	'Sambal',	'level',	2000,	NULL,	'2022-07-17 20:10:17',	NULL,	0,	1,	0),
(115,	90,	'asdsad',	'topping',	1330,	NULL,	NULL,	NULL,	0,	0,	0),
(116,	90,	NULL,	'topping',	0,	NULL,	NULL,	NULL,	0,	0,	0),
(117,	90,	NULL,	'topping',	0,	NULL,	NULL,	NULL,	0,	0,	0),
(118,	90,	'asdsd',	'level',	1340,	NULL,	NULL,	NULL,	0,	0,	0),
(119,	89,	NULL,	'topping',	0,	NULL,	NULL,	NULL,	0,	0,	0),
(120,	89,	'sdfsf',	'topping',	10,	NULL,	NULL,	NULL,	0,	0,	0),
(121,	80,	'Blbal',	'topping',	20000,	NULL,	NULL,	NULL,	0,	0,	0),
(122,	80,	'kloooe',	'level',	2330,	NULL,	NULL,	NULL,	0,	0,	0),
(123,	91,	'test',	'topping',	2330,	NULL,	'2022-07-18 00:30:42',	NULL,	0,	1,	0),
(124,	NULL,	'test',	'topping',	340,	NULL,	NULL,	NULL,	0,	0,	0),
(125,	92,	'test',	'topping',	340,	NULL,	NULL,	NULL,	0,	0,	0),
(126,	NULL,	'sefef',	'topping',	30,	NULL,	NULL,	NULL,	0,	0,	0),
(127,	NULL,	'sefef',	'topping',	30,	NULL,	NULL,	NULL,	0,	0,	0),
(128,	93,	'sefef',	'topping',	30,	NULL,	NULL,	NULL,	0,	0,	0),
(129,	NULL,	NULL,	'topping',	0,	NULL,	NULL,	NULL,	0,	0,	0),
(130,	94,	NULL,	'topping',	0,	NULL,	NULL,	NULL,	0,	0,	0),
(131,	95,	'kkkkkkk',	'level',	10,	NULL,	NULL,	NULL,	0,	0,	0),
(132,	96,	'test 1',	'topping',	101,	NULL,	NULL,	NULL,	0,	0,	0),
(133,	96,	NULL,	'topping',	101,	NULL,	NULL,	NULL,	0,	0,	0),
(134,	96,	'test 2',	'level',	101,	NULL,	NULL,	NULL,	0,	0,	0),
(135,	97,	'test 1',	'topping',	101,	NULL,	NULL,	NULL,	0,	0,	0),
(136,	97,	'erer',	'topping',	101,	NULL,	NULL,	NULL,	0,	0,	0),
(137,	97,	'test 2',	'level',	101,	NULL,	NULL,	NULL,	0,	0,	0),
(138,	98,	'asdad',	'topping',	2320,	NULL,	NULL,	NULL,	0,	0,	0),
(139,	98,	NULL,	'topping',	2320,	NULL,	NULL,	NULL,	0,	0,	0),
(140,	98,	'asdads',	'topping',	220,	NULL,	NULL,	NULL,	0,	0,	0),
(141,	99,	NULL,	'topping',	0,	NULL,	NULL,	NULL,	0,	0,	0),
(142,	100,	'sdfdsfs',	'level',	2,	NULL,	NULL,	NULL,	0,	0,	0),
(143,	100,	NULL,	'level',	222,	NULL,	NULL,	NULL,	0,	0,	0),
(144,	100,	'sfadfsdf',	'level',	2332,	NULL,	NULL,	NULL,	0,	0,	0),
(145,	108,	'Tempe',	'topping',	2000,	NULL,	NULL,	NULL,	0,	0,	0),
(146,	109,	'kacang',	'topping',	2000,	NULL,	'2022-07-22 03:20:05',	NULL,	0,	1,	0),
(147,	110,	'bubuk coklat',	'topping',	2000,	NULL,	NULL,	NULL,	0,	0,	0);

DROP TABLE IF EXISTS `m_menu`;
CREATE TABLE `m_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'makanan',
  `harga` int(11) NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `urutan` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_menu`) USING BTREE,
  KEY `created_by` (`created_by`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `m_menu` (`id_menu`, `nama`, `kategori`, `harga`, `deskripsi`, `foto`, `status`, `urutan`, `is_deleted`, `created_at`, `created_by`) VALUES
(2,	'Chicken Slam ',	'makanan',	13000,	'Ayam geprek dengan bumbu khas yang pedas dan gurih',	'https://javacode.landa.id/img/menu/gambar_628dc7b68c23a.png',	1,	4,	0,	2147483647,	1),
(3,	'Iced Lemon Tea ',	'minuman',	6000,	'Kesegaran daun teh yang bercampur dengan irisan lemon dalam air es yang menyegarkan hausmu',	'https://javacode.landa.id/img/menu/gambar_628dcc0bef13e.png',	1,	38,	0,	2147483647,	1),
(12,	'Chicken Slam Noodles',	'makanan',	16000,	'Campuran mie dengan ayam geprek yang pedas dan gurih',	'https://javacode.landa.id/img/menu/gambar_628dc80c52dc1.png',	1,	5,	0,	2147483647,	0),
(13,	'Fried Rice',	'makanan',	11000,	'Nasi goreng dengan bumbu khas yang pastinya bikin kamu nagih',	'https://javacode.landa.id/img/menu/gambar_628dc8695062b.png',	1,	9,	0,	2147483647,	0),
(14,	'Fried Rice Noodles',	'makanan',	15000,	'Nasi goreng dengan campuran mie yang di goreng yang pastinya bisa bikin kenyang perutmu',	'https://javacode.landa.id/img/menu/gambar_628dc8c841385.png',	1,	10,	0,	2147483647,	0),
(15,	'Lalapan Bebek Madura',	'makanan',	26000,	'Lalapan bebek yang di goreng dengan bumbu khas madura bersama sambal hijau yang nendang abis',	'https://javacode.landa.id/img/menu/gambar_628dc92109633.png',	1,	3,	0,	2147483647,	0),
(16,	'Lalapan Ayam Madura',	'makanan',	15000,	'Lalapan ayam yang di goreng dengan bumbu khas madura bersama sambal hijau yang nendang abis',	'https://javacode.landa.id/img/menu/gambar_628dc9649234c.png',	1,	1,	0,	0,	0),
(17,	'Lalapan Puyuh Madura',	'makanan',	18000,	'Lalapan burung puyuh yang di goreng dengan bumbu khas madura bersama sambal hijau yang nendang abis',	'https://javacode.landa.id/img/menu/gambar_628dc9a13655d.png',	1,	2,	0,	2147483647,	0),
(18,	'Frieno Java Code',	'makanan',	13000,	'Mie dangan campuran telur dan sayur dengan bumbu rahasia yang rasanya beda dari yang lainnya',	'https://javacode.landa.id/img/menu/gambar_628dca1e43bc0.png',	1,	11,	0,	2147483647,	0),
(19,	'Grilled Sausage',	'snack',	16000,	'Gurihnya Sosis Bakar Jumbo dengan bumbu barbeque beserta saus yang bikin tambah nikmat',	'https://javacode.landa.id/img/menu/gambar_628dd4268f11a.png',	1,	13,	0,	2147483647,	0),
(20,	'French Fries',	'snack',	10000,	'Crunchynya kentang goreng dengan origano dan saus cocol yang mantab betul',	'https://javacode.landa.id/img/menu/gambar_628dd467b276f.png',	1,	15,	0,	2147483647,	0),
(22,	'Potato Wedges',	'snack',	12000,	'Racikan Kentang Dengan Bumbu Spesial yang digoreng dengan sempurna beserta saus cocol yang mantul',	'https://javacode.landa.id/img/menu/gambar_628dd4abedc0a.png',	1,	14,	0,	2147483647,	0),
(23,	'Sascram Eggs',	'snack',	15000,	'Pingin ngemil tapi diet? pas banget nih kombinasi sosis bakar dan sascram eggs yang mendukung program dietmu, pastinya ga banyak karbo dong',	'https://javacode.landa.id/img/menu/gambar_628dd4f5ddae9.png',	1,	17,	0,	2147483647,	0),
(24,	'Beef Burger',	'snack',	13000,	'Mantab nih buat yang ga pingin makan berat tapi tetep bisa nahan laper, ini nih Burger Dengan Olahan Daging Sapi, Sayuran, Serta Keju',	'https://javacode.landa.id/img/menu/gambar_628dd53313451.png',	1,	16,	0,	2147483647,	0),
(25,	'Nugget',	'snack',	12000,	'Pingin ngemil tapi gamau yang manis? ini nih nugget ayam yang gurih bisa jadi pilihanmu',	'https://javacode.landa.id/img/menu/gambar_628dd5654e9be.png',	1,	18,	0,	2147483647,	0),
(26,	'Maryam',	'snack',	15000,	'Roti maryam yang juga dikenal sebagai roti cane/canai ini bisa disajikan jadi 2 variasi yaitu asin-gurih dan manis yang bikin lidahmu nanonano',	'https://javacode.landa.id/img/menu/gambar_628dd602d09fd.png',	1,	19,	0,	2147483647,	0),
(27,	'V60',	'minuman',	14000,	'Biji kopi arabika yang diolah menggunakan metode V60',	'https://javacode.landa.id/img/menu/gambar_6294232e1ae83.png',	1,	22,	0,	2147483647,	0),
(28,	'Tubruk',	'minuman',	6000,	'Nikmatnya Kopi Robusta yang digrilling langsung dengan aroma yang khas ',	'https://javacode.landa.id/img/menu/gambar_629423586a633.png',	1,	23,	0,	2147483647,	0),
(29,	'Iced Kopi Susu Strong',	'minuman',	12000,	'Nikmatnya Minuman dengan Kopi Robusta yang bercampur dengan manisnya susu ',	'https://javacode.landa.id/img/menu/gambar_628dcccc16a98.png',	1,	26,	0,	2147483647,	0),
(30,	'Iced Kopi Brown Sugar',	'minuman',	12000,	'Nikmatnya perpaduan Kopi Robusta ,Brown Sugar, dan susu yang menyegarkan hausmu',	'https://javacode.landa.id/img/menu/gambar_628dcd0c62847.png',	1,	28,	0,	2147483647,	0),
(31,	'Coffee Beer',	'minuman',	13000,	'Segarnya Coffee dingin dengan beer yang menyegarkan dahagamu',	'https://javacode.landa.id/img/menu/gambar_626610ce5de4c.png',	1,	55,	0,	2147483647,	0),
(32,	'Vietnam Drip',	'minuman',	13000,	'Kopi Robusta, Kental Manis, Diolah Dengan metode khas Vietnam Drip',	'https://javacode.landa.id/img/menu/gambar_629423b39df1e.png',	1,	24,	0,	2147483647,	0),
(33,	'Vietnam Drip',	'minuman',	13000,	'Kopi Robusta, Kental Manis, Diolah Dengan metode khas Vietnam Drip',	'https://javacode.landa.id/img/menu/gambar_625d153f59b19.png',	1,	33,	1,	2147483647,	0),
(34,	'Kopi Susu Creamy',	'minuman',	12000,	'Nikmatnya Minuman dengan Kopi Robusta yang bercampur dengan manisnya susu ',	'https://javacode.landa.id/img/menu/gambar_628dcd83501f7.png',	1,	27,	0,	2147483647,	0),
(35,	'Long Black',	'minuman',	13000,	'Kopi Robusta dengan metode Manual Brewing',	'https://javacode.landa.id/img/menu/gambar_629423d51a810.png',	1,	25,	0,	2147483647,	0),
(36,	'Iced Choco Coffee Creamy',	'minuman',	13000,	'Pingin minum kopi? tapi juga pingin minum coklat? ini nih solusinya Iced Choco Coffee Creamy dengan perpaduan Kopi susu creamy dan Chocolate spesial',	'https://javacode.landa.id/img/menu/gambar_628dcdd66a3e7.png',	1,	29,	0,	2147483647,	0),
(37,	'Iced Tea',	'minuman',	4000,	'Segarnya daun teh pilihan dengan air es yang manis ',	'https://javacode.landa.id/img/menu/gambar_628dce31afb47.png',	1,	37,	0,	2147483647,	0),
(38,	'Matcha Hot',	'minuman',	11000,	'Hangatnya susu dengan paduan matcha yang buat harimu makin berwarna',	'https://javacode.landa.id/img/menu/gambar_629424607b982.png',	1,	38,	1,	2147483647,	0),
(39,	'Iced Matcha Latte',	'minuman',	14000,	'Perpaduan Greentea dengan Susu Dingin yang cocok buat kamu yang suka minuman creamy',	'https://javacode.landa.id/img/menu/gambar_628dcec16eb09.png',	1,	31,	0,	2147483647,	0),
(40,	'Dark Chocolate Hot',	'minuman',	10000,	'Chocolate original + Susu ',	'https://javacode.landa.id/img/menu/gambar_6294248998b2e.png',	1,	40,	1,	2147483647,	0),
(41,	'Iced Chocolate',	'minuman',	14000,	'Segarnya Susu Coklat Dingin',	'https://javacode.landa.id/img/menu/gambar_628dcf2d9f738.png',	1,	35,	0,	2147483647,	0),
(42,	'Iced Strawberry Lava',	'minuman',	14000,	'Manisnya Strawberry dipadukan dengan creamynya susu yang buat lidah kamu dimanjakan minuman ini nih',	'https://javacode.landa.id/img/menu/gambar_628dcf9b912f5.png',	1,	32,	0,	2147483647,	0),
(43,	'Susu Ovaltine',	'minuman',	13000,	'Ovaltine+Susu',	'https://javacode.landa.id/img/menu/gambar_629424b0100eb.png',	1,	34,	0,	2147483647,	0),
(44,	'Lemon Tea',	'minuman',	5000,	'Daun teh irisan lemon',	'https://javacode.landa.id/img/menu/gambar_62661234a177c.png',	1,	44,	1,	2147483647,	0),
(45,	'Blue Blood Ocean',	'minuman',	13000,	'Segarnya paduan soda yang dikombinasikan dengan lemon dan biji selasih yang bisa bikin hausmu hilang dalam sekejap',	'https://javacode.landa.id/img/menu/gambar_628dd01509a85.png',	1,	41,	0,	2147483647,	0),
(46,	'Blood Moon',	'minuman',	13000,	'Seperti vampir yang kehausan darah, minuman ini juga bisa hilangin haus dari tenggorokanmu lo',	'https://javacode.landa.id/img/menu/gambar_628dd055d4ba9.png',	1,	42,	0,	2147483647,	0),
(47,	'Orange Squash',	'minuman',	13000,	'Segarnya perpaduan lemon dengan soda dan biji selasih, pas sekali untuk menemani hausmu',	'https://javacode.landa.id/img/menu/gambar_628dd0ae86403.png',	1,	43,	0,	2147483647,	0),
(48,	'Jahe Merah',	'minuman',	5000,	'Jahe Merah Tumbuk Hot',	'https://javacode.landa.id/img/menu/gambar_629424d526b7d.png',	1,	45,	0,	2147483647,	0),
(52,	'Empon-Empon',	'minuman',	8000,	'ee',	'https://javacode.landa.id/img/menu/gambar_629424f5329a0.png',	1,	46,	0,	2147483647,	0),
(53,	'Indomie',	'makanan',	6000,	'Mie Indomie dengan berbagai macam rasa beserta sayuran dan varian goreng maupun kuah',	'https://javacode.landa.id/img/menu/gambar_628dca5f93acd.png',	1,	12,	0,	1652337591,	3),
(54,	'Rice Bowl BBQ',	'makanan',	15000,	'Paduan Nasi dan Ayam Crispy berbumbu BBQ dengan porsi yang akan membuat perutmu terasa kenyang',	'https://javacode.landa.id/img/menu/gambar_628dcac045053.png',	1,	6,	0,	1652337633,	3),
(55,	'Rice Bowl  Sambal Matah',	'makanan',	15000,	'Paduan Nasi, Ayam Crispy dan Sambal Matah yang menyegarkan dengan porsi yang akan membuat perutmu terasa kenyang',	'https://javacode.landa.id/img/menu/gambar_628dcafd0c1d5.png',	1,	7,	0,	1652337722,	3),
(56,	'Rice Bowl Salted Egg',	'makanan',	16000,	'Paduan Nasi dan Ayam Crispy berbumbu Salted Egg yang creamy dengan porsi yang akan membuat perutmu terasa kenyang',	'https://javacode.landa.id/img/menu/gambar_628dcb3503278.png',	1,	8,	0,	1652337769,	3),
(57,	'Cireng',	'snack',	10000,	'Snack yang asin gurih crunchy apa lagi kalo bukan cireng',	'https://javacode.landa.id/img/menu/gambar_628dd6486fa06.png',	1,	21,	0,	1652337986,	3),
(58,	'tahu walik',	'snack',	11000,	'tw',	'',	1,	58,	1,	1652338014,	3),
(59,	'Iced Thai Tea',	'minuman',	10000,	'Kesegaran Teh bercampur susu, minuman ala thailand ini bisa bikin harimu menyenangkan lo',	'https://javacode.landa.id/img/menu/gambar_628dd107904e5.png',	1,	40,	0,	1652338297,	3),
(60,	'Iced Taro',	'minuman',	12000,	'Taro adalah makanan yang sangat populer, bentuk aslinya merupakan tanaman mirip ubi & kentang, dengan rasa manis dan sedikit rasa kacang, dan warna ungunya menjadi ciri khas tersendiri nah taro dengan kombinasi susu yang creamy dan kesegaran ice buat harimu lebih manis',	'https://javacode.landa.id/img/menu/gambar_628dd1d57d14a.png',	1,	33,	0,	1652338334,	3),
(61,	'Iced Lychee Tea',	'minuman',	12000,	'Bayangkan segarnya es teh yang nikmat tapi masih dipadukan dengan buah lychee, wah pastinya seger banget dan rasanya bikin lidah kamu nanonano',	'https://javacode.landa.id/img/menu/gambar_628dd22bdacfa.png',	1,	39,	0,	1652338378,	3),
(62,	'Iced Coffee Oreo',	'minuman',	12000,	'Ini nih Ice Coffe yang dipadukan dengan crunchy nya oreo yang bikin kamu ketagihan',	'https://javacode.landa.id/img/menu/gambar_628dd278117e8.png',	1,	36,	0,	1652338411,	3),
(63,	'Iced Coffee Regal',	'minuman',	12000,	'Betapa Nyummynya Iced Coffee dikombinasikan dengan regal yang bikin lidahmu jadi nanonano',	'https://javacode.landa.id/img/menu/gambar_628dd314e3789.png',	1,	30,	0,	1652338491,	3),
(64,	'Iced Orange',	'minuman',	7000,	'Segarnya Orange yang dipadukan air dingin yang bisa langsung hempas hausmu',	'https://javacode.landa.id/img/menu/gambar_628dd34d60573.png',	1,	44,	0,	1652338521,	3),
(65,	'Small - Kopi Susu Strong',	'minuman',	8000,	'Nikmatnya Minuman dengan Kopi Robusta yang bercampur dengan manisnya susu ',	'https://javacode.landa.id/img/menu/gambar_628dd70483ca2.png',	1,	47,	0,	1652339444,	3),
(66,	'Small - Kopi Susu Creamy',	'minuman',	8000,	'Nikmatnya Minuman dengan Kopi Robusta yang bercampur dengan manisnya susu ',	'https://javacode.landa.id/img/menu/gambar_628dd7af8b9d5.png',	1,	48,	0,	1652339502,	3),
(67,	'Small - Kopi Susu Brown Sugar',	'minuman',	8000,	'Nikmatnya perpaduan Kopi Robusta ,Brown Sugar, dan susu yang menyegarkan hausmu',	'https://javacode.landa.id/img/menu/gambar_628dd7d5109f6.png',	1,	49,	0,	1652339581,	3),
(68,	'Small - Iced Matcha Latte',	'minuman',	10000,	'Perpaduan Greentea dengan Susu Dingin yang cocok buat kamu yang suka minuman creamy',	'https://javacode.landa.id/img/menu/gambar_628dd81eadf0a.png',	1,	51,	0,	1652339617,	3),
(69,	'Small - Iced Chocolate',	'minuman',	10000,	'Segarnya Susu Coklat Dingin',	'https://javacode.landa.id/img/menu/gambar_628dd85909dc8.png',	1,	53,	0,	1652339645,	3),
(70,	'Small - Iced Ovaltine',	'minuman',	8000,	'ovltn',	'https://javacode.landa.id/img/menu/gambar_62942519b577e.png',	1,	54,	0,	1652339670,	3),
(71,	'Small - Iced Strawberry Lava',	'minuman',	10000,	'Manisnya Strawberry dipadukan dengan creamynya susu yang buat lidah kamu dimanjakan minuman ini nih',	'https://javacode.landa.id/img/menu/gambar_628dd89560f4b.png',	1,	52,	0,	1652339700,	3),
(72,	'Small - Iced Choco Coffee Crea',	'minuman',	10000,	'Pingin minum kopi? tapi juga pingin minum coklat? ini nih solusinya Iced Choco Coffee Creamy dengan perpaduan Kopi susu creamy dan Chocolate spesial',	'https://javacode.landa.id/img/menu/gambar_628dd8e82c246.png',	1,	50,	0,	1652339792,	3),
(73,	'kopi brown sugar 12 Oz',	'minuman',	8000,	'kbs',	'https://javacode.landa.id/img/menu/gambar_62835e53d4fbb.png',	1,	73,	1,	1652340124,	3),
(74,	'Naga Kuning',	'makanan',	20000,	'Naga',	'https://javacode.landa.id/img/menu/gambar_627cdd8179c57.png',	1,	74,	1,	1652350337,	3),
(75,	'Larutan Penyegar',	'minuman',	6500,	'Penolong Panas Dalammu',	'https://javacode.landa.id/img/menu/gambar_62876a210d691.png',	1,	59,	0,	1653040103,	0),
(76,	'Iso plus',	'minuman',	3500,	'Isoplus',	'https://javacode.landa.id/img/menu/gambar_6287679da6b87.png',	1,	60,	0,	1653040183,	0),
(77,	'Vibe mini',	'minuman',	7000,	'Vibemini',	'https://javacode.landa.id/img/menu/gambar_62876b78268a6.png',	1,	58,	0,	1653040314,	0),
(78,	'UC 1000',	'minuman',	8500,	'UC 1000',	'https://javacode.landa.id/img/menu/gambar_6287687675ec2.png',	1,	57,	0,	1653040482,	0),
(79,	'Club air mineral ',	'minuman',	3000,	'Clubairmineral',	'https://javacode.landa.id/img/menu/gambar_62876803ac1ab.png',	1,	62,	0,	1653041155,	0),
(80,	'Pisang Coklat',	'snack',	15000,	'Paduan pisang dan crunchynya kulit yang digoreng apalagi ditambah toping keju oreo susu yang bikin tambah lumer',	'https://javacode.landa.id/img/menu/gambar_628dd681c926c.png',	1,	20,	0,	1653042135,	0),
(81,	'Sari Kacang Hijau',	'minuman',	3500,	'Minuman yang membantu menjaga kesehatanmu dengan baiknya manfaat dari kacang hijau dikemas agar kamu bisa minum dimanapun kamu mau',	'https://javacode.landa.id/img/menu/gambar_629425b31d2e9.png',	1,	61,	0,	1653876147,	3),
(82,	'Hydro Coco',	'minuman',	8000,	'Nikmatnya kesegaran air kelapa dingin yang bikin hausmu hilang dalam sekejap',	'https://javacode.landa.id/img/menu/gambar_6294263983a9d.png',	1,	56,	0,	1653876281,	3);

DROP TABLE IF EXISTS `m_menu_detail`;
CREATE TABLE `m_menu_detail` (
  `id_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `keterangan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_detail`) USING BTREE,
  KEY `id_menu` (`id_menu`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `m_menu_detail` (`id_detail`, `id_menu`, `keterangan`, `type`, `harga`, `is_deleted`) VALUES
(1,	3,	'boba',	'topping',	2000,	1),
(2,	3,	'oreo',	'topping',	2000,	1),
(3,	3,	'1',	'level',	2000,	1),
(4,	3,	'2',	'level',	2000,	1),
(5,	2,	'1',	'level',	1000,	0),
(6,	2,	'2',	'level',	2000,	0),
(7,	2,	'3',	'level',	2500,	0),
(97,	74,	'Perasan air terjun',	'topping',	1000,	0),
(98,	74,	'1',	'level',	2000,	0),
(99,	74,	'Bunga',	'topping',	2000,	0),
(100,	74,	'2',	'level',	2000,	0),
(101,	3,	'Test Topping 1',	'topping',	1000,	1),
(102,	3,	'Test Topping 2',	'topping',	10000,	1),
(103,	3,	'Level 1',	'level',	1000,	1),
(104,	3,	'Level 2',	'level',	1000,	1),
(105,	2,	'1',	'level',	0,	0),
(106,	2,	'2',	'level',	0,	0),
(107,	2,	'3',	'level',	0,	0);

DROP TABLE IF EXISTS `m_promo`;
CREATE TABLE `m_promo` (
  `id_promo` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `diskon` int(11) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL,
  `kadaluarsa` int(11) DEFAULT NULL,
  `syarat_ketentuan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 1,
  `updated_by` int(11) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_promo`) USING BTREE,
  KEY `created_by` (`created_by`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `m_promo` (`id_promo`, `nama`, `type`, `diskon`, `nominal`, `kadaluarsa`, `syarat_ketentuan`, `foto`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `is_deleted`) VALUES
(19,	'Friend Referral Recruitment',	'voucher',	NULL,	200000,	30,	'<p>Teman mu disini karena Mu, terima kasih atas dedikasi menyebarkan informasinya</p>',	NULL,	'0000-00-00 00:00:00',	NULL,	NULL,	0,	1,	0),
(20,	'Friend Referral Retention',	'voucher',	NULL,	200000,	30,	'<p>Temen Mu ternyata betah disini, makasih ya udah buat dia bertahan dengan kita</p>',	NULL,	'0000-00-00 00:00:00',	NULL,	NULL,	0,	1,	0),
(21,	'Birthday',	'voucher',	NULL,	100000,	1,	'<p>Selamat ulang tahun, teman-teman sekantor selalu mendoakanmu sehat, bahagia, panjang umur, agar bisa jadi pribadi yang lebih baik dari tahun-tahun sebelumnya&nbsp;</p>',	NULL,	'0000-00-00 00:00:00',	NULL,	NULL,	0,	1,	1),
(22,	'Koordinator Program Kekompakan',	'voucher',	NULL,	100000,	30,	'<p>Berkat Kamu teman - teman sehat dan bahagia , terima kasih koordinator olahraga Ku</p>',	NULL,	'0000-00-00 00:00:00',	NULL,	NULL,	0,	1,	0),
(23,	'Active during Training',	'voucher',	NULL,	40000,	7,	'<p>Nah gitu dong, terus aktif ya pada saat Training</p><p>Semoga ilmu yang dipelajari bermanfaat bagi pengembangan dirimu</p>',	NULL,	'0000-00-00 00:00:00',	NULL,	NULL,	0,	1,	1),
(24,	'Ngajidjhfoafjsailkdjqwudijqodq',	'diskon',	10,	NULL,	NULL,	'<p>ngaji itu baik</p>',	NULL,	'0000-00-00 00:00:00',	'2022-07-18 03:22:13',	'2022-07-18 03:22:13',	0,	1,	1),
(25,	'Ontime',	'diskon',	20,	NULL,	NULL,	'<p>ayo ontime</p>',	NULL,	'0000-00-00 00:00:00',	NULL,	NULL,	1,	1,	1),
(40,	'Mengisi Survey/Review Apps',	'diskon',	10,	NULL,	0,	'<p>Anda bisa mendapatkan diskon ini dengan cara:<br>1. Mengisi survey atau memberikan review terkait apps yang telah ditentukan oleh perusahaan</p>',	NULL,	'0000-00-00 00:00:00',	NULL,	NULL,	0,	1,	0),
(41,	'Tahsin',	'diskon',	10,	NULL,	0,	'<p>Anda bisa mendapatkan diskon ini dengan cara:<br>1. Melakukan tahsin minimal 10 kali dalam waktu satu bulan</p>',	NULL,	'0000-00-00 00:00:00',	NULL,	NULL,	0,	1,	0),
(42,	'Competency Matrix',	'diskon',	10,	NULL,	0,	'<p>Anda bisa mendapatkan diskon ini dengan cara:<br>1. Mempertahankan kompetensi yang dimiliki di atas 90% dalam waktu satu bulan</p>',	NULL,	'0000-00-00 00:00:00',	NULL,	NULL,	0,	1,	0),
(43,	'Terlambat di bawah 3x',	'diskon',	10,	NULL,	0,	'<p>Anda bisa mendapatkan diskon ini dengan cara:<br>1. Mempertahankan jumlah keterlambatan di bawah 3x dalam sebulan</p><p>2. Mangkir akan dihitung sebagai keterlambatan</p>',	NULL,	'0000-00-00 00:00:00',	NULL,	NULL,	0,	1,	0),
(44,	'Full Absensi',	'diskon',	10,	0,	3,	'<p>Anda bisa mendapatkan diskon ini dengan cara:<br>1. Melakukan Masuk secara tepat waktu tanpa absen/mangkir dalam waktu satu bulan</p>',	NULL,	'0000-00-00 00:00:00',	'2022-07-17 21:21:08',	NULL,	0,	1,	0),
(45,	'Dapatkan voucher gratis ketika',	'voucher',	0,	100000,	1,	'<p>Ini hanya untuk test 2</p>',	'upload/fotoPromo/Xh1EVlzSV5OIu0bvG412X6xo0wqyemPa9BQjUnVn.jpg',	'0000-00-00 00:00:00',	'2022-07-18 02:32:09',	NULL,	3,	1,	1),
(46,	'kevin',	'voucher',	0,	10000,	1,	'<p>au</p>',	NULL,	'0000-00-00 00:00:00',	'2022-07-17 20:34:58',	NULL,	0,	1,	1),
(48,	'test 23',	'diskon',	10,	0,	0,	'ssdfsdfdsf',	'upload/fotoPromo/5qYmSIFOBIPxMdUOOUrVjUmLyWVWzlhVtgn41tvV.jpg',	'2022-07-17 08:14:09',	'2022-07-17 20:51:27',	'2022-07-17 20:51:27',	1,	1,	0),
(50,	'Coba',	'voucher',	10,	1110,	4,	'dddd',	'upload/fotoPromo/Fx6hayKk03C0dfZMxar5TqcrVjqWI9MVWfSpcXIC.jpg',	'2022-07-17 23:49:36',	'2022-07-18 00:12:53',	'2022-07-18 00:12:53',	1,	1,	0),
(51,	'test 3',	'voucher',	2320,	20000,	3,	'asdasd',	'upload/fotoPromo/zZdFYkj5ivMFcxxHvkCzXVBtTCsOz4B4dxtU0D77.jpg',	'2022-07-18 00:07:26',	'2022-07-18 00:07:43',	'2022-07-18 00:07:43',	1,	1,	0),
(52,	'Coba',	'voucher',	0,	30000,	10,	'adas',	'upload/fotoPromo/1NzD5Lmnn4CqoHzS2I20ulehDx50oNvCG2Jvecgl.jpg',	'2022-07-18 00:13:15',	'2022-07-18 00:13:15',	NULL,	1,	1,	0),
(53,	'Diskon 50%',	'diskon',	50,	0,	3,	'<p>Bla</p>',	'upload/fotoPromo/mt5EVdOnmime9cviv6JkDQSIhAZkI5OJIjZlszLJ.jpg',	'2022-07-20 02:57:41',	'2022-07-20 02:57:41',	NULL,	1,	1,	0),
(54,	'diskon hulala',	'diskon',	30,	0,	3,	'<p>jkjk</p>',	NULL,	'2022-07-22 23:05:30',	'2022-07-23 19:27:57',	'2022-07-23 19:27:57',	1,	1,	0),
(55,	'Promo sehat',	'diskon',	20,	0,	2,	'<p>Syarat</p>',	NULL,	'2022-07-23 08:09:21',	'2022-07-23 08:09:21',	NULL,	1,	1,	0),
(56,	'Promo diskon gila',	'diskon',	40,	0,	1,	'<p>ss</p>',	NULL,	'2022-07-23 08:10:05',	'2022-07-23 08:10:05',	NULL,	1,	1,	0),
(57,	'Hello world',	'diskon',	10,	0,	2,	'<p>syarat</p>',	NULL,	'2022-07-23 08:10:58',	'2022-07-23 19:25:00',	NULL,	1,	1,	0),
(58,	'Voucher 20k',	'voucher',	0,	20000,	3,	'<p>syarat voucher</p>',	'upload/fotoPromo/OgY6KO43e4OWNj8ilofHj2yUd0vf8c8ywRng60PR.jpg',	'2022-07-23 19:11:54',	'2022-07-23 19:24:37',	NULL,	1,	1,	0);

DROP TABLE IF EXISTS `m_review`;
CREATE TABLE `m_review` (
  `id_review` int(11) NOT NULL AUTO_INCREMENT,
  `score` float NOT NULL,
  `review` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_at` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `is_deleted` int(11) DEFAULT 0,
  PRIMARY KEY (`id_review`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `m_roles`;
CREATE TABLE `m_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) NOT NULL,
  `akses` text NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

INSERT INTO `m_roles` (`id`, `nama`, `akses`, `is_deleted`) VALUES
(1,	'Super Admin',	'{\r\n    \"auth_user\": true,\r\n    \"auth_akses\": true,\r\n\r\n    \"setting_menu\": true,\r\n    \"setting_customer\": true,\r\n    \"setting_promo\": true,\r\n    \"setting_diskon\": true,\r\n    \"setting_voucher\": true,\r\n\r\n    \"laporan_menu\": true,\r\n    \"laporan_customer\": true\r\n}',	0),
(2,	'User',	'{\r\n    \"auth_user\": true,\r\n    \"auth_akses\": true,\r\n\r\n    \"setting_menu\": true,\r\n    \"setting_customer\": true,\r\n    \"setting_promo\": true,\r\n    \"setting_diskon\": true,\r\n    \"setting_voucher\": false,\r\n\r\n    \"laporan_menu\": true,\r\n    \"laporan_customer\": true\r\n}',	0);

DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `secret_key` varchar(225) DEFAULT NULL,
  `apple_token` text DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `tgl_lahir` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(25) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT '111111',
  `ktp` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_google` tinyint(1) NOT NULL DEFAULT 0,
  `is_apple` tinyint(1) NOT NULL DEFAULT 0,
  `is_customer` tinyint(1) NOT NULL DEFAULT 1,
  `is_kitchen` int(11) NOT NULL DEFAULT 0,
  `m_roles_id` int(11) NOT NULL DEFAULT 2,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_user`) USING BTREE,
  KEY `m_roles_id` (`m_roles_id`) USING BTREE,
  CONSTRAINT `m_user_ibfk_1` FOREIGN KEY (`m_roles_id`) REFERENCES `m_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

INSERT INTO `m_user` (`id_user`, `secret_key`, `apple_token`, `nama`, `tgl_lahir`, `email`, `alamat`, `telepon`, `foto`, `password`, `pin`, `ktp`, `status`, `is_google`, `is_apple`, `is_customer`, `is_kitchen`, `m_roles_id`, `is_deleted`) VALUES
(1,	'd2307551847eaa2aefd86351e28fbc80a9b06acd',	NULL,	'Default Account Javacode',	'08/05/22',	'javacode@javacode.landa.id',	NULL,	'034112345678',	'https://javacode.landa.id/img/1/review/review_1_6278dc6a32e98.png',	'd033e22ae348aeb5660fc2140aec35850c4da997',	'000000',	NULL,	1,	0,	0,	1,	0,	2,	0),
(2,	'0d1316d6e32dd123ef73c8fe8434477bdfa8f233',	NULL,	'Kitchen',	NULL,	'kitchen@javacode.landa.id',	NULL,	NULL,	NULL,	'd033e22ae348aeb5660fc2140aec35850c4da997',	'111111',	NULL,	1,	0,	0,	0,	1,	1,	0),
(3,	'19af3a07bdec7be3523993c18010d763dd8c468f',	NULL,	'Admin',	NULL,	'admin@javacode.landa.id',	NULL,	NULL,	NULL,	'd033e22ae348aeb5660fc2140aec35850c4da997',	'111111',	NULL,	1,	0,	0,	0,	0,	1,	0),
(113,	'6fa46ec30c0d63ab66e8437b4dcdb264f7c528e5',	NULL,	'Shabil Alqorni',	'13/02/01',	'shabilalqorniways@gmail.com',	NULL,	'08970830732',	'https://javacode.landa.id/img/113/review/review_113_629839ac08d7c.png',	'4e9804c7add97c2bf38948cdecf0848600c6183b',	'130201',	NULL,	1,	1,	0,	1,	0,	2,	0),
(114,	'651a4ce2a28b317c5edaa0fdb1f89ca501aaebfb',	NULL,	'Andi Surya',	NULL,	'andi502.as@gmail.com',	NULL,	NULL,	NULL,	'412bc6ff9d10c653bd75f2b6314a08dd570544a0',	'111111',	NULL,	1,	1,	0,	1,	0,	2,	0),
(115,	'980107b8f3a45ba51e2c584e1c69e9639697b3d6',	NULL,	'Admin Aprilia',	NULL,	'admin@landa.co.id',	NULL,	NULL,	NULL,	'0198ca6c2f8d45bcac2f2bf0a6680a25239dc3ad',	'111111',	NULL,	1,	1,	0,	1,	0,	2,	0),
(116,	'dbd21e4dd3afc257c9db2257ac9a18e3488e928f',	NULL,	'Aprilia indriyawati',	NULL,	'apriliaindriyawati@gmail.com',	NULL,	NULL,	'https://javacode.landa.id/img/116/review/review_116_629da7aa6c480.png',	'7798650e5b3890466df67a1a306c5dc612c8c4d3',	'111111',	NULL,	1,	1,	0,	1,	0,	2,	0);

DROP TABLE IF EXISTS `m_voucher`;
CREATE TABLE `m_voucher` (
  `id_voucher` int(11) NOT NULL AUTO_INCREMENT,
  `id_promo` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nominal` int(11) NOT NULL,
  `info_voucher` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periode_mulai` date NOT NULL,
  `periode_selesai` date NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id_voucher`) USING BTREE,
  KEY `id_promo` (`id_promo`) USING BTREE,
  KEY `id_user` (`id_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `m_voucher` (`id_voucher`, `id_promo`, `id_user`, `nominal`, `info_voucher`, `periode_mulai`, `periode_selesai`, `type`, `status`, `catatan`, `created_at`, `updated_at`, `created_by`, `is_deleted`, `updated_by`) VALUES
(21,	50,	7,	1110,	NULL,	'2022-07-31',	'2022-08-04',	0,	1,	'10',	'2022-07-31 09:23:52',	'2022-08-02 02:19:55',	1,	0,	1);

DROP TABLE IF EXISTS `m_voucher_histori`;
CREATE TABLE `m_voucher_histori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_voucher` int(11) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `t_detail_order`;
CREATE TABLE `t_detail_order` (
  `id_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_item` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT 0,
  `topping` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `jumlah` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_done` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_detail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `t_detail_order` (`id_detail`, `id_order`, `id_item`, `level`, `topping`, `jumlah`, `total`, `catatan`, `is_done`, `is_deleted`) VALUES
(1,	1,	16,	0,	'[]',	1,	15000,	'',	0,	0),
(2,	1,	19,	0,	'[]',	1,	16000,	'',	0,	0),
(3,	1,	28,	0,	'[]',	1,	6000,	'',	0,	0),
(4,	2,	16,	0,	'[]',	1,	15000,	'',	1,	0),
(5,	2,	20,	0,	'[]',	1,	10000,	'',	1,	0),
(6,	2,	59,	0,	'',	1,	10000,	'',	1,	0),
(7,	3,	16,	0,	'[]',	1,	15000,	'',	0,	0),
(8,	3,	19,	0,	'[]',	1,	16000,	'',	0,	0),
(9,	3,	27,	0,	'[]',	1,	14000,	'',	0,	1),
(10,	4,	16,	0,	'[]',	1,	15000,	'',	1,	0),
(11,	4,	54,	0,	'[]',	1,	15000,	'',	1,	0),
(12,	4,	80,	0,	'[]',	1,	15000,	'',	1,	1),
(13,	4,	57,	0,	'[]',	1,	10000,	'',	1,	0),
(14,	5,	16,	0,	'',	1,	15000,	'',	0,	0),
(15,	6,	16,	0,	'',	1,	15000,	'',	0,	0),
(16,	7,	16,	0,	'',	1,	15000,	'',	0,	1),
(17,	7,	15,	0,	'',	1,	26000,	'',	0,	0),
(18,	8,	55,	0,	'',	1,	15000,	'',	0,	0),
(19,	9,	24,	0,	'',	1,	13000,	'',	0,	1),
(20,	9,	20,	0,	'',	1,	10000,	'',	0,	0),
(21,	10,	17,	0,	'',	1,	18000,	'',	0,	1),
(22,	10,	2,	0,	'',	1,	13000,	'',	0,	0),
(23,	10,	19,	0,	'',	1,	16000,	'',	0,	1),
(24,	10,	57,	0,	'',	1,	10000,	'',	0,	1),
(25,	10,	32,	0,	'',	1,	13000,	'',	0,	1),
(26,	10,	39,	0,	'',	1,	14000,	'',	0,	1),
(27,	11,	20,	0,	'',	1,	10000,	'',	0,	1),
(28,	11,	57,	0,	'',	2,	20000,	'',	0,	1),
(29,	11,	59,	0,	'',	2,	20000,	'',	0,	0),
(30,	11,	72,	0,	'',	2,	20000,	'',	0,	1),
(31,	11,	71,	0,	'',	2,	20000,	'',	0,	1),
(32,	11,	69,	0,	'',	1,	10000,	'',	0,	1),
(33,	12,	56,	0,	'',	1,	16000,	'',	0,	1),
(34,	12,	13,	0,	'',	1,	11000,	'',	0,	0),
(35,	12,	14,	0,	'',	1,	15000,	'',	0,	0),
(36,	13,	2,	0,	'',	1,	13000,	'',	0,	0),
(37,	13,	18,	0,	'',	1,	13000,	'',	0,	1),
(38,	13,	25,	0,	'',	1,	12000,	'',	0,	1),
(39,	13,	34,	0,	'',	1,	12000,	'',	0,	1),
(40,	14,	17,	0,	'',	1,	18000,	'',	0,	1),
(41,	14,	20,	0,	'',	1,	10000,	'',	0,	0),
(42,	14,	32,	0,	'',	1,	13000,	'',	0,	1),
(43,	15,	2,	0,	'',	1,	13000,	'',	1,	0),
(44,	15,	56,	0,	'',	1,	16000,	'',	1,	0),
(45,	15,	19,	0,	'',	1,	16000,	'',	1,	0),
(46,	15,	29,	0,	'',	1,	12000,	'',	1,	0),
(47,	15,	34,	0,	'',	1,	12000,	'',	1,	0),
(48,	16,	16,	0,	'',	1,	15000,	'',	1,	0),
(49,	17,	2,	0,	'',	1,	13000,	'',	1,	0),
(50,	17,	13,	0,	'',	1,	11000,	'',	1,	0),
(51,	18,	12,	0,	'',	1,	16000,	'',	1,	0),
(52,	18,	18,	0,	'',	1,	13000,	'',	1,	0),
(53,	18,	20,	0,	'',	1,	10000,	'',	1,	0),
(54,	18,	28,	0,	'',	1,	6000,	'',	1,	1),
(55,	19,	15,	0,	'[]',	1,	26000,	'',	1,	0),
(56,	20,	16,	0,	'',	1,	15000,	'',	0,	0),
(57,	21,	16,	0,	'[]',	1,	15000,	'',	1,	0),
(58,	21,	15,	0,	'',	1,	26000,	'',	1,	0),
(59,	21,	24,	0,	'',	1,	13000,	'',	1,	0),
(60,	22,	16,	0,	'[]',	1,	15000,	'',	1,	0),
(61,	22,	17,	0,	'[]',	1,	18000,	'',	1,	0),
(62,	23,	17,	0,	'',	1,	18000,	'',	1,	0),
(63,	23,	16,	0,	'',	1,	15000,	'',	1,	0),
(64,	23,	15,	0,	'',	1,	26000,	'',	1,	0),
(65,	23,	2,	0,	'',	1,	13000,	'',	1,	0),
(66,	24,	16,	0,	'',	1,	15000,	'none',	1,	0),
(67,	24,	17,	0,	'',	1,	18000,	'none',	1,	0),
(68,	25,	16,	0,	'',	1,	15000,	'none',	1,	0),
(69,	25,	17,	0,	'',	1,	18000,	'none',	1,	0),
(70,	26,	16,	0,	'',	1,	15000,	'',	0,	0),
(71,	27,	16,	0,	'',	1,	15000,	'',	0,	0),
(72,	28,	16,	0,	'[]',	1,	15000,	'',	0,	0),
(73,	29,	16,	0,	'[]',	1,	15000,	'',	0,	0),
(74,	30,	25,	0,	'[]',	1,	12000,	'',	0,	0),
(75,	31,	16,	0,	'[]',	1,	15000,	'',	0,	0),
(76,	32,	55,	0,	'[]',	1,	15000,	'',	0,	0),
(77,	33,	16,	0,	'[]',	1,	15000,	'',	0,	0),
(78,	34,	16,	0,	'[]',	1,	15000,	'',	0,	0),
(79,	35,	16,	0,	'[]',	1,	15000,	'',	0,	0),
(80,	36,	14,	0,	'[]',	1,	15000,	'',	0,	0),
(81,	37,	15,	0,	'[]',	1,	26000,	'',	0,	0),
(82,	38,	2,	0,	'[]',	1,	13000,	'',	0,	0),
(83,	39,	2,	0,	'[]',	1,	13000,	'',	0,	0),
(84,	40,	12,	0,	'[]',	1,	16000,	'',	0,	0),
(85,	41,	25,	0,	'[]',	1,	12000,	'',	0,	0),
(86,	42,	61,	0,	'[]',	1,	12000,	'',	1,	0),
(87,	42,	16,	0,	'[]',	1,	15000,	'',	1,	0),
(88,	43,	76,	0,	'[]',	1,	3500,	'',	1,	0),
(89,	43,	69,	0,	'[]',	1,	10000,	'',	1,	0),
(90,	44,	56,	0,	'[]',	1,	16000,	'',	1,	0),
(91,	44,	2,	0,	'[]',	1,	15000,	'',	1,	0),
(92,	44,	53,	0,	'[]',	2,	12000,	'',	1,	0),
(93,	45,	25,	0,	'[]',	1,	12000,	'',	0,	0),
(94,	46,	16,	0,	'[]',	1,	15000,	'',	1,	0),
(95,	47,	16,	0,	'[]',	1,	15000,	'',	0,	0),
(96,	48,	16,	0,	'[]',	1,	15000,	'',	0,	0),
(97,	48,	26,	0,	'[]',	1,	15000,	'',	0,	0),
(98,	48,	27,	0,	'[]',	1,	14000,	'',	0,	0),
(99,	49,	53,	0,	'[]',	1,	6000,	'',	0,	0),
(100,	50,	16,	0,	'[]',	1,	15000,	'',	1,	0),
(101,	50,	23,	0,	'[]',	1,	15000,	'',	1,	0),
(102,	51,	16,	0,	'',	1,	15000,	'none',	1,	0),
(103,	51,	17,	0,	'',	1,	18000,	'none',	1,	0),
(104,	52,	37,	0,	'[]',	1,	4000,	'',	0,	0),
(105,	53,	57,	0,	'[]',	1,	10000,	'',	0,	0),
(106,	54,	52,	0,	'[]',	1,	8000,	'',	1,	0),
(107,	55,	54,	0,	'[]',	1,	15000,	'',	1,	0),
(108,	55,	29,	0,	'[]',	1,	12000,	'',	1,	0),
(109,	55,	25,	0,	'[]',	1,	12000,	'',	1,	1),
(110,	56,	16,	0,	'[]',	1,	15000,	'',	1,	0),
(111,	56,	57,	0,	'[]',	1,	10000,	'',	1,	0),
(112,	56,	76,	0,	'[]',	1,	3500,	'',	1,	0),
(113,	57,	82,	0,	'[]',	1,	8000,	'',	1,	0);

DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `no_struk` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  `tanggal` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_voucher` int(11) DEFAULT NULL,
  `id_diskon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `potongan` int(11) DEFAULT NULL,
  `total_bayar` int(11) NOT NULL,
  `total_order` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_order`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `t_order` (`id_order`, `no_struk`, `id_user`, `tanggal`, `id_voucher`, `id_diskon`, `diskon`, `potongan`, `total_bayar`, `total_order`, `status`, `is_deleted`, `created_at`, `created_by`) VALUES
(1,	'001/KWT/04/2022',	3,	'2022-08-01',	NULL,	'[]',	0,	0,	37000,	37000,	4,	0,	1654144722,	0),
(2,	'002/KWT/04/2022',	3,	'2022-04-02',	NULL,	'[]',	0,	0,	35000,	35000,	3,	0,	1654153370,	0),
(3,	'003/KWT/05/2022',	3,	'2022-05-02',	NULL,	'[16,17,18,19,20]',	50,	22500,	8500,	31000,	4,	0,	1654153414,	0),
(4,	'004/KWT/05/2022',	3,	'2022-05-02',	NULL,	'[16,17,18,19,20]',	50,	27500,	12500,	40000,	3,	0,	1654153740,	0),
(5,	'005/KWT/05/2022',	2,	'2022-08-02',	NULL,	'[]',	0,	0,	15000,	15000,	4,	0,	1654155597,	0),
(6,	'006/KWT/05/2022',	2,	'2022-05-02',	NULL,	'[]',	0,	0,	15000,	15000,	4,	0,	1654156132,	0),
(7,	'007/KWT/05/2022',	2,	'2022-05-02',	NULL,	'[]',	0,	0,	26000,	26000,	4,	0,	1654158858,	0),
(8,	'008/KWT/05/2022',	2,	'2022-05-02',	NULL,	'[]',	0,	0,	15000,	15000,	4,	0,	1654160000,	0),
(9,	'009/KWT/05/2022',	2,	'2022-05-02',	NULL,	'[14]',	10,	2300,	7700,	10000,	4,	0,	1654161335,	0),
(10,	'010/KWT/05/2022',	2,	'2022-05-02',	NULL,	'[]',	0,	0,	13000,	13000,	4,	0,	1654161747,	0),
(11,	'011/KWT/05/2022',	2,	'2022-05-02',	NULL,	'[14,15]',	20,	20000,	0,	20000,	4,	0,	1654162046,	0),
(12,	'012/KWT/05/2022',	2,	'2022-05-02',	NULL,	'[12,13]',	20,	8400,	17600,	26000,	4,	0,	1654165342,	0),
(13,	'013/KWT/05/2022',	2,	'2022-05-02',	NULL,	'[12,13]',	20,	10000,	3000,	13000,	4,	0,	1654220838,	0),
(14,	'014/KWT/05/2022',	2,	'2022-05-02',	NULL,	'[12,13]',	20,	8200,	1800,	10000,	4,	0,	1654221532,	0),
(15,	'015/KWT/06/2022',	2,	'2022-06-03',	NULL,	'[12,13]',	20,	13800,	55200,	69000,	3,	0,	1654222315,	0),
(16,	'016/KWT/06/2022',	2,	'2022-06-03',	NULL,	'[12,13]',	20,	3000,	12000,	15000,	2,	0,	1654223412,	0),
(17,	'017/KWT/06/2022',	2,	'2022-06-03',	NULL,	'[12,13]',	20,	4800,	19200,	24000,	1,	0,	1654223500,	0),
(18,	'018/KWT/06/2022',	2,	'2022-06-03',	NULL,	'[12,13]',	20,	7800,	31200,	39000,	3,	0,	1654224384,	0),
(19,	'019/KWT/06/2022',	1,	'2022-06-03',	NULL,	'[]',	0,	0,	26000,	26000,	3,	0,	1654229605,	0),
(20,	'020/KWT/06/2022',	1,	'2022-06-03',	NULL,	'[]',	0,	0,	15000,	15000,	4,	0,	1654229655,	0),
(21,	'021/KWT/06/2022',	3,	'2022-06-06',	NULL,	'[]',	0,	0,	54000,	54000,	3,	0,	1654496636,	0),
(22,	'022/KWT/06/2022',	1,	'2022-06-06',	NULL,	'[]',	0,	0,	33000,	33000,	2,	0,	1654498987,	0),
(23,	'023/KWT/06/2022',	1,	'2022-06-06',	NULL,	'[]',	0,	0,	72000,	72000,	2,	0,	1654499889,	0),
(24,	'024/KWT/06/2022',	1,	'2022-06-06',	NULL,	'[]',	0,	0,	33000,	33000,	3,	0,	1654500591,	0),
(25,	'025/KWT/06/2022',	1,	'2022-06-06',	NULL,	'[]',	0,	0,	33000,	33000,	2,	0,	1654500919,	0),
(26,	'026/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	3000,	12000,	15000,	1,	0,	1654501989,	0),
(27,	'027/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	3000,	12000,	15000,	0,	0,	1654502515,	0),
(28,	'028/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	3000,	12000,	15000,	0,	0,	1654502636,	0),
(29,	'029/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	3000,	12000,	15000,	0,	0,	1654502791,	0),
(30,	'030/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	2400,	9600,	12000,	0,	0,	1654502817,	0),
(31,	'031/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	3000,	12000,	15000,	0,	0,	1654502859,	0),
(32,	'032/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	3000,	12000,	15000,	0,	0,	1654502879,	0),
(33,	'033/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	3000,	12000,	15000,	0,	0,	1654503110,	0),
(34,	'034/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	3000,	12000,	15000,	0,	0,	1654503123,	0),
(35,	'035/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	3000,	12000,	15000,	0,	0,	1654504344,	0),
(36,	'036/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	3000,	12000,	15000,	0,	0,	1654505670,	0),
(37,	'037/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	5200,	20800,	26000,	0,	0,	1654505819,	0),
(38,	'038/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	2600,	10400,	13000,	0,	0,	1654506345,	0),
(39,	'039/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	2600,	10400,	13000,	0,	0,	1654506387,	0),
(40,	'040/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	3200,	12800,	16000,	0,	0,	1654506455,	0),
(41,	'041/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	2400,	9600,	12000,	0,	0,	1654506526,	0),
(42,	'042/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	5400,	21600,	27000,	2,	0,	1654506667,	0),
(43,	'043/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	2700,	10800,	13500,	2,	0,	1654506703,	0),
(44,	'044/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	8600,	34400,	43000,	2,	0,	1654506743,	0),
(45,	'045/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	2400,	9600,	12000,	0,	0,	1654507201,	0),
(46,	'046/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	3000,	12000,	15000,	2,	0,	1654507717,	0),
(47,	'047/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	3000,	12000,	15000,	1,	0,	1654507935,	0),
(48,	'048/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	8800,	35200,	44000,	0,	0,	1654509331,	0),
(49,	'049/KWT/06/2022',	2,	'2022-06-06',	NULL,	'[12,13]',	20,	1200,	6000,	6000,	4,	0,	1654510833,	0),
(50,	'050/KWT/06/2022',	3,	'2022-06-06',	NULL,	'[21,22,23]',	30,	9000,	21000,	30000,	3,	0,	1654511068,	0),
(51,	'051/KWT/07/2022',	1,	'2022-07-06',	NULL,	'[]',	0,	0,	33000,	33000,	3,	0,	1654511381,	0),
(52,	'052/KWT/07/2022',	2,	'2022-07-01',	NULL,	'[12,13]',	20,	800,	4000,	4000,	4,	0,	1654554073,	0),
(53,	'053/KWT/07/2022',	2,	'2022-07-07',	NULL,	'[12,13]',	20,	2000,	8000,	10000,	0,	0,	1654555322,	0),
(54,	'054/KWT/07/2022',	1,	'2022-07-07',	NULL,	'[]',	0,	0,	8000,	8000,	2,	0,	1654567248,	0),
(55,	'055/KWT/07/2022',	3,	'2022-07-07',	NULL,	'[21,22,23]',	30,	8100,	18900,	27000,	3,	0,	1654567646,	0),
(56,	'056/KWT/07/2022',	3,	'2022-07-07',	NULL,	'[21,22,23]',	30,	8550,	19950,	28500,	3,	0,	1654571574,	0),
(57,	'057/KWT/07/2022',	3,	'2022-07-07',	NULL,	'[21,22,23]',	30,	2400,	8000,	8000,	3,	0,	1654571633,	0);

DELIMITER ;;

CREATE TRIGGER `voucher_histori` AFTER INSERT ON `t_order` FOR EACH ROW
BEGIN
DECLARE id INT DEFAULT 0;

SET id = new.id_voucher;

IF(id != '' && id IS NOT NULL) THEN
INSERT INTO m_voucher_histori(id_voucher,nominal,created_at,created_by) VALUES (new.id_voucher,new.potongan,new.created_at,new.created_by);
END IF;
END;;

DELIMITER ;

DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_roles_id` int(11) NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_security` timestamp NULL DEFAULT NULL,
  `is_deleted` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_auth_user_roles_id_index` (`user_roles_id`),
  KEY `user_auth_email_index` (`email`),
  KEY `user_auth_nama_index` (`nama`),
  KEY `user_auth_updated_security_index` (`updated_security`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `user_auth` (`id`, `user_roles_id`, `nama`, `email`, `password`, `foto`, `updated_security`, `is_deleted`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1,	1,	'Wahyu Agung1',	'agung2@landa.co.id',	'$2y$10$h03NuXjNaqW8g.GJ6CniVOSabna8532GeiNzr25CNWO7SHE3vyfx.',	'upload/fotoUser/Daq6jkQ5uMSkTj8LjizXDlkdnwyGPRM8p0huJnJ7.png',	'2022-07-30 13:45:32',	'0',	NULL,	'2022-08-01 09:22:51',	NULL,	0,	1,	0),
(2,	1,	'Wahyu Agung2',	'agung3@landa.co.id',	'$2y$10$HXnxJEyHYI93VcLk3.b3Mem3F7PrdfgPC.Wf9mtdOsR9ERUdtAEu.',	NULL,	'2022-07-30 13:45:32',	'0',	NULL,	NULL,	NULL,	0,	0,	0),
(3,	1,	'Wahyu Agung3',	'agung4@landa.co.id',	'$2y$10$wbLSoWjvCOsnIEvU51cN7eIHD570/JG.ZnHaQbhMn8grC9uSXiSxW',	NULL,	'2022-07-30 13:45:32',	'0',	NULL,	NULL,	NULL,	0,	0,	0),
(4,	1,	'Wahyu Agung4',	'agung5@landa.co.id',	'$2y$10$Aeqt1suPlFiYKK7.Ol4WAOzgeyrm3BTIIRzSvFCWTSRVD.cZpnYrK',	NULL,	'2022-07-30 13:45:32',	'0',	NULL,	NULL,	NULL,	0,	0,	0),
(5,	1,	'Wahyu Agung5',	'agung6@landa.co.id',	'$2y$10$y.EAo.hetu.oq5hujlDoA.U/TYiC2GzDPfiPu8aqpyfks6Gblgi/i',	NULL,	'2022-07-30 13:45:32',	'0',	NULL,	NULL,	NULL,	0,	0,	0),
(6,	1,	'Wahyu Agung',	'agung7@landa.co.id',	'$2y$10$LmHlc9/y94sKg0jJwsMxguhBkirLUT0NAu5cjKAIaWUzBQjN1BXEG',	NULL,	'2022-07-30 13:45:32',	'0',	NULL,	NULL,	NULL,	0,	0,	0),
(7,	1,	'Wahyu Agung6',	'agung8@landa.co.id',	'$2y$10$17g8eymcuqwnQa2FQ/G0P.UAwgAJz96A9mb19kRKSEUFRAJO8fzyC',	NULL,	'2022-07-30 13:45:32',	'0',	NULL,	NULL,	NULL,	0,	0,	0),
(8,	1,	'Wahyu Agung7',	'agung9@landa.co.id',	'$2y$10$iK0l1hIqMwu4AkFyJRMgOeUgabk65rjLSohc9vKqtfzI4kvH7LiUy',	NULL,	'2022-07-30 13:45:32',	'0',	NULL,	NULL,	NULL,	0,	0,	0),
(9,	1,	'Wahyu Agung8',	'agung10@landa.co.id',	'$2y$10$TpLyMIAjKz96a/eEphfcZ.OQHWm9u.FV2bRkXnuxCT3.FnarKJocS',	NULL,	'2022-07-30 13:45:32',	'0',	NULL,	NULL,	NULL,	0,	0,	0),
(10,	1,	'Wahyu Agung9',	'agung11@landa.co.id',	'$2y$10$1NC4m7ksT/f1HtZptg9zEeeD77OYGnKr6h77mSv2L/FQAhpS7KMNK',	NULL,	'2022-07-30 13:45:33',	'0',	NULL,	NULL,	NULL,	0,	0,	0);

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `akses` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_roles_nama_index` (`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `user_roles` (`id`, `nama`, `akses`, `is_deleted`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1,	'Super Admin',	'{\"user\":{\"create\":true,\"update\":true,\"delete\":true,\"view\":true},\"roles\":{\"create\":true,\"update\":true,\"delete\":true,\"view\":true},\"customer\":{\"create\":true,\"update\":true,\"delete\":true,\"view\":true},\"item\":{\"create\":true,\"update\":true,\"delete\":true,\"view\":true},\"promo\":{\"create\":true,\"update\":true,\"delete\":true,\"view\":true},\"diskon\":{\"create\":true,\"update\":true,\"delete\":true,\"view\":true},\"voucher\":{\"create\":true,\"update\":true,\"delete\":true,\"view\":true},\"report_menu\":{\"view\":true},\"report_customer\":{\"view\":true},\"report_penjualan\":{\"view\":true},\"dashboard\":{\"view\":true},\"laporan_menu\":{\"view\":true},\"laporan_customer\":{\"view\":true},\"laporan_penjualan\":{\"view\":true},\"laporan_dashboard\":{\"view\":true}}',	'0',	NULL,	'2022-08-01 09:11:45',	NULL,	0,	1,	0),
(2,	'User',	'{\"user\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false},\"roles\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false},\"customer\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false},\"item\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":true},\"promo\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":true},\"diskon\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":true},\"voucher\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":true}}',	'0',	NULL,	'2022-07-14 23:43:08',	NULL,	0,	1,	0),
(7,	'asdsd',	'{\"user\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false},\"roles\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":true},\"customer\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false},\"item\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false}}',	'0',	'2022-07-15 01:09:14',	'2022-07-15 07:27:32',	'2022-07-15 07:27:32',	1,	1,	0),
(8,	'dfdgdfg777',	'{\"user\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false},\"roles\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":true},\"customer\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false},\"item\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false}}',	'0',	'2022-07-15 01:09:20',	'2022-07-15 07:26:01',	'2022-07-15 07:26:01',	1,	1,	0),
(9,	'ksakdlad',	'{\"user\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false},\"roles\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":true},\"customer\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false},\"item\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false}}',	'0',	'2022-07-15 07:28:36',	'2022-07-15 07:28:40',	'2022-07-15 07:28:40',	1,	1,	0),
(10,	'sadsa',	'{\"user\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":true},\"roles\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false},\"customer\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false},\"item\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":false},\"promo\":{\"create\":false,\"update\":false,\"delete\":false,\"view\":true}}',	'0',	'2022-07-17 23:28:37',	'2022-07-17 23:28:37',	NULL,	1,	1,	0);

-- 2022-08-02 09:27:37
