-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2026 at 01:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maysan`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `content` longtext NOT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `department_id`, `title`, `slug`, `image`, `excerpt`, `content`, `views`, `created_at`, `updated_at`) VALUES
(4, 3, 'أهمية العناية بالبشرة يوميًا للحفاظ على النضارة', 'welcome-to-clinic', 'articles/6EqlZKVMfUHUCCzhDT4pZey39kRxeqLOjrwx40jV.jpg', 'أهمية العناية بالبشرة يوميًا للحفاظ على النضارة', 'مقالات تجميلية - عيادة التجميل\r\nأهمية العناية بالبشرة\r\nالعناية بالبشرة ليست رفاهية بل ضرورة للحفاظ على صحة الجلد ومظهره. تساعد الروتينات اليومية مثل التنظيف والترطيب واستخدام واقي الشمس على تقليل علامات التقدم في العمر وحماية البشرة من العوامل الخارجية الضارة. كما أن زيارة العيادات المتخصصة بشكل دوري يساعد في الحفاظ على نضارة البشرة.\r\nإزالة الشعر بالليزر\r\nتعتبر جلسات إزالة الشعر بالليزر من أكثر الحلول فعالية للتخلص من الشعر غير المرغوب فيه بشكل طويل الأمد. تعتمد التقنية على استهداف بصيلات الشعر دون التأثير على الجلد المحيط، مما يجعلها آمنة وفعالة مع تقليل نمو الشعر تدريجياً.\r\nالفيلر والبوتوكس\r\nتستخدم حقن الفيلر والبوتوكس لتحسين مظهر الوجه وتقليل التجاعيد. الفيلر يعمل على ملء الفراغات واستعادة الحجم، بينما يساعد البوتوكس في إرخاء العضلات المسببة للتجاعيد، مما يمنح مظهراً أكثر شباباً وطبيعية.\r\nعلاج حب الشباب وآثاره\r\nحب الشباب من أكثر مشاكل البشرة شيوعاً، ويحتاج إلى علاج متخصص حسب الحالة. تشمل العلاجات الأدوية الموضعية، التقشير الكيميائي، والليزر، بالإضافة إلى جلسات تهدف لتقليل آثار الحبوب وتحسين ملمس البشرة.\r\nشد البشرة وتقنيات الهايفو\r\nتقنيات شد البشرة الحديثة مثل الهايفو والخيوط التجميلية تساعد على تحسين مرونة الجلد وتحفيز إنتاج الكولاجين دون جراحة. هذه الإجراءات تمنح نتائج طبيعية وتدريجية تجعل الوجه يبدو أكثر شباباً وشدًا.', 1, '2026-05-23 16:25:24', '2026-05-23 16:25:44');

-- --------------------------------------------------------

--
-- Table structure for table `before_afters`
--

CREATE TABLE `before_afters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `before_afters`
--

INSERT INTO `before_afters` (`id`, `image`, `created_at`, `updated_at`) VALUES
(4, 'before_afters/AyY69kK1DrJY6IjX3msvVkaEIdcKte1cPCjkOygX.png', '2026-05-23 19:50:46', '2026-05-23 19:50:46'),
(5, 'before_afters/ljor7kW77DRINlWHocW9qfNQz6IzhMUAxvp37wgT.png', '2026-05-23 19:51:00', '2026-05-23 19:51:00'),
(6, 'before_afters/dsnRTEJ9BUL466HoTrittCXyzPP4tBxEl4nmmFl0.png', '2026-05-23 19:51:11', '2026-05-23 19:51:11');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `google_map_url` varchar(255) DEFAULT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `location_id`, `name`, `image`, `phone`, `instagram_url`, `google_map_url`, `address`, `created_at`, `updated_at`) VALUES
(6, 2, 'الشفاء', 'branches/84pok4gJnEKigglLEEpJdZgAIYIDGM0PstL3ystf.png', '0502866013', 'https://www.instagram.com/messan_clinic/', 'https://tr.ee/XO9a-IvTXZ', 'حي الشفا شارع المثني بن حارثة.', '2026-05-23 16:37:19', '2026-05-23 16:37:19'),
(7, 2, 'العقيق', 'branches/GslAQ9coepz4x9chIxn1L5RR68z0p83OXaN4R5Rr.png', '0550083999', 'https://www.instagram.com/meesan_clinic', 'https://maps.app.goo.gl/tSTNmyCYjj9PjYoc6', 'طريق الامام سعود بن فيصل.', '2026-05-23 16:50:31', '2026-05-23 16:52:54'),
(8, 2, 'العليا', 'branches/O1dyk13mCHQWD0QwSHVQUK2AUyYOsb9Y5BfhxNAr.png', '0547881208', 'https://www.instagram.com/maysan__alolaya', NULL, 'برج توران سنتر بوابة 5', '2026-05-23 16:54:45', '2026-05-23 16:54:45'),
(9, 2, 'المروج', 'branches/RTmvLKN4CAdZqQ5xvkp0SE02agvzkKoJRyQFspsC.png', '0557577930', 'https://www.instagram.com/maysan.clinic', NULL, 'حي المروج طريق الإمام سعود بن عبدالعزيز', '2026-05-23 19:27:43', '2026-05-23 19:27:43'),
(10, 2, 'الياسمين', 'branches/mmjh9F8RcCp1a7XYY2FFAGzHb3XKihSUxB9Ew1S1.png', '0554404674', 'https://www.instagram.com/maysanalyasmine', 'https://maps.app.goo.gl/rZwXpEDsy6sUCjZB9', 'الرياض حي الياسمين', '2026-05-23 19:34:34', '2026-05-23 19:35:00'),
(11, 1, 'ميسان الدمام', 'branches/rZ80svXTnThYGq4QuqgwtOhBcZVQA1FfQ01DLqOs.png', '0555437789', 'https://www.instagram.com/maysanalyasmine', NULL, 'الدمام _حي الروضه_ شارع الامير نايف مقابل كلية البنات', '2026-05-23 19:40:54', '2026-05-23 19:40:54'),
(12, 1, 'القصيم', 'branches/YylG1RMTHeySs2s3kLzWNjXKN2mvkKKQYgwoWmbN.png', '0551914040', 'https://www.instagram.com/meesan__clinic', 'https://maps.app.goo.gl/kMeSTyx7D1GsCR6d7', 'القصيم.بريدة', '2026-05-23 19:44:02', '2026-05-23 19:44:02');

