-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2020 at 12:54 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `estudy`
--

-- --------------------------------------------------------

--
-- Table structure for table `admlogin`
--

CREATE TABLE `admlogin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admlogin`
--

INSERT INTO `admlogin` (`id`, `email`, `pwd`) VALUES
(1, 'admin@gmail.com', 'ZHWU');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `qid` varchar(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `answer` longtext NOT NULL,
  `imgname` longtext NOT NULL,
  `dt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `qid`, `email`, `answer`, `imgname`, `dt`) VALUES
(1, '3', 'shubhamjais1999@gmail.com', 'zdg', 'Media/userpictures/5394678DSCN0060.JPG', '2020-07-18 03:51:02.984300'),
(3, '3', 'shubhamjais1999@gmail.com', 'sd', 'Media/userpictures/9934200DSCN0066.JPG', '2020-07-18 03:53:38.814479');

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `title` longtext NOT NULL,
  `doc` longtext NOT NULL,
  `description` longtext NOT NULL,
  `dt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`id`, `name`, `email`, `title`, `doc`, `description`, `dt`) VALUES
(3, 'Shubham jaiswal', 'shubhamjais1999@gmail.com', 'hj', 'Media/userpictures/5995105_Content_LernerDownload_05 PMFinal Technology Selection 2020.pdf', 'a', '2020-07-17 09:50:24.702855'),
(4, 'Shubham Jaiswal', 'shubhamjais1999@gmail.com', 'hj', 'Media/userpictures/4316030DSCN0073.JPG', 'sdfg', '2020-07-18 06:59:10.937654');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add login', 7, 'add_login'),
(26, 'Can change login', 7, 'change_login'),
(27, 'Can delete login', 7, 'delete_login'),
(28, 'Can view login', 7, 'view_login'),
(29, 'Can add register', 8, 'add_register'),
(30, 'Can change register', 8, 'change_register'),
(31, 'Can delete register', 8, 'delete_register'),
(32, 'Can view register', 8, 'view_register'),
(33, 'Can add adm login', 9, 'add_admlogin'),
(34, 'Can change adm login', 9, 'change_admlogin'),
(35, 'Can delete adm login', 9, 'delete_admlogin'),
(36, 'Can view adm login', 9, 'view_admlogin'),
(37, 'Can add notification', 10, 'add_notification'),
(38, 'Can change notification', 10, 'change_notification'),
(39, 'Can delete notification', 10, 'delete_notification'),
(40, 'Can view notification', 10, 'view_notification'),
(41, 'Can add enquiry', 11, 'add_enquiry'),
(42, 'Can change enquiry', 11, 'change_enquiry'),
(43, 'Can delete enquiry', 11, 'delete_enquiry'),
(44, 'Can view enquiry', 11, 'view_enquiry'),
(45, 'Can add feedback', 12, 'add_feedback'),
(46, 'Can change feedback', 12, 'change_feedback'),
(47, 'Can delete feedback', 12, 'delete_feedback'),
(48, 'Can view feedback', 12, 'view_feedback'),
(49, 'Can add email', 13, 'add_email'),
(50, 'Can change email', 13, 'change_email'),
(51, 'Can delete email', 13, 'delete_email'),
(52, 'Can view email', 13, 'view_email'),
(53, 'Can add sms', 14, 'add_sms'),
(54, 'Can change sms', 14, 'change_sms'),
(55, 'Can delete sms', 14, 'delete_sms'),
(56, 'Can view sms', 14, 'view_sms'),
(57, 'Can add question', 15, 'add_question'),
(58, 'Can change question', 15, 'change_question'),
(59, 'Can delete question', 15, 'delete_question'),
(60, 'Can view question', 15, 'view_question'),
(61, 'Can add answer', 16, 'add_answer'),
(62, 'Can change answer', 16, 'change_answer'),
(63, 'Can delete answer', 16, 'delete_answer'),
(64, 'Can view answer', 16, 'view_answer'),
(65, 'Can add qp details', 17, 'add_qpdetails'),
(66, 'Can change qp details', 17, 'change_qpdetails'),
(67, 'Can delete qp details', 17, 'delete_qpdetails'),
(68, 'Can view qp details', 17, 'view_qpdetails'),
(69, 'Can add exam question', 18, 'add_examquestion'),
(70, 'Can change exam question', 18, 'change_examquestion'),
(71, 'Can delete exam question', 18, 'delete_examquestion'),
(72, 'Can view exam question', 18, 'view_examquestion'),
(73, 'Can add result', 19, 'add_result'),
(74, 'Can change result', 19, 'change_result'),
(75, 'Can delete result', 19, 'delete_result'),
(76, 'Can view result', 19, 'view_result'),
(77, 'Can add upload', 20, 'add_upload'),
(78, 'Can change upload', 20, 'change_upload'),
(79, 'Can delete upload', 20, 'delete_upload'),
(80, 'Can view upload', 20, 'view_upload'),
(81, 'Can add assignment', 21, 'add_assignment'),
(82, 'Can change assignment', 21, 'change_assignment'),
(83, 'Can delete assignment', 21, 'delete_assignment'),
(84, 'Can view assignment', 21, 'view_assignment');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(9, 'admZone', 'admlogin'),
(13, 'admZone', 'email'),
(18, 'admZone', 'examquestion'),
(10, 'admZone', 'notification'),
(17, 'admZone', 'qpdetails'),
(19, 'admZone', 'result'),
(14, 'admZone', 'sms'),
(20, 'admZone', 'upload'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(11, 'estudy', 'enquiry'),
(7, 'estudy', 'login'),
(8, 'estudy', 'register'),
(6, 'sessions', 'session'),
(16, 'stdZone', 'answer'),
(21, 'stdZone', 'assignment'),
(12, 'stdZone', 'feedback'),
(15, 'stdZone', 'question');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-07-04 17:31:19.792345'),
(2, 'auth', '0001_initial', '2020-07-04 17:31:20.274373'),
(3, 'admin', '0001_initial', '2020-07-04 17:31:23.367549'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-07-04 17:31:24.198597'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-07-04 17:31:24.254600'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-07-04 17:31:24.681625'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-07-04 17:31:24.959641'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-07-04 17:31:25.091648'),
(9, 'auth', '0004_alter_user_username_opts', '2020-07-04 17:31:25.117650'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-07-04 17:31:25.460669'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-07-04 17:31:25.481670'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-07-04 17:31:25.499671'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-07-04 17:31:26.040702'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-07-04 17:31:26.557732'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-07-04 17:31:27.668795'),
(16, 'auth', '0011_update_proxy_permissions', '2020-07-04 17:31:27.685796'),
(17, 'estudy', '0001_initial', '2020-07-04 17:31:27.825804'),
(18, 'sessions', '0001_initial', '2020-07-04 17:31:27.893808'),
(19, 'admZone', '0001_initial', '2020-07-07 03:09:34.314481'),
(20, 'admZone', '0002_auto_20200707_1150', '2020-07-07 06:20:32.576157'),
(21, 'admZone', '0003_notification', '2020-07-07 12:26:38.411695'),
(22, 'estudy', '0002_enquiry', '2020-07-08 00:11:22.311739'),
(23, 'stdZone', '0001_initial', '2020-07-08 07:59:52.065985'),
(24, 'stdZone', '0002_auto_20200708_1354', '2020-07-08 08:24:59.817754'),
(25, 'admZone', '0004_email', '2020-07-09 01:09:13.725721'),
(26, 'admZone', '0005_sms', '2020-07-09 10:05:03.271602'),
(27, 'admZone', '0006_auto_20200709_1536', '2020-07-09 10:06:36.335925'),
(28, 'stdZone', '0003_question', '2020-07-12 10:31:43.173234'),
(29, 'stdZone', '0004_answer', '2020-07-12 16:11:11.794330'),
(30, 'stdZone', '0005_auto_20200712_2144', '2020-07-12 16:14:16.797912'),
(31, 'admZone', '0007_qpdetails', '2020-07-15 16:27:38.058416'),
(32, 'admZone', '0008_examquestion', '2020-07-16 02:41:56.726802'),
(33, 'admZone', '0009_auto_20200716_0820', '2020-07-16 02:50:45.064021'),
(34, 'admZone', '0010_qpdetails_status', '2020-07-16 03:10:40.518397'),
(35, 'admZone', '0011_qpdetails_paperid', '2020-07-16 07:38:11.943576'),
(36, 'admZone', '0012_result', '2020-07-16 12:05:42.654572'),
(37, 'admZone', '0013_upload', '2020-07-16 16:44:28.688825'),
(38, 'stdZone', '0006_assignment', '2020-07-17 02:13:07.922906');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ldpfw7eqnf1tag2cpeotkh9swvk0e3l9', 'OGUyOGU2ODlhYjZlYjA1Njc1ZjZkMTliZmJjMjQ5MWExOGNmYjc3Yjp7ImlkIjoic2h1YmhhbWphaXMxOTk5QGdtYWlsLmNvbSIsImFpZCI6ImFkbWluQGdtYWlsLmNvbSJ9', '2020-08-01 10:51:41.447167');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `to` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `txt` longtext NOT NULL,
  `dt` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobno` varchar(50) NOT NULL,
  `topic` varchar(50) NOT NULL,
  `msg` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiry`
--

INSERT INTO `enquiry` (`id`, `name`, `email`, `mobno`, `topic`, `msg`) VALUES
(13, 'Shubham Jaiswal', 'shubhamjais1999@gmail.com', 'test', 'test', 'django');

-- --------------------------------------------------------

--
-- Table structure for table `examquestion`
--

CREATE TABLE `examquestion` (
  `id` int(11) NOT NULL,
  `paperid` varchar(15) NOT NULL,
  `question` longtext NOT NULL,
  `a` longtext NOT NULL,
  `b` longtext NOT NULL,
  `c` longtext NOT NULL,
  `d` longtext NOT NULL,
  `ans` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examquestion`
--

INSERT INTO `examquestion` (`id`, `paperid`, `question`, `a`, `b`, `c`, `d`, `ans`) VALUES
(1, 'QP848997206', 'This is sample\r\nQuestion', 'a', 'b', 'c', 'd', 'B'),
(3, 'QP205852008', 'What is ReactJS?', 'Server-side Framework', 'User-interface framework', 'Both', 'None', 'C'),
(4, 'QP205852008', 'What are the limitations of ReactJS?', 'React is only for view layer of the app so we still need the help of other technologies to get a complete tooling set for development', 'React is using inline templating and JSX. This can seem awkward to some developers', 'The library of react is too large', 'All of these', 'D'),
(5, 'QP205852008', 'How can you access the state of a component from inside of a member function?', 'this.getState()', 'this.prototype.stateValue', 'this.state', 'this.values', 'D'),
(6, 'QP205852008', 'Props are __________ into other components', 'Injected', 'Methods', 'Both A and B', 'All of these', 'B'),
(7, 'QP205852008', 'Which of the following API is a MUST for every ReactJS component?', 'getInitialState', 'render', 'renderComponent', 'None', 'C'),
(8, 'QP205852008', ' At the highest level, React components have lifecycle events that fall into', 'Initialization', 'State/Property Updates', 'Destruction', 'All of these', 'D'),
(9, 'QP205852008', 'What are the advantages of React JS?', 'React can be used on client and as well as server side too', 'Using React increases readability and makes maintainability easier. Component, Data patterns improves readability and thus makes it easier for manitaining larger apps', 'React can be used with any other framework (Backbone.js, Angular.js) as it is only a view layer', 'All of the above', 'D'),
(10, 'QP205852008', 'How does React handle Web Accessibility Initiative - Accessible Rich Internet Applications (WAI-ARIA) standard?', 'aria-* HTML attributes are fully supported in JSX. Where most DOM properties and attributes in React are camelCased, these attributes should be lowercased', 'aria-* attributes should be converted to camelCase like other attributes eg. className, onChange and so on', 'React processes aria-* attributes separately and update the DOM for accessibility if the user requires it', 'React is yet to support WAI-ARIA standard', 'D'),
(11, 'QP205852008', 'What does the “webpack” command do?', 'Transpiles all the Javascript down into one file', 'Runs react local development server', 'Both A and B', 'None', 'A'),
(12, 'QP205852008', 'What is a react.js in MVC?', 'Controller', 'Middleware', 'Model', 'Router', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobno` varchar(50) NOT NULL,
  `topic` varchar(50) NOT NULL,
  `feedback` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `mobno`, `topic`, `feedback`) VALUES
(1, 'Shubham Jaiswal', 'shubhamjais1999@gmail.com', '8858312336', 'django', 'feedback\r\n'),
(7, 'Shubham Jaiswal', 'shubhamjais1999@gmail.com', '8858312336', 'test', 'test\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `email`, `pwd`) VALUES
(1, 'shubhamjais1999@gmail.com', 'HSFYSZN');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `link` longtext NOT NULL,
  `notification` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `link`, `notification`) VALUES
(15, 'test', 'Last Date of Submission of Project is 17-07-2020 09:00 AM'),
(16, 'test', 'Date for farewell will be announced soon.');

-- --------------------------------------------------------

--
-- Table structure for table `qpdetails`
--

CREATE TABLE `qpdetails` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` varchar(30) NOT NULL,
  `tq` varchar(5) NOT NULL,
  `udt` varchar(50) NOT NULL,
  `status` longtext NOT NULL,
  `paperid` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qpdetails`
--

INSERT INTO `qpdetails` (`id`, `subject`, `date`, `time`, `tq`, `udt`, `status`, `paperid`) VALUES
(6, 'Database', '2020-07-22', '14:00', '1', '2020-07-16 13:50:51.179956', 'false', 'QP783018809'),
(7, 'React Mock Test', '2020-07-22', '10:00', '10', '2020-07-18 10:27:17.871868', 'true', 'QP205852008');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `question` longtext NOT NULL,
  `imgname` longtext NOT NULL,
  `dt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `email`, `question`, `imgname`, `dt`) VALUES
(2, 'shubhamjais1999@gmail.com', 'test', 'Media/userpictures/13089916266026_1626218364340164_6982134408812822923_n.jpg', '2020-07-12 16:42:29.465154');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `dob` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobno` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `picture` longtext NOT NULL,
  `address` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `name`, `gender`, `dob`, `email`, `mobno`, `course`, `picture`, `address`) VALUES
(11, 'Shubham Jaiswal', 'Male', '2000-07-01', 'shubhamjais1999@gmail.com', '8858312336', 'BCA', 'Media/userpictures/4656631IMG_20181027_071204.jpg', 'Traffic Chauraha Mission Road, Karwi Chitrakoot');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `paperid` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tq` varchar(15) NOT NULL,
  `correct` varchar(5) NOT NULL,
  `ans` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `paperid`, `name`, `email`, `tq`, `correct`, `ans`) VALUES
(1, 'QP205852008', 'Shubham Jaiswal', 'shubhamjais1999@gmail.com', '10', '8', 'C,D,C,B,D,D,D,D,A,A,');

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `id` int(11) NOT NULL,
  `mobno` varchar(50) NOT NULL,
  `msg` longtext NOT NULL,
  `dt` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms`
--

INSERT INTO `sms` (`id`, `mobno`, `msg`, `dt`) VALUES
(4, '8858312336', 'This is test Message', '2020-07-11 00:19:41.548603'),
(6, '8543832619', 'Hello', '2020-07-11 15:35:13.828718');

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE `upload` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `fname` longtext NOT NULL,
  `dt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admlogin`
--
ALTER TABLE `admlogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `examquestion`
--
ALTER TABLE `examquestion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qpdetails`
--
ALTER TABLE `qpdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admlogin`
--
ALTER TABLE `admlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `examquestion`
--
ALTER TABLE `examquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `qpdetails`
--
ALTER TABLE `qpdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `upload`
--
ALTER TABLE `upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
