-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 11, 2025 at 06:45 AM
-- Server version: 10.6.23-MariaDB
-- PHP Version: 8.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acehotel_templebell_dynamic`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_applicants`
--

CREATE TABLE `tbl_applicants` (
  `id` int(11) NOT NULL,
  `parent` varchar(100) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `current_address` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `position` varchar(100) NOT NULL,
  `myfile` varchar(50) NOT NULL,
  `qualification` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_applicants`
--

INSERT INTO `tbl_applicants` (`id`, `parent`, `fullname`, `current_address`, `mobile`, `phone`, `email`, `sortorder`, `position`, `myfile`, `qualification`) VALUES
(1, '', 'Juan Francisco', '', '', '', 'sahas@longtail.info', 1, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_articles`
--

CREATE TABLE `tbl_articles` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sub_title` text NOT NULL,
  `content` text NOT NULL,
  `linktype` tinyint(1) NOT NULL DEFAULT 0,
  `linksrc` tinytext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `meta_title` tinytext NOT NULL,
  `meta_keywords` varchar(250) NOT NULL,
  `meta_description` varchar(250) NOT NULL,
  `type` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `homepage` int(11) NOT NULL DEFAULT 0,
  `image` blob NOT NULL,
  `date` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `upcoming` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_articles`
--

INSERT INTO `tbl_articles` (`id`, `parent_id`, `slug`, `title`, `sub_title`, `content`, `linktype`, `linksrc`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `type`, `added_date`, `modified_date`, `sortorder`, `homepage`, `image`, `date`, `category`, `upcoming`) VALUES
(16, 0, 'about-us', 'About us', '', '	<div class=\"six columns mob-whole\">\r\n		<h3>\r\n			Corporate Travel Consultantii</h3>\r\n		<p>\r\n			We Share our best traveling experience and destinations to make sure you get right informations about you are willing to visit.</p>\r\n		<p>\r\n			Destination:<br />\r\n			Nepal | India | Tibet | Bhutan | Maldives | Dubai | Bankok | Thailand</p>\r\n		<p>\r\n			Highlights:<br />\r\n			Trekking | Mountainerring | Travel | Tour | Adventure | Seightseeking | Jungle Safari | Bird Watching etc</p>\r\n	</div>\r\n', 0, '', 1, '', '', '', 0, '2024-12-17 11:59:42', '2025-01-03 12:05:09', 1, 1, 0x613a303a7b7d, '', '', 1),
(17, 0, 'about-us', 'About Us', 'About Us', '<div class=\"about_us my-5 text-sm-center\">\r\n	<div class=\"about_text\">\r\n		<div class=\"col-xl-8 mx-auto\">\r\n			<h1 class=\"word_wrap\">\r\n				Welcome to</h1>\r\n			<h1>\r\n				Temple Bell Boutique Hotel &amp; Spa</h1>\r\n			<p class=\"my-3 word_wrap\" style=\"text-align: left;\">\r\n				Temple Bell Boutique Hotel &amp; Spa is a sanctuary where Nepali heritage meets international sophistication. Designed to showcase the intricate craftsmanship of Nepali architecture, the hotel features traditional wood carvings, stone works, and vibrant d&eacute;cor that reflect the rich cultural essence of the region.<br />\r\n				With an unwavering commitment to personalized service, the hotel offers luxurious accommodations, state-of-the-art amenities, and serene spaces for relaxation, including breathtaking views of the Annapurna range and Phewa Lake. Whether you&rsquo;re here for leisure or adventure, Temple Bell Boutique Hotel &amp; Spa ensures that every moment is steeped in the warmth of Nepali values and the excellence of world-class hospitality.</p>\r\n			<div class=\"mt-2\">\r\n				&nbsp;</div>\r\n			<p style=\"text-align: justify;\">\r\n				<b>Mission:</b>To create an enriching and memorable guest experience by harmonizing the timeless charm of authentic Nepali architecture, values, and traditions with the comfort and convenience of world-class facilities and exceptional service.</p>\r\n			<div class=\"mt-2\">\r\n				&nbsp;</div>\r\n			<p style=\"text-align: justify;\">\r\n				<b>Vision:</b>To become a symbol of Nepali hospitality and cultural pride, inspiring global travelers to discover the soul of Nepal through a perfect blend of tradition and modern elegance.</p>\r\n			<p>\r\n				&nbsp;</p>\r\n		</div>\r\n		<div class=\"article_image my-5\">\r\n			<div class=\"row\">\r\n				<div class=\"col-md-6\">\r\n					<img alt=\"Deluxe Room\" class=\"img-fluid\" src=\"/assets/userfiles/images/room.jpg\" width=\"100%\" /></div>\r\n				<div class=\"col-md-6 mt-3 mt-md-0\">\r\n					<img alt=\"Temple Bell\" class=\"img-fluid\" src=\"/assets/userfiles/images/exterior.jpg\" width=\"100%\" /></div>\r\n			</div>\r\n		</div>\r\n		<div class=\"col-xl-8 mx-auto\">\r\n			<h1 class=\"word_wrap mt-4 my-sm-4\">\r\n				Unmatched Location</h1>\r\n			<p style=\"text-align:left\">\r\n				Perched gracefully overlooking the majestic Himalayan mountains and the tranquil Phewa Lake, Temple Bell Boutique Hotel &amp; Spa offers breathtaking panoramic views that create a perfect backdrop for an unforgettable stay. Our prime location provides easy access to the vibrant city life of Pokhara while offering a peaceful retreat away from the hustle and bustle.</p>\r\n		</div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', 0, '', 1, 'About Us', 'Temple Bell Boutique Hotel, Nepali heritage, international sophistication, traditional architecture, Nepali craftsmanship, wood carvings, stone works, vibrant décor, cultural essence, regional culture, boutique hotel, cultural fusion, heritage design', 'Temple Bell Boutique Hotel & Spa is a sanctuary where Nepali heritage meets international sophistication. Designed to showcase the intricate craftsmanship of Nepal', 0, '2025-04-16 21:21:07', '2025-06-05 10:54:29', 2, 0, 0x613a313a7b693a303b733a31343a2270594d46492d747279322e6a7067223b7d, '', '', 0),
(18, 0, 'temple-bell-boutique-hotel-spa', 'Temple Bell Boutique Hotel & Spa', 'Temple Bell Boutique Hotel & Spa', '<div class=\"article_content custom-container\">\r\n	<h1 class=\"word_wrap\">\r\n		Temple Bell Boutique Hotel &amp; Spa: A Sanctuary of Elegance and Tranquility.</h1>\r\n	<p class=\"my-3 my-sm-5\">\r\n		Welcome to Temple Bell Boutique Hotel &amp; Spa, an exquisite oasis where the serene beauty of nature meets the pinnacle of luxury and comfort. Our hotel is designed to provide an unparalleled experience for discerning travelers seeking a perfect blend of relaxation, adventure, and cultural immersion.</p>\r\n	<a class=\"text-black text-decoration-none\" href=\"about-us\"><img alt=\"button\" class=\"color-filter me-2\" src=\"template/web/image/btn.png\" width=\"24\" />Explore</a> <img alt=\"mountain\" class=\"img-fluid vw-100 d-block d-xl-none mt-5\" src=\"template/web/image/mountain-overaly.jpg\" /></div>\r\n<p>\r\n	&nbsp;</p>\r\n', 0, '', 1, 'Temple Bell Boutique Hotel & Spa', 'Temple Bell Boutique Hotel, luxury hotel, spa retreat, serene beauty, nature oasis, pinnacle of comfort, unparalleled experience, discerning travelers, relaxation, adventure, cultural immersion, boutique accommodation, luxury getaway, tranquil escape', 'Welcome to Temple Bell Boutique Hotel & Spa, an exquisite oasis where the serene beauty of nature meets the pinnacle of luxury and comfort our hotel is designed', 0, '2025-04-17 16:53:43', '2025-06-05 10:52:32', 3, 1, 0x613a303a7b7d, '', '', 0),
(19, 0, 'teset', 'teset', 'asdfasdasd', '<p style=\"text-align: center;\">\r\n	asdasdasd</p>\r\n', 0, '', 0, '', '', '', 0, '2025-04-18 12:35:29', '2025-04-18 12:35:47', 4, 0, 0x613a303a7b7d, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog`
--

CREATE TABLE `tbl_blog` (
  `id` int(11) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` varchar(100) NOT NULL,
  `brief` text NOT NULL,
  `content` text NOT NULL,
  `blog_date` date NOT NULL,
  `archive_date` date NOT NULL,
  `sortorder` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `source` mediumtext NOT NULL,
  `type` int(11) NOT NULL,
  `viewcount` int(11) NOT NULL,
  `meta_keywords` varchar(250) NOT NULL,
  `meta_description` varchar(250) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `linksrc` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `linktype` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `upcoming` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_conbined_news`
--

CREATE TABLE `tbl_conbined_news` (
  `id` int(11) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `brief` tinytext NOT NULL,
  `content` text NOT NULL,
  `image` mediumtext NOT NULL,
  `home_image` text NOT NULL,
  `gallery` text NOT NULL,
  `status` int(11) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` date NOT NULL,
  `meta_keywords` varchar(250) NOT NULL,
  `display` varchar(250) NOT NULL,
  `event_stdate` date NOT NULL,
  `event_endate` date NOT NULL,
  `type` int(11) NOT NULL,
  `author` varchar(200) NOT NULL,
  `banner_image` varchar(300) NOT NULL,
  `source` mediumtext NOT NULL,
  `meta_description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_configs`
--

CREATE TABLE `tbl_configs` (
  `id` int(11) NOT NULL,
  `sitetitle` varchar(200) NOT NULL,
  `icon_upload` varchar(200) NOT NULL,
  `logo_upload` varchar(200) NOT NULL,
  `fb_upload` varchar(255) NOT NULL,
  `twitter_upload` varchar(255) NOT NULL,
  `gallery_upload` varchar(255) NOT NULL,
  `contact_upload` varchar(255) NOT NULL,
  `other_upload` varchar(255) NOT NULL,
  `facility_upload` varchar(240) NOT NULL,
  `offer_upload` varchar(255) NOT NULL,
  `sitename` varchar(50) NOT NULL,
  `location_type` tinyint(1) NOT NULL DEFAULT 1,
  `location_map` mediumtext NOT NULL,
  `location_image` varchar(250) NOT NULL,
  `fiscal_address` tinytext NOT NULL,
  `mail_address` tinytext NOT NULL,
  `contact_info` tinytext NOT NULL,
  `address` varchar(100) NOT NULL,
  `email_address` tinytext NOT NULL,
  `breif` text NOT NULL,
  `copyright` varchar(200) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `site_keywords` tinytext NOT NULL,
  `site_description` tinytext NOT NULL,
  `fb_messenger` text NOT NULL,
  `google_anlytics` text NOT NULL,
  `linksrc` varchar(255) NOT NULL,
  `robot_txt` text NOT NULL,
  `schema_code` tinytext NOT NULL,
  `book_type` tinyint(4) NOT NULL DEFAULT 1,
  `hotel_page` varchar(200) NOT NULL,
  `hotel_code` tinytext NOT NULL,
  `booking_code` tinytext NOT NULL,
  `template` varchar(100) NOT NULL,
  `admin_template` varchar(100) NOT NULL,
  `headers` text DEFAULT NULL,
  `footer` text DEFAULT NULL,
  `search_box` text DEFAULT NULL,
  `search_result` text DEFAULT NULL,
  `action` tinyint(1) NOT NULL DEFAULT 0,
  `contact_info2` varchar(100) NOT NULL,
  `pobox` varchar(50) NOT NULL,
  `pixel_code` mediumtext NOT NULL,
  `whatsapp` varchar(100) NOT NULL,
  `whatsapp_a` varchar(100) NOT NULL,
  `upcoming` int(11) NOT NULL,
  `upcomingcontent` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_configs`
--

INSERT INTO `tbl_configs` (`id`, `sitetitle`, `icon_upload`, `logo_upload`, `fb_upload`, `twitter_upload`, `gallery_upload`, `contact_upload`, `other_upload`, `facility_upload`, `offer_upload`, `sitename`, `location_type`, `location_map`, `location_image`, `fiscal_address`, `mail_address`, `contact_info`, `address`, `email_address`, `breif`, `copyright`, `meta_title`, `site_keywords`, `site_description`, `fb_messenger`, `google_anlytics`, `linksrc`, `robot_txt`, `schema_code`, `book_type`, `hotel_page`, `hotel_code`, `booking_code`, `template`, `admin_template`, `headers`, `footer`, `search_box`, `search_result`, `action`, `contact_info2`, `pobox`, `pixel_code`, `whatsapp`, `whatsapp_a`, `upcoming`, `upcomingcontent`) VALUES
(1, 'Temple Bell Boutique Hotel & Spa, Pokhara - Official site', '0IOyW-fav.png', 'NaKlo-lgo.png', '', '', 'uyasx-try.jpg', 'wJcGp-try.jpg', 'N6BLt-pYMFI-try2.jpg', 'zesbi-try2.jpg', '5sCIF-3.jpg', 'Temple Bell', 1, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2090.5386239907016!2d83.9599284716046!3d28.21178238948551!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3995954c7f508235%3A0x4f8bb68a403453d8!2sTemple%20Bell%20Boutique%20Hotel%20and%20Spa!5e0!3m2!1sen!2snp!4v1743420674142!5m2!1sen!2snp', 'aHQyy-map.jpg', 'Street No. 17 Lakeside, Pokhara, Nepal', 'ktm location', '+977-061 590555', '', 'info@templebellnepal.com', '', '©  {year} Temple Bell Boutique Hotel & Spa | All Rights Reserved', 'Temple Bell | Boutique Hotel & Spa, Pokhara - Official site', 'Temple Bell Boutique Hotel, Pokhara, luxurious retreat, modern comfort, Nepalese charm, Lake Fewa, elegantly designed rooms, state-of-the-art spa, fine dining, local flavors, international cuisine, hospitality, relaxation, upscale experience.', 'Temple Bell Boutique Hotel & Spa in Pokhara is a luxurious retreat blending modern comfort with Nepalese charm, nestled peacefully near scenic and serene Fewa Lake.', '', '<!-- Google tag (gtag.js) -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=G-2Q5JY7NVMV\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'G-2Q5JY7NVMV\');\r\n</script>', '#', 'User-agent: *\r\nDisallow: /cgi-bin/', '', 2, 'result.php', 'neiApE6', 'nmJEzK2', 'web', 'blue', '', '', 'Develop By Amit prajapati', 'Develop By Amit prajapati', 0, 'email@email.com', '2769', '', '987568562222', '+9779856022272', 0, 'We are coming, get ready for the best travel experience with us.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_countries`
--

CREATE TABLE `tbl_countries` (
  `id` int(11) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  `country_no_code` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_countries`
--

INSERT INTO `tbl_countries` (`id`, `country_name`, `country_no_code`, `status`) VALUES
(1, 'United States', '+1', 1),
(2, 'Canada', '+1', 1),
(3, 'Mexico', '+52', 1),
(4, 'Afghanistan', '+93', 1),
(5, 'Albania', '+355', 1),
(6, 'Algeria', '+213', 1),
(7, 'Andorra', '+376', 1),
(8, 'Angola', '+244', 1),
(9, 'Anguilla', '+1-264', 1),
(10, 'Antarctica', '+672', 1),
(11, 'Antigua and Barbuda', '+1-268', 1),
(12, 'Argentina', '+54', 1),
(13, 'Armenia', '+374', 1),
(14, 'Aruba', '+297', 1),
(15, 'Ascension Island', '+247', 1),
(16, 'Australia', '+61', 1),
(17, 'Austria', '+43', 1),
(18, 'Azerbaijan', '+994', 1),
(19, 'Bahamas', '+1-242', 1),
(20, 'Bahrain', '+973', 1),
(21, 'Bangladesh', '+880', 1),
(22, 'Barbados', '+1-246', 1),
(23, 'Belarus', '+375', 1),
(24, 'Belgium', '+32', 1),
(25, 'Belize', '+501', 1),
(26, 'Benin', '+229', 1),
(27, 'Bermuda', '+1-441', 1),
(28, 'Bhutan', '+975', 1),
(29, 'Bolivia', '+591', 1),
(30, 'Bophuthatswana', '+27', 1),
(31, 'Bosnia-Herzegovina', '+387', 1),
(32, 'Botswana', '+267', 1),
(33, 'Bouvet Island', '+47', 1),
(34, 'Brazil', '+55', 1),
(35, 'British Indian Ocean', '+246', 1),
(36, 'British Virgin Islands', '+1284', 1),
(37, 'Brunei Darussalam', '+673', 1),
(38, 'Bulgaria', '+359', 1),
(39, 'Burkina Faso', '+226', 1),
(40, 'Burundi', '+257', 1),
(41, 'Cambodia', '+855', 1),
(42, 'Cameroon', '+237', 1),
(44, 'Cape Verde Island', '+238', 1),
(45, 'Cayman Islands', '+1-345', 1),
(46, 'Central Africa', '+236', 1),
(47, 'Chad', '+235', 1),
(48, 'Channel Islands', '+44', 1),
(49, 'Chile', '+56', 1),
(50, 'China, Peoples Republic', '+86', 1),
(51, 'Christmas Island', '+61', 1),
(52, 'Cocos (Keeling) Islands', '+61', 1),
(53, 'Colombia', '+57', 1),
(54, 'Comoros Islands', '+269', 1),
(55, 'Congo', '+242', 1),
(56, 'Cook Islands', '+682', 1),
(57, 'Costa Rica', '+506', 1),
(58, 'Croatia', '+385', 1),
(59, 'Cuba', '+53', 1),
(60, 'Cyprus', '+357', 1),
(61, 'Czech Republic', '+420', 1),
(62, 'Denmark', '+45', 1),
(63, 'Djibouti', '+253', 1),
(64, 'Dominica', '+1-767', 1),
(65, 'Dominican Republic', '+1-809', 1),
(66, 'Easter Island', '+56', 1),
(67, 'Ecuador', '+593', 1),
(68, 'Egypt', '+20', 1),
(69, 'El Salvador', '+503', 1),
(70, 'England', '+44', 1),
(71, 'Equatorial Guinea', '+240', 1),
(72, 'Estonia', '+372', 1),
(73, 'Ethiopia', '+251', 1),
(74, 'Falkland Islands', '+500', 1),
(75, 'Faeroe Islands', '+298', 1),
(76, 'Fiji', '+679', 1),
(77, 'Finland', '+358', 1),
(78, 'France', '+33', 1),
(79, 'French Guyana', '+594', 1),
(80, 'French Polynesia', '+689', 1),
(81, 'Gabon', '+241', 1),
(82, 'Gambia', '+220', 1),
(83, 'Georgia Republic', '+995', 1),
(84, 'Germany', '+49', 1),
(85, 'Gibraltar', '+350', 1),
(86, 'Greece', '+30', 1),
(87, 'Greenland', '+299', 1),
(88, 'Grenada', '+1-473', 1),
(89, 'Guadeloupe (French)', '+590', 1),
(90, 'Guatemala', '+502', 1),
(91, 'Guernsey Island', '+44', 1),
(92, 'Guinea Bissau', '+245', 1),
(93, 'Guinea', '+224', 1),
(94, 'Guyana', '+592', 1),
(95, 'Haiti', '+509', 1),
(96, 'Heard and McDonald Isls', '+672', 1),
(97, 'Honduras', '+504', 1),
(98, 'Hong Kong', '+852', 1),
(99, 'Hungary', '+36', 1),
(100, 'Iceland', '+354', 1),
(101, 'India', '+91', 1),
(102, 'Iran', '+98', 1),
(103, 'Iraq', '+964', 1),
(104, 'Ireland', '+353', 1),
(105, 'Isle of Man', '+44', 1),
(106, 'Israel', '+972', 1),
(107, 'Italy', '+39', 1),
(108, 'Ivory Coast', '+225', 1),
(109, 'Jamaica', '+1-876', 1),
(110, 'Japan', '+81', 1),
(111, 'Jersey Island', '+44', 1),
(112, 'Jordan', '+962', 1),
(113, 'Kazakhstan', '+7', 1),
(114, 'Kenya', '+254', 1),
(115, 'Kiribati', '+686', 1),
(116, 'Kuwait', '+965', 1),
(117, 'Laos', '+856', 1),
(118, 'Latvia', '+371', 1),
(119, 'Lebanon', '+961', 1),
(120, 'Lesotho', '+266', 1),
(121, 'Liberia', '+231', 1),
(122, 'Libya', '+218', 1),
(123, 'Liechtenstein', '+423', 1),
(124, 'Lithuania', '+370', 1),
(125, 'Luxembourg', '+352', 1),
(126, 'Macao', '+853', 1),
(127, 'Macedonia', '+389', 1),
(128, 'Madagascar', '+261', 1),
(129, 'Malawi', '+265', 1),
(130, 'Malaysia', '+60', 1),
(131, 'Maldives', '+960', 1),
(132, 'Mali', '+223', 1),
(133, 'Malta', '+356', 1),
(134, 'Martinique (French)', '+596', 1),
(135, 'Mauritania', '+222', 1),
(136, 'Mauritius', '+230', 1),
(137, 'Mayotte', '+262', 1),
(139, 'Micronesia', '+691', 1),
(140, 'Moldavia', '+373', 1),
(141, 'Monaco', '+377', 1),
(142, 'Mongolia', '+976', 1),
(143, 'Montenegro', '+382', 1),
(144, 'Montserrat', '+1664', 1),
(145, 'Morocco', '+212', 1),
(146, 'Mozambique', '+258', 1),
(147, 'Myanmar', '+95', 1),
(148, 'Namibia', '+264', 1),
(149, 'Nauru', '+674', 1),
(150, 'Nepal', '+977', 1),
(151, 'Netherlands Antilles', '+599', 1),
(152, 'Netherlands', '+31', 1),
(153, 'New Caledonia (French)', '+687', 1),
(154, 'New Zealand', '+64', 1),
(155, 'Nicaragua', '+505', 1),
(156, 'Niger', '+227', 1),
(157, 'Niue', '+683', 1),
(158, 'Norfolk Island', '+672', 1),
(159, 'North Korea', '+850', 1),
(160, 'Northern Ireland', '+44', 1),
(161, 'Norway', '+47', 1),
(162, 'Oman', '+968', 1),
(163, 'Pakistan', '+92', 1),
(164, 'Panama', '+507', 1),
(165, 'Papua New Guinea', '+675', 1),
(166, 'Paraguay', '+595', 1),
(167, 'Peru', '+51', 1),
(168, 'Philippines', '+63', 1),
(169, 'Pitcairn Island', '+64', 1),
(170, 'Poland', '+48', 1),
(171, 'Polynesia (French)', '+689', 1),
(172, 'Portugal', '+351', 1),
(173, 'Qatar', '+974', 1),
(174, 'Reunion Island', '+262', 1),
(175, 'Romania', '+40', 1),
(176, 'Russia', '+7', 1),
(177, 'Rwanda', '+250', 1),
(178, 'S.Georgia Sandwich Isls', '+500', 1),
(179, 'Sao Tome, Principe', '+239', 1),
(180, 'San Marino', '+378', 1),
(181, 'Saudi Arabia', '+966', 1),
(182, 'Scotland', '+44', 1),
(183, 'Senegal', '+221', 1),
(184, 'Serbia', '+381', 1),
(185, 'Seychelles', '+248', 1),
(186, 'Shetland', '+44', 1),
(187, 'Sierra Leone', '+232', 1),
(188, 'Singapore', '+65', 1),
(189, 'Slovak Republic', '+421', 1),
(190, 'Slovenia', '+386', 1),
(191, 'Solomon Islands', '+677', 1),
(192, 'Somalia', '+252', 1),
(193, 'South Africa', '+27', 1),
(194, 'South Korea', '+82', 1),
(195, 'Spain', '+34', 1),
(196, 'Sri Lanka', '+94', 1),
(197, 'St. Helena', '+290', 1),
(198, 'St. Lucia', '+1758', 1),
(199, 'St. Pierre Miquelon', '+508', 1),
(200, 'St. Martins', '+590', 1),
(201, 'St. Kitts Nevis Anguilla', '+1869', 1),
(202, 'St. Vincent Grenadines', '+1784', 1),
(203, 'Sudan', '+249', 1),
(204, 'Suriname', '+597', 1),
(205, 'Svalbard Jan Mayen', '+47', 1),
(206, 'Swaziland', '+268', 1),
(207, 'Sweden', '+46', 1),
(208, 'Switzerland', '+41', 1),
(209, 'Syria', '+963', 1),
(210, 'Tajikistan', '+992', 1),
(211, 'Taiwan', '+886', 1),
(212, 'Tahiti', '+689', 1),
(213, 'Tanzania', '+255', 1),
(214, 'Thailand', '+66', 1),
(215, 'Togo', '+228', 1),
(216, 'Tokelau', '+690', 1),
(217, 'Tonga', '+676', 1),
(218, 'Trinidad and Tobago', '+1-868', 1),
(219, 'Tunisia', '+216', 1),
(220, 'Turkmenistan', '+993', 1),
(221, 'Turks and Caicos Isls', '+1649', 1),
(222, 'Tuvalu', '+688', 1),
(223, 'Uganda', '+256', 1),
(224, 'Ukraine', '+380', 1),
(225, 'United Arab Emirates', '+971', 1),
(226, 'Uruguay', '+598', 1),
(227, 'Uzbekistan', '+998', 1),
(228, 'Vanuatu', '+678', 1),
(229, 'Vatican City State', '+379', 1),
(230, 'Venezuela', '+58', 1),
(231, 'Vietnam', '+84', 1),
(232, 'Virgin Islands (Brit,1)', '+1284', 1),
(233, 'Wales', '+44', 1),
(234, 'Wallis Futuna Islands', '+681', 1),
(235, 'Western Sahara', '+212', 1),
(236, 'Western Samoa', '+685', 1),
(237, 'Yemen', '+967', 1),
(238, 'Yugoslavia', '+381', 1),
(239, 'Zaire', '+243', 1),
(240, 'Zambia', '+260', 1),
(241, 'Zimbabwe', '+263', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_download`
--

CREATE TABLE `tbl_download` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `image` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_download`
--

INSERT INTO `tbl_download` (`id`, `slug`, `title`, `status`, `sortorder`, `image`) VALUES
(1, 'asdasd', 'asdasd', 1, 1, 'T8z6W-abs.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_events`
--

CREATE TABLE `tbl_events` (
  `id` int(11) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `brief` tinytext NOT NULL,
  `content` text NOT NULL,
  `image` mediumtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `meta_keywords` varchar(250) NOT NULL,
  `meta_description` varchar(250) NOT NULL,
  `event_stdate` date NOT NULL,
  `event_endate` date NOT NULL,
  `type` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_gr` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `content_gr` text NOT NULL,
  `status` int(11) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_faq`
--

INSERT INTO `tbl_faq` (`id`, `title`, `title_gr`, `content`, `content_gr`, `status`, `sortorder`, `added_date`) VALUES
(17, 'title_1', '', '', '', 1, 1, '2025-02-18 10:43:58'),
(18, 'title_2', '', '', '', 1, 2, '2025-02-19 10:43:58'),
(20, 'title_4', '', '', '', 1, 3, '2025-02-21 10:43:58'),
(21, 'title_500', '', '', '', 1, 4, '2025-02-22 10:43:58'),
(22, 'title_6', '', '', '', 1, 5, '2025-02-23 10:43:58'),
(23, 'title_7', '', '', '', 1, 6, '2025-02-24 10:43:58'),
(24, 'title_8', '', '', '', 1, 7, '2025-02-25 10:43:58'),
(25, 'title_9', '', '', '', 1, 8, '2025-02-26 10:43:58'),
(26, 'title_10', '', '', '', 1, 9, '2025-02-27 10:43:58'),
(27, 'title_11', '', '', '', 1, 10, '2025-02-28 10:43:58'),
(28, 'title_12', '', '', '', 1, 11, '2025-03-01 10:43:58'),
(29, 'title_13', '', '', '', 1, 12, '2025-03-02 10:43:58'),
(30, 'title_14', '', '', '', 1, 13, '2025-03-03 10:43:58'),
(31, 'title_15', '', '', '', 1, 14, '2025-03-04 10:43:58'),
(32, 'title_16', '', '', '', 1, 15, '2025-03-05 10:43:58'),
(33, 'title_17', '', '', '', 1, 16, '2025-03-06 10:43:58'),
(34, 'title_18', '', '', '', 1, 17, '2025-03-07 10:43:58'),
(35, 'title_19', '', '', '', 1, 18, '2025-03-08 10:43:58'),
(36, 'title_20', '', '', '', 1, 19, '2025-03-09 10:43:58'),
(37, 'title_2100', '', '', '', 1, 20, '2025-03-10 10:43:58'),
(38, 'title_22', '', '', '', 1, 21, '2025-03-11 10:43:58'),
(39, 'title_23', '', '', '', 1, 22, '2025-03-12 10:43:58'),
(40, 'title_24', '', '', '', 1, 23, '2025-03-13 10:43:58'),
(41, 'title_25', '', '', '', 1, 24, '2025-03-14 10:43:58'),
(42, 'title_26', '', '', '', 1, 25, '2025-03-15 10:43:58'),
(43, 'title_27', '', '', '', 1, 26, '2025-03-16 10:43:58'),
(44, 'title_28', '', '', '', 1, 27, '2025-03-17 10:43:58'),
(45, 'title_29', '', '', '', 1, 28, '2025-03-18 10:43:58'),
(46, 'title_30', '', '', '', 1, 29, '2025-03-19 10:43:58'),
(47, 'title_31', '', '', '', 1, 30, '2025-03-20 10:43:58'),
(48, 'title_32', '', '', '', 1, 31, '2025-03-21 10:43:58'),
(49, 'title_33', '', '', '', 1, 32, '2025-03-22 10:43:58'),
(50, 'title_34', '', '', '', 1, 33, '2025-03-23 10:43:58'),
(51, 'title_35', '', '', '', 1, 34, '2025-03-24 10:43:58'),
(52, 'title_36', '', '', '', 1, 35, '2025-03-25 10:43:58'),
(53, 'title_37', '', '', '', 1, 36, '2025-03-26 10:43:58'),
(54, 'title_38', '', '', '', 1, 37, '2025-03-27 10:43:58'),
(55, 'title_39', '', '', '', 1, 38, '2025-03-28 10:43:58'),
(56, 'title_40', '', '', '', 1, 39, '2025-03-29 10:43:58'),
(57, 'title_41', '', '', '', 1, 40, '2025-03-30 10:43:58'),
(58, 'title_42', '', '', '', 1, 41, '2025-03-31 10:43:58'),
(59, 'title_43', '', '', '', 1, 42, '2025-04-01 10:43:58'),
(60, 'title_44', '', '', '', 1, 43, '2025-04-02 10:43:58'),
(61, 'title_45', '', '', '', 1, 44, '2025-04-03 10:43:58'),
(62, 'title_46', '', '', '', 1, 45, '2025-04-04 10:43:58'),
(63, 'title_47', '', '', '', 1, 46, '2025-04-05 10:43:58'),
(64, 'title_48', '', '', '', 1, 47, '2025-04-06 10:43:58'),
(65, 'title_49', '', '', '', 1, 48, '2025-04-07 10:43:58'),
(66, 'title_50', '', '', '', 1, 49, '2025-04-08 10:43:58'),
(67, 'ttitle new', '', '<p>\r\n	asdasd</p>\r\n', '', 1, 50, '2025-03-07 12:52:28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_features`
--

CREATE TABLE `tbl_features` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `parentId` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `brief` text NOT NULL,
  `icon` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_features`
--

INSERT INTO `tbl_features` (`id`, `title`, `parentId`, `image`, `brief`, `icon`, `status`, `sortorder`, `added_date`) VALUES
(21, 'Flat-screen TV', 17, 'BNaUQ-led-tv.png', '', '', 1, 4, '2025-04-17 09:08:23'),
(22, 'Private Balcony', 17, 'ZvzIt-balcony.png', '', '', 1, 5, '2025-04-17 09:08:41'),
(20, 'Free Wi-Fi', 17, '8gBOf-wifi.png', '', '', 1, 3, '2025-04-17 09:08:05'),
(17, 'Room Amenities', 0, '', '', '', 1, 1, '2025-04-17 09:06:20'),
(18, 'Comfortable King Bed', 17, 'lzYTu-bed.webp', '', '', 1, 1, '2025-04-17 09:07:14'),
(19, 'Air Conditioning', 17, 'GWT9J-air-conditioner.png', '', '', 1, 2, '2025-04-17 09:07:46'),
(23, 'Mini Bar', 17, 'xyhMU-mini.png', '', '', 1, 6, '2025-04-17 09:09:01'),
(24, 'Tea & Coffee Maker', 17, '9eL37-hot-drink.png', '', '', 1, 7, '2025-04-17 09:09:12'),
(25, 'Hall Amenities', 0, '', '', '', 1, 2, '2025-04-17 15:29:30'),
(26, 'Projector', 25, 'qrPrb-projector.png', '', '', 1, 1, '2025-04-17 15:30:23'),
(27, 'PA System With Microphone', 25, 'LUS5T-microphone.png', '', '', 1, 2, '2025-04-17 15:31:29'),
(28, 'Computer/Laptop', 25, '7KYqn-laptop.png', '', '', 1, 3, '2025-04-17 15:31:41'),
(29, 'Whiteboard', 25, 'Nvpvo-blackboard.png', '', '', 1, 4, '2025-04-17 15:31:59'),
(30, 'Flip Chart', 25, 'aXz6R-flip-chart.png', '', '', 1, 5, '2025-04-17 15:32:22'),
(31, 'Soft (Pin) Board', 25, '4KfH5-hanging-whiteboard.png', '', '', 1, 6, '2025-04-18 12:49:20'),
(32, 'Printing Services', 25, 'LGjTc-print.png', '', '', 1, 7, '2025-04-18 12:49:50'),
(33, 'Writing Pads With Pencils', 25, 'Xh1DJ-book.png', '', '', 1, 8, '2025-04-18 12:50:32'),
(34, 'Photography', 25, 'sTvXO-camera.png', '', '', 1, 9, '2025-04-18 12:50:50'),
(35, 'Videography', 25, 'JdmfL-videography.png', '', '', 1, 10, '2025-04-18 12:51:04'),
(36, 'High Speed Internet', 17, '6c59c-wifi.png', '', '', 1, 8, '2025-04-18 14:51:16'),
(37, 'Air Conditioner', 17, 'jsFgM-air-conditioner.png', '', '', 1, 9, '2025-04-18 14:51:30'),
(38, 'Bathrobe', 17, 'uM0OB-bathrobe.png', '', '', 1, 10, '2025-04-18 14:51:42'),
(39, 'Bathtub', 17, 'T88rv-bathtub.png', '', '', 1, 11, '2025-04-18 14:51:56'),
(40, 'Iron & Iron Board', 17, 'MJBHf-ironing-board.png', '', '', 1, 12, '2025-04-18 14:54:27'),
(41, 'Daily Housekeeping', 17, 'IFeFk-cleaning-tools.png', '', '', 1, 13, '2025-04-18 14:54:42'),
(42, 'Complimentary Toiletries', 17, 'Vh9KV-toiletries.png', '', '', 1, 14, '2025-04-18 14:55:04'),
(43, 'Separate Living Room', 17, 'HVy8j-living.png', '', '', 1, 15, '2025-04-18 14:55:31'),
(44, 'Shower', 17, 'M182k-shower.png', '', '', 1, 16, '2025-04-18 14:55:51'),
(45, 'Slipper', 17, 'NJsJT-slippers.png', '', '', 1, 17, '2025-04-18 14:56:34'),
(46, 'Hairdryer', 17, 'qhjvd-Hair Dryer.png', '', '', 1, 18, '2025-04-18 15:00:52'),
(47, 'Work Desk', 17, 'Jnn6s-Work Desk.png', '', '', 1, 19, '2025-04-18 15:01:06'),
(48, 'Twin Bed', 17, 'iQzWM-Twin Bed.png', '', '', 1, 20, '2025-04-18 15:02:03'),
(49, 'Fruit Basket', 17, 'jpibF-Twin Bed.png', '', '', 1, 21, '2025-04-18 15:03:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_galleries`
--

CREATE TABLE `tbl_galleries` (
  `id` int(11) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `image` varchar(50) NOT NULL,
  `detail` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `registered` varchar(50) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_galleries`
--

INSERT INTO `tbl_galleries` (`id`, `slug`, `title`, `image`, `detail`, `status`, `sortorder`, `registered`, `type`) VALUES
(1, 'exterior', 'Exterior', '', '', 1, 6, '2025-04-16 19:12:56', 1),
(2, 'interior', 'Interior', '', '', 1, 5, '2025-04-16 19:13:02', 1),
(3, 'rooms', 'Rooms', '', '', 1, 4, '2025-04-16 19:13:09', 1),
(4, 'restaurant-bar', 'Restaurant & Bar', '', '', 1, 3, '2025-04-16 19:13:17', 1),
(5, 'meeting-hall', 'Meeting Hall', '', '', 1, 2, '2025-04-16 19:13:24', 1),
(6, 'wellness-center', 'Wellness Center', '', '', 1, 1, '2025-04-16 19:13:29', 1),
(7, 'swimming-pool', 'Swimming Pool', '', '', 1, 0, '2025-04-16 19:13:36', 1),
(8, 'culinary-excellence', 'Culinary Excellence', '', '', 1, 7, '2025-04-18 08:16:40', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gallery_images`
--

CREATE TABLE `tbl_gallery_images` (
  `id` int(11) NOT NULL,
  `galleryid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `image` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `detail` varchar(200) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `registered` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_gallery_images`
--

INSERT INTO `tbl_gallery_images` (`id`, `galleryid`, `title`, `image`, `status`, `detail`, `sortorder`, `registered`) VALUES
(1, 1, 'Exterior', 'mWeQy-1.jpg', 1, '', 1, '2025-04-16 19:29:48'),
(2, 1, 'Exterior', 'C4pGq-4.jpg', 1, '', 2, '2025-04-16 19:29:48'),
(3, 1, 'Exterior', 'lAYpC-2.jpg', 1, '', 3, '2025-04-16 19:29:48'),
(4, 1, 'Exterior', 'H7Q9L-5.jpg', 1, '', 4, '2025-04-16 19:29:49'),
(5, 1, 'Exterior', 'oBSgP-3.jpg', 1, '', 5, '2025-04-16 19:29:49'),
(6, 1, 'Exterior', 'ccPG3-1.jpg', 1, '', 6, '2025-04-16 19:29:49'),
(7, 1, 'Exterior', 'ypRAV-5.jpg', 1, '', 7, '2025-04-16 20:56:23'),
(8, 1, 'Exterior', '1P0nd-2.jpg', 1, '', 8, '2025-04-16 20:56:23'),
(9, 1, 'Exterior', 'dLvAB-6.jpg', 1, '', 9, '2025-04-16 20:56:23'),
(10, 2, 'Interior', 'lq6I2-1.jpg', 1, '', 1, '2025-04-16 20:57:08'),
(11, 2, 'Interior', 'UOKL1-2.jpg', 1, '', 2, '2025-04-16 20:57:08'),
(12, 2, 'Interior', 'gAWXl-3.jpg', 1, '', 3, '2025-04-16 20:57:08'),
(13, 2, 'Interior', 'MbRD8-6.jpg', 1, '', 4, '2025-04-16 20:57:08'),
(14, 2, 'Interior', 'pud0K-5.jpg', 1, '', 5, '2025-04-16 20:57:08'),
(15, 2, 'Interior', 'v8nCe-4.jpg', 1, '', 6, '2025-04-16 20:57:08'),
(16, 2, 'Interior', 'VEeW6-7.jpg', 1, '', 7, '2025-04-16 20:57:08'),
(17, 2, 'Interior', 'EZrGh-8.jpg', 1, '', 8, '2025-04-16 20:57:08'),
(18, 2, 'Interior', 'K62Lp-9.jpg', 1, '', 9, '2025-04-16 20:57:08'),
(19, 3, 'Rooms', 'OGXib-2.jpg', 1, '', 1, '2025-04-16 20:58:11'),
(20, 3, 'Rooms', 'fQmOz-1.jpg', 1, '', 2, '2025-04-16 20:58:11'),
(21, 3, 'Rooms', 'tlvVk-4.jpg', 1, '', 3, '2025-04-16 20:58:11'),
(22, 3, 'Rooms', 'XQDq6-5.jpg', 1, '', 4, '2025-04-16 20:58:11'),
(23, 3, 'Rooms', 't6EXT-6.jpg', 1, '', 5, '2025-04-16 20:58:11'),
(24, 3, 'Rooms', 'l8Q5q-3.jpg', 1, '', 6, '2025-04-16 20:58:11'),
(25, 3, 'Rooms', 'LZt92-7.jpg', 1, '', 7, '2025-04-16 20:58:11'),
(26, 3, 'Rooms', 'j6rqk-8.jpg', 1, '', 8, '2025-04-16 20:58:11'),
(27, 3, 'Rooms', 'zYupJ-9.jpg', 1, '', 9, '2025-04-16 20:58:11'),
(28, 3, 'Rooms', 'jzepp-10.jpg', 1, '', 10, '2025-04-16 20:58:11'),
(29, 3, 'Rooms', '1UUQo-11.jpg', 1, '', 11, '2025-04-16 20:58:11'),
(30, 3, 'Rooms', '5eMK3-12.jpg', 1, '', 12, '2025-04-16 20:58:11'),
(31, 3, 'Bathroom', 'br4X4-13.jpg', 0, '', 13, '2025-04-16 20:58:30'),
(32, 3, 'Bathroom', 'hUviF-14.jpg', 0, '', 14, '2025-04-16 20:58:30'),
(33, 3, 'Bathroom', 'wttT0-15.jpg', 0, '', 15, '2025-04-16 20:58:30'),
(34, 4, 'Restaurant', 'hzujg-3.jpg', 1, '', 1, '2025-04-16 20:59:44'),
(35, 4, 'Restaurant', '1LLYh-2.jpg', 1, '', 2, '2025-04-16 20:59:44'),
(36, 4, 'Restaurant', 'ADYUh-6.jpg', 1, '', 3, '2025-04-16 20:59:44'),
(37, 4, 'Restaurant', '5NbrR-4.jpg', 1, '', 4, '2025-04-16 20:59:44'),
(38, 4, 'Restaurant', 'ARa65-5.jpg', 1, '', 5, '2025-04-16 20:59:44'),
(39, 4, 'Restaurant', 'UcnOJ-1.jpg', 1, '', 6, '2025-04-16 20:59:44'),
(40, 4, 'Restaurant', 'h0zwv-7.jpg', 1, '', 7, '2025-04-16 20:59:44'),
(41, 4, 'Restaurant', 'X79t9-8.jpg', 1, '', 8, '2025-04-16 20:59:44'),
(42, 4, 'Restaurant', 'e7TQ1-9.jpg', 1, '', 9, '2025-04-16 20:59:44'),
(43, 4, 'Restaurant', 'vfYkg-10.jpg', 1, '', 10, '2025-04-16 20:59:44'),
(44, 4, 'Restaurant', 'R6aCj-11.jpg', 1, '', 11, '2025-04-16 20:59:44'),
(45, 4, 'Restaurant', 'YPc7l-12.jpg', 1, '', 12, '2025-04-16 20:59:44'),
(46, 4, 'Bar', 'VbEUP-3.jpg', 1, '', 13, '2025-04-16 21:00:32'),
(47, 4, 'Bar', 'n4GQx-4.jpg', 1, '', 14, '2025-04-16 21:00:32'),
(48, 4, 'Bar', 'dAXSF-2.jpg', 1, '', 15, '2025-04-16 21:00:32'),
(49, 4, 'Bar', '76ZP6-9.jpg', 1, '', 16, '2025-04-16 21:00:32'),
(50, 4, 'Bar', 'JXX83-5.jpg', 1, '', 17, '2025-04-16 21:00:32'),
(51, 4, 'Bar', 'RDJV5-1.jpg', 1, '', 18, '2025-04-16 21:00:32'),
(52, 4, 'Bar', 'kmXTj-6.jpg', 1, '', 19, '2025-04-16 21:00:32'),
(53, 4, 'Bar', 'LPIbD-7.jpg', 1, '', 20, '2025-04-16 21:00:32'),
(54, 4, 'Bar', 'CMzsk-8.jpg', 1, '', 21, '2025-04-16 21:00:32'),
(103, 5, 'Meeting Hall', 'nIS4p-3.jpg', 1, '', 6, '2025-04-18 16:52:41'),
(102, 5, 'Meeting Hall', 'cgAXW-1.jpg', 1, '', 5, '2025-04-18 16:52:41'),
(101, 5, 'Meeting Hall', 'n0I5x-2.jpg', 1, '', 4, '2025-04-18 16:52:41'),
(100, 5, 'Meeting Hall', 'IjEI0-4.jpg', 1, '', 3, '2025-04-18 16:52:41'),
(99, 5, 'Meeting Hall', 'rrWd9-6.jpg', 1, '', 2, '2025-04-18 16:52:41'),
(98, 5, 'Meeting Hall', 'xGHRg-5.jpg', 1, '', 1, '2025-04-18 16:52:41'),
(96, 6, 'Spa', 'Lxdk3-1.jpg', 1, '', 8, '2025-04-18 16:26:04'),
(95, 6, 'Spa', 'Uty3d-4.jpg', 1, '', 7, '2025-04-18 16:26:04'),
(94, 6, 'Spa', 'tAVv1-3.jpg', 1, '', 6, '2025-04-18 16:26:04'),
(93, 6, 'Spa', 'mlZ1W-6.jpg', 1, '', 5, '2025-04-18 16:26:04'),
(92, 6, 'Spa', '7b04b-6 (1).jpg', 1, '', 4, '2025-04-18 16:26:04'),
(91, 6, 'Spa', 'faNjm-8.jpg', 1, '', 3, '2025-04-18 16:26:04'),
(90, 6, 'Spa', 'kUbw9-New Project.jpg', 1, '', 2, '2025-04-18 16:26:04'),
(89, 6, 'Spa', 'gmEks-7.jpg', 1, '', 1, '2025-04-18 16:26:04'),
(88, 7, 'Swimming Pool', 'e5aCX-4.jpg', 1, '', 6, '2025-04-18 16:08:32'),
(87, 7, 'Swimming Pool', '90OFp-5.jpg', 1, '', 5, '2025-04-18 16:08:32'),
(86, 7, 'Swimming Pool', 'ZErkf-3.jpg', 1, '', 4, '2025-04-18 16:08:32'),
(85, 7, 'Swimming Pool', 'QOcMm-6.jpg', 1, '', 3, '2025-04-18 16:08:32'),
(84, 7, 'Swimming Pool', 'xEh0I-2.jpg', 1, '', 2, '2025-04-18 16:08:32'),
(83, 7, 'Swimming Pool', '8jBVY-1.jpg', 1, '', 1, '2025-04-18 16:08:32'),
(80, 8, 'Culinary Excellence', 'IGNTC-culinary2.jpg', 0, '', 1, '2025-04-18 08:17:08'),
(81, 8, 'Culinary Excellence', 'll31S-culinary3.jpg', 1, '', 2, '2025-04-18 08:17:08'),
(82, 8, 'Culinary Excellence', 'VTn21-culinary4.jpg', 1, '', 3, '2025-04-18 08:17:08'),
(97, 6, 'Spa', '82VOk-2.jpg', 1, '', 9, '2025-04-18 16:26:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group_type`
--

CREATE TABLE `tbl_group_type` (
  `id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `group_type` varchar(20) NOT NULL,
  `authority` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Frontend,2=>Personality,3=>Backend,4=>Both',
  `description` tinytext NOT NULL,
  `status` tinyint(4) NOT NULL,
  `permission` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_group_type`
--

INSERT INTO `tbl_group_type` (`id`, `group_name`, `group_type`, `authority`, `description`, `status`, `permission`) VALUES
(1, 'Administrator', '1', 1, '', 1, 'a:20:{i:0;s:2:\"74\";i:1;s:3:\"306\";i:2;s:1:\"1\";i:3;s:1:\"2\";i:4;s:1:\"3\";i:5;s:1:\"4\";i:6;s:2:\"25\";i:7;s:2:\"23\";i:8;s:2:\"24\";i:9;s:3:\"310\";i:10;s:2:\"20\";i:11;s:1:\"5\";i:12;s:2:\"11\";i:13;s:2:\"19\";i:14;s:2:\"28\";i:15;s:2:\"12\";i:16;s:2:\"16\";i:17;s:2:\"15\";i:18;s:2:\"14\";i:19;s:2:\"13\";}'),
(2, 'General Admin', '1', 1, '', 1, 'a:17:{i:0;s:2:\"74\";i:1;s:1:\"1\";i:2;s:1:\"2\";i:3;s:1:\"3\";i:4;s:1:\"4\";i:5;s:2:\"25\";i:6;s:2:\"23\";i:7;s:2:\"24\";i:8;s:3:\"310\";i:9;s:2:\"20\";i:10;s:1:\"5\";i:11;s:2:\"11\";i:12;s:2:\"19\";i:13;s:2:\"28\";i:14;s:2:\"12\";i:15;s:2:\"14\";i:16;s:2:\"13\";}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs`
--

CREATE TABLE `tbl_logs` (
  `id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `registered` varchar(50) NOT NULL,
  `userid` int(11) NOT NULL,
  `user_action` int(11) NOT NULL,
  `ip_track` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`id`, `action`, `registered`, `userid`, `user_action`, `ip_track`) VALUES
(1, 'Log has been cleared.', '2025-04-18 10:35:37', 1, 6, '::1'),
(2, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-18 10:40:21', 1, 4, '::1'),
(3, 'Changes on Popup \'asefasdasd\' has been saved successfully.', '2025-04-18 10:48:56', 1, 4, '::1'),
(4, 'Changes on Popup \'asefasdasd\' has been saved successfully.', '2025-04-18 10:49:09', 1, 4, '::1'),
(5, 'Login: admin logged in.', '2025-04-18 11:21:14', 1, 1, '103.10.28.150'),
(6, 'Services [asdasdasd]Data has added successfully.', '2025-04-18 11:21:40', 1, 3, '103.10.28.150'),
(7, 'Servicess  [asdasdasd]Data has deleted successfully.', '2025-04-18 11:21:49', 1, 6, '103.10.28.150'),
(8, 'Services  [asdasdasd]Data has deleted successfully.', '2025-04-18 11:21:49', 1, 6, '103.10.28.150'),
(9, 'Login: admin logged in.', '2025-04-18 11:23:08', 1, 1, '103.10.28.150'),
(10, 'Services [Rooms]Data has added successfully.', '2025-04-18 11:25:01', 1, 3, '103.10.28.150'),
(11, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-18 11:28:39', 1, 4, '103.10.28.150'),
(12, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-18 11:31:00', 1, 4, '103.10.28.150'),
(13, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-18 11:31:22', 1, 4, '103.10.28.150'),
(14, 'Services [Event Hall]Data has added successfully.', '2025-04-18 11:35:34', 1, 3, '103.10.28.150'),
(15, 'Services [Parking Space]Data has added successfully.', '2025-04-18 11:35:55', 1, 3, '103.10.28.150'),
(16, 'Services [Welcome Drink]Data has added successfully.', '2025-04-18 11:36:31', 1, 3, '103.10.28.150'),
(17, 'Services [CCTV Security]Data has added successfully.', '2025-04-18 11:36:43', 1, 3, '103.10.28.150'),
(18, 'Services [Spa]Data has added successfully.', '2025-04-18 11:37:11', 1, 3, '103.10.28.150'),
(19, 'Services [High Speed Internet]Data has added successfully.', '2025-04-18 11:39:08', 1, 3, '103.10.28.150'),
(20, 'Services [Airport Pickup & Drop]Data has added successfully.', '2025-04-18 11:39:41', 1, 3, '103.10.28.150'),
(21, 'Services [Room Service]Data has added successfully.', '2025-04-18 11:40:08', 1, 3, '103.10.28.150'),
(22, 'Services [Daily Housekeeping]Data has added successfully.', '2025-04-18 11:40:38', 1, 3, '103.10.28.150'),
(23, 'Services [Concierge Service]Data has added successfully.', '2025-04-18 11:41:00', 1, 3, '103.10.28.150'),
(24, 'Services [Daily Newspaper]Data has added successfully.', '2025-04-18 11:43:10', 1, 3, '103.10.28.150'),
(25, 'Services [Cards Accepted]Data has added successfully.', '2025-04-18 11:43:22', 1, 3, '103.10.28.150'),
(26, 'Services [Elevator]Data has added successfully.', '2025-04-18 11:43:31', 1, 3, '103.10.28.150'),
(27, 'Services [Doctor on Call]Data has added successfully.', '2025-04-18 11:43:44', 1, 3, '103.10.28.150'),
(28, 'Services [Power Backup]Data has added successfully.', '2025-04-18 11:43:58', 1, 3, '103.10.28.150'),
(29, 'Services [Luggage Storage]Data has added successfully.', '2025-04-18 11:44:18', 1, 3, '103.10.28.150'),
(30, 'Services [Fitness Center]Data has added successfully.', '2025-04-18 11:44:30', 1, 3, '103.10.28.150'),
(31, 'Services [Restaurant]Data has added successfully.', '2025-04-18 11:44:54', 1, 3, '103.10.28.150'),
(32, 'Services [Fire Extinguisher]Data has added successfully.', '2025-04-18 11:45:18', 1, 3, '103.10.28.150'),
(33, 'Services [Safe Deposit]Data has added successfully.', '2025-04-18 11:45:58', 1, 3, '103.10.28.150'),
(34, 'Services [24hrs Travel Desk]Data has added successfully.', '2025-04-18 11:46:15', 1, 3, '103.10.28.150'),
(35, 'Services [24hrs Reception]Data has added successfully.', '2025-04-18 11:48:15', 1, 3, '103.10.28.150'),
(36, 'User [Temple Bell  ] Edit Successfully', '2025-04-18 11:48:47', 1, 4, '103.10.28.150'),
(37, 'Login: admin logged in.', '2025-04-18 11:49:54', 1, 1, '103.10.28.150'),
(38, 'Login: admin logged in.', '2025-04-18 11:52:24', 1, 1, '103.10.28.150'),
(39, 'User [Temple Bell  ] Edit Successfully', '2025-04-18 11:57:09', 1, 4, '103.10.28.150'),
(40, 'Login: superadmin logged in.', '2025-04-18 11:58:36', 1, 1, '103.10.28.150'),
(41, 'Login: admin logged in.', '2025-04-18 11:59:23', 1, 1, '103.10.28.150'),
(42, 'Sub Package \'Yak and Yeti Bar\' has added successfully.', '2025-04-18 12:02:08', 1, 3, '103.10.28.150'),
(43, 'Changes on Sub Package \'Yak and Yeti Bar\' has been saved successfully.', '2025-04-18 12:02:36', 1, 4, '103.10.28.150'),
(44, 'Menu [Yak and Yeti Bar] Edit Successfully', '2025-04-18 12:03:02', 1, 4, '103.10.28.150'),
(45, 'Changes on Sub Package \'Buddha Sadan Hall\' has been saved successfully.', '2025-04-18 12:04:46', 1, 4, '103.10.28.150'),
(46, 'Changes on Sub Package \'Deluxe Room\' has been saved successfully.', '2025-04-18 12:04:54', 1, 4, '103.10.28.150'),
(47, 'Menu [Deluxe Room] Edit Successfully', '2025-04-18 12:06:28', 1, 4, '103.10.28.150'),
(48, 'Menu [Super Deluxe Room] Edit Successfully', '2025-04-18 12:06:39', 1, 4, '103.10.28.150'),
(49, 'Changes on Sub Package \'Super Deluxe Room\' has been saved successfully.', '2025-04-18 12:09:29', 1, 4, '103.10.28.150'),
(50, 'Changes on Sub Package \'Super Deluxe Room\' has been saved successfully.', '2025-04-18 12:09:46', 1, 4, '103.10.28.150'),
(51, 'Changes on Sub Package \'Junior Suite Room\' has been saved successfully.', '2025-04-18 12:11:01', 1, 4, '103.10.28.150'),
(52, 'Changes on Sub Package \'Suite Room\' has been saved successfully.', '2025-04-18 12:11:48', 1, 4, '103.10.28.150'),
(53, 'Changes on Sub Package \'Deluxe Room\' has been saved successfully.', '2025-04-18 12:12:51', 1, 4, '103.10.28.150'),
(54, 'Changes on Sub Package \'Super Deluxe Room\' has been saved successfully.', '2025-04-18 12:13:18', 1, 4, '103.10.28.150'),
(55, 'Changes on Sub Package \'Junior Suite Room\' has been saved successfully.', '2025-04-18 12:13:37', 1, 4, '103.10.28.150'),
(56, 'Changes on Sub Package \'Suite Room\' has been saved successfully.', '2025-04-18 12:13:56', 1, 4, '103.10.28.150'),
(57, 'Changes on Sub Package \'Suite Room\' has been saved successfully.', '2025-04-18 12:14:11', 1, 4, '103.10.28.150'),
(58, 'Changes on Sub Package \'Super Deluxe Room\' has been saved successfully.', '2025-04-18 12:14:31', 1, 4, '103.10.28.150'),
(59, 'Changes on Sub Package \'Junior Suite Room\' has been saved successfully.', '2025-04-18 12:14:43', 1, 4, '103.10.28.150'),
(60, 'Changes on Sub Package \'Suite Room\' has been saved successfully.', '2025-04-18 12:14:52', 1, 4, '103.10.28.150'),
(61, 'Sub Package \'Aanti \' has added successfully.', '2025-04-18 12:17:39', 1, 3, '103.10.28.150'),
(62, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:22:22', 1, 3, '103.10.28.150'),
(63, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:22:22', 1, 3, '103.10.28.150'),
(64, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:22:22', 1, 3, '103.10.28.150'),
(65, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:22:22', 1, 3, '103.10.28.150'),
(66, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:22:22', 1, 3, '103.10.28.150'),
(67, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:22:22', 1, 3, '103.10.28.150'),
(68, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:22:22', 1, 3, '103.10.28.150'),
(69, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:22:22', 1, 3, '103.10.28.150'),
(70, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:22:22', 1, 3, '103.10.28.150'),
(71, 'SubPackage Gallery Image [Yak and Yeti Bar]Data has deleted successfully.', '2025-04-18 12:23:07', 1, 6, '103.10.28.150'),
(72, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:23', 1, 6, '103.10.28.150'),
(73, 'SubPackage Gallery Image [Yak and Yeti Bar]Data has deleted successfully.', '2025-04-18 12:23:23', 1, 6, '103.10.28.150'),
(74, 'SubPackage Gallery Image [Yak and Yeti Bar]Data has deleted successfully.', '2025-04-18 12:23:29', 1, 6, '103.10.28.150'),
(75, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:29', 1, 6, '103.10.28.150'),
(76, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:29', 1, 6, '103.10.28.150'),
(77, 'SubPackage Gallery Image [Yak and Yeti Bar]Data has deleted successfully.', '2025-04-18 12:23:31', 1, 6, '103.10.28.150'),
(78, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:31', 1, 6, '103.10.28.150'),
(79, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:31', 1, 6, '103.10.28.150'),
(80, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:31', 1, 6, '103.10.28.150'),
(81, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:33', 1, 6, '103.10.28.150'),
(82, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:33', 1, 6, '103.10.28.150'),
(83, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:33', 1, 6, '103.10.28.150'),
(84, 'SubPackage Gallery Image [Yak and Yeti Bar]Data has deleted successfully.', '2025-04-18 12:23:33', 1, 6, '103.10.28.150'),
(85, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:33', 1, 6, '103.10.28.150'),
(86, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:36', 1, 6, '103.10.28.150'),
(87, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:36', 1, 6, '103.10.28.150'),
(88, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:36', 1, 6, '103.10.28.150'),
(89, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:36', 1, 6, '103.10.28.150'),
(90, 'SubPackage Gallery Image [Yak and Yeti Bar]Data has deleted successfully.', '2025-04-18 12:23:36', 1, 6, '103.10.28.150'),
(91, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:36', 1, 6, '103.10.28.150'),
(92, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:38', 1, 6, '103.10.28.150'),
(93, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:40', 1, 6, '103.10.28.150'),
(94, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:40', 1, 6, '103.10.28.150'),
(95, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:40', 1, 6, '103.10.28.150'),
(96, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:40', 1, 6, '103.10.28.150'),
(97, 'SubPackage Gallery Image [Yak and Yeti Bar]Data has deleted successfully.', '2025-04-18 12:23:40', 1, 6, '103.10.28.150'),
(98, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:40', 1, 6, '103.10.28.150'),
(99, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:40', 1, 6, '103.10.28.150'),
(100, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:42', 1, 6, '103.10.28.150'),
(101, 'SubPackage Gallery Image [Yak and Yeti Bar]Data has deleted successfully.', '2025-04-18 12:23:47', 1, 6, '103.10.28.150'),
(102, 'SubPackage Gallery Image [Yak and Yeti Bar]Data has deleted successfully.', '2025-04-18 12:23:48', 1, 6, '103.10.28.150'),
(103, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:50', 1, 6, '103.10.28.150'),
(104, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:23:50', 1, 6, '103.10.28.150'),
(105, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:24:11', 1, 3, '103.10.28.150'),
(106, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:24:11', 1, 3, '103.10.28.150'),
(107, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:24:11', 1, 3, '103.10.28.150'),
(108, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:24:11', 1, 3, '103.10.28.150'),
(109, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:24:11', 1, 3, '103.10.28.150'),
(110, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:24:11', 1, 3, '103.10.28.150'),
(111, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:24:11', 1, 3, '103.10.28.150'),
(112, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:24:11', 1, 3, '103.10.28.150'),
(113, 'Sub Package Image [Yak and Yeti Bar]Data has added successfully.', '2025-04-18 12:24:11', 1, 3, '103.10.28.150'),
(114, 'Changes on Sub Package \'Yak and Yeti Bar\' has been saved successfully.', '2025-04-18 12:28:53', 1, 4, '103.10.28.150'),
(115, 'Changes on Sub Package \'Yak and Yeti Bar\' has been saved successfully.', '2025-04-18 12:29:17', 1, 4, '103.10.28.150'),
(116, 'Package Dining Edit Successfully', '2025-04-18 12:30:11', 1, 4, '103.10.28.150'),
(117, 'Article \'teset\' has added successfully.', '2025-04-18 12:35:29', 1, 3, '103.10.28.150'),
(118, 'Changes on Article \'teset\' has been saved successfully.', '2025-04-18 12:35:47', 1, 4, '103.10.28.150'),
(119, 'Features [Soft (Pin) Board]Data has added successfully.', '2025-04-18 12:49:20', 1, 3, '103.10.28.150'),
(120, 'Features [Printing Services]Data has added successfully.', '2025-04-18 12:49:50', 1, 3, '103.10.28.150'),
(121, 'Features [Writing Pads With Pencils]Data has added successfully.', '2025-04-18 12:50:32', 1, 3, '103.10.28.150'),
(122, 'Features [Photography]Data has added successfully.', '2025-04-18 12:50:50', 1, 3, '103.10.28.150'),
(123, 'Features [Videography]Data has added successfully.', '2025-04-18 12:51:04', 1, 3, '103.10.28.150'),
(124, 'Changes on Sub Package \'Buddha Sadan Hall\' has been saved successfully.', '2025-04-18 12:51:19', 1, 4, '103.10.28.150'),
(125, 'Changes on Sub Package \'Buddha Sadan Hall\' has been saved successfully.', '2025-04-18 12:53:25', 1, 4, '103.10.28.150'),
(126, 'SubPackage Gallery Image [Deluxe Room]Data has deleted successfully.', '2025-04-18 12:53:47', 1, 6, '103.10.28.150'),
(127, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:53:51', 1, 6, '103.10.28.150'),
(128, 'SubPackage Gallery Image [Deluxe Room]Data has deleted successfully.', '2025-04-18 12:53:51', 1, 6, '103.10.28.150'),
(129, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:53:53', 1, 6, '103.10.28.150'),
(130, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 12:53:53', 1, 6, '103.10.28.150'),
(131, 'SubPackage Gallery Image [Deluxe Room]Data has deleted successfully.', '2025-04-18 12:53:53', 1, 6, '103.10.28.150'),
(132, 'Sub Package Image [Deluxe Room]Data has added successfully.', '2025-04-18 12:55:03', 1, 3, '103.10.28.150'),
(133, 'Sub Package Image [Deluxe Twin Room]Data has added successfully.', '2025-04-18 12:55:03', 1, 3, '103.10.28.150'),
(134, 'Sub Package Image [Deluxe Twin Room]Data has added successfully.', '2025-04-18 12:55:03', 1, 3, '103.10.28.150'),
(135, 'Sub Package Image [Deluxe Family Room]Data has added successfully.', '2025-04-18 12:55:03', 1, 3, '103.10.28.150'),
(136, 'Sub Package Image [Super Deluxe Room]Data has added successfully.', '2025-04-18 12:56:36', 1, 3, '103.10.28.150'),
(137, 'Sub Package Image [Super Deluxe Room]Data has added successfully.', '2025-04-18 12:56:36', 1, 3, '103.10.28.150'),
(138, 'Sub Package Image [Super Deluxe Room]Data has added successfully.', '2025-04-18 12:56:36', 1, 3, '103.10.28.150'),
(139, 'Sub Package Image [Junior Suite Room]Data has added successfully.', '2025-04-18 12:59:04', 1, 3, '103.10.28.150'),
(140, 'Sub Package Image [Junior Suite Room]Data has added successfully.', '2025-04-18 12:59:04', 1, 3, '103.10.28.150'),
(141, 'Sub Package Image [Junior Suite Room]Data has added successfully.', '2025-04-18 12:59:04', 1, 3, '103.10.28.150'),
(142, 'Sub Package Image [Suite Room]Data has added successfully.', '2025-04-18 13:00:17', 1, 3, '103.10.28.150'),
(143, 'Sub Package Image [Suite Room]Data has added successfully.', '2025-04-18 13:00:17', 1, 3, '103.10.28.150'),
(144, 'Sub Package Image [Suite Room]Data has added successfully.', '2025-04-18 13:00:17', 1, 3, '103.10.28.150'),
(145, 'Changes on Sub Package \'Deluxe Room\' has been saved successfully.', '2025-04-18 13:05:15', 1, 4, '103.10.28.150'),
(146, 'Changes on Popup \'asefasdasd\' has been saved successfully.', '2025-04-18 13:06:44', 1, 4, '103.10.28.150'),
(147, 'Changes on Sub Package \'Super Deluxe Room\' has been saved successfully.', '2025-04-18 13:06:47', 1, 4, '103.10.28.150'),
(148, 'Popup \'asdasdasd\' has added successfully.', '2025-04-18 13:07:26', 1, 3, '103.10.28.150'),
(149, 'Changes on Sub Package \'Junior Suite Room\' has been saved successfully.', '2025-04-18 13:08:00', 1, 4, '103.10.28.150'),
(150, 'Changes on Sub Package \'Deluxe Single Room\' has been saved successfully.', '2025-04-18 13:15:46', 1, 4, '103.10.28.150'),
(151, 'Changes on Sub Package \'Deluxe Single Room\' has been saved successfully.', '2025-04-18 13:15:57', 1, 4, '103.10.28.150'),
(152, 'Sub Package \'Deluxe Double Room\' has added successfully.', '2025-04-18 13:16:56', 1, 3, '103.10.28.150'),
(153, 'Sub Package Image [Deluxe Double Room]Data has added successfully.', '2025-04-18 13:17:44', 1, 3, '103.10.28.150'),
(154, 'Sub Package Image [Deluxe Double Room]Data has added successfully.', '2025-04-18 13:17:44', 1, 3, '103.10.28.150'),
(155, 'Sub Package Image [Deluxe Double Room]Data has added successfully.', '2025-04-18 13:17:44', 1, 3, '103.10.28.150'),
(156, 'Sub Package Image [Deluxe Double Room]Data has added successfully.', '2025-04-18 13:17:44', 1, 3, '103.10.28.150'),
(157, 'Menu [Deluxe Double Room] Edit Successfully', '2025-04-18 13:18:22', 1, 4, '103.10.28.150'),
(158, 'SubPackage Gallery Image [Deluxe Room]Data has deleted successfully.', '2025-04-18 13:19:08', 1, 6, '103.10.28.150'),
(159, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 13:19:10', 1, 6, '103.10.28.150'),
(160, 'SubPackage Gallery Image [Deluxe Twin Room]Data has deleted successfully.', '2025-04-18 13:19:10', 1, 6, '103.10.28.150'),
(161, 'SubPackage Gallery Image [Deluxe Twin Room]Data has deleted successfully.', '2025-04-18 13:19:13', 1, 6, '103.10.28.150'),
(162, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 13:19:13', 1, 6, '103.10.28.150'),
(163, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 13:19:13', 1, 6, '103.10.28.150'),
(164, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 13:19:15', 1, 6, '103.10.28.150'),
(165, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 13:19:15', 1, 6, '103.10.28.150'),
(166, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 13:19:15', 1, 6, '103.10.28.150'),
(167, 'SubPackage Gallery Image [Deluxe Family Room]Data has deleted successfully.', '2025-04-18 13:19:15', 1, 6, '103.10.28.150'),
(168, 'Sub Package Image [Deluxe Single Room]Data has added successfully.', '2025-04-18 13:19:32', 1, 3, '103.10.28.150'),
(169, 'Sub Package Image [Deluxe Single Room]Data has added successfully.', '2025-04-18 13:19:32', 1, 3, '103.10.28.150'),
(170, 'Sub Package Image [Deluxe Single Room]Data has added successfully.', '2025-04-18 13:19:32', 1, 3, '103.10.28.150'),
(171, 'Sub Package Image [Deluxe Single Room]Data has added successfully.', '2025-04-18 13:19:32', 1, 3, '103.10.28.150'),
(172, 'Menu [Deluxe Room] Edit Successfully', '2025-04-18 13:20:08', 1, 4, '103.10.28.150'),
(173, 'Menu [Deluxe Single Room] Edit Successfully', '2025-04-18 13:20:34', 1, 4, '103.10.28.150'),
(174, 'Menu [Deluxe Triple Room] Edit Successfully', '2025-04-18 13:21:06', 1, 4, '103.10.28.150'),
(175, 'Sub Package \'Deluxe Triple Room\' has added successfully.', '2025-04-18 13:24:17', 1, 3, '103.10.28.150'),
(176, 'Sub Package Image [Deluxe Triple Room]Data has added successfully.', '2025-04-18 13:25:00', 1, 3, '103.10.28.150'),
(177, 'Sub Package Image [Deluxe Triple Room]Data has added successfully.', '2025-04-18 13:25:00', 1, 3, '103.10.28.150'),
(178, 'Sub Package Image [Deluxe Triple Room]Data has added successfully.', '2025-04-18 13:25:00', 1, 3, '103.10.28.150'),
(179, 'Sub Package Image [Deluxe Triple Room]Data has added successfully.', '2025-04-18 13:25:00', 1, 3, '103.10.28.150'),
(180, 'Sub Package Image [Deluxe Triple Room]Data has added successfully.', '2025-04-18 13:25:00', 1, 3, '103.10.28.150'),
(181, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 13:28:04', 1, 4, '103.10.28.150'),
(182, 'Changes on Sub Package \'Deluxe Single Room\' has been saved successfully.', '2025-04-18 13:29:39', 1, 4, '103.10.28.150'),
(183, 'Changes on Sub Package \'Deluxe Double Room\' has been saved successfully.', '2025-04-18 13:31:38', 1, 4, '103.10.28.150'),
(184, 'Changes on Popup \'asdasdasd\' has been saved successfully.', '2025-04-18 13:31:42', 1, 4, '103.10.28.150'),
(185, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 13:32:14', 1, 4, '103.10.28.150'),
(186, 'Package Accommodation Edit Successfully', '2025-04-18 13:37:56', 1, 4, '103.10.28.150'),
(187, 'Changes on Sub Package \'Deluxe Double Room\' has been saved successfully.', '2025-04-18 13:39:41', 1, 4, '103.10.28.150'),
(188, 'Changes on Sub Package \'Deluxe Double Room\' has been saved successfully.', '2025-04-18 13:40:19', 1, 4, '103.10.28.150'),
(189, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 13:40:51', 1, 4, '103.10.28.150'),
(190, 'Changes on Popup \'asdasdasd\' has been saved successfully.', '2025-04-18 13:41:43', 1, 4, '103.10.28.150'),
(191, 'Changes on Popup \'asefasdasd\' has been saved successfully.', '2025-04-18 13:42:44', 1, 4, '103.10.28.150'),
(192, 'Login: admin logged in.', '2025-04-18 13:45:01', 1, 1, '103.10.28.150'),
(193, 'Changes on Sub Package \'Deluxe Single Room\' has been saved successfully.', '2025-04-18 13:49:43', 1, 4, '103.10.28.150'),
(194, 'Changes on Sub Package \'Deluxe Double Room\' has been saved successfully.', '2025-04-18 13:49:54', 1, 4, '103.10.28.150'),
(195, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 13:50:12', 1, 4, '103.10.28.150'),
(196, 'Login: admin logged in.', '2025-04-18 14:41:09', 1, 1, '103.10.28.150'),
(197, 'Login: admin logged in.', '2025-04-18 14:41:51', 1, 1, '103.10.28.150'),
(198, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 14:43:27', 1, 4, '103.10.28.150'),
(199, 'Changes on Sub Package \'Deluxe Double Room\' has been saved successfully.', '2025-04-18 14:43:47', 1, 4, '103.10.28.150'),
(200, 'Changes on Sub Package \'Deluxe Single Room\' has been saved successfully.', '2025-04-18 14:44:04', 1, 4, '103.10.28.150'),
(201, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 14:44:22', 1, 4, '103.10.28.150'),
(202, 'Changes on Sub Package \'Buddha Sadan Hall\' has been saved successfully.', '2025-04-18 14:45:43', 1, 4, '103.10.28.150'),
(203, 'Login: admin logged in.', '2025-04-18 14:45:54', 1, 1, '103.10.28.150'),
(204, 'Changes on Popup \'asdasdasd\' has been saved successfully.', '2025-04-18 14:46:04', 1, 4, '103.10.28.150'),
(205, 'Changes on Popup \'asdasdasd\' has been saved successfully.', '2025-04-18 14:46:10', 1, 4, '103.10.28.150'),
(206, 'Features [High Speed Internet]Data has added successfully.', '2025-04-18 14:51:16', 1, 3, '103.10.28.150'),
(207, 'Features [Air Conditioner]Data has added successfully.', '2025-04-18 14:51:30', 1, 3, '103.10.28.150'),
(208, 'Features [Bathrobe]Data has added successfully.', '2025-04-18 14:51:42', 1, 3, '103.10.28.150'),
(209, 'Features [Bathtub]Data has added successfully.', '2025-04-18 14:51:56', 1, 3, '103.10.28.150'),
(210, 'Features [Bathtub] Edit Successfully', '2025-04-18 14:53:43', 1, 4, '103.10.28.150'),
(211, 'Features [Iron & Iron Board]Data has added successfully.', '2025-04-18 14:54:27', 1, 3, '103.10.28.150'),
(212, 'Features [Daily Housekeeping]Data has added successfully.', '2025-04-18 14:54:42', 1, 3, '103.10.28.150'),
(213, 'Features [Complimentary Toiletries]Data has added successfully.', '2025-04-18 14:55:04', 1, 3, '103.10.28.150'),
(214, 'Features [Separate Living Room]Data has added successfully.', '2025-04-18 14:55:31', 1, 3, '103.10.28.150'),
(215, 'Features [Shower]Data has added successfully.', '2025-04-18 14:55:51', 1, 3, '103.10.28.150'),
(216, 'Features [Slipper]Data has added successfully.', '2025-04-18 14:56:34', 1, 3, '103.10.28.150'),
(217, 'Changes on Sub Package \'Deluxe Single Room\' has been saved successfully.', '2025-04-18 14:58:57', 1, 4, '103.10.28.150'),
(218, 'Changes on Sub Package \'Deluxe Double Room\' has been saved successfully.', '2025-04-18 15:00:16', 1, 4, '103.10.28.150'),
(219, 'Features [Hairdryer]Data has added successfully.', '2025-04-18 15:00:52', 1, 3, '103.10.28.150'),
(220, 'Features [Work Desk]Data has added successfully.', '2025-04-18 15:01:06', 1, 3, '103.10.28.150'),
(221, 'Features [Twin Bed]Data has added successfully.', '2025-04-18 15:02:03', 1, 3, '103.10.28.150'),
(222, 'Changes on Sub Package \'Deluxe Single Room\' has been saved successfully.', '2025-04-18 15:02:26', 1, 4, '103.10.28.150'),
(223, 'Changes on Sub Package \'Deluxe Double Room\' has been saved successfully.', '2025-04-18 15:02:45', 1, 4, '103.10.28.150'),
(224, 'Features [Fruit Basket]Data has added successfully.', '2025-04-18 15:03:27', 1, 3, '103.10.28.150'),
(225, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 15:04:11', 1, 4, '103.10.28.150'),
(226, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 15:04:37', 1, 4, '103.10.28.150'),
(227, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 15:05:20', 1, 4, '103.10.28.150'),
(228, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 15:07:08', 1, 4, '103.10.28.150'),
(229, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 15:08:03', 1, 4, '103.10.28.150'),
(230, 'Login: admin logged in.', '2025-04-18 15:08:25', 1, 1, '103.10.28.150'),
(231, 'Slideshow [Slide 3]Data has added successfully.', '2025-04-18 15:09:01', 1, 3, '103.10.28.150'),
(232, 'Slideshow [Slide 3] Edit Successfully', '2025-04-18 15:09:26', 1, 4, '103.10.28.150'),
(233, 'Slideshow [slide 1] Edit Successfully', '2025-04-18 15:09:49', 1, 4, '103.10.28.150'),
(234, 'Slideshow [Slide 3] Edit Successfully', '2025-04-18 15:10:12', 1, 4, '103.10.28.150'),
(235, 'Slideshow [Slide 1] Edit Successfully', '2025-04-18 15:10:33', 1, 4, '103.10.28.150'),
(236, 'Slideshow [Slide 2] Edit Successfully', '2025-04-18 15:13:39', 1, 4, '103.10.28.150'),
(237, 'Slideshow [Slide 3] Edit Successfully', '2025-04-18 15:15:16', 1, 4, '103.10.28.150'),
(238, 'Slideshow [Slide 4]Data has added successfully.', '2025-04-18 15:18:20', 1, 3, '103.10.28.150'),
(239, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 15:22:19', 1, 4, '103.10.28.150'),
(240, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 15:23:37', 1, 4, '103.10.28.150'),
(241, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 15:24:05', 1, 4, '103.10.28.150'),
(242, 'Package Dining Edit Successfully', '2025-04-18 15:25:23', 1, 4, '103.10.28.150'),
(243, 'Slideshow [Slide 5]Data has added successfully.', '2025-04-18 15:26:34', 1, 3, '103.10.28.150'),
(244, 'Package Dining Edit Successfully', '2025-04-18 15:28:43', 1, 4, '103.10.28.150'),
(245, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-18 15:33:47', 1, 4, '103.10.28.150'),
(246, 'Services [Buddha Sadan] Edit Successfully', '2025-04-18 15:34:50', 1, 4, '103.10.28.150'),
(247, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-18 15:35:21', 1, 4, '103.10.28.150'),
(248, 'Services [Aanti] Edit Successfully', '2025-04-18 15:38:47', 1, 4, '103.10.28.150'),
(249, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 15:39:20', 1, 4, '103.10.28.150'),
(250, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 15:39:34', 1, 4, '103.10.28.150'),
(251, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 15:40:41', 1, 4, '103.10.28.150'),
(252, 'Services [Bhojan Kakshya] Edit Successfully', '2025-04-18 15:42:21', 1, 4, '103.10.28.150'),
(253, 'Services [Yak and Yeti Bar] Edit Successfully', '2025-04-18 15:48:06', 1, 4, '103.10.28.150'),
(254, 'Services [Swimming Pool] Edit Successfully', '2025-04-18 15:48:23', 1, 4, '103.10.28.150'),
(255, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-18 15:48:29', 1, 4, '103.10.28.150'),
(256, 'Login: admin logged in.', '2025-04-18 15:53:32', 1, 1, '27.34.27.41'),
(257, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-18 15:53:46', 1, 4, '27.34.27.41'),
(258, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 16:05:40', 1, 4, '103.10.28.150'),
(259, 'Sub Gallery Image  [Swimming Pool]Data has deleted successfully.', '2025-04-18 16:07:58', 1, 6, '103.10.28.150'),
(260, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:04', 1, 6, '103.10.28.150'),
(261, 'Sub Gallery Image  [Swimming Pool]Data has deleted successfully.', '2025-04-18 16:08:04', 1, 6, '103.10.28.150'),
(262, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 16:08:15', 1, 4, '103.10.28.150'),
(263, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:17', 1, 6, '103.10.28.150'),
(264, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:17', 1, 6, '103.10.28.150'),
(265, 'Sub Gallery Image  [Swimming Pool]Data has deleted successfully.', '2025-04-18 16:08:17', 1, 6, '103.10.28.150'),
(266, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:20', 1, 6, '103.10.28.150'),
(267, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:20', 1, 6, '103.10.28.150'),
(268, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:20', 1, 6, '103.10.28.150'),
(269, 'Sub Gallery Image  [Swimming Pool]Data has deleted successfully.', '2025-04-18 16:08:20', 1, 6, '103.10.28.150'),
(270, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:22', 1, 6, '103.10.28.150'),
(271, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:22', 1, 6, '103.10.28.150'),
(272, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:22', 1, 6, '103.10.28.150'),
(273, 'Sub Gallery Image  [Swimming Pool]Data has deleted successfully.', '2025-04-18 16:08:22', 1, 6, '103.10.28.150'),
(274, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:22', 1, 6, '103.10.28.150'),
(275, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:25', 1, 6, '103.10.28.150'),
(276, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:25', 1, 6, '103.10.28.150'),
(277, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:25', 1, 6, '103.10.28.150'),
(278, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:25', 1, 6, '103.10.28.150'),
(279, 'Sub Gallery Image  [Swimming Pool]Data has deleted successfully.', '2025-04-18 16:08:25', 1, 6, '103.10.28.150'),
(280, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:08:25', 1, 6, '103.10.28.150'),
(281, 'Sub Gallery Image [Swimming Pool]Data has added successfully.', '2025-04-18 16:08:32', 1, 3, '103.10.28.150'),
(282, 'Sub Gallery Image [Swimming Pool]Data has added successfully.', '2025-04-18 16:08:32', 1, 3, '103.10.28.150'),
(283, 'Sub Gallery Image [Swimming Pool]Data has added successfully.', '2025-04-18 16:08:32', 1, 3, '103.10.28.150'),
(284, 'Sub Gallery Image [Swimming Pool]Data has added successfully.', '2025-04-18 16:08:32', 1, 3, '103.10.28.150'),
(285, 'Sub Gallery Image [Swimming Pool]Data has added successfully.', '2025-04-18 16:08:32', 1, 3, '103.10.28.150'),
(286, 'Sub Gallery Image [Swimming Pool]Data has added successfully.', '2025-04-18 16:08:32', 1, 3, '103.10.28.150'),
(287, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 16:09:29', 1, 4, '103.10.28.150'),
(288, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 16:16:31', 1, 4, '27.34.27.41'),
(289, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 16:19:10', 1, 4, '27.34.27.41'),
(290, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-18 16:20:59', 1, 4, '103.10.28.150'),
(291, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 16:22:29', 1, 4, '103.10.28.150'),
(292, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 16:24:13', 1, 4, '103.10.28.150'),
(293, 'Sub Gallery Image  [Spa]Data has deleted successfully.', '2025-04-18 16:24:26', 1, 6, '103.10.28.150'),
(294, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:29', 1, 6, '103.10.28.150'),
(295, 'Sub Gallery Image  [Spa]Data has deleted successfully.', '2025-04-18 16:24:29', 1, 6, '103.10.28.150'),
(296, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:31', 1, 6, '103.10.28.150'),
(297, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:31', 1, 6, '103.10.28.150'),
(298, 'Sub Gallery Image  [Spa]Data has deleted successfully.', '2025-04-18 16:24:31', 1, 6, '103.10.28.150'),
(299, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:49', 1, 6, '103.10.28.150'),
(300, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:49', 1, 6, '103.10.28.150'),
(301, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:49', 1, 6, '103.10.28.150'),
(302, 'Sub Gallery Image  [Spa]Data has deleted successfully.', '2025-04-18 16:24:49', 1, 6, '103.10.28.150'),
(303, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:53', 1, 6, '103.10.28.150'),
(304, 'Sub Gallery Image  [Spa]Data has deleted successfully.', '2025-04-18 16:24:53', 1, 6, '103.10.28.150'),
(305, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:53', 1, 6, '103.10.28.150'),
(306, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:53', 1, 6, '103.10.28.150'),
(307, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:53', 1, 6, '103.10.28.150'),
(308, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:56', 1, 6, '103.10.28.150'),
(309, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:56', 1, 6, '103.10.28.150'),
(310, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:56', 1, 6, '103.10.28.150'),
(311, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:56', 1, 6, '103.10.28.150'),
(312, 'Sub Gallery Image  [Spa]Data has deleted successfully.', '2025-04-18 16:24:56', 1, 6, '103.10.28.150'),
(313, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:56', 1, 6, '103.10.28.150'),
(314, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:59', 1, 6, '103.10.28.150'),
(315, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:59', 1, 6, '103.10.28.150'),
(316, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:59', 1, 6, '103.10.28.150'),
(317, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:59', 1, 6, '103.10.28.150'),
(318, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:59', 1, 6, '103.10.28.150'),
(319, 'Sub Gallery Image  [Spa]Data has deleted successfully.', '2025-04-18 16:24:59', 1, 6, '103.10.28.150'),
(320, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:24:59', 1, 6, '103.10.28.150'),
(321, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:02', 1, 6, '103.10.28.150'),
(322, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:02', 1, 6, '103.10.28.150'),
(323, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:02', 1, 6, '103.10.28.150'),
(324, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:02', 1, 6, '103.10.28.150'),
(325, 'Sub Gallery Image  [Spa]Data has deleted successfully.', '2025-04-18 16:25:02', 1, 6, '103.10.28.150'),
(326, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:02', 1, 6, '103.10.28.150'),
(327, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:02', 1, 6, '103.10.28.150'),
(328, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:02', 1, 6, '103.10.28.150'),
(329, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:04', 1, 6, '103.10.28.150'),
(330, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:04', 1, 6, '103.10.28.150'),
(331, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:04', 1, 6, '103.10.28.150'),
(332, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:04', 1, 6, '103.10.28.150'),
(333, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:04', 1, 6, '103.10.28.150'),
(334, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:04', 1, 6, '103.10.28.150'),
(335, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:04', 1, 6, '103.10.28.150'),
(336, 'Sub Gallery Image  [Spa]Data has deleted successfully.', '2025-04-18 16:25:04', 1, 6, '103.10.28.150'),
(337, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:04', 1, 6, '103.10.28.150'),
(338, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:07', 1, 6, '103.10.28.150'),
(339, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:07', 1, 6, '103.10.28.150'),
(340, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:07', 1, 6, '103.10.28.150'),
(341, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:07', 1, 6, '103.10.28.150'),
(342, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:07', 1, 6, '103.10.28.150'),
(343, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:07', 1, 6, '103.10.28.150'),
(344, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:07', 1, 6, '103.10.28.150'),
(345, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:07', 1, 6, '103.10.28.150'),
(346, 'Sub Gallery Image  [Spa]Data has deleted successfully.', '2025-04-18 16:25:07', 1, 6, '103.10.28.150'),
(347, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:25:07', 1, 6, '103.10.28.150'),
(348, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-18 16:25:32', 1, 4, '103.10.28.150'),
(349, 'Sub Gallery Image [Spa]Data has added successfully.', '2025-04-18 16:26:04', 1, 3, '103.10.28.150'),
(350, 'Sub Gallery Image [Spa]Data has added successfully.', '2025-04-18 16:26:04', 1, 3, '103.10.28.150'),
(351, 'Sub Gallery Image [Spa]Data has added successfully.', '2025-04-18 16:26:04', 1, 3, '103.10.28.150'),
(352, 'Sub Gallery Image [Spa]Data has added successfully.', '2025-04-18 16:26:04', 1, 3, '103.10.28.150'),
(353, 'Sub Gallery Image [Spa]Data has added successfully.', '2025-04-18 16:26:04', 1, 3, '103.10.28.150'),
(354, 'Sub Gallery Image [Spa]Data has added successfully.', '2025-04-18 16:26:04', 1, 3, '103.10.28.150'),
(355, 'Sub Gallery Image [Spa]Data has added successfully.', '2025-04-18 16:26:04', 1, 3, '103.10.28.150'),
(356, 'Sub Gallery Image [Spa]Data has added successfully.', '2025-04-18 16:26:04', 1, 3, '103.10.28.150'),
(357, 'Sub Gallery Image [Spa]Data has added successfully.', '2025-04-18 16:26:04', 1, 3, '103.10.28.150'),
(358, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 16:26:27', 1, 4, '103.10.28.150'),
(359, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-18 16:28:48', 1, 4, '103.10.28.150'),
(360, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-18 16:32:50', 1, 4, '103.10.28.150'),
(361, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-18 16:34:00', 1, 4, '103.10.28.150'),
(362, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-18 16:37:11', 1, 4, '103.10.28.150'),
(363, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 16:47:49', 1, 4, '103.10.28.150'),
(364, 'Changes on Article \'Temple Bell Boutique Hotel & Spa\' has been saved successfully.', '2025-04-18 16:50:37', 1, 4, '103.10.28.150'),
(365, 'Sub Gallery Image  [Meeting Hall]Data has deleted successfully.', '2025-04-18 16:51:50', 1, 6, '103.10.28.150'),
(366, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:51:53', 1, 6, '103.10.28.150'),
(367, 'Sub Gallery Image  [Meeting Hall]Data has deleted successfully.', '2025-04-18 16:51:53', 1, 6, '103.10.28.150'),
(368, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:51:56', 1, 6, '103.10.28.150'),
(369, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:51:56', 1, 6, '103.10.28.150'),
(370, 'Sub Gallery Image  [Meeting Hall]Data has deleted successfully.', '2025-04-18 16:51:56', 1, 6, '103.10.28.150'),
(371, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:51:59', 1, 6, '103.10.28.150'),
(372, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:51:59', 1, 6, '103.10.28.150'),
(373, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:51:59', 1, 6, '103.10.28.150'),
(374, 'Sub Gallery Image  [Meeting Hall]Data has deleted successfully.', '2025-04-18 16:51:59', 1, 6, '103.10.28.150'),
(375, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:02', 1, 6, '103.10.28.150'),
(376, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:02', 1, 6, '103.10.28.150'),
(377, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:02', 1, 6, '103.10.28.150'),
(378, 'Sub Gallery Image  [Meeting Hall]Data has deleted successfully.', '2025-04-18 16:52:02', 1, 6, '103.10.28.150'),
(379, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:02', 1, 6, '103.10.28.150'),
(380, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:05', 1, 6, '103.10.28.150'),
(381, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:05', 1, 6, '103.10.28.150'),
(382, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:05', 1, 6, '103.10.28.150'),
(383, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:05', 1, 6, '103.10.28.150'),
(384, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:05', 1, 6, '103.10.28.150'),
(385, 'Sub Gallery Image  [Meeting Hall]Data has deleted successfully.', '2025-04-18 16:52:05', 1, 6, '103.10.28.150'),
(386, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:08', 1, 6, '103.10.28.150'),
(387, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:08', 1, 6, '103.10.28.150'),
(388, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:08', 1, 6, '103.10.28.150'),
(389, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:08', 1, 6, '103.10.28.150'),
(390, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:08', 1, 6, '103.10.28.150'),
(391, 'Sub Gallery Image  [Meeting Hall]Data has deleted successfully.', '2025-04-18 16:52:08', 1, 6, '103.10.28.150'),
(392, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:08', 1, 6, '103.10.28.150'),
(393, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:11', 1, 6, '103.10.28.150'),
(394, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:11', 1, 6, '103.10.28.150'),
(395, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:11', 1, 6, '103.10.28.150'),
(396, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:11', 1, 6, '103.10.28.150'),
(397, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:11', 1, 6, '103.10.28.150'),
(398, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:11', 1, 6, '103.10.28.150'),
(399, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:11', 1, 6, '103.10.28.150'),
(400, 'Sub Gallery Image  [Meeting Hall]Data has deleted successfully.', '2025-04-18 16:52:11', 1, 6, '103.10.28.150'),
(401, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:15', 1, 6, '103.10.28.150'),
(402, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:15', 1, 6, '103.10.28.150'),
(403, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:15', 1, 6, '103.10.28.150'),
(404, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:15', 1, 6, '103.10.28.150'),
(405, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:15', 1, 6, '103.10.28.150'),
(406, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:15', 1, 6, '103.10.28.150'),
(407, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:15', 1, 6, '103.10.28.150'),
(408, 'Sub Gallery Image  [Meeting Hall]Data has deleted successfully.', '2025-04-18 16:52:15', 1, 6, '103.10.28.150'),
(409, 'Sub Gallery Image  []Data has deleted successfully.', '2025-04-18 16:52:15', 1, 6, '103.10.28.150'),
(410, 'Sub Gallery Image [Meeting Hall]Data has added successfully.', '2025-04-18 16:52:41', 1, 3, '103.10.28.150'),
(411, 'Sub Gallery Image [Meeting Hall]Data has added successfully.', '2025-04-18 16:52:41', 1, 3, '103.10.28.150'),
(412, 'Sub Gallery Image [Meeting Hall]Data has added successfully.', '2025-04-18 16:52:41', 1, 3, '103.10.28.150'),
(413, 'Sub Gallery Image [Meeting Hall]Data has added successfully.', '2025-04-18 16:52:41', 1, 3, '103.10.28.150'),
(414, 'Sub Gallery Image [Meeting Hall]Data has added successfully.', '2025-04-18 16:52:41', 1, 3, '103.10.28.150'),
(415, 'Sub Gallery Image [Meeting Hall]Data has added successfully.', '2025-04-18 16:52:41', 1, 3, '103.10.28.150'),
(416, 'Changes on Sub Package \'Buddha Sadan Hall\' has been saved successfully.', '2025-04-18 16:52:58', 1, 4, '103.10.28.150'),
(417, 'Changes on Sub Package \'Bhojan Kakchya\' has been saved successfully.', '2025-04-18 16:56:18', 1, 4, '103.10.28.150'),
(418, 'Changes on Sub Package \'Yak and Yeti Bar\' has been saved successfully.', '2025-04-18 16:58:17', 1, 4, '103.10.28.150'),
(419, 'Changes on Sub Package \'Deluxe Single Room\' has been saved successfully.', '2025-04-18 17:00:22', 1, 4, '103.10.28.150'),
(420, 'Changes on Sub Package \'Deluxe Double Room\' has been saved successfully.', '2025-04-18 17:02:32', 1, 4, '103.10.28.150'),
(421, 'SubPackage Gallery Image [Buddha Sadan Hall]Data has deleted successfully.', '2025-04-18 17:03:31', 1, 6, '103.10.28.150'),
(422, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 17:03:33', 1, 6, '103.10.28.150'),
(423, 'SubPackage Gallery Image [Buddha Sadan Hall]Data has deleted successfully.', '2025-04-18 17:03:33', 1, 6, '103.10.28.150'),
(424, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 17:03:36', 1, 6, '103.10.28.150'),
(425, 'SubPackage Gallery Image [Buddha Sadan Hall]Data has deleted successfully.', '2025-04-18 17:03:36', 1, 6, '103.10.28.150'),
(426, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 17:03:36', 1, 6, '103.10.28.150'),
(427, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 17:03:40', 1, 6, '103.10.28.150'),
(428, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 17:03:40', 1, 6, '103.10.28.150'),
(429, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 17:03:40', 1, 6, '103.10.28.150'),
(430, 'SubPackage Gallery Image [Buddha Sadan Hall]Data has deleted successfully.', '2025-04-18 17:03:40', 1, 6, '103.10.28.150'),
(431, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 17:03:43', 1, 6, '103.10.28.150'),
(432, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 17:03:43', 1, 6, '103.10.28.150'),
(433, 'SubPackage Gallery Image [Buddha Sadan Hall]Data has deleted successfully.', '2025-04-18 17:03:43', 1, 6, '103.10.28.150'),
(434, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 17:03:43', 1, 6, '103.10.28.150'),
(435, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-18 17:03:43', 1, 6, '103.10.28.150'),
(436, 'Sub Package Image [Meeting Hall]Data has added successfully.', '2025-04-18 17:04:17', 1, 3, '103.10.28.150'),
(437, 'Sub Package Image [Meeting Hall]Data has added successfully.', '2025-04-18 17:04:17', 1, 3, '103.10.28.150'),
(438, 'Sub Package Image [Meeting Hall]Data has added successfully.', '2025-04-18 17:04:17', 1, 3, '103.10.28.150'),
(439, 'Sub Package Image [Meeting Hall]Data has added successfully.', '2025-04-18 17:04:17', 1, 3, '103.10.28.150'),
(440, 'Sub Package Image [Meeting Hall]Data has added successfully.', '2025-04-18 17:04:17', 1, 3, '103.10.28.150'),
(441, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 17:09:24', 1, 4, '103.10.28.150'),
(442, 'Changes on Sub Package \'Aanti \' has been saved successfully.', '2025-04-18 17:17:12', 1, 4, '103.10.28.150'),
(443, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-04-18 17:20:43', 1, 4, '103.10.28.150'),
(444, 'Changes on Sub Package \'Deluxe Double Room\' has been saved successfully.', '2025-04-18 17:20:54', 1, 4, '103.10.28.150'),
(445, 'Services [Swimming Pool] Edit Successfully', '2025-04-18 17:22:20', 1, 4, '103.10.28.150'),
(446, 'Services [Buddha Sadan] Edit Successfully', '2025-04-18 17:22:29', 1, 4, '103.10.28.150'),
(447, 'Services [Bhojan Kakshya] Edit Successfully', '2025-04-18 17:22:48', 1, 4, '103.10.28.150');
INSERT INTO `tbl_logs` (`id`, `action`, `registered`, `userid`, `user_action`, `ip_track`) VALUES
(448, 'Services [Yak and Yeti Bar] Edit Successfully', '2025-04-18 17:22:58', 1, 4, '103.10.28.150'),
(449, 'Services [Coffee Shop] Edit Successfully', '2025-04-18 17:23:12', 1, 4, '103.10.28.150'),
(450, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 17:26:26', 1, 4, '103.10.28.150'),
(451, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 17:30:48', 1, 4, '103.10.28.150'),
(452, 'Changes on Sub Package \'Bhojan Kakchya\' has been saved successfully.', '2025-04-18 17:34:06', 1, 4, '103.10.28.150'),
(453, 'Changes on Sub Package \'Yak and Yeti Bar\' has been saved successfully.', '2025-04-18 17:34:22', 1, 4, '103.10.28.150'),
(454, 'Changes on Sub Package \'Bhojan Kakchya\' has been saved successfully.', '2025-04-18 17:39:45', 1, 4, '103.10.28.150'),
(455, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 17:41:59', 1, 4, '103.10.28.150'),
(456, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 17:42:29', 1, 4, '103.10.28.150'),
(457, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 17:43:15', 1, 4, '103.10.28.150'),
(458, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 17:45:14', 1, 4, '103.10.28.150'),
(459, 'Login: admin logged in.', '2025-04-18 17:50:17', 1, 1, '27.34.27.41'),
(460, 'Popup  [asdasdasd]Data has deleted successfully.', '2025-04-18 17:50:25', 1, 6, '27.34.27.41'),
(461, 'Changes on Popup \'asefasdasd\' has been saved successfully.', '2025-04-18 17:50:30', 1, 4, '27.34.27.41'),
(462, 'Changes on Popup \'Temple Bells Grand Prelude\' has been saved successfully.', '2025-04-18 17:53:06', 1, 4, '27.34.27.41'),
(463, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 17:56:55', 1, 4, '103.10.28.150'),
(464, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 17:57:57', 1, 4, '103.10.28.150'),
(465, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 17:59:05', 1, 4, '103.10.28.150'),
(466, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 17:59:41', 1, 4, '103.10.28.150'),
(467, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 17:59:55', 1, 4, '103.10.28.150'),
(468, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 18:00:43', 1, 4, '103.10.28.150'),
(469, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 18:03:58', 1, 4, '27.34.27.41'),
(470, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 18:05:06', 1, 4, '27.34.27.41'),
(471, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-18 18:05:18', 1, 4, '27.34.27.41'),
(472, 'Login: admin logged in.', '2025-04-21 10:08:54', 1, 1, '110.44.115.243'),
(473, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-21 10:10:13', 1, 4, '110.44.115.243'),
(474, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-21 10:11:34', 1, 4, '110.44.115.243'),
(475, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-21 10:12:56', 1, 4, '110.44.115.243'),
(476, 'Login: admin logged in.', '2025-04-21 11:32:52', 1, 1, '103.10.28.143'),
(477, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-21 11:42:43', 1, 4, '103.10.28.143'),
(478, 'Login: admin logged in.', '2025-04-21 11:46:54', 1, 1, '27.34.27.41'),
(479, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-21 11:47:07', 1, 4, '27.34.27.41'),
(480, 'SubPackage Gallery Image [Bhojan Kakchya]Data has deleted successfully.', '2025-04-21 11:51:18', 1, 6, '103.10.28.143'),
(481, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:20', 1, 6, '103.10.28.143'),
(482, 'SubPackage Gallery Image [Bhojan Kakchya]Data has deleted successfully.', '2025-04-21 11:51:20', 1, 6, '103.10.28.143'),
(483, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:23', 1, 6, '103.10.28.143'),
(484, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:23', 1, 6, '103.10.28.143'),
(485, 'SubPackage Gallery Image [Bhojan Kakchya]Data has deleted successfully.', '2025-04-21 11:51:23', 1, 6, '103.10.28.143'),
(486, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:28', 1, 6, '103.10.28.143'),
(487, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:28', 1, 6, '103.10.28.143'),
(488, 'SubPackage Gallery Image [Bhojan Kakchya]Data has deleted successfully.', '2025-04-21 11:51:28', 1, 6, '103.10.28.143'),
(489, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:28', 1, 6, '103.10.28.143'),
(490, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:32', 1, 6, '103.10.28.143'),
(491, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:32', 1, 6, '103.10.28.143'),
(492, 'SubPackage Gallery Image [Bhojan Kakchya]Data has deleted successfully.', '2025-04-21 11:51:32', 1, 6, '103.10.28.143'),
(493, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:32', 1, 6, '103.10.28.143'),
(494, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:32', 1, 6, '103.10.28.143'),
(495, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:35', 1, 6, '103.10.28.143'),
(496, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:35', 1, 6, '103.10.28.143'),
(497, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:35', 1, 6, '103.10.28.143'),
(498, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:35', 1, 6, '103.10.28.143'),
(499, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:35', 1, 6, '103.10.28.143'),
(500, 'SubPackage Gallery Image [Bhojan Kakchya]Data has deleted successfully.', '2025-04-21 11:51:35', 1, 6, '103.10.28.143'),
(501, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:40', 1, 6, '103.10.28.143'),
(502, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:40', 1, 6, '103.10.28.143'),
(503, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:40', 1, 6, '103.10.28.143'),
(504, 'SubPackage Gallery Image [Bhojan Kakchya]Data has deleted successfully.', '2025-04-21 11:51:40', 1, 6, '103.10.28.143'),
(505, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:40', 1, 6, '103.10.28.143'),
(506, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:40', 1, 6, '103.10.28.143'),
(507, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:51:40', 1, 6, '103.10.28.143'),
(508, 'Sub Package Image [Bhojan Kakchya]Data has added successfully.', '2025-04-21 11:52:07', 1, 3, '103.10.28.143'),
(509, 'Sub Package Image [Bhojan Kakchya]Data has added successfully.', '2025-04-21 11:52:07', 1, 3, '103.10.28.143'),
(510, 'Sub Package Image [Bhojan Kakchya]Data has added successfully.', '2025-04-21 11:52:07', 1, 3, '103.10.28.143'),
(511, 'Sub Package Image [Bhojan Kakchya]Data has added successfully.', '2025-04-21 11:52:07', 1, 3, '103.10.28.143'),
(512, 'Sub Package Image [Bhojan Kakchya]Data has added successfully.', '2025-04-21 11:52:07', 1, 3, '103.10.28.143'),
(513, 'Sub Package Image [Bhojan Kakchya]Data has added successfully.', '2025-04-21 11:52:07', 1, 3, '103.10.28.143'),
(514, 'SubPackage Gallery Image [Bhojan Kakchya]Data has deleted successfully.', '2025-04-21 11:55:00', 1, 6, '103.10.28.143'),
(515, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:55:04', 1, 6, '103.10.28.143'),
(516, 'SubPackage Gallery Image [Bhojan Kakchya]Data has deleted successfully.', '2025-04-21 11:55:04', 1, 6, '103.10.28.143'),
(517, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:55:24', 1, 6, '103.10.28.143'),
(518, 'SubPackage Gallery Image []Data has deleted successfully.', '2025-04-21 11:55:24', 1, 6, '103.10.28.143'),
(519, 'SubPackage Gallery Image [Bhojan Kakchya]Data has deleted successfully.', '2025-04-21 11:55:24', 1, 6, '103.10.28.143'),
(520, 'Sub Package Image [Bhojan Kakchya]Data has added successfully.', '2025-04-21 11:56:40', 1, 3, '103.10.28.143'),
(521, 'Sub Package Image [Bhojan Kakchya]Data has added successfully.', '2025-04-21 11:56:40', 1, 3, '103.10.28.143'),
(522, 'Login: admin logged in.', '2025-04-21 15:28:04', 1, 1, '103.10.28.143'),
(523, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-21 15:29:32', 1, 4, '103.10.28.143'),
(524, 'Login: admin logged in.', '2025-04-21 15:58:13', 1, 1, '103.181.227.200'),
(525, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-21 15:58:37', 1, 4, '103.181.227.200'),
(526, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-21 16:01:48', 1, 4, '103.181.227.200'),
(527, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-21 16:08:28', 1, 4, '103.10.28.143'),
(528, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-21 16:17:21', 1, 4, '103.10.28.143'),
(529, 'Login: admin logged in.', '2025-04-21 17:51:29', 1, 1, '27.34.66.56'),
(530, 'Login: admin logged in.', '2025-04-21 17:52:51', 1, 1, '27.34.66.56'),
(531, 'User [Temple Bell  ] Edit Successfully', '2025-04-21 17:54:49', 1, 4, '27.34.66.56'),
(532, 'Login: admin logged in.', '2025-04-21 17:58:20', 1, 1, '27.34.66.56'),
(533, 'User [Temple Bell  ] Edit Successfully', '2025-04-21 17:58:53', 1, 4, '27.34.66.56'),
(534, 'Login: admin logged in.', '2025-04-21 18:00:55', 1, 1, '27.34.66.56'),
(535, 'Login: superadmin logged in.', '2025-04-22 09:43:45', 1, 1, '27.34.27.41'),
(536, 'User Group [Administrator] Edit Successfully', '2025-04-22 09:43:56', 1, 4, '27.34.27.41'),
(537, 'User Group [General Admin] Edit Successfully', '2025-04-22 09:44:01', 1, 4, '27.34.27.41'),
(538, 'Virtual Tour \'adsadasdasd\' has added successfully.', '2025-04-22 09:44:50', 1, 3, '27.34.27.41'),
(539, '360 Image \'ASDXASDASD\' has added successfully.', '2025-04-22 09:45:05', 1, 3, '27.34.27.41'),
(540, '360 Image \'SADSADASDASD\' has added successfully.', '2025-04-22 09:49:16', 1, 3, '27.34.27.41'),
(541, 'Hotspot \'FG\' has added successfully.', '2025-04-22 09:49:32', 1, 3, '27.34.27.41'),
(542, 'Login: admin logged in.', '2025-04-23 17:31:55', 1, 1, '103.10.28.140'),
(543, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-23 17:32:52', 1, 4, '103.10.28.140'),
(544, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-23 17:33:22', 1, 4, '103.10.28.140'),
(545, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-23 17:34:20', 1, 4, '103.10.28.140'),
(546, 'Login: admin logged in.', '2025-04-23 18:16:54', 1, 1, '103.10.28.140'),
(547, 'Changes on Article \'About Us\' has been saved successfully.', '2025-04-23 18:18:10', 1, 4, '103.10.28.140'),
(548, 'Login: admin logged in.', '2025-04-24 16:42:42', 1, 1, '103.10.28.143'),
(549, 'Login: admin logged in.', '2025-04-25 16:21:36', 1, 1, '103.10.28.148'),
(550, 'Login: superadmin logged in.', '2025-04-28 13:46:44', 1, 1, '27.34.25.126'),
(551, 'User Group [Administrator] Edit Successfully', '2025-04-28 13:46:53', 1, 4, '27.34.25.126'),
(552, 'User Group [General Admin] Edit Successfully', '2025-04-28 13:46:57', 1, 4, '27.34.25.126'),
(553, 'User [Temple Bell  ] Edit Successfully', '2025-04-28 13:47:30', 1, 4, '27.34.25.126'),
(554, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-28 13:56:53', 1, 4, '27.34.25.126'),
(555, 'Login: admin logged in.', '2025-04-28 15:19:35', 1, 1, '103.10.28.129'),
(556, 'Offers [testing] Edit Successfully', '2025-04-28 15:20:07', 1, 4, '103.10.28.129'),
(557, 'Offers [testing] Edit Successfully', '2025-04-28 15:21:00', 1, 4, '103.10.28.129'),
(558, 'Offers [testing] Edit Successfully', '2025-04-28 15:21:46', 1, 4, '103.10.28.129'),
(559, 'Login: admin logged in.', '2025-04-28 15:56:48', 1, 1, '103.10.28.129'),
(560, 'Features [Projector] Edit Successfully', '2025-04-28 15:57:29', 1, 4, '103.10.28.129'),
(561, 'Login: superadmin logged in.', '2025-04-28 15:57:32', 1, 1, '103.10.28.129'),
(562, 'Offers [testing] Edit Successfully', '2025-04-28 15:57:46', 1, 4, '103.10.28.129'),
(563, 'Offers [asdasd] Edit Successfully', '2025-04-28 16:07:25', 1, 4, '103.10.28.129'),
(564, 'Offers [test] Edit Successfully', '2025-04-28 16:07:34', 1, 4, '103.10.28.129'),
(565, 'Offers [testing] Edit Successfully', '2025-04-28 16:09:14', 1, 4, '103.10.28.129'),
(566, 'Offers [testing] Edit Successfully', '2025-04-28 16:15:36', 1, 4, '103.10.28.129'),
(567, 'Offers [testing] Edit Successfully', '2025-04-28 16:33:50', 1, 4, '103.10.28.129'),
(568, 'Offers [testing] Edit Successfully', '2025-04-28 16:34:05', 1, 4, '103.10.28.129'),
(569, 'Offers [testing] Edit Successfully', '2025-04-28 16:34:31', 1, 4, '103.10.28.129'),
(570, 'Offers [testing] Edit Successfully', '2025-04-28 16:41:42', 1, 4, '103.10.28.129'),
(571, 'Login: superadmin logged in.', '2025-04-28 17:46:20', 1, 1, '103.10.28.129'),
(572, 'Login: admin logged in.', '2025-04-29 10:20:21', 1, 1, '103.10.28.145'),
(573, 'Offers  [testing]Data has deleted successfully.', '2025-04-29 10:20:38', 1, 6, '103.10.28.145'),
(574, 'Offers  [asdasd]Data has deleted successfully.', '2025-04-29 10:20:38', 1, 6, '103.10.28.145'),
(575, 'Offers  [test]Data has deleted successfully.', '2025-04-29 10:20:38', 1, 6, '103.10.28.145'),
(576, 'Offers [Step into Luxury]Data has added successfully.', '2025-04-29 10:21:59', 1, 3, '103.10.28.145'),
(577, 'Changes on Popup \'Temple Bells Grand Prelude\' has been saved successfully.', '2025-04-29 10:22:22', 1, 4, '103.10.28.145'),
(578, 'Changes on Popup \'Temple Bells Grand Prelude\' has been saved successfully.', '2025-04-29 10:22:42', 1, 4, '103.10.28.145'),
(579, 'Login: superadmin logged in.', '2025-04-29 10:29:36', 1, 1, '27.34.25.126'),
(580, 'Offers [Step into Luxury] Edit Successfully', '2025-04-29 10:30:10', 1, 4, '103.10.28.145'),
(581, 'Changes on Popup \'Temple Bells Grand Prelude\' has been saved successfully.', '2025-04-29 10:30:11', 1, 4, '27.34.25.126'),
(582, 'Changes on Popup \'Temple Bells Grand Prelude\' has been saved successfully.', '2025-04-29 10:31:00', 1, 4, '27.34.25.126'),
(583, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-29 10:32:03', 1, 4, '27.34.25.126'),
(584, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-04-29 10:32:13', 1, 4, '27.34.25.126'),
(585, 'Menu [Offers] CreatedData has added successfully.', '2025-04-29 10:35:34', 1, 3, '103.10.28.145'),
(586, 'Login: admin logged in.', '2025-04-29 10:40:06', 1, 1, '103.10.28.145'),
(587, 'Login: superadmin logged in.', '2025-04-29 15:36:47', 1, 1, '103.10.28.142'),
(588, 'Changes on Popup \'Temple Bells Grand Prelude\' has been saved successfully.', '2025-04-29 15:37:02', 1, 4, '103.10.28.142'),
(589, 'Changes on Popup \'Temple Bells Grand Prelude\' has been saved successfully.', '2025-04-29 15:37:48', 1, 4, '103.10.28.142'),
(590, 'Login: admin logged in.', '2025-04-30 07:35:51', 1, 1, '203.9.210.207'),
(591, 'Login: admin logged in.', '2025-05-01 22:11:18', 1, 1, '27.34.66.63'),
(592, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-05-01 22:11:47', 1, 4, '27.34.66.63'),
(593, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-05-01 22:15:43', 1, 4, '27.34.66.63'),
(594, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-05-01 22:18:11', 1, 4, '27.34.66.63'),
(595, 'Login: superadmin logged in.', '2025-05-02 16:36:58', 1, 1, '103.10.28.151'),
(596, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-05-02 16:39:09', 1, 4, '103.10.28.151'),
(597, 'Login: admin logged in.', '2025-05-06 13:18:02', 1, 1, '103.10.28.150'),
(598, 'Login: admin logged in.', '2025-05-06 13:19:09', 1, 1, '103.10.28.150'),
(599, 'Login: admin logged in.', '2025-05-06 14:13:16', 1, 1, '103.10.28.150'),
(600, 'Login: admin logged in.', '2025-05-06 15:43:29', 1, 1, '103.10.28.150'),
(601, 'Login: admin logged in.', '2025-05-07 10:45:52', 1, 1, '103.10.28.150'),
(602, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-05-07 10:51:18', 1, 4, '103.10.28.150'),
(603, 'Changes on Article \'About Us\' has been saved successfully.', '2025-05-07 10:53:32', 1, 4, '103.10.28.150'),
(604, 'Changes on Article \'About Us\' has been saved successfully.', '2025-05-07 10:54:05', 1, 4, '103.10.28.150'),
(605, 'Changes on Article \'Temple Bell Boutique Hotel & Spa\' has been saved successfully.', '2025-05-07 10:56:53', 1, 4, '103.10.28.150'),
(606, 'Changes on Article \'Temple Bell Boutique Hotel & Spa\' has been saved successfully.', '2025-05-07 10:57:11', 1, 4, '103.10.28.150'),
(607, 'Changes on Article \'About Us\' has been saved successfully.', '2025-05-07 11:03:36', 1, 4, '103.10.28.150'),
(608, 'Changes on Article \'Temple Bell Boutique Hotel & Spa\' has been saved successfully.', '2025-05-07 11:04:01', 1, 4, '103.10.28.150'),
(609, 'Package Hall Edit Successfully', '2025-05-07 11:08:36', 1, 4, '103.10.28.150'),
(610, 'Package Hall Edit Successfully', '2025-05-07 11:09:14', 1, 4, '103.10.28.150'),
(611, 'Package Dining Edit Successfully', '2025-05-07 11:12:13', 1, 4, '103.10.28.150'),
(612, 'Package Accommodation Edit Successfully', '2025-05-07 11:18:34', 1, 4, '103.10.28.150'),
(613, 'Package Dining Edit Successfully', '2025-05-07 11:19:41', 1, 4, '103.10.28.150'),
(614, 'Package Hall Edit Successfully', '2025-05-07 11:20:48', 1, 4, '103.10.28.150'),
(615, 'Login: admin logged in.', '2025-05-07 11:46:30', 1, 1, '103.10.28.150'),
(616, 'Login: admin logged in.', '2025-05-07 13:01:57', 1, 1, '103.10.28.150'),
(617, 'Login: admin logged in.', '2025-05-07 13:13:09', 1, 1, '103.10.28.150'),
(618, 'Login: admin logged in.', '2025-05-07 14:55:44', 1, 1, '103.10.28.150'),
(619, 'Login: admin logged in.', '2025-05-08 13:05:29', 1, 1, '103.10.28.145'),
(620, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-05-08 13:07:20', 1, 4, '103.10.28.145'),
(621, 'Package Hall Edit Successfully', '2025-05-08 13:08:26', 1, 4, '103.10.28.145'),
(622, 'Package Dining Edit Successfully', '2025-05-08 13:10:17', 1, 4, '103.10.28.145'),
(623, 'Package Accommodation Edit Successfully', '2025-05-08 13:12:02', 1, 4, '103.10.28.145'),
(624, 'Changes on Sub Package \'Buddha Sadan Hall\' has been saved successfully.', '2025-05-08 13:17:20', 1, 4, '103.10.28.145'),
(625, 'Changes on Sub Package \'Bhojan Kakchya\' has been saved successfully.', '2025-05-08 13:22:56', 1, 4, '103.10.28.145'),
(626, 'Changes on Sub Package \'Yak and Yeti Bar\' has been saved successfully.', '2025-05-08 13:29:36', 1, 4, '103.10.28.145'),
(627, 'Changes on Sub Package \'Yak and Yeti Bar\' has been saved successfully.', '2025-05-08 13:30:05', 1, 4, '103.10.28.145'),
(628, 'Changes on Sub Package \'Deluxe Single Room\' has been saved successfully.', '2025-05-08 13:34:16', 1, 4, '103.10.28.145'),
(629, 'Changes on Sub Package \'Deluxe Double Room\' has been saved successfully.', '2025-05-08 13:37:55', 1, 4, '103.10.28.145'),
(630, 'Changes on Sub Package \'Deluxe Double Room\' has been saved successfully.', '2025-05-08 13:39:54', 1, 4, '103.10.28.145'),
(631, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-05-08 14:37:42', 1, 4, '103.10.28.145'),
(632, 'Login: admin logged in.', '2025-05-08 14:37:57', 1, 1, '103.10.28.145'),
(633, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-05-08 14:38:28', 1, 4, '103.10.28.145'),
(634, 'Login: admin logged in.', '2025-05-09 09:34:16', 1, 1, '103.10.28.139'),
(635, 'Login: admin logged in.', '2025-05-09 14:41:30', 1, 1, '103.10.28.139'),
(636, 'Login: admin logged in.', '2025-05-09 14:44:45', 1, 1, '103.10.28.139'),
(637, 'Login: admin logged in.', '2025-05-09 15:51:40', 1, 1, '103.10.28.139'),
(638, 'Login: admin logged in.', '2025-05-13 11:34:57', 1, 1, '103.10.28.152'),
(639, 'Login: admin logged in.', '2025-05-13 12:55:17', 1, 1, '103.10.28.152'),
(640, 'Login: admin logged in.', '2025-05-13 14:23:52', 1, 1, '103.10.28.152'),
(641, 'Login: admin logged in.', '2025-05-13 14:29:20', 1, 1, '103.10.28.152'),
(642, 'Login: admin logged in.', '2025-05-13 17:35:04', 1, 1, '103.10.28.152'),
(643, 'Login: admin logged in.', '2025-05-14 09:32:40', 1, 1, '103.10.28.153'),
(644, 'Login: superadmin logged in.', '2025-05-14 10:08:49', 1, 1, '103.10.28.153'),
(645, 'Changes on Article \'Temple Bell Boutique Hotel & Spa\' has been saved successfully.', '2025-05-14 10:09:52', 1, 4, '103.10.28.153'),
(646, 'Login: superadmin logged in.', '2025-05-14 10:35:00', 1, 1, '103.10.28.153'),
(647, 'Menu [Home] Edit Successfully', '2025-05-14 10:35:12', 1, 4, '103.10.28.153'),
(648, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-05-14 11:13:34', 1, 4, '103.10.28.153'),
(649, 'Login: admin logged in.', '2025-05-14 12:48:30', 1, 1, '103.10.28.153'),
(650, 'Login: admin logged in.', '2025-05-14 13:22:53', 1, 1, '103.10.28.153'),
(651, 'Login: superadmin logged in.', '2025-05-14 14:27:52', 1, 1, '103.10.28.153'),
(652, 'Login: admin logged in.', '2025-05-14 14:32:40', 1, 1, '103.10.28.153'),
(653, 'Login: admin logged in.', '2025-05-14 15:03:25', 1, 1, '103.10.28.153'),
(654, 'Login: admin logged in.', '2025-05-14 15:11:12', 1, 1, '103.10.28.153'),
(655, 'Changes on Config \'Temple Bell\' has been saved successfully.', '2025-05-14 15:11:29', 1, 4, '103.10.28.153'),
(656, 'Changes on Article \'About Us\' has been saved successfully.', '2025-05-14 15:11:48', 1, 4, '103.10.28.153'),
(657, 'Changes on Article \'Temple Bell Boutique Hotel & Spa\' has been saved successfully.', '2025-05-14 15:12:09', 1, 4, '103.10.28.153'),
(658, 'Package Hall Edit Successfully', '2025-05-14 15:12:38', 1, 4, '103.10.28.153'),
(659, 'Package Dining Edit Successfully', '2025-05-14 15:12:54', 1, 4, '103.10.28.153'),
(660, 'Package Accommodation Edit Successfully', '2025-05-14 15:13:10', 1, 4, '103.10.28.153'),
(661, 'Changes on Sub Package \'Buddha Sadan Hall\' has been saved successfully.', '2025-05-14 15:13:33', 1, 4, '103.10.28.153'),
(662, 'Changes on Sub Package \'Bhojan Kakchya\' has been saved successfully.', '2025-05-14 15:14:00', 1, 4, '103.10.28.153'),
(663, 'Changes on Sub Package \'Yak and Yeti Bar\' has been saved successfully.', '2025-05-14 15:14:49', 1, 4, '103.10.28.153'),
(664, 'Changes on Sub Package \'Deluxe Single Room\' has been saved successfully.', '2025-05-14 15:15:19', 1, 4, '103.10.28.153'),
(665, 'Changes on Sub Package \'Deluxe Double Room\' has been saved successfully.', '2025-05-14 15:15:36', 1, 4, '103.10.28.153'),
(666, 'Changes on Sub Package \'Deluxe Triple Room\' has been saved successfully.', '2025-05-14 15:15:55', 1, 4, '103.10.28.153'),
(667, 'Login: admin logged in.', '2025-05-14 15:23:10', 1, 1, '103.10.28.153'),
(668, 'Login: admin logged in.', '2025-05-14 16:55:07', 1, 1, '103.10.28.153'),
(669, 'Login: admin logged in.', '2025-05-15 09:25:59', 1, 1, '103.10.28.141'),
(670, 'Login: admin logged in.', '2025-05-15 10:57:25', 1, 1, '103.10.28.141'),
(671, 'Login: admin logged in.', '2025-05-15 13:29:23', 1, 1, '103.10.28.141'),
(672, 'Login: admin logged in.', '2025-05-16 16:54:25', 1, 1, '103.10.28.131'),
(673, 'Login: admin logged in.', '2025-05-21 11:18:30', 1, 1, '103.10.28.141'),
(674, 'Login: admin logged in.', '2025-05-21 17:43:29', 1, 1, '103.10.28.141'),
(675, 'Login: admin logged in.', '2025-05-22 11:00:14', 1, 1, '103.10.28.131'),
(676, 'Login: admin logged in.', '2025-05-22 11:58:56', 1, 1, '103.10.28.131'),
(677, 'Login: admin logged in.', '2025-05-22 14:52:50', 1, 1, '103.10.28.131'),
(678, 'Login: admin logged in.', '2025-05-26 13:42:09', 1, 1, '103.10.28.139'),
(679, 'Login: admin logged in.', '2025-05-28 12:44:41', 1, 1, '103.10.28.148'),
(680, 'Login: admin logged in.', '2025-05-29 17:42:13', 1, 1, '103.10.28.135'),
(681, 'Login: admin logged in.', '2025-05-30 13:01:03', 1, 1, '103.10.28.148'),
(682, 'Login: admin logged in.', '2025-06-03 10:13:51', 1, 1, '103.10.28.138'),
(683, 'Login: admin logged in.', '2025-06-04 10:24:25', 1, 1, '103.10.28.149'),
(684, 'Login: admin logged in.', '2025-06-04 16:05:03', 1, 1, '103.10.28.149'),
(685, 'Login: admin logged in.', '2025-06-05 10:05:40', 1, 1, '103.10.28.152'),
(686, 'Login: admin logged in.', '2025-06-05 10:44:16', 1, 1, '103.10.28.152'),
(687, 'Login: admin logged in.', '2025-06-05 10:46:56', 1, 1, '103.10.28.152'),
(688, 'Changes on Article \'Temple Bell Boutique Hotel & Spa\' has been saved successfully.', '2025-06-05 10:52:32', 1, 4, '103.10.28.152'),
(689, 'Changes on Article \'About Us\' has been saved successfully.', '2025-06-05 10:54:29', 1, 4, '103.10.28.152'),
(690, 'Package Hall Edit Successfully', '2025-06-05 10:57:45', 1, 4, '103.10.28.152'),
(691, 'Package Dining Edit Successfully', '2025-06-05 10:59:53', 1, 4, '103.10.28.152'),
(692, 'Package Accommodation Edit Successfully', '2025-06-05 11:01:53', 1, 4, '103.10.28.152'),
(693, 'Changes on Sub Package \'Buddha Sadan Hall\' has been saved successfully.', '2025-06-05 11:04:06', 1, 4, '103.10.28.152'),
(694, 'Changes on Sub Package \'Bhojan Kakchya\' has been saved successfully.', '2025-06-05 11:07:50', 1, 4, '103.10.28.152'),
(695, 'Changes on Sub Package \'Yak and Yeti Bar\' has been saved successfully.', '2025-06-05 11:11:36', 1, 4, '103.10.28.152'),
(696, 'Login: admin logged in.', '2025-06-05 11:35:57', 1, 1, '103.10.28.152'),
(697, 'Login: admin logged in.', '2025-06-05 13:18:29', 1, 1, '103.10.28.152'),
(698, 'Login: admin logged in.', '2025-06-06 13:02:24', 1, 1, '103.10.28.132'),
(699, 'Login: admin logged in.', '2025-06-06 14:52:35', 1, 1, '103.10.28.132'),
(700, 'Login: admin logged in.', '2025-06-06 17:42:13', 1, 1, '103.10.28.132'),
(701, 'Login: admin logged in.', '2025-06-09 15:11:53', 1, 1, '103.10.28.146'),
(702, 'Login: admin logged in.', '2025-06-09 16:20:52', 1, 1, '103.10.28.146'),
(703, 'Login: admin logged in.', '2025-06-10 13:02:26', 1, 1, '103.10.28.135'),
(704, 'Login: admin logged in.', '2025-06-10 15:48:08', 1, 1, '103.10.28.135'),
(705, 'Login: admin logged in.', '2025-06-11 17:24:51', 1, 1, '103.10.28.158'),
(706, 'Login: admin logged in.', '2025-06-13 16:36:06', 1, 1, '160.250.255.146'),
(707, 'Offers [Step into Luxury] Edit Successfully', '2025-06-13 16:36:25', 1, 4, '160.250.255.146'),
(708, 'Login: superadmin logged in.', '2025-06-17 11:41:13', 1, 1, '27.34.27.29'),
(709, 'Login: admin logged in.', '2025-06-17 12:04:13', 1, 1, '103.10.28.140'),
(710, 'Login: superadmin logged in.', '2025-06-17 13:18:23', 1, 1, '27.34.27.29'),
(711, 'Login: admin logged in.', '2025-06-17 17:01:48', 1, 1, '103.10.28.140'),
(712, 'Login: admin logged in.', '2025-06-18 16:57:17', 1, 1, '103.10.28.152'),
(713, 'Login: admin logged in.', '2025-06-20 11:33:57', 1, 1, '103.10.28.145'),
(714, 'Login: admin logged in.', '2025-06-20 12:36:08', 1, 1, '103.10.28.145'),
(715, 'Login: admin logged in.', '2025-06-23 09:56:54', 1, 1, '103.10.28.136'),
(716, 'Login: admin logged in.', '2025-06-23 10:46:50', 1, 1, '103.10.28.136'),
(717, 'Login: admin logged in.', '2025-06-23 11:19:52', 1, 1, '103.10.28.136'),
(718, 'Login: admin logged in.', '2025-06-23 11:43:23', 1, 1, '103.10.28.136'),
(719, 'Login: admin logged in.', '2025-06-23 16:40:47', 1, 1, '103.10.28.151'),
(720, 'Login: admin logged in.', '2025-06-24 13:04:03', 1, 1, '160.250.254.208'),
(721, 'Login: superadmin logged in.', '2025-06-26 10:32:51', 1, 1, '160.250.255.204'),
(722, 'Offers [Step into Luxury] Edit Successfully', '2025-06-26 10:33:27', 1, 4, '160.250.255.204'),
(723, 'Offers [Step into Luxury] Edit Successfully', '2025-06-26 10:34:02', 1, 4, '160.250.255.204'),
(724, 'Login: admin logged in.', '2025-06-26 16:25:09', 1, 1, '160.250.255.204'),
(725, 'Login: admin logged in.', '2025-06-27 09:39:25', 1, 1, '160.250.255.205'),
(726, 'Login: admin logged in.', '2025-06-27 14:41:36', 1, 1, '160.250.255.205'),
(727, 'Login: admin logged in.', '2025-06-30 10:08:37', 1, 1, '160.250.255.142'),
(728, 'Login: admin logged in.', '2025-06-30 10:15:14', 1, 1, '160.250.255.142'),
(729, 'Login: admin logged in.', '2025-06-30 10:42:57', 1, 1, '160.250.255.142'),
(730, 'Login: admin logged in.', '2025-06-30 11:58:03', 1, 1, '160.250.255.142'),
(731, 'Login: superadmin logged in.', '2025-06-30 16:42:54', 1, 1, '160.250.254.5'),
(732, 'Changes on Config \'Temple Bell Boutique Hotel & Spa, Pokhara - Official site\' has been saved success', '2025-06-30 16:43:29', 1, 4, '160.250.254.5'),
(733, 'Changes on Config \'Temple Bell Boutique Hotel & Spa, Pokhara - Official site\' has been saved success', '2025-06-30 16:44:25', 1, 4, '160.250.254.5'),
(734, 'Login: admin logged in.', '2025-06-30 17:07:09', 1, 1, '160.250.254.5'),
(735, 'Login: admin logged in.', '2025-06-30 17:55:55', 1, 1, '160.250.254.5'),
(736, 'Login: superadmin logged in.', '2025-07-01 10:57:01', 1, 1, '27.34.27.252'),
(737, 'Login: admin logged in.', '2025-07-01 13:20:16', 1, 1, '160.250.255.250'),
(738, 'Login: admin logged in.', '2025-07-01 13:26:16', 1, 1, '160.250.255.250'),
(739, 'Services [Welcome Drink] Edit Successfully', '2025-07-01 13:27:36', 1, 4, '160.250.255.250'),
(740, 'Login: admin logged in.', '2025-07-01 16:59:52', 1, 1, '160.250.255.250'),
(741, 'Login: admin logged in.', '2025-07-01 17:16:46', 1, 1, '160.250.255.250'),
(742, 'User [Temple Bell  ] Edit Successfully', '2025-07-01 17:17:29', 1, 4, '160.250.255.250'),
(743, 'Login: admin logged in.', '2025-07-01 17:18:19', 1, 1, '160.250.255.250'),
(744, 'Login: superadmin logged in.', '2025-07-03 13:50:19', 1, 1, '160.250.255.217'),
(745, 'User [Temple Bell  ] Edit Successfully', '2025-07-03 13:50:50', 1, 4, '160.250.255.217'),
(746, 'User [Super admin  ] Edit Successfully', '2025-07-03 13:50:58', 1, 4, '160.250.255.217'),
(747, 'Login: superadmin logged in.', '2025-07-03 13:51:08', 1, 1, '160.250.255.217'),
(748, 'User [Temple Bell  ] Edit Successfully', '2025-07-03 13:52:17', 1, 4, '160.250.255.217'),
(749, 'Login: superadmin logged in.', '2025-07-03 14:53:48', 1, 1, '160.250.255.217'),
(750, 'Login: superadmin logged in.', '2025-07-18 10:49:54', 1, 1, '160.250.254.205'),
(751, 'Login: superadmin logged in.', '2025-07-18 16:42:16', 1, 1, '160.250.255.206'),
(752, 'Login: admin logged in.', '2025-07-21 13:38:30', 1, 1, '160.250.254.80'),
(753, 'SocialNetworking [facebook] Edit Successfully', '2025-07-21 13:39:16', 1, 4, '160.250.254.80');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs_action`
--

CREATE TABLE `tbl_logs_action` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `bgcolor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_logs_action`
--

INSERT INTO `tbl_logs_action` (`id`, `title`, `icon`, `bgcolor`) VALUES
(1, 'Login', 'icon-sign-in', 'bg-blue'),
(2, 'Logout', 'icon-sign-out', 'primary-bg'),
(3, 'Add', 'icon-plus-circle', 'bg-green'),
(4, 'Edit', 'icon-edit', 'bg-blue-alt'),
(5, 'Copy', 'icon-copy', 'ui-state-default'),
(6, 'Delete', 'icon-clock-os-circle', 'bg-red');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mainservices`
--

CREATE TABLE `tbl_mainservices` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sub_title` text NOT NULL,
  `content` text NOT NULL,
  `linktype` tinyint(1) NOT NULL DEFAULT 0,
  `linksrc` tinytext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `meta_title` tinytext NOT NULL,
  `meta_keywords` varchar(250) NOT NULL,
  `meta_description` varchar(250) NOT NULL,
  `type` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `homepage` int(11) NOT NULL DEFAULT 0,
  `image` blob NOT NULL,
  `date` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_mainservices`
--

INSERT INTO `tbl_mainservices` (`id`, `parent_id`, `slug`, `title`, `sub_title`, `content`, `linktype`, `linksrc`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `type`, `added_date`, `modified_date`, `sortorder`, `homepage`, `image`, `date`, `category`) VALUES
(1, 0, 'spa', 'SPA', 'The Health club Kavre has spa, hot tub and a indoor swimming pool for your refreshment and relaxation.', '<p>\r\n	Get yourself pampered from the professional masseurs of &quot;The Himalayan Healers&quot;: a social entrepreneurship venture, and a a Healing Arts School and collection of Spa Boutiques, with branches in both Nepal and in the United States</p>\r\n', 0, 'about-us', 1, '', '', '', 0, '2023-09-03 12:49:59', '2023-10-30 14:38:42', 2, 1, 0x613a313a7b693a303b733a31343a224e464f374b2d706f6f6c2e6a7067223b7d, '', ''),
(3, 0, 'pool-jacuzzi', 'Pool & Jacuzzi', 'Pool & Jacuzzi', '<p>\r\n	Restaurant is spacious and comfortable and features spectacular views and treats you with large a selection of Chinese, Indian, Nepalese and Continental cuisines. The rustic mountain tavern decor, the cozy fireplace, the beckoning dance floor and of course the delightful choice of wines, cocktails and spirits along with fusion and jazz probably makes it the coziest bar at 7,200 ft.</p>\r\n', 0, '', 1, '', '', '', 0, '2023-09-03 14:08:35', '2023-09-03 14:08:35', 1, 1, 0x613a313a7b693a303b733a31353a226b416550352d706f2d6a752e6a7067223b7d, '', ''),
(4, 0, 'children-play-area-indoor-outdoor', 'Children Play Area Indoor & Outdoor', 'Children Play Area Indoor & Outdoor', '<p>\r\n	Nepal, is home to 10% of the world&#39;s birds which means 800 species of birds. Come see, if you can spot some of these birds in Nagarkot</p>\r\n', 0, '', 1, '', '', '', 0, '2023-09-04 13:12:47', '2023-10-16 14:42:54', 0, 1, 0x613a313a7b693a303b733a31383a2241664a41422d6368696c6472656e2e6a7067223b7d, '', ''),
(5, 0, 'yuvvyuvyui', 'yuvvyuvyui', 'buibu', '<p>\r\n	vyuvyvbyiu</p>\r\n', 1, 'tuyyuv', 1, '', '', '', 0, '2024-01-10 13:22:30', '2024-01-10 13:22:54', 3, 1, 0x613a313a7b693a303b733a32303a2267497674462d666163696c69746965732e6a7067223b7d, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `linksrc` varchar(150) NOT NULL,
  `parentOf` int(11) NOT NULL DEFAULT 0,
  `linktype` varchar(10) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `upcoming` int(11) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `name`, `linksrc`, `parentOf`, `linktype`, `status`, `sortorder`, `added_date`, `type`, `icon`, `upcoming`, `image`) VALUES
(20, 'Who we are', '#about-us', 0, '0', 1, 1, '2024-12-17 10:47:27', 1, '', 1, '0O8wg-info.png'),
(21, 'Reach us', '#mod-map', 0, '0', 1, 2, '2024-12-17 10:48:05', 1, '', 1, '3qbn0-location.png'),
(22, 'Work with us', '#mod-career', 0, '0', 1, 3, '2024-12-17 10:48:31', 1, '', 1, 'Tr93G-career.png'),
(36, 'Home', '#', 0, '0', 1, 1, '2025-02-21 16:13:16', 1, '', 0, ''),
(37, 'About Us', 'about-us', 0, '0', 1, 2, '2025-02-25 11:21:02', 1, '', 0, ''),
(38, 'Rooms', 'accommodation', 0, '0', 1, 3, '2025-02-25 11:30:16', 1, '', 0, ''),
(39, 'Deluxe Single Room', 'deluxe-single-room', 38, '0', 1, 1, '2025-04-16 12:47:31', 1, '', 0, ''),
(40, 'Deluxe Double Room', 'deluxe-double-room', 38, '0', 1, 2, '2025-04-16 12:47:48', 1, '', 0, ''),
(41, 'Dining', 'dining', 0, '0', 1, 4, '2025-04-16 12:51:47', 1, '', 0, ''),
(42, 'Buddha Sadan Hall', 'buddha-sadan-hall', 0, '0', 1, 5, '2025-04-16 12:52:04', 1, '', 0, ''),
(43, 'Gallery', 'gallery-list', 0, '0', 1, 7, '2025-04-16 12:52:40', 1, '', 0, ''),
(44, 'Facilities', 'facilities-list', 0, '0', 1, 8, '2025-04-16 12:53:02', 1, '', 0, ''),
(45, 'Contact Us', 'contact-us', 0, '0', 1, 9, '2025-04-16 12:53:17', 1, '', 0, ''),
(46, 'About the Hotel', 'about-us', 0, '0', 1, 10, '2025-04-16 13:05:48', 2, '', 0, ''),
(47, 'Gallery', 'gallery-list', 0, '0', 1, 11, '2025-04-16 13:06:02', 2, '', 0, ''),
(48, 'Facilities', 'facilities-list', 0, '0', 1, 12, '2025-04-16 13:06:18', 2, '', 0, ''),
(49, 'Restaurant', 'dining', 0, '0', 1, 13, '2025-04-16 13:06:29', 2, '', 0, ''),
(50, 'Meeting & Events', 'buddha-sadan-hall', 0, '0', 1, 14, '2025-04-16 13:06:46', 2, '', 0, ''),
(51, 'Deluxe Triple Room', 'deluxe-triple-room', 38, '0', 1, 3, '2025-04-18 09:55:19', 1, '', 0, ''),
(52, 'Suite Room', 'suite-room', 38, '0', 0, 4, '2025-04-18 09:55:34', 1, '', 0, ''),
(53, 'Bhojan Kakchya', 'bhojan-kakchya', 41, '0', 1, 1, '2025-04-18 09:55:59', 1, '', 0, ''),
(54, 'Aanti', '#', 41, '0', 0, 2, '2025-04-18 09:56:17', 1, '', 0, ''),
(55, 'Yak and Yeti Bar', 'yak-and-yeti-bar', 41, '0', 1, 3, '2025-04-18 09:56:31', 1, '', 0, ''),
(56, 'Offers', 'offer-list', 0, '0', 1, 6, '2025-04-29 10:35:34', 1, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_metadata`
--

CREATE TABLE `tbl_metadata` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `meta_title` tinytext NOT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(250) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL,
  `sortorder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_metadata`
--

INSERT INTO `tbl_metadata` (`id`, `module_id`, `page_name`, `meta_title`, `meta_keywords`, `meta_description`, `added_date`, `modified_date`, `sortorder`) VALUES
(21, 12, 'Contact', 'contact us', 'contact us, customer support, get in touch, business inquiries, email us, contact form, support team, help center, customer service, reach us, call us, feedback form', 'Get in touch with us for inquiries, support, feedback, or collaborations.', '2025-04-18 10:40:21', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mlink`
--

CREATE TABLE `tbl_mlink` (
  `mod_class` varchar(50) NOT NULL,
  `m_url` tinytext NOT NULL,
  `act_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_mlink`
--

INSERT INTO `tbl_mlink` (`mod_class`, `m_url`, `act_id`) VALUES
('Article', 'qs', 16),
('Package', 'asd', 15),
('Subpackage', 'sdf', 46),
('Package', 'accommodation', 2),
('Subpackage', 'deluxe-single-room', 1),
('Subpackage', 'super-deluxe-room', 2),
('Subpackage', 'junior-suite-room', 3),
('Subpackage', 'suite-room', 4),
('Article', 'about-us', 17),
('Package', 'dining', 3),
('Subpackage', 'bhojan-kakchya', 5),
('Package', 'hall', 4),
('Subpackage', 'buddha-sadan-hall', 6),
('Article', 'temple-bell-boutique-hotel-spa', 18),
('Subpackage', 'yak-and-yeti-bar', 7),
('Subpackage', 'aanti', 8),
('Article', 'teset', 19),
('Subpackage', 'deluxe-double-room', 9),
('Subpackage', 'deluxe-triple-room', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modules`
--

CREATE TABLE `tbl_modules` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL DEFAULT 'dashboard',
  `mode` varchar(20) NOT NULL,
  `icon_link` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `upcoming` int(11) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` date NOT NULL,
  `properties` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_modules`
--

INSERT INTO `tbl_modules` (`id`, `parent_id`, `name`, `link`, `mode`, `icon_link`, `status`, `upcoming`, `sortorder`, `added_date`, `properties`) VALUES
(1, 74, 'User Mgmt', 'user/list', 'user', 'icon-users', 1, 1, 1, '2013-04-04', ''),
(2, 0, 'Menu Mgmt', 'menu/list', 'menu', 'icon-list', 1, 1, 2, '2011-06-05', 'a:1:{s:5:\"level\";s:1:\"3\";}'),
(3, 0, 'Articles Mgmt', 'articles/list', 'articles', 'icon-adn', 1, 1, 2, '2013-02-22', 'a:2:{s:8:\"imgwidth\";s:4:\"1920\";s:9:\"imgheight\";s:4:\"1080\";}'),
(4, 0, 'Slideshow Mgmt', 'slideshow/list', 'slideshow', 'icon-film', 1, 1, 2, '2013-02-22', 'a:2:{s:8:\"imgwidth\";s:4:\"1920\";s:9:\"imgheight\";s:4:\"1080\";}'),
(5, 0, 'Gallery Mgmt', 'gallery/list', 'gallery', 'icon-picture-o', 1, 0, 6, '0000-00-00', 'a:4:{s:8:\"imgwidth\";s:4:\"1920\";s:9:\"imgheight\";s:4:\"1080\";s:9:\"simgwidth\";s:4:\"1920\";s:10:\"simgheight\";s:4:\"1080\";}'),
(6, 0, 'News Mgmt', 'news/list', 'news', 'icon-list-alt', 0, 0, 19, '2020-02-12', 'a:2:{s:8:\"imgwidth\";s:3:\"300\";s:9:\"imgheight\";s:3:\"300\";}'),
(7, 0, 'Event Mgmt', 'events/list', 'events', 'icon-bullhorn', 0, 0, 10, '2020-12-20', ''),
(8, 0, 'Advertisement Mgmt', 'advertisement/list', 'advertisement', 'icon-indent', 0, 0, 4, '0000-00-00', 'a:8:{s:9:\"limgwidth\";s:3:\"100\";s:10:\"limgheight\";s:3:\"200\";s:9:\"timgwidth\";s:3:\"300\";s:10:\"timgheight\";s:3:\"400\";s:9:\"rimgwidth\";s:3:\"500\";s:10:\"rimgheight\";s:3:\"600\";s:9:\"bimgwidth\";s:3:\"700\";s:10:\"bimgheight\";s:3:\"800\";}'),
(9, 0, 'Video Mgmt', 'video/list', 'video', 'icon-hdd-o', 0, 0, 13, '0000-00-00', ''),
(10, 0, 'Poll Mgmt', 'poll/list', 'poll', 'icon-exchange', 0, 0, 22, '0000-00-00', ''),
(11, 0, 'Social / OTA Mgmt', 'social/list', 'social', 'icon-google-plus', 1, 1, 6, '2013-02-22', 'a:2:{s:8:\"imgwidth\";s:2:\"50\";s:9:\"imgheight\";s:2:\"50\";}'),
(12, 0, 'Setting Mgmt', 'setting/list', 'settings', 'icon-gear', 1, 1, 21, '2013-02-22', ''),
(13, 12, 'Preference Mgmt', 'preference/list', 'preference', 'icon-gear', 1, 0, 1, '0000-00-00', 'a:18:{s:8:\"imgwidth\";s:2:\"50\";s:9:\"imgheight\";s:2:\"50\";s:9:\"simgwidth\";s:2:\"50\";s:10:\"simgheight\";s:2:\"50\";s:10:\"fbimgwidth\";s:4:\"1200\";s:11:\"fbimgheight\";s:3:\"630\";s:9:\"timgwidth\";s:4:\"1200\";s:10:\"timgheight\";s:3:\"630\";s:9:\"gimgwidth\";s:4:\"1920\";s:10:\"gimgheight\";s:4:\"1080\";s:9:\"cimgwidth\";s:4:\"1920\";s:10:\"cimgheight\";s:4:\"1080\";s:9:\"oimgwidth\";s:4:\"1920\";s:10:\"oimgheight\";s:4:\"1080\";s:9:\"fimgwidth\";s:4:\"1920\";s:10:\"fimgheight\";s:4:\"1080\";s:10:\"ofimgwidth\";s:4:\"1920\";s:11:\"ofimgheight\";s:4:\"1080\";}'),
(14, 12, 'Office Info/Location', 'location/list', 'location', 'icon-gear', 1, 0, 2, '0000-00-00', ''),
(15, 12, 'Modules Mgmt', 'module/list', 'module', 'icon-gear', 0, 0, 3, '0000-00-00', ''),
(16, 12, 'Properties Mgmt', 'properties/list', 'properties', 'icon-gear', 1, 0, 4, '0000-00-00', ''),
(17, 0, 'Testimonial', 'testimonial/list', 'testimonial', 'icon-list-alt', 0, 0, 6, '2025-04-25', 'a:2:{s:8:\"imgwidth\";s:2:\"50\";s:9:\"imgheight\";s:2:\"50\";}'),
(18, 0, 'Subscribers Mgmt', 'subscribers/list', 'subscribers', 'icon-comments', 0, 0, 14, '2015-05-17', ''),
(19, 0, 'Offers Mgmt', 'offers/list', 'offers', 'icon-tags', 1, 0, 18, '2015-05-20', 'a:4:{s:9:\"bimgwidth\";s:4:\"1920\";s:10:\"bimgheight\";s:4:\"1080\";s:8:\"imgwidth\";s:4:\"1920\";s:9:\"imgheight\";s:4:\"1080\";}'),
(20, 0, 'Services Mgmt', 'services/list', 'services', 'icon-exchange', 1, 0, 5, '2015-08-09', 'a:2:{s:8:\"imgwidth\";s:2:\"50\";s:9:\"imgheight\";s:2:\"50\";}'),
(21, 0, 'Movies Mgmt', 'movies/list', 'movies', 'icon-list', 0, 0, 15, '2015-10-30', ''),
(22, 0, 'Theaters', 'theaters/list', 'theaters', 'icon-film', 0, 0, 17, '2015-11-01', ''),
(23, 25, 'Package Mgmt', 'package/list', 'package', 'icon-exchange', 1, 0, 5, '2016-06-17', 'a:6:{s:8:\"imgwidth\";s:5:\"1920`\";s:9:\"imgheight\";s:4:\"1080\";s:12:\"subbimgwidth\";s:4:\"1920\";s:13:\"subbimgheight\";s:4:\"1080\";s:11:\"subimgwidth\";s:4:\"1920\";s:12:\"subimgheight\";s:4:\"1080\";}'),
(24, 25, 'Features Mgmt', 'features/list', 'features', 'icon-gear', 1, 0, 1, '2016-11-16', ''),
(25, 0, 'Package Mgmt', 'package/list', '', 'icon-bullhorn', 1, 0, 4, '2016-11-16', ''),
(26, 0, 'Activity Mgmt', 'activity/list', 'activity', '\r\nicon-hand-o-left', 0, 0, 7, '0000-00-00', 'a:4:{s:8:\"imgwidth\";s:3:\"800\";s:9:\"imgheight\";s:3:\"600\";s:9:\"simgwidth\";s:3:\"400\";s:10:\"simgheight\";s:3:\"350\";}'),
(27, 0, 'Blog Mgmt', 'blog/list', 'blog', '\r\n\r\nicon-list-alt', 0, 0, 8, '2025-04-25', 'a:2:{s:8:\"imgwidth\";s:4:\"1920\";s:9:\"imgheight\";s:4:\"1080\";}'),
(28, 0, 'Popup', 'popup/list', 'popup', 'icon-list', 1, 0, 20, '2020-02-13', 'a:2:{s:8:\"imgwidth\";s:3:\"100\";s:9:\"imgheight\";s:3:\"300\";}'),
(29, 0, ' News/Events Mgmt', 'combinednews/list', 'combinednews', 'icon-tags', 0, 0, 14, '2020-09-05', 'a:2:{s:8:\"imgwidth\";s:3:\"350\";s:9:\"imgheight\";s:3:\"240\";}'),
(30, 0, 'Product Mgmt', 'product/list', 'product', 'icon-list', 0, 0, 1, '2021-11-25', ''),
(55, 0, 'Applicant Mgmt', 'applicant/list', 'applicant', 'icon-adn', 0, 1, 10, '2024-12-19', ''),
(74, 0, 'Users', '', '', 'icon-users', 1, 1, 1, '2021-10-03', ''),
(300, 0, 'FAQ', 'faq/list', 'faq', 'icon-list', 0, 0, 8, '2023-08-31', ''),
(301, 0, 'Nearby ', 'nearby/list', 'nearby', 'icon-list', 0, 0, 8, '2023-08-29', 'a:2:{s:8:\"imgwidth\";s:4:\"1920\";s:9:\"imgheight\";s:4:\"1080\";}'),
(302, 0, 'Vacancy Mgmt', 'vacency/list', 'vacency', 'icon-list', 0, 0, 7, '2023-08-28', ''),
(303, 0, 'Main service Mgt', 'mservices/list', 'mservice', 'icon-list', 0, 0, 6, '2023-09-01', 'a:2:{s:8:\"imgwidth\";s:2:\"12\";s:9:\"imgheight\";s:2:\"12\";}'),
(304, 0, 'OTA Mgmt', 'ota/list', 'ota', 'icon-google-plus', 0, 0, 12, '0000-00-00', 'a:2:{s:8:\"imgwidth\";s:2:\"14\";s:9:\"imgheight\";s:2:\"13\";}'),
(305, 0, 'Nearby ', 'nearby/list', 'nearby', 'icon-list', 0, 0, 8, '2023-08-29', ''),
(306, 74, 'User Group', 'usergroup/list', 'usergroup', 'icon-gears', 1, 1, 3, '2023-10-10', ''),
(309, 0, 'Download Mgmt', 'download/list', 'download', 'icon-gear', 0, 0, 7, '2024-03-28', ''),
(310, 0, 'Virtual Tour', 'virtualtour/list', 'virtualtour', 'icon-list', 1, 0, 4, '2025-01-23', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nearby`
--

CREATE TABLE `tbl_nearby` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sub_title` text NOT NULL,
  `content` text NOT NULL,
  `linktype` tinyint(1) NOT NULL DEFAULT 0,
  `linksrc` tinytext NOT NULL,
  `google_embeded` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `meta_title` tinytext NOT NULL,
  `meta_keywords` varchar(250) NOT NULL,
  `meta_description` varchar(250) NOT NULL,
  `type` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `homepage` int(11) NOT NULL DEFAULT 0,
  `image` blob NOT NULL,
  `date` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `distance` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(250) NOT NULL,
  `author` varchar(100) NOT NULL,
  `brief` mediumtext NOT NULL,
  `content` mediumtext NOT NULL,
  `news_date` date NOT NULL,
  `archive_date` date DEFAULT NULL,
  `sortorder` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `image` varchar(50) NOT NULL,
  `source` longtext NOT NULL,
  `type` int(11) NOT NULL,
  `viewcount` int(11) NOT NULL DEFAULT 0,
  `meta_keywords` varchar(250) NOT NULL,
  `meta_description` varchar(250) NOT NULL,
  `added_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_offers`
--

CREATE TABLE `tbl_offers` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `list_image` varchar(255) NOT NULL,
  `adults` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `linksrc` varchar(255) NOT NULL,
  `linktype` tinyint(1) NOT NULL DEFAULT 0,
  `rate` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `brief` tinytext NOT NULL,
  `content` longtext NOT NULL,
  `offerpopup` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `added_date` varchar(50) NOT NULL,
  `offer_date` varchar(50) NOT NULL,
  `start_date` varchar(50) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_offers`
--

INSERT INTO `tbl_offers` (`id`, `slug`, `title`, `image`, `list_image`, `adults`, `children`, `linksrc`, `linktype`, `rate`, `discount`, `brief`, `content`, `offerpopup`, `status`, `added_date`, `offer_date`, `start_date`, `sortorder`, `type`) VALUES
(4, 'step-into-luxury', 'Step into Luxury', '', 'WDMOf-obpJF-offer2.jpeg', 0, 0, '', 0, 0, 0, '', '', '1', 0, '2025-04-29 10:21:59', '2025-05-31', '2025-04-29', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_offer_child`
--

CREATE TABLE `tbl_offer_child` (
  `offer_id` int(11) NOT NULL,
  `offer_pax` varchar(200) NOT NULL,
  `offer_usd` varchar(10) NOT NULL,
  `offer_inr` varchar(10) NOT NULL,
  `offer_npr` varchar(10) NOT NULL,
  `offer_no` int(11) NOT NULL,
  `multi_offer_title` varchar(255) NOT NULL,
  `multi_offer_npr` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ota`
--

CREATE TABLE `tbl_ota` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `linksrc` tinytext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `sortorder` int(11) NOT NULL,
  `registered` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_ota`
--

INSERT INTO `tbl_ota` (`id`, `title`, `image`, `icon`, `linksrc`, `status`, `sortorder`, `registered`) VALUES
(7, 'booking', 'guqcq-bo.png', '', '#', 1, 1, ''),
(8, 'agoda', '8fj3b-ag.png', '', '#', 1, 2, ''),
(9, 'expedia', 'hhqsu-ex.png', '', '#', 1, 3, ''),
(10, 'tripadvisor', 'qw86F-ta.png', '', '#', 1, 4, ''),
(11, 'Make My Trip', 'sFzjy-ma.png', '', '#', 1, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package`
--

CREATE TABLE `tbl_package` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(250) NOT NULL,
  `sub_title` text NOT NULL,
  `image` varchar(50) NOT NULL,
  `header_image` text NOT NULL,
  `banner_image` mediumtext NOT NULL,
  `detail` longtext NOT NULL,
  `content` mediumtext NOT NULL,
  `meta_title` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_package`
--

INSERT INTO `tbl_package` (`id`, `slug`, `title`, `sub_title`, `image`, `header_image`, `banner_image`, `detail`, `content`, `meta_title`, `meta_keywords`, `meta_description`, `status`, `sortorder`, `added_date`, `modified_date`, `type`) VALUES
(2, 'accommodation', 'Accommodation', 'Luxurious Accommodations', '', '', 'a:1:{i:0;s:23:\"uRo8g-accommodation.jpg\";}', '', '<p>\r\n	Temple Bell Boutique Hotel &amp; Spa in Pokhara offers elegantly designed accommodations that blend modern comfort with traditional Nepalese charm. Guests can choose from Deluxe Single, Deluxe Double, and Deluxe Triple Rooms.</p>\r\n', 'Accommodation', 'Temple Bell Boutique Hotel, Pokhara, elegantly designed accommodations, modern comfort, traditional Nepalese charm, Deluxe Single Room, Deluxe Double Room, Deluxe Triple Room, boutique hotel, luxury stay, cultural design, comfortable lodging', 'Temple Bell Boutique Hotel & Spa in Pokhara offers elegantly designed accommodations that blend modern comfort with traditional Nepalese charm.\r\n\r\n', 1, 1, '2025-04-16 13:02:31', '2025-06-05 11:01:53', 1),
(3, 'dining', 'Dining', 'Dining', '', '', 'a:1:{i:0;s:14:\"t6aao-Try2.jpg\";}', '', '<p>\r\n	Temple Bell Boutique Hotel &amp; Spa in Pokhara offers a refined dining experience featuring a blend of local and international flavors. Guests can enjoy authentic Nepalese cuisine alongside continental and Asian dishes, prepared with fresh ingredients.</p>\r\n', 'Dining', 'Temple Bell Boutique Hotel, Pokhara, refined dining experience, local flavors, international cuisine, authentic Nepalese cuisine, continental dishes, Asian dishes, fresh ingredients, gourmet dining, culinary fusion, hotel restaurant, fine dining.', 'Temple Bell Boutique Hotel & Spa in Pokhara offers a refined dining experience featuring a blend of local and international flavors guests can enjoy.\r\n', 1, 2, '2025-04-17 09:15:33', '2025-06-05 10:59:53', 0),
(4, 'hall', 'Hall', 'Hall', '', '', 'a:0:{}', '', '<p>\r\n	Temple Bell Boutique Hotel &amp; Spa in Pokhara features the Buddha Sadan Hall, an elegant venue designed for meetings, conferences, and special events. The hall blends modern amenities with traditional Nepalese charm</p>\r\n', 'Hall', 'Temple Bell Boutique Hotel, Pokhara, Buddha Sadan Hall, elegant venue, meetings, conferences, special events, modern amenities, traditional Nepalese charm, event space, corporate events, cultural venue, boutique hotel, professional gatherings, heritage', 'Temple Bell Boutique Hotel & Spa in Pokhara features the Buddha Sadan Hall, an elegant venue designed for meetings, conferences, and special events \r\n', 1, 3, '2025-04-17 14:02:23', '2025-06-05 10:57:45', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package_sub`
--

CREATE TABLE `tbl_package_sub` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sub_title` varchar(200) NOT NULL,
  `detail` longtext NOT NULL,
  `image` mediumtext NOT NULL,
  `header_image` text NOT NULL,
  `be_room_type` text NOT NULL,
  `image2` varchar(200) NOT NULL,
  `image3` varchar(255) NOT NULL,
  `source_vid` varchar(255) NOT NULL,
  `three60_image` varchar(255) NOT NULL,
  `rojai_room_id` varchar(255) NOT NULL,
  `image4` varchar(200) NOT NULL,
  `feature` blob NOT NULL,
  `content` mediumtext NOT NULL,
  `facility_title` varchar(255) NOT NULL,
  `number_room` int(11) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `discount` int(11) NOT NULL,
  `people_qnty` int(11) NOT NULL,
  `onep_price` int(11) NOT NULL,
  `twop_price` int(11) NOT NULL,
  `threep_price` int(11) NOT NULL,
  `oneb_price` int(11) NOT NULL,
  `twob_price` int(11) NOT NULL,
  `threeb_price` int(11) NOT NULL,
  `extra_bed` varchar(10) NOT NULL,
  `short_title` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `serve` varchar(255) NOT NULL,
  `theatre_style` varchar(255) NOT NULL,
  `class_room_style` varchar(255) NOT NULL,
  `shape` varchar(255) NOT NULL,
  `round_table` varchar(255) NOT NULL,
  `clusture` varchar(255) NOT NULL,
  `cocktail` varchar(255) NOT NULL,
  `seats` varchar(20) NOT NULL,
  `meta_title` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `below_content` mediumtext NOT NULL,
  `seminar` varchar(50) NOT NULL,
  `meeting` varchar(50) NOT NULL,
  `events` varchar(50) NOT NULL,
  `conference` varchar(50) NOT NULL,
  `catering` varchar(50) NOT NULL,
  `celebration` varchar(50) NOT NULL,
  `organic_food` varchar(50) NOT NULL,
  `occupancy` varchar(50) NOT NULL,
  `view` varchar(50) NOT NULL,
  `size` varchar(50) NOT NULL,
  `service` varchar(50) NOT NULL,
  `live_music` varchar(50) NOT NULL,
  `bed` varchar(50) NOT NULL,
  `room_size` varchar(50) NOT NULL,
  `room_service` varchar(50) NOT NULL,
  `airport_pickup` varchar(50) NOT NULL,
  `private_balcony` varchar(50) NOT NULL,
  `checkinout` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_package_sub`
--

INSERT INTO `tbl_package_sub` (`id`, `slug`, `title`, `sub_title`, `detail`, `image`, `header_image`, `be_room_type`, `image2`, `image3`, `source_vid`, `three60_image`, `rojai_room_id`, `image4`, `feature`, `content`, `facility_title`, `number_room`, `currency`, `discount`, `people_qnty`, `onep_price`, `twop_price`, `threep_price`, `oneb_price`, `twob_price`, `threeb_price`, `extra_bed`, `short_title`, `time`, `location`, `serve`, `theatre_style`, `class_room_style`, `shape`, `round_table`, `clusture`, `cocktail`, `seats`, `meta_title`, `meta_keywords`, `meta_description`, `status`, `sortorder`, `added_date`, `modified_date`, `type`, `below_content`, `seminar`, `meeting`, `events`, `conference`, `catering`, `celebration`, `organic_food`, `occupancy`, `view`, `size`, `service`, `live_music`, `bed`, `room_size`, `room_service`, `airport_pickup`, `private_balcony`, `checkinout`) VALUES
(1, 'deluxe-single-room', 'Deluxe Single Room', '', 'Enjoy a peaceful and comfortable stay in our Deluxe Single Room, perfect for solo travelers. The room features warm wooden interiors and soft lighting, creating a relaxing atmosphere.\r\n\r\n', 'a:1:{i:0;s:21:\"uPnXw-Deluxe-Room.jpg\";}', '', '', '', '', '', '', '', '', 0x613a323a7b693a32353b613a323a7b693a303b613a313a7b693a303b733a303a22223b7d693a313b733a303a22223b7d693a31373b613a323a7b693a303b613a313a7b693a303b733a303a22223b7d693a313b613a31353a7b693a303b733a323a223232223b693a313b733a323a223230223b693a323b733a323a223139223b693a333b733a323a223138223b693a343b733a323a223435223b693a353b733a323a223434223b693a363b733a323a223432223b693a373b733a323a223431223b693a383b733a323a223430223b693a393b733a323a223338223b693a31303b733a323a223337223b693a31313b733a323a223336223b693a31323b733a323a223231223b693a31333b733a323a223437223b693a31343b733a323a223436223b7d7d7d, '<p>\r\n	The Deluxe Single Room at Temple Bell Boutique Hotel &amp; Spa is designed for solo travelers seeking a peaceful and comfortable stay. Guests can enjoy a cozy single bed with soft linens and vibrant accents, ensuring a restful sleep.</p>\r\n', '', 0, 'USD', 0, 0, 125, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 'Deluxe Single Room', 'Deluxe Single Room, Temple Bell Boutique Hotel & Spa, solo travelers, peaceful stay, comfortable, 200 sq. ft., wooden interiors, soft lighting, relaxing ambiance, cozy single bed, soft linens, vibrant accents, restful sleep, functional desk.\r\n', 'The Deluxe Single Room at Temple Bell Boutique Hotel & Spa is designed for solo travelers seeking a peaceful and comfortable stay. Guests can enjoy a cozy single bed with soft linens and vibrant accents, ensuring a restful sleep.\r\n\r\n', 1, 9, '2025-04-16 13:03:23', '2025-05-14 15:15:19', 2, '', '', '', '', '', '', '', '', '1 Adults', '', '', '', '', '', '200 sq.ft.', '', '', '', ''),
(2, 'super-deluxe-room', 'Super Deluxe Room', '', 'Experience comfort in our Super Deluxe Room, crafted with wooden walls, stone accents, and warm lighting for a cozy ambiance. The spacious room features a large bed adorned with vibrant pillows and a stylish cover, making it an ideal spot to unwind after a busy day.\r\n\r\n', 'a:1:{i:0;s:22:\"sx0VA-Super-Deluxe.jpg\";}', '', '', '', '', '', '', '', '', 0x613a303a7b7d, '<p style=\"text-align: justify;\">\r\n	Experience comfort in our Super Deluxe Room, crafted with wooden walls, stone accents, and warm lighting for a cozy ambiance. The spacious room features a large bed adorned with vibrant pillows and a stylish cover, making it an ideal spot to unwind after a busy day. A wooden desk, a comfortable seating area, and ample space enhance convenience, while every detail is designed for a relaxing and enjoyable stay.</p>\r\n', '', 0, 'USD', 0, 0, 195, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 6, '2025-04-16 13:03:38', '2025-04-18 13:06:47', 2, '', '', '', '', '', '', '', '', '3 Adults', '', '', '', '', '', '250 sq.ft', '', '', '', ''),
(3, 'junior-suite-room', 'Junior Suite Room', '', 'The Junior Suite is designed to provide a relaxing and comfortable stay, featuring twin beds with soft linens and pillows for a restful sleep. A cozy living area with warm lighting offers the perfect spot to unwind, while large windows showcase stunning views of Pokhara’s beautiful landscapes.\n\n', 'a:1:{i:0;s:22:\"UNVtu-Junior-Suite.jpg\";}', '', '5047800', '', '', '', '', '', '', 0x613a303a7b7d, '<p style=\"text-align: justify;\">\n	The Junior Suite is designed to provide a relaxing and comfortable stay, featuring twin beds with soft linens and pillows for a restful sleep. A cozy living area with warm lighting offers the perfect spot to unwind, while large windows showcase stunning views of Pokhara&rsquo;s beautiful landscapes. The suite also includes a flat-screen TV, Wi-Fi, a minibar, and a spacious bathroom with premium toiletries.</p>\n', '', 0, 'USD', 0, 0, 250, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 5, '2025-04-16 13:03:58', '2025-04-18 13:08:00', 2, '', '', '', '', '', '', '', '', '3 Adults', '', '', '', '', '', '300 sq.ft', '', '', '', ''),
(4, 'suite-room', 'Suite Room', '', 'Experience unmatched comfort in the Suite Room at Temple Bell. Thoughtfully designed, the room features a spacious layout with stylish furnishings and a warm inviting ambiance.\n\n', 'a:0:{}', '', '5047799', '', '', '', '', '', '', 0x613a303a7b7d, '<p style=\"text-align: justify;\">\n	Experience unmatched comfort in the Suite Room at Temple Bell. Thoughtfully designed, the room features a spacious layout with stylish furnishings and a warm inviting ambiance. The suite includes a plush king-size bed, a cozy living area, and large windows that fill the space with natural light. Equipped with modern amenities making the Suite Room an ideal choice for a relaxing and memorable stay.</p>\n', '', 0, 'USD', 0, 0, 350, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 4, '2025-04-16 13:04:10', '2025-04-18 12:14:52', 2, '', '', '', '', '', '', '', '', '3 Adults', '', '', '', '', '', '350 sq.ft', '', '', '', ''),
(5, 'bhojan-kakchya', 'Bhojan Kakchya', '', 'Delight in a vibrant dining experience at Bhojan Kakchya, our spacious all-day dining restaurant with a capacity of 90 guests. Begin your day with a delightful breakfast spread, offering American, Indian, Continental, and Asian options, all crafted to perfection.', 'a:1:{i:0;s:14:\"LnfVa-Dine.jpg\";}', '', '', '', '', '', '', '', '', 0x613a303a7b7d, '<p style=\"text-align: justify;\">\r\n	Bhojan Kakchya is the signature restaurant at Temple Bell Boutique Hotel &amp; Spa, offering a delightful culinary experience with a diverse menu. Guests can enjoy a selection of Chinese, British, Nepalese, Pizza, Thai, Local, and Grill/BBQ cuisines, catering to various tastes and preferences.</p>\r\n', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '7:00 AM to 11:00 PM', '', '', '90 pax', '', '', '', 'Bhojan Kakchya', 'Bhojan Kakchya, vibrant dining experience, all-day dining, spacious restaurant, 90 guest capacity, breakfast spread, American cuisine, Indian cuisine, Continental cuisine, Asian cuisine, crafted to perfection, hotel restaurant, gourmet breakfast.\r\n', 'Delight in a vibrant dining experience at Bhojan Kakchya, our spacious all-day dining restaurant with a capacity of 90 guests. Begin your day with a breakfast \r\n\r\n', 1, 6, '2025-04-17 13:19:26', '2025-06-05 11:07:50', 3, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'All Day', '', '', ''),
(6, 'buddha-sadan-hall', 'Buddha Sadan Hall', '', 'Buddha Sadan is a spacious and well-equipped hall, ideal for hosting meetings, events, and gatherings. With an area of 1250 square feet, it offers flexible seating arrangements, such as a U-shape for 60 people, a classroom setup for 70, a theatre-style for 130, or a round-table layout for 76 guests.', 'a:0:{}', '', '', '', '', '', '', '', '', 0x613a323a7b693a32353b613a323a7b693a303b613a313a7b693a303b733a303a22223b7d693a313b613a31303a7b693a303b733a323a223330223b693a313b733a323a223239223b693a323b733a323a223238223b693a333b733a323a223237223b693a343b733a323a223236223b693a353b733a323a223331223b693a363b733a323a223335223b693a373b733a323a223334223b693a383b733a323a223333223b693a393b733a323a223332223b7d7d693a31373b613a323a7b693a303b613a313a7b693a303b733a303a22223b7d693a313b733a303a22223b7d7d, '<p class=\"lh-lg\" style=\"text-align:justify\">\r\n	Buddha Sadan is a spacious and well-equipped hall, ideal for hosting meetings, events, and gatherings. With an area of 1250 square feet, it offers flexible seating arrangements, such as a U-shape for 60 people, a classroom setup for 70, a theatre-style for 130, or a round-table layout for 76 guests. This versatility ensures that your event can be tailored to your needs, whether it&#39;s formal or casual.</p>\r\n<p class=\"lh-lg\" style=\"text-align:justify\">\r\n	The hall comes with modern amenities, including a projector, PA system, computer/laptop, whiteboard, and more. Additional features like printing services, flip charts, pin boards, and writing pads make it convenient for all kinds of events. To capture your special moments, photography and videography services are available, creating a smooth and memorable experience for you and your guests.</p>\r\n', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 'Buddha Sadan Hall', '', '', '', '130 Pax	', '70 Pax', '60 Pax', '76 Pax', '', '', '', 'Buddha Sadan Hall', 'Buddha Sadan, spacious hall, well-equipped hall, meetings, events, gatherings, 1250 square feet, flexible seating arrangements, U-shape setup, classroom setup, theatre-style setup, round-table layout, event venue, conference hall, Pokhara event space\r\n', 'The Buddha Sadan Hall at Temple Bell Boutique Hotel & Spa is a spacious and well-equipped venue designed for meetings, events, and gatherings \r\n\r\n\r\n\r\n', 1, 1, '2025-04-17 15:28:49', '2025-06-05 11:04:06', 4, '', '', '', '', '', '', '', '', '', '', '1250 sq.ft.', '', '', '', '', '', '', '', ''),
(7, 'yak-and-yeti-bar', 'Yak and Yeti Bar', '', 'Discover a relaxed and stylish setting at Yak & Yeti Bar, our cozy space accommodating up to 35 guests. Whether you start your morning with a refreshing drink or wind down after a long day, Yak & Yeti Bar offers the perfect spot to enjoy quality moments.\r\n\r\n', 'a:1:{i:0;s:14:\"5UFpG-bar2.jpg\";}', '', '', '', '', '', '', '', '', 0x613a303a7b7d, '<p style=\"text-align: justify;\">\r\n	The Yak and Yeti Bar at Temple Bell Boutique Hotel &amp; Spa offers a relaxed and stylish setting, perfect for unwinding. Accommodating up to 35 guests, this cozy space provides an inviting atmosphere for both casual drinks and special celebrations.</p>\r\n<p style=\"text-align: justify;\">\r\n	Guests can enjoy a variety of classic cocktails and refreshing mocktails, expertly crafted by skilled bartenders. The bar operates all day from 7:00 AM to 11:00 PM, ensuring a seamless experience whether you&#39;re starting your morning with a refreshing drink or winding down after a long day.</p>\r\n', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '7:00 AM to 11:00 PM', '', '', '35 pax', '', '', '', 'Yak and Yeti Bar', 'Yak & Yeti Bar, relaxed setting, stylish space, cozy bar, 35 guest capacity, refreshing drinks, morning drinks, evening relaxation, quality moments, casual atmosphere, hotel bar, social spot, Pokhara nightlife, intimate gathering place\r\n', 'Discover a relaxed and stylish setting at Yak & Yeti Bar, our cozy space accommodating up to 35 guests. Whether you start your morning with a refreshing drink\r\n\r\n', 1, 5, '2025-04-18 12:02:08', '2025-06-05 11:11:36', 3, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'All Day', '', '', ''),
(8, 'aanti', 'Aanti ', '', 'Discover the charm of intimate dining at Aanti, our cozy restaurant designed for up to 44 guests. It is the perfect place to enjoy a calm and relaxing meal.', 'a:0:{}', '', '', '', '', '', '', '', '', 0x613a303a7b7d, '<p style=\"text-align: justify;\">\r\n	Discover the charm of intimate dining at Aanti, our cozy restaurant designed for up to 44 guests. It is the perfect place to enjoy a calm and relaxing meal. The menu offers a variety of options, including local dishes and international favorites, all prepared with care to delight your taste buds. Whether you&#39;re having a quiet meal or celebrating a special moment, Aanti&rsquo;s warm and welcoming atmosphere ensures a memorable experience. With friendly service and a focus on quality, every meal at Aanti is special.</p>\r\n', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '7:00 am to 11:00pm', '', '', '44 pax', '', '', '', '', '', '', 0, 7, '2025-04-18 12:17:39', '2025-04-18 17:17:12', 3, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'All Day', '', '', ''),
(9, 'deluxe-double-room', 'Deluxe Double Room', '', 'Deluxe Double Room is designed to provide a relaxing & comfortable stay, featuring twin beds with soft linens & pillows for a restful sleep. A cozy living area with warm lighting offers perfect spot to unwind.\n\n', 'a:1:{i:0;s:22:\"JBYHT-Junior-Suite.jpg\";}', '', '5047786', '', '', '', '', '', '', 0x613a323a7b693a32353b613a323a7b693a303b613a313a7b693a303b733a303a22223b7d693a313b733a303a22223b7d693a31373b613a323a7b693a303b613a313a7b693a303b733a303a22223b7d693a313b613a31353a7b693a303b733a323a223435223b693a313b733a323a223434223b693a323b733a323a223432223b693a333b733a323a223431223b693a343b733a323a223430223b693a353b733a323a223338223b693a363b733a323a223337223b693a373b733a323a223336223b693a383b733a323a223232223b693a393b733a323a223231223b693a31303b733a323a223230223b693a31313b733a323a223139223b693a31323b733a323a223438223b693a31333b733a323a223437223b693a31343b733a323a223436223b7d7d7d, '<p style=\"text-align: justify;\">\n	The Deluxe Double Room at Temple Bell Boutique Hotel &amp; Spa is designed to provide a relaxing and comfortable stay. It also have twin beds with soft linens and pillows, ensuring a restful sleep.</p>\n', '', 0, 'USD', 0, 0, 150, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 'Deluxe Double Room', 'Deluxe Double Room,  relaxing stay, comfortable, 200 sq. ft., twin beds, soft linens, pillows, restful sleep, cozy living area, warm lighting, large windows, stunning views, Pokhara landscapes, modern amenities, Wi-Fi, flat-screen TV,  minibar.\n', 'The Deluxe Double Room at Temple Bell Boutique Hotel & Spa is designed to provide a relaxing and comfortable stay. It also have twin beds with soft linens and pillows, ensuring a restful sleep\n\n', 1, 8, '2025-04-18 13:16:56', '2025-05-14 15:15:36', 2, '', '', '', '', '', '', '', '', '2 Adults', '', '', '', '', '', '200 sq.ft', '', '', '', ''),
(10, 'deluxe-triple-room', 'Deluxe Triple Room', '', 'Experience comfort in our Deluxe Triple Room, crafted with wooden walls, stone accents, and warm lighting for a cozy ambiance. The spacious room features a large bed adorned with vibrant pillows.', 'a:1:{i:0;s:16:\"VYZsd-triple.jpg\";}', '', '', '', '', '', '', '', '', 0x613a323a7b693a32353b613a323a7b693a303b613a313a7b693a303b733a303a22223b7d693a313b733a303a22223b7d693a31373b613a323a7b693a303b613a313a7b693a303b733a303a22223b7d693a313b613a31353a7b693a303b733a323a223439223b693a313b733a323a223434223b693a323b733a323a223433223b693a333b733a323a223432223b693a343b733a323a223431223b693a353b733a323a223339223b693a363b733a323a223337223b693a373b733a323a223336223b693a383b733a323a223233223b693a393b733a323a223232223b693a31303b733a323a223231223b693a31313b733a323a223230223b693a31323b733a323a223139223b693a31333b733a323a223138223b693a31343b733a323a223436223b7d7d7d, '<p>\r\n	The Deluxe Triple Room at Temple Bell Boutique Hotel &amp; Spa offers a spacious and cozy retreat for small groups or families. this room is designed with wooden walls.</p>\r\n', '', 0, 'USD', 0, 0, 195, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 'Deluxe Triple Room', 'Deluxe Triple Room, Temple Bell Boutique Hotel & Spa, spacious retreat, cozy ambiance, small groups, families, 250 sq. ft., wooden walls, stone accents, warm lighting, comfortable atmosphere, relaxing stay, large bed,  private balcony, premium toiletries.\r\n\r\n', 'The Deluxe Triple Room at Temple Bell Boutique Hotel & Spa offers a spacious and cozy retreat for small groups or families. this room is designed with wooden walls.\r\n\r\n', 1, 7, '2025-04-18 13:24:17', '2025-05-14 15:15:55', 2, '', '', '', '', '', '', '', '', '2 Adults + 1 Child', '', '', '', '', '', '250 sq.ft', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission`
--

CREATE TABLE `tbl_permission` (
  `id` int(11) NOT NULL,
  `type` varchar(5) NOT NULL,
  `group_id` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `module_id` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_popup`
--

CREATE TABLE `tbl_popup` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `date1` date NOT NULL,
  `date2` date NOT NULL,
  `image` varchar(200) NOT NULL,
  `source` varchar(250) NOT NULL,
  `linktype` varchar(150) NOT NULL,
  `linksrc` varchar(250) NOT NULL,
  `position` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `slug` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_popup`
--

INSERT INTO `tbl_popup` (`id`, `title`, `date1`, `date2`, `image`, `source`, `linktype`, `linksrc`, `position`, `status`, `sortorder`, `type`, `slug`) VALUES
(2, 'Temple Bells Grand Prelude', '2024-09-10', '2028-01-26', 'a:1:{i:0;s:17:\"obpJF-offer2.jpeg\";}', '', '0', 'offer-list/step-into-luxury', 1, 0, 1, 1, 'temple-bells-grand-prelude');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `img_thumb` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `img_jpg` varchar(255) NOT NULL,
  `img_png` varchar(255) NOT NULL,
  `img_svg` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(255) NOT NULL,
  `modified_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_room_price`
--

CREATE TABLE `tbl_room_price` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  `one_person` int(11) NOT NULL,
  `two_person` int(11) NOT NULL,
  `three_person` int(11) NOT NULL,
  `registered` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_services`
--

CREATE TABLE `tbl_services` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `sub_title` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `icon` varchar(255) NOT NULL,
  `linksrc` varchar(255) NOT NULL,
  `linktype` tinyint(1) NOT NULL DEFAULT 0,
  `content` longtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `added_date` varchar(50) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `service_type` tinyint(1) NOT NULL,
  `brief` varchar(250) NOT NULL,
  `meta_title` tinyint(4) NOT NULL,
  `meta_keywords` int(11) NOT NULL,
  `meta_description` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_services`
--

INSERT INTO `tbl_services` (`id`, `slug`, `title`, `sub_title`, `image`, `icon`, `linksrc`, `linktype`, `content`, `status`, `added_date`, `sortorder`, `type`, `service_type`, `brief`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, 'swimming-pool', 'Swimming Pool', '', 'a:1:{i:0;s:23:\"yVCN1-swimming-pool.png\";}', '', '', 0, '', 1, '2025-04-16 21:14:13', 6, 0, 1, '', 0, 0, 0),
(2, 'restaurant', 'Restaurant', '', 'a:1:{i:0;s:14:\"pEEbN-tray.png\";}', '', '', 0, '', 0, '2025-04-16 21:14:28', 3, 0, 1, '', 0, 0, 0),
(3, 'bar', 'Bar', '', 'a:1:{i:0;s:18:\"CAgWa-cocktail.png\";}', '', '', 0, '', 1, '2025-04-16 21:14:44', 12, 0, 1, '', 0, 0, 0),
(4, 'coffee-shop', 'Coffee Shop', '', 'a:1:{i:0;s:20:\"R4NY9-coffee-cup.png\";}', '', '', 0, '', 1, '2025-04-16 21:14:59', 13, 0, 1, '', 0, 0, 0),
(5, 'swimming-pool', 'Swimming Pool', '', 'a:1:{i:0;s:11:\"vXRgF-E.jpg\";}', '', 'facilities-list', 0, '', 1, '2025-04-18 08:01:46', 10, 0, 2, '', 0, 0, 0),
(6, 'yak-and-yeti-bar', 'Yak and Yeti Bar', '', 'a:1:{i:0;s:11:\"08dwr-D.jpg\";}', '', 'yak-and-yeti-bar', 0, '', 1, '2025-04-18 08:01:57', 9, 0, 2, '', 0, 0, 0),
(7, 'bhojan-kakshya', 'Bhojan Kakshya', '', 'a:1:{i:0;s:15:\"oHULh-C (1).jpg\";}', '', 'bhojan-kakchya', 0, '', 1, '2025-04-18 08:02:09', 8, 0, 2, '', 0, 0, 0),
(8, 'aanti', 'Aanti', '', 'a:1:{i:0;s:11:\"LyTDp-B.jpg\";}', '', '', 0, '', 0, '2025-04-18 08:02:22', 7, 0, 2, '', 0, 0, 0),
(9, 'coffee-shop', 'Coffee Shop', '', 'a:1:{i:0;s:21:\"yoJmL-Coffee-Shop.jpg\";}', '', 'facilities-list', 0, '', 1, '2025-04-18 08:03:10', 6, 0, 2, '', 0, 0, 0),
(10, 'buddha-sadan', 'Buddha Sadan', '', 'a:1:{i:0;s:11:\"DD8F9-A.jpg\";}', '', 'buddha-sadan-hall', 0, '', 1, '2025-04-18 08:03:19', 5, 0, 2, '', 0, 0, 0),
(12, 'rooms', 'Rooms', '', 'a:1:{i:0;s:14:\"WWJpp-bed.webp\";}', '', '', 0, '', 1, '2025-04-18 11:25:01', 26, 0, 1, '', 0, 0, 0),
(13, 'event-hall', 'Event Hall', '', 'a:1:{i:0;s:20:\"Aatmf-event-hall.png\";}', '', '', 0, '', 1, '2025-04-18 11:35:34', 7, 0, 1, '', 0, 0, 0),
(14, 'parking-space', 'Parking Space', '', 'a:1:{i:0;s:17:\"xBvNY-parking.png\";}', '', '', 0, '', 1, '2025-04-18 11:35:55', 21, 0, 1, '', 0, 0, 0),
(15, 'welcome-drink', 'Welcome Drink', '', 'a:1:{i:0;s:23:\"S0QvJ-welcome-drink.png\";}', '', '', 0, '', 1, '2025-04-18 11:36:31', 2, 0, 1, '', 0, 0, 0),
(16, 'cctv-security', 'CCTV Security', '', 'a:1:{i:0;s:21:\"nX2By-cctv-camera.png\";}', '', '', 0, '', 1, '2025-04-18 11:36:43', 23, 0, 1, '', 0, 0, 0),
(17, 'spa', 'Spa', '', 'a:1:{i:0;s:13:\"C3kPv-spa.png\";}', '', '', 0, '', 1, '2025-04-18 11:37:11', 10, 0, 1, '', 0, 0, 0),
(18, 'high-speed-internet', 'High Speed Internet', '', 'a:1:{i:0;s:14:\"gDOlR-wifi.png\";}', '', '', 0, '', 1, '2025-04-18 11:39:08', 4, 0, 1, '', 0, 0, 0),
(19, 'airport-pickup-drop', 'Airport Pickup & Drop', '', 'a:1:{i:0;s:17:\"aNNWm-airport.png\";}', '', '', 0, '', 1, '2025-04-18 11:39:41', 1, 0, 1, '', 0, 0, 0),
(20, 'room-service', 'Room Service', '', 'a:1:{i:0;s:22:\"1u7EB-room-service.png\";}', '', '', 0, '', 1, '2025-04-18 11:40:08', 5, 0, 1, '', 0, 0, 0),
(21, 'daily-housekeeping', 'Daily Housekeeping', '', 'a:1:{i:0;s:24:\"Vedye-cleaning-tools.png\";}', '', '', 0, '', 1, '2025-04-18 11:40:38', 24, 0, 1, '', 0, 0, 0),
(22, 'concierge-service', 'Concierge Service', '', 'a:1:{i:0;s:17:\"zNjsU-doorman.png\";}', '', '', 0, '', 1, '2025-04-18 11:41:00', 20, 0, 1, '', 0, 0, 0),
(23, 'daily-newspaper', 'Daily Newspaper', '', 'a:1:{i:0;s:25:\"rlufG-Daily Newspaper.png\";}', '', '', 0, '', 1, '2025-04-18 11:43:10', 16, 0, 1, '', 0, 0, 0),
(24, 'cards-accepted', 'Cards Accepted', '', 'a:1:{i:0;s:24:\"daDn4-Cards Accepted.png\";}', '', '', 0, '', 1, '2025-04-18 11:43:22', 18, 0, 1, '', 0, 0, 0),
(25, 'elevator', 'Elevator', '', 'a:1:{i:0;s:18:\"PQAQJ-Elevator.png\";}', '', '', 0, '', 1, '2025-04-18 11:43:31', 17, 0, 1, '', 0, 0, 0),
(26, 'doctor-on-call', 'Doctor on Call', '', 'a:1:{i:0;s:24:\"NCbo3-Doctor on Call.png\";}', '', '', 0, '', 1, '2025-04-18 11:43:44', 9, 0, 1, '', 0, 0, 0),
(27, 'power-backup', 'Power Backup', '', 'a:1:{i:0;s:22:\"gz2e8-Power Backup.png\";}', '', '', 0, '', 1, '2025-04-18 11:43:58', 27, 0, 1, '', 0, 0, 0),
(28, 'luggage-storage', 'Luggage Storage', '', 'a:1:{i:0;s:25:\"obcNC-Luggage Storage.png\";}', '', '', 0, '', 1, '2025-04-18 11:44:18', 25, 0, 1, '', 0, 0, 0),
(29, 'fitness-center', 'Fitness Center', '', 'a:1:{i:0;s:24:\"YgXRG-Fitness Center.png\";}', '', '', 0, '', 1, '2025-04-18 11:44:30', 22, 0, 1, '', 0, 0, 0),
(30, 'restaurant', 'Restaurant', '', 'a:1:{i:0;s:20:\"n8mWZ-Restaurant.png\";}', '', '', 0, '', 1, '2025-04-18 11:44:54', 8, 0, 1, '', 0, 0, 0),
(31, 'fire-extinguisher', 'Fire Extinguisher', '', 'a:1:{i:0;s:27:\"oJmPX-Fire Extinguisher.png\";}', '', '', 0, '', 1, '2025-04-18 11:45:18', 19, 0, 1, '', 0, 0, 0),
(32, 'safe-deposit', 'Safe Deposit', '', 'a:1:{i:0;s:22:\"Tt5ht-Safe Deposit.png\";}', '', '', 0, '', 1, '2025-04-18 11:45:58', 15, 0, 1, '', 0, 0, 0),
(33, '24hrs-travel-desk', '24hrs Travel Desk', '', 'a:1:{i:0;s:21:\"X6bme-Travel Desk.png\";}', '', '', 0, '', 1, '2025-04-18 11:46:15', 14, 0, 1, '', 0, 0, 0),
(34, '24hrs-reception', '24hrs Reception', '', 'a:1:{i:0;s:19:\"KN8e1-Reception.png\";}', '', '', 0, '', 1, '2025-04-18 11:48:15', 11, 0, 1, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slideshow`
--

CREATE TABLE `tbl_slideshow` (
  `id` int(11) NOT NULL,
  `title` tinytext NOT NULL,
  `sub_title` tinytext NOT NULL,
  `image` tinytext NOT NULL,
  `linksrc` tinytext NOT NULL,
  `linktype` tinyint(1) NOT NULL DEFAULT 0,
  `content` longtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `m_status` tinyint(1) NOT NULL DEFAULT 1,
  `added_date` varchar(50) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `source` varchar(250) NOT NULL,
  `source_vid` varchar(255) NOT NULL,
  `url_type` varchar(50) NOT NULL,
  `thumb_image` longtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `class` varchar(100) NOT NULL,
  `mode` int(11) NOT NULL,
  `upcoming` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_slideshow`
--

INSERT INTO `tbl_slideshow` (`id`, `title`, `sub_title`, `image`, `linksrc`, `linktype`, `content`, `status`, `m_status`, `added_date`, `sortorder`, `type`, `source`, `source_vid`, `url_type`, `thumb_image`, `url`, `host`, `class`, `mode`, `upcoming`) VALUES
(81, 'Slider', '', 'TRHXI-BUDK7-gallery1.jpg', '', 0, '', 1, 0, '2024-12-17 13:32:22', 2, 0, '', '', '', '', '', '', '', 1, 1),
(84, 'Slider2', '', 'xIthg-pool3-D-qOvmMG.webp', '', 0, '<h1>\r\n	We are coming, get ready for the best travel experience with us.</h1>\r\n', 1, 0, '2024-12-24 16:08:33', 1, 0, '', '', '', '', '', '', '', 1, 1),
(85, 'Slider1', '', '4P4PR-BUDK7-gallery1.jpg', '', 0, '', 1, 0, '2024-12-25 13:06:40', 3, 0, '', '', '', '', '', '', '', 1, 1),
(86, 'Slide 2', 'Your Newest Sanctuary', 'x37nF-2.jpg', '', 0, '<p>\r\n	blend of modern comfort &amp; traditional charm.</p>\r\n', 1, 0, '2025-04-17 16:36:27', 6, 0, '', '', '', '', '', '', '', 1, 0),
(87, 'Slide 3', 'Your Newest Sanctuary', 'GhDFR-3.jpg', '', 0, '<p>\r\n	blend of modern comfort &amp; traditional charm.</p>\r\n', 1, 0, '2025-04-17 16:37:43', 5, 0, '', '', '', '', '', '', '', 1, 0),
(88, 'Slide 1', 'Your Newest Sanctuary', '4XtMg-1.jpg', '', 0, '<p>\r\n	blend of modern comfort &amp; traditional charm.</p>\r\n', 1, 0, '2025-04-18 15:09:01', 7, 0, '', '', '', '', '', '', '', 1, 0),
(89, 'Slide 4', 'Your Newest Sanctuary', 'a4d5C-4.jpg', '', 0, 'blend of modern comfort & traditional charm.', 1, 0, '2025-04-18 15:18:20', 4, 0, '', '', '', '', '', '', '', 1, 0),
(90, 'Slide 5', 'Your Newest Sanctuary', 'vz42Z-5.jpg', '', 0, '<p>\r\n	blend of modern comfort &amp; traditional charm.</p>\r\n', 1, 0, '2025-04-18 15:26:34', 3, 0, '', '', '', '', '', '', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slideshows_withouttlist`
--

CREATE TABLE `tbl_slideshows_withouttlist` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(50) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `registered` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_social_networking`
--

CREATE TABLE `tbl_social_networking` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `linksrc` tinytext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `sortorder` int(11) NOT NULL,
  `registered` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_social_networking`
--

INSERT INTO `tbl_social_networking` (`id`, `title`, `image`, `icon`, `type`, `linksrc`, `status`, `sortorder`, `registered`) VALUES
(1, 'facebook', '', 'fab fa-facebook text-dark fa-2x', 1, 'https://www.facebook.com/templebellboutiquehotel', 1, 1, '2025-02-25 11:12:21'),
(2, 'instagram', '', 'fab fa-instagram text-dark fa-2x', 1, 'https://www.instagram.com/templebellboutiquehotelandspa/', 1, 2, '2025-02-25 11:12:34'),
(3, 'Tiktok', '', 'fab fa-tiktok text-dark fa-2x', 1, 'https://www.tiktok.com/@templebellhotel', 1, 3, '2025-04-18 09:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subpackage_images`
--

CREATE TABLE `tbl_subpackage_images` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `subpackageid` int(11) NOT NULL,
  `detail` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `registered` varchar(50) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_subpackage_images`
--

INSERT INTO `tbl_subpackage_images` (`id`, `title`, `subpackageid`, `detail`, `status`, `sortorder`, `registered`, `image`) VALUES
(73, 'Hall', 31, '', 1, 61, '2023-06-21 13:59:14', 'lumn1-1.jpg'),
(74, 'Hall', 31, '', 1, 62, '2023-06-21 13:59:14', 'TXYew-2.jpg'),
(75, 'Hall', 31, '', 1, 63, '2023-06-21 13:59:14', '3WSgO-3.jpg'),
(76, 'Hall', 31, '', 1, 64, '2023-06-21 13:59:14', 'V7UWD-4.jpg'),
(77, 'Hall', 31, '', 1, 65, '2023-06-21 13:59:14', 'IZ0in-5.jpg'),
(78, 'Hall', 31, '', 1, 66, '2023-06-21 13:59:14', 's8rXz-6.jpg'),
(96, 'n', 39, '', 1, 50, '2023-08-29 14:54:22', '1ftnO-img2.jpg'),
(97, 'nn', 39, '', 1, 59, '2023-08-29 14:54:22', 'T13H4-img2.jpg'),
(98, 'n', 39, '', 1, 60, '2023-08-29 14:54:22', '6ZaBg-img2.jpg'),
(105, 'dep', 28, '', 1, 40, '2023-09-04 12:42:45', 'h26jS-delpre.jpg'),
(106, 'dep', 28, '', 1, 51, '2023-09-04 12:42:45', '4PvHa-delpre.jpg'),
(107, 'dep', 28, '', 1, 56, '2023-09-04 12:42:45', 'aTYbg-delpre.jpg'),
(108, 'a', 42, '', 1, 46, '2023-09-04 12:58:24', 'Jpoxc-img3.jpg'),
(109, 'a', 42, '', 1, 52, '2023-09-04 12:58:24', 'Xlari-img3.jpg'),
(110, 's', 43, '', 1, 47, '2023-09-04 13:00:16', 'eUhDU-880x864_img2.jpg'),
(111, 's', 43, '', 1, 53, '2023-09-04 13:00:16', 'DlMGX-880x864_img2.jpg'),
(114, 'deluxe', 29, '', 1, 48, '2023-09-15 11:40:40', 'FFzBD-del.jpg'),
(115, 'delxue', 29, '', 1, 54, '2023-09-15 11:40:40', 'D5uYC-del.jpg'),
(116, 'deluxe', 29, '', 1, 57, '2023-09-15 11:40:40', 'ecYs1-del.jpg'),
(117, 'standard', 41, '', 1, 55, '2023-09-17 12:48:42', 'wath6-standard.jpg'),
(118, 'standard', 41, '', 1, 49, '2023-09-17 12:48:42', 'zSkxL-stand.jpg'),
(119, 'standard', 41, '', 1, 58, '2023-09-17 12:48:42', '8Ws0F-stand.jpg'),
(121, 'lib', 44, '', 1, 1, '2023-09-17 17:18:17', 'mEXDT-library.jpg'),
(122, 'lib', 44, '', 1, 45, '2023-09-17 17:18:17', 'nFb8K-library.jpg'),
(147, 'Yak and Yeti Bar', 7, '', 1, 29, '2025-04-18 12:24:11', 'pbEvh-7.jpg'),
(148, 'Yak and Yeti Bar', 7, '', 1, 36, '2025-04-18 12:24:11', 'kjf1U-9.jpg'),
(149, 'Yak and Yeti Bar', 7, '', 1, 37, '2025-04-18 12:24:11', 'TnttJ-1.jpg'),
(150, 'Yak and Yeti Bar', 7, '', 1, 38, '2025-04-18 12:24:11', 'xNsjQ-3.jpg'),
(151, 'Yak and Yeti Bar', 7, '', 1, 39, '2025-04-18 12:24:11', '9prz7-4.jpg'),
(152, 'Yak and Yeti Bar', 7, '', 1, 41, '2025-04-18 12:24:11', '6LCU4-5.jpg'),
(153, 'Yak and Yeti Bar', 7, '', 1, 42, '2025-04-18 12:24:11', 'XMd5d-8.jpg'),
(154, 'Yak and Yeti Bar', 7, '', 1, 43, '2025-04-18 12:24:11', 'B4TlY-2.jpg'),
(155, 'Yak and Yeti Bar', 7, '', 1, 44, '2025-04-18 12:24:11', 'nTYzQ-6.jpg'),
(160, 'Super Deluxe Room', 2, '', 1, 26, '2025-04-18 12:56:36', 'QBSCc-1.jpg'),
(161, 'Super Deluxe Room', 2, '', 1, 30, '2025-04-18 12:56:36', 'Mg5YF-2.jpg'),
(162, 'Super Deluxe Room', 2, '', 1, 33, '2025-04-18 12:56:36', 'UDGme-4.jpg'),
(163, 'Junior Suite Room', 3, '', 1, 27, '2025-04-18 12:59:04', 'BY0YX-1.jpg'),
(164, 'Junior Suite Room', 3, '', 1, 31, '2025-04-18 12:59:04', 'IWzg3-4.jpg'),
(165, 'Junior Suite Room', 3, '', 1, 34, '2025-04-18 12:59:04', 'L7oct-2.jpg'),
(166, 'Suite Room', 4, '', 1, 28, '2025-04-18 13:00:17', 'pxw65-1.jpg'),
(167, 'Suite Room', 4, '', 1, 32, '2025-04-18 13:00:17', 'br1n4-4.jpg'),
(168, 'Suite Room', 4, '', 1, 35, '2025-04-18 13:00:17', 'xddPp-2.jpg'),
(169, 'Deluxe Double Room', 9, '', 1, 25, '2025-04-18 13:17:44', 'hVmhy-3.jpg'),
(170, 'Deluxe Double Room', 9, '', 1, 15, '2025-04-18 13:17:44', 'IqOwQ-2.jpg'),
(171, 'Deluxe Double Room', 9, '', 1, 22, '2025-04-18 13:17:44', 'DxaXI-4.jpg'),
(172, 'Deluxe Double Room', 9, '', 1, 11, '2025-04-18 13:17:44', 'pF41A-1.jpg'),
(173, 'Deluxe Single Room', 1, '', 1, 8, '2025-04-18 13:19:32', 'nvFX3-1.jpg'),
(174, 'Deluxe Single Room', 1, '', 1, 12, '2025-04-18 13:19:32', '6yYQZ-3.jpg'),
(175, 'Deluxe Single Room', 1, '', 1, 16, '2025-04-18 13:19:32', 'DfbL9-4.jpg'),
(176, 'Deluxe Single Room', 1, '', 1, 19, '2025-04-18 13:19:32', 'BLwwU-2.jpg'),
(177, 'Deluxe Triple Room', 10, '', 1, 9, '2025-04-18 13:25:00', 'lLpa4-2.jpg'),
(178, 'Deluxe Triple Room', 10, '', 1, 13, '2025-04-18 13:25:00', 'dlZve-1.jpg'),
(179, 'Deluxe Triple Room', 10, '', 1, 17, '2025-04-18 13:25:00', 'Dow5C-3.jpg'),
(180, 'Deluxe Triple Room', 10, '', 1, 20, '2025-04-18 13:25:00', 'H8eZb-4.jpg'),
(181, 'Deluxe Triple Room', 10, '', 1, 23, '2025-04-18 13:25:00', 'uUoJr-5.jpg'),
(182, 'Meeting Hall', 6, '', 1, 10, '2025-04-18 17:04:17', 'SIA1H-5.jpg'),
(183, 'Meeting Hall', 6, '', 1, 14, '2025-04-18 17:04:17', 'C9YLD-4.jpg'),
(184, 'Meeting Hall', 6, '', 1, 18, '2025-04-18 17:04:17', 's77G9-2.jpg'),
(185, 'Meeting Hall', 6, '', 1, 21, '2025-04-18 17:04:17', 'BMDq1-1.jpg'),
(186, 'Meeting Hall', 6, '', 1, 24, '2025-04-18 17:04:17', 'C7N4H-3.jpg'),
(188, 'Bhojan Kakchya', 5, '', 1, 3, '2025-04-21 11:52:07', 'NrpZN-5.jpg'),
(189, 'Bhojan Kakchya', 5, '', 1, 1, '2025-04-21 11:52:07', 'C8RWi-2.jpg'),
(192, 'Bhojan Kakchya', 5, '', 1, 2, '2025-04-21 11:52:07', 'mb4sN-4.jpg'),
(193, 'Bhojan Kakchya', 5, '', 1, 4, '2025-04-21 11:56:40', 'RjUtM-7.jpg'),
(194, 'Bhojan Kakchya', 5, '', 1, 5, '2025-04-21 11:56:40', 'CjjIA-8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscribers`
--

CREATE TABLE `tbl_subscribers` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `mailaddress` varchar(250) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_testimonial`
--

CREATE TABLE `tbl_testimonial` (
  `id` int(11) NOT NULL,
  `parentOf` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(225) NOT NULL,
  `linksrc` text NOT NULL,
  `content` mediumtext NOT NULL,
  `rating` int(11) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  `via_type` varchar(200) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `optional_email` longtext NOT NULL,
  `hall_email` varchar(200) NOT NULL,
  `hr_email` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(65) NOT NULL,
  `accesskey` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `access_code` varchar(255) NOT NULL,
  `facebook_uid` varchar(255) NOT NULL,
  `facebook_accesstoken` varchar(255) NOT NULL,
  `facebook_tokenexpire` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` date NOT NULL,
  `permission` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `first_name`, `middle_name`, `last_name`, `contact`, `email`, `optional_email`, `hall_email`, `hr_email`, `username`, `password`, `accesskey`, `image`, `group_id`, `access_code`, `facebook_uid`, `facebook_accesstoken`, `facebook_tokenexpire`, `status`, `sortorder`, `added_date`, `permission`) VALUES
(1, 'Temple Bell', '', '', '', 'info@templebellnepal.com', '', 'statshakya@gmail.com', 'statshakya@gmail.com', 'admin', '85a7b83955e2b8e689f7275c51d9f953', 'IwJ7VxQYSReEbkuSUDOk7E5VU', '', 2, 'IKLxivj8RW', '', '', '2021-04-29 05:40:38', 1, 1, '2014-03-26', 0x613a32313a7b693a303b733a313a2231223b693a313b733a313a2232223b693a323b733a313a2233223b693a333b733a323a223235223b693a343b733a323a223234223b693a353b733a323a223233223b693a363b733a313a2234223b693a373b733a333a22333032223b693a383b733a333a22333033223b693a393b733a313a2235223b693a31303b733a323a223237223b693a31313b733a333a22333030223b693a31323b733a333a22333031223b693a31333b733a323a223131223b693a31343b733a333a22333034223b693a31353b733a323a223137223b693a31363b733a323a223230223b693a31373b733a323a223238223b693a31383b733a323a223132223b693a31393b733a323a223133223b693a32303b733a323a223134223b7d),
(2, 'Super admin', '', '', '', 'info@templebellnepal.com', 'support@longtail.info', 'support@longtail.info', 'support@longtail.info', 'superadmin', '4ef961d430016feab913571a25818e97', 'cSLZorarrOMEmMps8aBPQ41g3', '', 1, '', '', '', '2023-11-09 10:05:54', 1, 0, '0000-00-00', 0x613a32363a7b693a303b733a323a223734223b693a313b733a313a2231223b693a323b733a333a22333036223b693a333b733a313a2232223b693a343b733a313a2233223b693a353b733a323a223235223b693a363b733a323a223234223b693a373b733a323a223233223b693a383b733a313a2234223b693a393b733a333a22333032223b693a31303b733a333a22333033223b693a31313b733a313a2235223b693a31323b733a323a223237223b693a31333b733a333a22333030223b693a31343b733a333a22333031223b693a31353b733a333a22333035223b693a31363b733a323a223131223b693a31373b733a323a223137223b693a31383b733a333a22333034223b693a31393b733a323a223230223b693a32303b733a323a223139223b693a32313b733a323a223238223b693a32323b733a323a223132223b693a32333b733a323a223133223b693a32343b733a323a223134223b693a32353b733a323a223136223b7d),
(3, 'asdasd', 'asdasd', 'asdasd', '', 'stat@gmail.com', 'stat@gmail.com', 'stat@gmail.com', 'stat@gmail.com', 'asdas', '80c9ef0fb86369cd25f90af27ef53a9e', 'XZtQjE8Rse66xhHG6sSVqzyDZ', '', 3, '', '', '', '0000-00-00 00:00:00', 1, 2, '2024-01-10', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vacency`
--

CREATE TABLE `tbl_vacency` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `post` varchar(250) NOT NULL,
  `location` varchar(250) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `pax` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date1` date NOT NULL,
  `date2` date NOT NULL,
  `archive_date` date DEFAULT NULL,
  `sortorder` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `image` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `added_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_vacency`
--

INSERT INTO `tbl_vacency` (`id`, `title`, `post`, `location`, `slug`, `pax`, `content`, `date1`, `date2`, `archive_date`, `sortorder`, `status`, `image`, `type`, `meta_keywords`, `meta_description`, `added_date`) VALUES
(9, 'Asst. Laundry Manager', 'Manager', 'Kathmandu, Nepal', 'asst-laundry-manager', '1', '<p>\r\n	Bachelor</p>\r\n', '0000-00-00', '2023-08-31', '0000-00-00', 1, 1, '', 0, '', '', '2023-08-28 15:12:02'),
(10, 'Painter / Plumber', 'Painter / Plumber', 'Kathmandu, Nepal', 'painter-plumber', '1', '<p>\r\n	<span style=\"color: rgb(71, 61, 53); font-family: Roboto, sans-serif; font-size: 20px; background-color: rgb(247, 246, 246);\">Painter / Plumber</span></p>\r\n', '0000-00-00', '2023-09-22', '0000-00-00', 3, 1, '', 0, '', '', '2023-08-29 11:42:43'),
(12, 'Sales Executive', 'Sales Executive', 'patan', 'sales-executive', '1', '<p>\r\n	asdasd</p>\r\n', '0000-00-00', '2023-09-15', '0000-00-00', 2, 1, '', 0, '', '', '2023-09-03 15:03:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_video`
--

CREATE TABLE `tbl_video` (
  `id` int(11) NOT NULL,
  `source` varchar(200) NOT NULL,
  `url_type` varchar(50) NOT NULL,
  `title` longtext NOT NULL,
  `thumb_image` longtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `class` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vt_360_images`
--

CREATE TABLE `tbl_vt_360_images` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `hfov` int(5) NOT NULL,
  `pitch` int(11) NOT NULL,
  `yaw` int(11) NOT NULL,
  `type` text NOT NULL,
  `panorama` longblob NOT NULL,
  `status` int(1) NOT NULL,
  `sortorder` int(5) NOT NULL,
  `added_date` datetime(6) NOT NULL,
  `virtual_tour_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vt_360_images`
--

INSERT INTO `tbl_vt_360_images` (`id`, `title`, `hfov`, `pitch`, `yaw`, `type`, `panorama`, `status`, `sortorder`, `added_date`, `virtual_tour_id`) VALUES
(2, 'ASDXASDASD', 100, 0, 0, '', 0x424456385a2d59624351772d6a756e676c652e6a7067, 1, 1, '2025-04-22 09:45:05.000000', 2),
(3, 'SADSADASDASD', 100, 0, 0, '', 0x73647a73662d61747472616374696f6e5f70682e77656270, 1, 2, '2025-04-22 09:49:16.000000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vt_hotspots`
--

CREATE TABLE `tbl_vt_hotspots` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `hotspot_pitch` float NOT NULL,
  `hotspot_yaw` float NOT NULL,
  `hotspot_type` varchar(50) NOT NULL,
  `hotspot_text` text NOT NULL,
  `scene_id` varchar(50) NOT NULL,
  `target_yaw` float NOT NULL,
  `target_pitch` float NOT NULL,
  `status` int(11) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `three60_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vt_hotspots`
--

INSERT INTO `tbl_vt_hotspots` (`id`, `title`, `hotspot_pitch`, `hotspot_yaw`, `hotspot_type`, `hotspot_text`, `scene_id`, `target_yaw`, `target_pitch`, `status`, `sortorder`, `added_date`, `three60_id`) VALUES
(2, 'FG', 0, 0, 'scene', '', '2', 0, 0, 1, 1, '2025-04-22 09:49:32', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vt_virtual_tour`
--

CREATE TABLE `tbl_vt_virtual_tour` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` datetime NOT NULL,
  `scene_fade_duration` int(11) NOT NULL,
  `image_width` varchar(255) NOT NULL,
  `image_height` varchar(255) NOT NULL,
  `hotspot_icon` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vt_virtual_tour`
--

INSERT INTO `tbl_vt_virtual_tour` (`id`, `title`, `status`, `sortorder`, `added_date`, `scene_fade_duration`, `image_width`, `image_height`, `hotspot_icon`) VALUES
(2, 'adsadasdasd', 1, 1, '2025-04-22 09:44:50', 500, '1200', '600', 0x3078444d332d322e6a7067);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_applicants`
--
ALTER TABLE `tbl_applicants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_articles`
--
ALTER TABLE `tbl_articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_blog`
--
ALTER TABLE `tbl_blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_conbined_news`
--
ALTER TABLE `tbl_conbined_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_configs`
--
ALTER TABLE `tbl_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_countries`
--
ALTER TABLE `tbl_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_download`
--
ALTER TABLE `tbl_download`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_events`
--
ALTER TABLE `tbl_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_features`
--
ALTER TABLE `tbl_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_galleries`
--
ALTER TABLE `tbl_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_gallery_images`
--
ALTER TABLE `tbl_gallery_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_group_type`
--
ALTER TABLE `tbl_group_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_logs_action`
--
ALTER TABLE `tbl_logs_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_mainservices`
--
ALTER TABLE `tbl_mainservices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_metadata`
--
ALTER TABLE `tbl_metadata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_modules`
--
ALTER TABLE `tbl_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_nearby`
--
ALTER TABLE `tbl_nearby`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_offers`
--
ALTER TABLE `tbl_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_offer_child`
--
ALTER TABLE `tbl_offer_child`
  ADD KEY `offer_id` (`offer_id`);

--
-- Indexes for table `tbl_ota`
--
ALTER TABLE `tbl_ota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_package`
--
ALTER TABLE `tbl_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_package_sub`
--
ALTER TABLE `tbl_package_sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_popup`
--
ALTER TABLE `tbl_popup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_room_price`
--
ALTER TABLE `tbl_room_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_services`
--
ALTER TABLE `tbl_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_slideshow`
--
ALTER TABLE `tbl_slideshow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_slideshows_withouttlist`
--
ALTER TABLE `tbl_slideshows_withouttlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_social_networking`
--
ALTER TABLE `tbl_social_networking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_subpackage_images`
--
ALTER TABLE `tbl_subpackage_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_subscribers`
--
ALTER TABLE `tbl_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_testimonial`
--
ALTER TABLE `tbl_testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_vacency`
--
ALTER TABLE `tbl_vacency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_video`
--
ALTER TABLE `tbl_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_vt_360_images`
--
ALTER TABLE `tbl_vt_360_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `virtual_tour_id` (`virtual_tour_id`);

--
-- Indexes for table `tbl_vt_hotspots`
--
ALTER TABLE `tbl_vt_hotspots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `three60_id` (`three60_id`);

--
-- Indexes for table `tbl_vt_virtual_tour`
--
ALTER TABLE `tbl_vt_virtual_tour`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_applicants`
--
ALTER TABLE `tbl_applicants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_articles`
--
ALTER TABLE `tbl_articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_blog`
--
ALTER TABLE `tbl_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_conbined_news`
--
ALTER TABLE `tbl_conbined_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_configs`
--
ALTER TABLE `tbl_configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_countries`
--
ALTER TABLE `tbl_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `tbl_download`
--
ALTER TABLE `tbl_download`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_events`
--
ALTER TABLE `tbl_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `tbl_features`
--
ALTER TABLE `tbl_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tbl_galleries`
--
ALTER TABLE `tbl_galleries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_gallery_images`
--
ALTER TABLE `tbl_gallery_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `tbl_group_type`
--
ALTER TABLE `tbl_group_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=754;

--
-- AUTO_INCREMENT for table `tbl_logs_action`
--
ALTER TABLE `tbl_logs_action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_mainservices`
--
ALTER TABLE `tbl_mainservices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tbl_metadata`
--
ALTER TABLE `tbl_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_modules`
--
ALTER TABLE `tbl_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT for table `tbl_nearby`
--
ALTER TABLE `tbl_nearby`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_offers`
--
ALTER TABLE `tbl_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_ota`
--
ALTER TABLE `tbl_ota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_package`
--
ALTER TABLE `tbl_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_package_sub`
--
ALTER TABLE `tbl_package_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_popup`
--
ALTER TABLE `tbl_popup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_room_price`
--
ALTER TABLE `tbl_room_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_services`
--
ALTER TABLE `tbl_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_slideshow`
--
ALTER TABLE `tbl_slideshow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `tbl_slideshows_withouttlist`
--
ALTER TABLE `tbl_slideshows_withouttlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_social_networking`
--
ALTER TABLE `tbl_social_networking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_subpackage_images`
--
ALTER TABLE `tbl_subpackage_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `tbl_subscribers`
--
ALTER TABLE `tbl_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_testimonial`
--
ALTER TABLE `tbl_testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_vacency`
--
ALTER TABLE `tbl_vacency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_video`
--
ALTER TABLE `tbl_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_vt_360_images`
--
ALTER TABLE `tbl_vt_360_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_vt_hotspots`
--
ALTER TABLE `tbl_vt_hotspots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_vt_virtual_tour`
--
ALTER TABLE `tbl_vt_virtual_tour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_vt_360_images`
--
ALTER TABLE `tbl_vt_360_images`
  ADD CONSTRAINT `tbl_vt_360_images_ibfk_1` FOREIGN KEY (`virtual_tour_id`) REFERENCES `tbl_vt_virtual_tour` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_vt_hotspots`
--
ALTER TABLE `tbl_vt_hotspots`
  ADD CONSTRAINT `tbl_vt_hotspots_ibfk_1` FOREIGN KEY (`three60_id`) REFERENCES `tbl_vt_360_images` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