-- --------------------------------------------------------

--
-- Table structure for table `branch_department`
--

CREATE TABLE `branch_department` (
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `article_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `comment` text NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(2, 'قسم الأسنان', 'departments/nz8HnNXoope8qWY8YOZs8CWrZCsW8ohJXVR9iOxL.jpg', '2026-05-18 15:24:49', '2026-05-23 15:36:07'),
(3, 'قسم الجراحة والتجميل', 'departments/VpCNOL1Rr5q2fE53PM6cEvSRCb0vAOpLVOfNtvUn.jpg', '2026-05-22 20:39:23', '2026-05-23 15:35:15'),
(4, 'قسم البشرة والليزر', 'departments/Nmer3LpMA6bA9NsJ7TQtU2iY9VNpMCaOIEZfKNjP.jpg', '2026-05-23 15:37:04', '2026-05-23 15:37:04'),
(5, 'قسم الجلدية', 'departments/J9qOTBNBwjLq9WGxE0uTvRqbQkunKcFyKxkuyCcL.jpg', '2026-05-23 15:37:58', '2026-05-23 15:37:58');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `department_id`, `branch_id`, `name`, `image`, `description`, `created_at`, `updated_at`) VALUES
(7, 5, 6, 'د.محمد حموده', 'doctors/h297yssowkvggqfjjI2Hh4bfhjDyThuK9Mqrh3HK.png', NULL, '2026-05-23 16:39:00', '2026-05-23 16:39:00'),
(8, 3, 6, 'د.أسامة بكري', 'doctors/VxD7FgO6tn39GIz3JFkwCO7l9FVzpawwrPvIfBXb.png', 'نائب اول جراحة تجميل', '2026-05-23 16:40:44', '2026-05-23 16:40:44'),
(9, 3, 6, 'د.محمد الأطروش', 'doctors/A47ltMVQEsoiD9UjP4CRQQQH2BreKENRFOb0fy5B.png', 'أخصائي جراحة الفم والفكين', '2026-05-23 16:43:30', '2026-05-23 16:43:30'),
(10, 3, 7, 'د.محمد الحداد', 'doctors/lj8MoMmCAfDwKtOPMyktAYaJul40yhkmnpxOWMX9.png', 'جراحة ونحت الجسم', '2026-05-23 16:51:18', '2026-05-23 16:51:18'),
(11, 3, 7, 'د.غادة البغدادي', 'doctors/xNvUiPqx5q3zud8U94tMkndBK6uxnHPPJC5dZAcS.png', 'نائب جلدية وتجميل', '2026-05-23 16:52:11', '2026-05-23 16:52:11'),
(12, 5, 8, 'د.سارة ابراهيم', 'doctors/2kEhAQTxiI7czs50HrkhBQL7WqI3Z8MdHuIs1uJ7.png', 'طبيبة امراض جلدية', '2026-05-23 16:59:00', '2026-05-23 16:59:00'),
(13, 3, 8, 'د.حاتم توفيق', 'doctors/3XZ0aO7F75wCxoVm7kVBvpsrNtD6mIP2TUXx1VSa.png', 'جراحة وترميم وتجميل', '2026-05-23 17:00:26', '2026-05-23 17:00:26'),
(14, 5, 9, 'د.مرفت السالم', 'doctors/tXpQdmwELdrFZbk1rT19rzWW6obbpSphpav3DEMS.png', 'أخصائية جلدية وتجميل للشد المائي لبشرة', '2026-05-23 19:29:54', '2026-05-23 19:29:54'),
(15, 3, 9, 'د.محمد عزمي', 'doctors/Nfl9vDeaJ7Mv09Ti77tbIHgPRDl1eRGFSS9pYk9H.png', 'نائب اول جراحة وتجميل', '2026-05-23 19:31:30', '2026-05-23 19:31:30'),
(16, 5, 10, 'د.ريهام حلمي', 'doctors/iy7lUU8zmkmA5axV1epnFyyuzPlFWhq378qOKcS8.png', 'أخصائية أمراض الجلدية والتجميل والليزر', '2026-05-23 19:36:36', '2026-05-23 19:36:36'),
(17, 5, 12, 'د.اسماء عاطف', 'doctors/L3lPAhsgavUO0pnxKH6EtlnWNOaBeKHDsfZ7p9av.png', 'نائب الجلدية والتجميل', '2026-05-23 19:45:18', '2026-05-23 19:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `question_ar` varchar(255) NOT NULL,
  `answer_ar` text NOT NULL,
  `order_column` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `department_id`, `question_ar`, `answer_ar`, `order_column`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 2, 'نبيه', 'العشماوي', 1, 1, '2026-05-18 18:44:53', '2026-05-18 19:08:10'),
(7, 2, 'العشماوي', 'يلسشيبلسي', 1, 1, '2026-05-18 19:08:20', '2026-05-18 19:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `home_contents`
--

CREATE TABLE `home_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hero_title_en` varchar(255) DEFAULT NULL,
  `hero_title_ar` varchar(255) DEFAULT NULL,
  `hero_subtitle_en` varchar(255) DEFAULT NULL,
  `hero_subtitle_ar` varchar(255) DEFAULT NULL,
  `about_title_en` varchar(255) DEFAULT NULL,
  `about_title_ar` varchar(255) DEFAULT NULL,
  `about_desc_en` text DEFAULT NULL,
  `about_desc_ar` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_contents`
--

INSERT INTO `home_contents` (`id`, `hero_title_en`, `hero_title_ar`, `hero_subtitle_en`, `hero_subtitle_ar`, `about_title_en`, `about_title_ar`, `about_desc_en`, `about_desc_ar`, `created_at`, `updated_at`) VALUES
(1, 'T', 'ت', 'E', 'ا', 'O', 'تقديم خدمات طبية وجمالية متكاملة، تعتمد على التقنيات الحديثة والخبرة العالمية، مع ضمان أعلى معايير الأمان والجودة', 'F', 'تأسس أوروم في عام 2010، ويمثل قمة التميز الطهوي. فلسفتنا بسيطة: الحصول على أجود المكونات، ومعاملتها باحترام، وتحويلها إلى ذكريات لا تُنسى. تحت إشراف الشيف التنفيذي أليساندرو ماركو، ندعوك في رحلة عبر النكهة والملمس والمشاعر.', '2026-05-15 11:06:18', '2026-05-23 15:25:14');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'الدمام', '2026-05-18 15:05:26', '2026-05-18 15:08:01'),
(2, 'الرياض', '2026-05-21 20:41:42', '2026-05-23 16:31:46');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('hero_video','hero_image','gallery_image') NOT NULL DEFAULT 'gallery_image',
  `path` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `order_column` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `type`, `path`, `thumbnail`, `title`, `order_column`, `is_active`, `created_at`, `updated_at`) VALUES
(17, 'gallery_image', 'media/1XZrcg3N3pm1bj1c8DXPbzIQPh874t9xAPrAKFXR.png', 'media/1XZrcg3N3pm1bj1c8DXPbzIQPh874t9xAPrAKFXR.png', NULL, 2, 1, '2026-05-21 19:04:20', '2026-05-21 19:04:20'),
(18, 'gallery_image', 'media/piPMr3x73ixnqR3VmZMNYGpVfX66kkHsYtOHiQAe.png', 'media/piPMr3x73ixnqR3VmZMNYGpVfX66kkHsYtOHiQAe.png', NULL, 3, 1, '2026-05-21 19:04:25', '2026-05-21 19:04:25'),
(20, 'hero_video', 'media/XzKQ2FfbFeoCkJPVBVgrka3WeKYymbLuo253nGYa.mp4', 'media/XzKQ2FfbFeoCkJPVBVgrka3WeKYymbLuo253nGYa.mp4', NULL, 0, 1, '2026-05-22 13:46:04', '2026-05-22 13:46:04'),
(21, 'gallery_image', 'media/FIasehlMg92usyPHxb8SxbtP7nETmdElkaMQTbCw.png', 'media/FIasehlMg92usyPHxb8SxbtP7nETmdElkaMQTbCw.png', NULL, 4, 1, '2026-05-23 15:03:40', '2026-05-23 15:03:40'),
(22, 'hero_image', 'media/bdPkLyFC3wpbHLxpQZIBN0It5L3mpO93c1cLtSoR.jpg', 'media/bdPkLyFC3wpbHLxpQZIBN0It5L3mpO93c1cLtSoR.jpg', NULL, 0, 1, '2026-05-23 15:21:49', '2026-05-23 15:21:49');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2026_04_26_002748_create_users_table', 1),
(4, '2026_04_28_170924_create_reservations_table', 1),
(5, '2026_05_14_190506_create_settings_table', 1),
(6, '2026_05_14_203331_update_settings_table_with_multilang_and_socials', 2),
(7, '2026_05_14_204159_add_contact_details_to_settings_table', 3),
(8, '2026_05_15_135639_create_home_contents_table', 4),
(9, '2026_05_15_154255_create_faqs_table', 5),
(10, '2026_05_15_161312_create_media_table', 6),
(11, '2026_05_16_223005_create_testimonials_table', 7),
(12, '2026_05_17_121648_create_statistics_table', 8),
(13, '2026_05_18_171857_create_departments_table', 9),
(14, '2026_05_18_171906_create_locations_table', 9),
(15, '2026_05_18_172040_create_offers_table', 9),
(16, '2026_05_18_172055_create_services_table', 9),
(17, '2026_05_18_172507_create_branches_table', 9),
(18, '2026_05_18_172508_create_articles_table', 9),
(19, '2026_05_18_172943_create_branch_department_table', 9),
(20, '2026_05_18_173658_create_comments_table', 9),
(21, '2026_05_18_180633_add_location_id_to_branches_table', 10),
(22, '2026_05_18_213032_alter_faqs_table_remove_english_add_department', 11),
(23, '2026_05_19_121639_create_partners_table', 12),
(24, '2026_05_19_173242_create_doctors_table', 13),
(25, '2026_05_21_230613_add_clinic_relations_to_reservations_table', 14),
(26, '2026_05_21_235706_add_message_to_reservations_table', 15),
(27, '2026_05_22_184540_create_before_afters_table', 16),
(28, '2026_05_23_154407_add_branch_id_to_users_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `title`, `img`, `price`, `old_price`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(2, 'عرض عيد الأضحي', 'offers/UkYwjzsXvo4RwD3awa6o7LCxHnKVz2QHO3MKfMaw.png', 900.00, 1200.00, '2026-05-23', '2026-05-27', '2026-05-22 21:05:10', '2026-05-23 19:56:18'),
(3, 'عرض عيد الأضحي', 'offers/1zfBpxGW9i8BFsyt8T0212dIaG2ctS3AITYDYOar.png', 1200.00, NULL, '2026-05-24', '2026-05-28', '2026-05-23 19:58:19', '2026-05-23 19:58:19');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `image`, `link`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, NULL, 'partners/sQmEqmP5C96rIfSkUlGCWpGVf0rLBElqHzObrDoY.jpg', NULL, 1, 0, '2026-05-19 09:29:20', '2026-05-19 09:29:20'),
(2, NULL, 'partners/9ytrp4PHO6ciAzWRBlDEPRJj8QmBwjNDK0P6LwxP.webp', NULL, 1, 0, '2026-05-19 09:29:27', '2026-05-19 09:29:27'),
(3, NULL, 'partners/SHbwrRpwrZUlAfdm483O12fSRa7nA6NH2ZYAFxO9.jpg', NULL, 1, 0, '2026-05-19 09:29:36', '2026-05-19 09:29:36'),
(5, 'nabih', 'partners/Tm7e9YBhISewLaTthnRXqzMKG9qtt6MISHyahBVB.png', NULL, 1, 0, '2026-05-19 09:29:57', '2026-05-19 09:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reservation_date` date NOT NULL,
  `reservation_time` time NOT NULL,
  `status` enum('pending','confirmed','cancelled','completed') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_archive` tinyint(1) NOT NULL DEFAULT 0,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `name`, `phone`, `email`, `location_id`, `branch_id`, `department_id`, `service_id`, `doctor_id`, `reservation_date`, `reservation_time`, `status`, `notes`, `message`, `is_archive`, `is_delete`, `created_at`, `updated_at`) VALUES
(11, 'Bebo Alashmawy', '+201505253851', 'beboalashmawy@gmail.com', 1, NULL, 2, NULL, NULL, '2026-05-29', '13:04:00', 'pending', NULL, 'asdfsad', 0, 0, '2026-05-23 14:04:31', '2026-05-23 14:04:31');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `department_id`, `name`, `image`, `price`, `description`, `created_at`, `updated_at`) VALUES
(4, 3, 'شد الوجه والرقبة', 'services/fns98XfpW4e6pF7fosiNZMoab0BNfzaexY1iCoNL.jpg', 3.99, 'إجراء تجميلي يهدف إلى شد الجلد المترهل في الوجه والرقبة، وتحسين مظهر التجاعيد والخطوط العميقة، ليمنحك ملامح أكثر شبابًا وتناسقًا بشكل طبيعي.', '2026-05-23 15:41:21', '2026-05-23 15:41:32'),
(5, 3, 'شد الجفون', 'services/pAsXj7azOxkodpoUUsvaLiX9E03LHnGCwz6jpuxl.jpg', 4.00, 'عملية تجميلية لإزالة ترهلات أو انتفاخات الجفون العلوية أو السفلية، مما يساعد على تحسين شكل العين وإعطاء نظرة أكثر حيوية وشبابًا.', '2026-05-23 15:43:03', '2026-05-23 15:43:03'),
(6, 3, 'تكبير وشد الصدر', 'services/tnIcvJYuO1epIHu8DiP7AiEsognWS4DGrcEmg0yn.jpg', 4.00, 'عملية تجميلية تهدف إلى تحسين حجم وشكل الثدي ورفعه لإعادة التناسق والجاذبية، باستخدام تقنيات آمنة تناسب احتياجات كل حالة.', '2026-05-23 15:44:09', '2026-05-23 15:44:09'),
(7, 3, 'تجميل الأنف', 'services/VKWb1dNUMbQ1jUPEULTQdy6fTUiSnNzrbXn4M9U8.jpg', 4.00, 'إجراء يهدف إلى تحسين شكل الأنف أو تصحيح مشاكله الوظيفية، مع الحفاظ على تناسق الملامح للحصول على مظهر طبيعي ومتوازن للوجه.', '2026-05-23 15:45:05', '2026-05-23 15:45:05'),
(8, 3, 'شد الجسم وشفط الدهون', 'services/dsmVMCtDIbBg3JBGCgOU9R8fvN2hRd6r0dujLr2d.jpg', 4.00, 'إجراء يساعد على إزالة الدهون الموضعية وشد ترهلات الجسم، لإبراز قوام متناسق وأكثر رشاقة بشكل واضح وفعّال.', '2026-05-23 15:46:15', '2026-05-23 15:46:15'),
(9, 3, 'إعادة الترميم والتجميل بعد العمليات أو الحوادث', 'services/Pw8Nhok6OhOxjhLYsWKCFB44wN59pYcsJLuVhpoV.jpg', 4.00, 'عمليات تهدف إلى إصلاح وتشويه الأنسجة الناتج عن الحوادث أو العمليات السابقة، وإعادة الشكل الطبيعي بأعلى دقة واحترافية لتحسين الوظيفة والمظهر.', '2026-05-23 15:47:40', '2026-05-23 15:47:40'),
(10, 2, 'تنظيف الأسنان وتلميعها', 'services/2bSbbGYlt2QTfJVg9mb1Fb5vjP3fQxeFIT8Hus4y.jpg', 4.00, 'إجراء تجميلي سريع وآمن يساعد على تفتيح لون الأسنان وإزالة التصبغات، ليمنحك ابتسامة أكثر إشراقًا وجاذبية من أول جلسة.', '2026-05-23 15:49:14', '2026-05-23 15:49:14'),
(11, 2, 'تركيب الأسنان الثابتة والمتحركة', 'services/zZZKRXGBvCnNS3zsYlKGgqAXbok4d21NV7cHhjDn.jpg', 4.00, 'حلول تعويضية متكاملة لتعويض الأسنان المفقودة، سواء بتركيبات ثابتة أو متحركة، بهدف استعادة وظيفة الفم والشكل الطبيعي للابتسامة بشكل مريح وفعّال.', '2026-05-23 15:50:09', '2026-05-23 15:50:09'),
(12, 2, 'تبييض الأسنان بالليزر', 'services/P4SrmSBzPPG9ooNxvFHdOaUOg5su5je4i4ifQUB2.jpg', 4.00, 'إجراء تجميلي سريع وآمن يساعد على تفتيح لون الأسنان وإزالة التصبغات، ليمنحك ابتسامة أكثر إشراقًا وجاذبية من أول جلسة', '2026-05-23 15:51:22', '2026-05-23 15:51:22'),
(13, 2, 'ابتسامة هوليوود (الفينير)', 'services/LHOMf1oyo4JbrUWPQKNgRDpjamQ72uLNlT1ikbJI.jpg', 4.00, 'تصميم تجميلي متكامل للأسنان باستخدام قشور الفينير، لتحسين اللون والشكل والمحاذاة، والحصول على ابتسامة مثالية متناسقة تشبه نجوم هوليوود.', '2026-05-23 15:53:37', '2026-05-23 15:53:37'),
(14, 2, 'تقويم الأسنان بأنواعه', 'services/icLvpzZaokopkzuHV4sg2dAUjkKV8zCP0BJTZrUx.jpg', 4.00, 'علاج يهدف إلى تصحيح اصطفاف الأسنان وتحسين الإطباق باستخدام تقويم ثابت أو متحرك أو شفاف، للحصول على ابتسامة صحية ومتناسقة.', '2026-05-23 15:54:43', '2026-05-23 15:54:43'),
(15, 2, 'زراعة الأسنان وعلاج اللثة', 'services/zfRLXgEYODr2mVQfaLEYosBxJSGgezT08qZC9HWo.jpg', 1500.00, 'إجراء متقدم لتعويض الأسنان المفقودة بزراعات ثابتة تدوم طويلًا، مع علاج مشاكل اللثة لتحسين صحة الفم ودعم الأسنان الطبيعية أو المزروعة.', '2026-05-23 15:55:30', '2026-05-23 15:55:30'),
(16, 4, 'جلسات ليزر لإزالة الشعر بجميع أنواعه', 'services/M2bRE6PKRyYlYcM0fB7sTq7Bv8Fm5UmYuLj1gdXO.jpg', 4.00, 'تقنية حديثة وآمنة لإزالة الشعر غير المرغوب فيه من مختلف مناطق الجسم، بنتائج طويلة الأمد وبأقل ألم ممكن، مع تحسين نعومة البشرة مع كل جلسة.', '2026-05-23 16:05:24', '2026-05-23 16:05:24'),
(17, 4, 'تنظيف البشرة العميق والعناية المتقدمة', 'services/HWHc8S4r1Wq7Vwoi040lu9sYIonSzzCOaHNdCrpR.jpg', 4.00, 'جلسات متخصصة لتنظيف المسام بعمق وإزالة الشوائب والرؤوس السوداء، مع ترطيب وتجديد البشرة للحصول على نضارة وصحة واضحة.', '2026-05-23 16:08:02', '2026-05-23 16:08:02'),
(18, 4, 'جلسات التقشير الكيميائي الطبي', 'services/80Iv6S6uDBcWcBPt0KW4gk9wD5BQGndGTdIuweou.jpg', 4.00, 'إجراء طبي يساعد على إزالة الطبقات التالفة من الجلد، وتقليل التصبغات وآثار الحبوب، لتحفيز تجدد البشرة وإظهار مظهر أكثر إشراقًا.', '2026-05-23 16:10:18', '2026-05-23 16:10:18'),
(19, 4, 'جلسات البلازما للوجه والشعر (PRP)', 'services/WurIRW7GLopd0ocHdlVQonv7zr9205EPizP5CEsv.jpg', 4.00, 'علاج يعتمد على البلازما المستخلصة من دم المريض لتحفيز نمو الشعر وتجديد خلايا البشرة، مما يساعد على تقوية الشعر وتحسين نضارة الوجه بشكل طبيعي.', '2026-05-23 16:10:58', '2026-05-23 16:10:58'),
(20, 4, 'الميزوثيرابي لتفتيح وشد البشرة', 'services/Ov5fLB6XBBBFbLKCShF7hmTlUv6Qiv0No0KCA4BG.jpg', 4.00, 'حقن دقيقة تحتوي على فيتامينات وعناصر مغذية تساعد على تفتيح البشرة، تحسين مرونتها، وتقليل علامات التعب والتقدم في العمر.', '2026-05-23 16:11:38', '2026-05-23 16:11:38'),
(21, 4, 'جلسات شد البشرة بتقنيات حديثة مثل الهايفو (HIFU)', 'services/wLMPyy8qeoeKOiblXcGVF5x6TYli8OndQiMGLj1W.jpg', 4.00, 'تقنية غير جراحية لشد الجلد وتحفيز إنتاج الكولاجين باستخدام الموجات فوق الصوتية، تمنح نتائج تدريجية وطبيعية لوجه أكثر شبابًا ورفعًا.', '2026-05-23 16:12:14', '2026-05-23 16:12:14'),
(22, 5, 'الخيوط التجميلية لشد البشرة وجلسات الهايفو', 'services/ENHCWImuuusAO00T1NCnEfyFhnPujAMl4dMICdvj.jpg', 4.00, 'حلول غير جراحية لشد الجلد وتحسين ملامح الوجه باستخدام الخيوط التجميلية أو تقنية الهايفو الحديثة، لتحفيز الكولاجين ومنح البشرة مظهرًا أكثر شبابًا ورفعًا طبيعيًا.', '2026-05-23 16:13:16', '2026-05-23 16:13:16'),
(24, 5, 'علاج الأمراض الجلدية المزمنة (الصدفية والإكزيما)', 'services/mZlEvfrNzW9CNdp9cd606r6Q73md0AbOtVND8ZRl.jpg', 4.00, 'برامج علاجية متخصصة تهدف إلى تقليل الأعراض والسيطرة على الحالات الجلدية المزمنة مثل الصدفية والإكزيما، لتحسين راحة الجلد وجودة الحياة.', '2026-05-23 16:13:56', '2026-05-23 16:13:56'),
(25, 4, 'إبر النضارة والفيلر والبوتوكس', 'services/FfmQmpDJF19iUL2AvL0aY5lRLHQN7PU4K2LSKoqk.jpg', 4.00, 'جلسات تجميلية دقيقة تعمل على تحسين نضارة البشرة، تعبئة التجاعيد، وإبراز ملامح الوجه بطريقة طبيعية وآمنة تمنح مظهرًا أكثر شبابًا وحيوية.', '2026-05-23 16:14:46', '2026-05-23 16:14:46'),
(26, 5, 'جلسات متقدمة لعلاج الندبات', 'services/SRkmyDrgpcrdDjCde73Tl0dwGpvh79H6YKbfwsQ1.jpg', 4.00, 'علاجات متطورة تساعد على تقليل آثار الجروح والندبات وتحسين ملمس الجلد، باستخدام تقنيات تحفيز تجديد الخلايا للحصول على بشرة أكثر نعومة وتجانسًا.', '2026-05-23 16:16:41', '2026-05-23 16:16:41'),
(27, 5, 'علاجات فروة الرأس ومشاكل الشعر', 'services/A0bFSShb5hbmwu2Sp81HAE8qoekHmsPhEwp3hbXw.jpg', 4.00, 'برامج علاجية تستهدف تساقط الشعر وضعف البصيلات وقشرة الرأس، بهدف تقوية الشعر وتحسين صحة فروة الرأس وتحفيز النمو الطبيعي.', '2026-05-23 16:17:50', '2026-05-23 16:17:50'),
(28, 5, 'بشرة صحية تعكس صحة داخلية متكاملة', 'services/el0uITFOFggLEvjbY25vtwpPWYxsPCO61mB7PnIf.jpg', 3.99, 'نهتم بعلاج البشرة من الداخل والخارج لتحقيق توازن صحي يعكس إشراقة طبيعية وجمال مستدام يعتمد على العناية الشاملة.', '2026-05-23 16:18:22', '2026-05-23 16:18:22'),
(29, 5, 'علاج حب الشباب وآثاره والتصبغات والبقع', 'services/2BATHj8hmMbn0dwVfXvlfTu4IPpFAmxpOhqdF7j3.jpg', 4.00, 'حلول طبية متكاملة تستهدف حب الشباب وآثاره، وتعمل على تفتيح التصبغات وتوحيد لون البشرة للحصول على مظهر نقي وصافي.', '2026-05-23 16:19:32', '2026-05-23 16:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0lG9xS2b9DLKE0yGBgUfpy3Rn4ngRDjKNBK7sBz9', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWW5mcVo3NlZUVlRTOXFybmJMOGVPeHE0RlBQQU5Ocnl3a1Q4cmpKUCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjMwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYnJhbmNoZXMiO3M6NToicm91dGUiO3M6MTQ6ImJyYW5jaGVzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1779578029);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(255) NOT NULL DEFAULT 'Aurum Restaurant',
  `site_title` varchar(255) NOT NULL DEFAULT 'Fine Dining Experience',
  `meta_description` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `icon_180` varchar(255) DEFAULT NULL,
  `icon_32` varchar(255) DEFAULT NULL,
  `icon_16` varchar(255) DEFAULT NULL,
  `manifest` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address_en` varchar(255) DEFAULT NULL,
  `address_ar` varchar(255) DEFAULT NULL,
  `hours_en` varchar(255) DEFAULT NULL,
  `hours_ar` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `snapchat` varchar(255) DEFAULT NULL,
  `tiktok` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `map_link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `site_title`, `meta_description`, `logo`, `icon_180`, `icon_32`, `icon_16`, `manifest`, `created_at`, `updated_at`, `address_en`, `address_ar`, `hours_en`, `hours_ar`, `facebook`, `twitter`, `instagram`, `snapchat`, `tiktok`, `mobile`, `whatsapp`, `email`, `map_link`) VALUES
(1, 'ميسان', 'maysan', 'نمنحك تجربة تجميل متكاملة تجمع بين العناية، الدقة، وأحدث التقنيات للحصول على بشرة صحية وإطلالة طبيعية جذابة.\r\nفي ميسان نهتم بأدق التفاصيل لنقدم خدمات التجميل والعناية بالبشرة، الليزر، والنضارة بأعلى معايير الجودة وعلى يد مختصين محترفين.', 'logo/BUs50gqQgkfv1lqf58HZcX98V2eDHsxNJH74NQoY.png', 'icon_180/o1jxhas7bZF94s9UfYlVEj7O2KBjInmNmlQXWHJj.png', 'icon_32/6qvAsND90A8l110egmuzyxBGpkgvU8A6lu1KMTHN.png', 'icon_16/Yl4htKse15VzigJw8kIp2DaoUwPD6NbA7PMG14s5.png', NULL, '2026-05-14 16:54:38', '2026-05-23 14:49:04', 'english', 'الرياض المملكة العربية السعودية', 'english', 'يوميًا من الساعة 1 مساءً إلى 12 مساءً', 'https://www.facebook.com/myssanclinics', NULL, NULL, NULL, NULL, '+966 53 519 7319', '+966 53 519 7319', NULL, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d55244.21560874368!2d31.288166885998187!3d30.072313582744943!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14368976c35c36e9%3A0x2c45a00925c4c444!2z2YXYtdix!5e0!3m2!1sar!2seg!4v1778794925380!5m2!1sar!2seg\" width=\"700\" height=\"650\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>');

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`id`, `number`, `title_ar`, `title_en`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '15+', 'سنوات الخبره', 'Years Experience', 0, 1, '2026-05-17 09:26:42', '2026-05-17 09:30:40'),
(2, '98%', 'نسبة رضا العملاء %', 'ا', 0, 1, '2026-05-17 09:31:07', '2026-05-22 11:31:31'),
(3, '20,000+', 'عميلة راضية', 'S', 0, 1, '2026-05-17 09:31:49', '2026-05-22 11:32:13'),
(4, '50+', 'جهاز حديث', 'ا', 0, 1, '2026-05-22 11:32:39', '2026-05-22 11:32:39');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 5,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `role`, `message`, `rating`, `is_active`, `created_at`, `updated_at`) VALUES
(8, 'نوف العتيبي', 'معلمة', 'تجربتي مع العيادة كانت ممتازة جدًا، فريق محترف والنتيجة ظهرت بشكل واضح بعد جلسات نحت الجسم. حسيت بثقة كبيرة في نفسي بعد التغيير', 5, 1, '2026-05-23 20:08:33', '2026-05-23 20:11:11'),
(9, 'العنود الشمري', 'مهندسة', 'بعد الولادة كان عندي ترهلات مزعجة، وبعد جلسات النحت والشد لاحظت فرق كبير جدًا.', 5, 1, '2026-05-23 20:09:17', '2026-05-23 20:11:09'),
(10, 'دانه الحربي', 'مضيفه', 'تعامل راقي جدًا واهتمام بأدق التفاصيل. حسيت إني في أيد أمينة من أول زيارة.', 5, 1, '2026-05-23 20:09:50', '2026-05-23 20:11:07'),
(11, 'رهف المطيري', 'ربة منزل', 'أفضل شيء في العيادة إنهم بيهتموا إن النتيجة تكون طبيعية ومناسبة لشكل الجسم، مش مبالغ فيها.', 5, 1, '2026-05-23 20:10:28', '2026-05-23 20:11:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `branch_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Bebo Alashmawy', 'beboalashmawy@gmail.com', 'admin', NULL, NULL, '$2y$12$NP/xDQ0ia0PIIFcok0ZyFuQUj14ygAE/xYqG5i8yTx3merX9z.0rq', NULL, '2026-05-14 16:54:17', '2026-05-17 16:24:52'),
(3, 'elqseim', 'elqseim@maysan.fun', 'sales', NULL, NULL, '$2y$12$X4uz9L7EPsM038yE86xov.X.ijDBU6SQAvEuhj7UMs7ClVMyp11uy', NULL, '2026-05-23 13:32:04', '2026-05-23 14:03:46'),
(4, 'avora', 'avora008@avora.fun', 'sales', NULL, NULL, '$2y$12$.Sxm700nS8oL44UKwX961uO2oc8odd/zXFczp4rcuUgucjGtcdt6a', NULL, '2026-05-23 14:06:07', '2026-05-23 14:06:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_slug_unique` (`slug`),
  ADD KEY `articles_department_id_foreign` (`department_id`);

--
-- Indexes for table `before_afters`
--
ALTER TABLE `before_afters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branches_location_id_foreign` (`location_id`);

--
-- Indexes for table `branch_department`
--
ALTER TABLE `branch_department`
  ADD PRIMARY KEY (`branch_id`,`department_id`),
  ADD KEY `branch_department_department_id_foreign` (`department_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_article_id_foreign` (`article_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctors_department_id_foreign` (`department_id`),
  ADD KEY `doctors_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_department_id_foreign` (`department_id`);

--
-- Indexes for table `home_contents`
--
ALTER TABLE `home_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservations_location_id_foreign` (`location_id`),
  ADD KEY `reservations_branch_id_foreign` (`branch_id`),
  ADD KEY `reservations_department_id_foreign` (`department_id`),
  ADD KEY `reservations_service_id_foreign` (`service_id`),
  ADD KEY `reservations_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_department_id_foreign` (`department_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_branch_id_foreign` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `before_afters`
--
ALTER TABLE `before_afters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `home_contents`
--
ALTER TABLE `home_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `branch_department`
--
ALTER TABLE `branch_department`
  ADD CONSTRAINT `branch_department_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branch_department_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `doctors_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `reservations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `reservations_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `reservations_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `reservations_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
