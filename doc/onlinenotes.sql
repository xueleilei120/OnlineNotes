/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : onlinenotes

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2017-08-09 17:03:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 用户信息', '7', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 用户信息', '7', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 用户信息', '7', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('22', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('23', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('24', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('25', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('26', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('27', 'Can view 用户信息', '7', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('28', 'Can add Bookmark', '8', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('29', 'Can change Bookmark', '8', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete Bookmark', '8', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('31', 'Can add User Setting', '9', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('32', 'Can change User Setting', '9', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete User Setting', '9', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('34', 'Can add User Widget', '10', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('35', 'Can change User Widget', '10', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete User Widget', '10', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('37', 'Can add log entry', '11', 'add_log');
INSERT INTO `auth_permission` VALUES ('38', 'Can change log entry', '11', 'change_log');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete log entry', '11', 'delete_log');
INSERT INTO `auth_permission` VALUES ('40', 'Can view Bookmark', '8', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('41', 'Can view log entry', '11', 'view_log');
INSERT INTO `auth_permission` VALUES ('42', 'Can view User Setting', '9', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('43', 'Can view User Widget', '10', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('44', 'Can add captcha store', '12', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('45', 'Can change captcha store', '12', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('46', 'Can delete captcha store', '12', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('47', 'Can view captcha store', '12', 'view_captchastore');
INSERT INTO `auth_permission` VALUES ('48', 'Can add 标签', '13', 'add_tag');
INSERT INTO `auth_permission` VALUES ('49', 'Can change 标签', '13', 'change_tag');
INSERT INTO `auth_permission` VALUES ('50', 'Can delete 标签', '13', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('51', 'Can add 分类', '14', 'add_category');
INSERT INTO `auth_permission` VALUES ('52', 'Can change 分类', '14', 'change_category');
INSERT INTO `auth_permission` VALUES ('53', 'Can delete 分类', '14', 'delete_category');
INSERT INTO `auth_permission` VALUES ('54', 'Can add 笔记', '15', 'add_notes');
INSERT INTO `auth_permission` VALUES ('55', 'Can change 笔记', '15', 'change_notes');
INSERT INTO `auth_permission` VALUES ('56', 'Can delete 笔记', '15', 'delete_notes');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 未公开的笔记', '15', 'add_nopublicnotes');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 未公开的笔记', '15', 'change_nopublicnotes');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 未公开的笔记', '15', 'delete_nopublicnotes');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 分类', '14', 'view_category');
INSERT INTO `auth_permission` VALUES ('61', 'Can view 未公开的笔记', '16', 'view_nopublicnotes');
INSERT INTO `auth_permission` VALUES ('62', 'Can view 笔记', '15', 'view_notes');
INSERT INTO `auth_permission` VALUES ('63', 'Can view 标签', '13', 'view_tag');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES ('1', 'HZEI', 'hzei', '4261694f6b19a21322fb5fb54bd9c57f19a8e075', '2017-08-07 10:00:40.578000');
INSERT INTO `captcha_captchastore` VALUES ('4', 'YGUR', 'ygur', 'd1acf13f5af13c4fef3abf36f012877d5b95b8e1', '2017-08-07 10:03:25.589000');
INSERT INTO `captcha_captchastore` VALUES ('5', 'WGOC', 'wgoc', 'e91c67940704e5769476d2795891551c6108f242', '2017-08-07 17:19:11.311000');
INSERT INTO `captcha_captchastore` VALUES ('6', 'SNAW', 'snaw', '0252731a118f9b3b576fdf97abc9d70439a554dd', '2017-08-07 17:35:16.927000');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('12', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('14', 'notes', 'category');
INSERT INTO `django_content_type` VALUES ('16', 'notes', 'nopublicnotes');
INSERT INTO `django_content_type` VALUES ('15', 'notes', 'notes');
INSERT INTO `django_content_type` VALUES ('13', 'notes', 'tag');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('8', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('11', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('9', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('10', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-08-07 08:47:20.624000');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-08-07 08:47:28.687000');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-08-07 08:47:30.724000');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-08-07 08:47:30.911000');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2017-08-07 08:47:32.049000');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-08-07 08:47:32.894000');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-08-07 08:47:33.532000');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-08-07 08:47:33.644000');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-08-07 08:47:34.180000');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-08-07 08:47:34.206000');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-08-07 08:47:34.256000');
INSERT INTO `django_migrations` VALUES ('12', 'sessions', '0001_initial', '2017-08-07 08:47:34.659000');
INSERT INTO `django_migrations` VALUES ('13', 'users', '0001_initial', '2017-08-07 08:48:24.960000');
INSERT INTO `django_migrations` VALUES ('14', 'xadmin', '0001_initial', '2017-08-07 09:51:08.106000');
INSERT INTO `django_migrations` VALUES ('15', 'captcha', '0001_initial', '2017-08-07 09:51:31.711000');
INSERT INTO `django_migrations` VALUES ('16', 'notes', '0001_initial', '2017-08-07 09:51:37.335000');
INSERT INTO `django_migrations` VALUES ('17', 'notes', '0002_auto_20170804_2032', '2017-08-07 09:51:40.511000');
INSERT INTO `django_migrations` VALUES ('18', 'notes', '0003_auto_20170804_2036', '2017-08-07 09:51:43.450000');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('tap13lglhrqcb7yg8awgnrigyyudkru5', 'ZDM3ODdlY2M4NGMzNzdlY2MyMWZiNjNiM2U0NWUyMjU0Njk0YmM5Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sibm90ZXMiLCJjYXRlZ29yeSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiNDM5OTViNjcxMzFkNTA5Yzc3NzBjNzcyNjczODk4YmM0YjNmYzFhNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2017-08-23 16:59:36.676000');

-- ----------------------------
-- Table structure for notes_category
-- ----------------------------
DROP TABLE IF EXISTS `notes_category`;
CREATE TABLE `notes_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_category_author_id_80d304ae_fk_users_userprofile_id` (`author_id`),
  CONSTRAINT `notes_category_author_id_80d304ae_fk_users_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notes_category
-- ----------------------------
INSERT INTO `notes_category` VALUES ('7', '篮球', '4');

-- ----------------------------
-- Table structure for notes_notes
-- ----------------------------
DROP TABLE IF EXISTS `notes_notes`;
CREATE TABLE `notes_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_notes_author_id_956b8ae9_fk_users_userprofile_id` (`author_id`),
  KEY `notes_notes_category_id_76349cee_fk_notes_category_id` (`category_id`),
  CONSTRAINT `notes_notes_author_id_956b8ae9_fk_users_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `notes_notes_category_id_76349cee_fk_notes_category_id` FOREIGN KEY (`category_id`) REFERENCES `notes_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notes_notes
-- ----------------------------

-- ----------------------------
-- Table structure for notes_notes_tag
-- ----------------------------
DROP TABLE IF EXISTS `notes_notes_tag`;
CREATE TABLE `notes_notes_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notes_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notes_notes_tag_notes_id_c739c82a_uniq` (`notes_id`,`tag_id`),
  KEY `notes_notes_tag_tag_id_04cfcd8a_fk_notes_tag_id` (`tag_id`),
  CONSTRAINT `notes_notes_tag_notes_id_5ca07bc8_fk_notes_notes_id` FOREIGN KEY (`notes_id`) REFERENCES `notes_notes` (`id`),
  CONSTRAINT `notes_notes_tag_tag_id_04cfcd8a_fk_notes_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `notes_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notes_notes_tag
-- ----------------------------

-- ----------------------------
-- Table structure for notes_tag
-- ----------------------------
DROP TABLE IF EXISTS `notes_tag`;
CREATE TABLE `notes_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_tag_author_id_20ae3327_fk_users_userprofile_id` (`author_id`),
  CONSTRAINT `notes_tag_author_id_20ae3327_fk_users_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notes_tag
-- ----------------------------
INSERT INTO `notes_tag` VALUES ('13', '篮球', '4');
INSERT INTO `notes_tag` VALUES ('14', '标签2', '4');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$24000$LJ2zaaJVQbKk$r0V5oIYpaOjgKN6x79kUI++TNcABDFaIo7fBkEOc4EA=', '2017-08-09 16:58:55.873000', '1', 'liuyc', '', '', '2@qq.com', '1', '1', '2017-08-07 08:48:50.228000', '', null, 'female', '', null, 'images/default.png');
INSERT INTO `users_userprofile` VALUES ('4', 'pbkdf2_sha256$24000$FUg58kKmmPEN$7m6ohlUMqvua1ivRWIjlWMgl4sLmugYwTzncUu7s640=', '2017-08-09 16:28:03.779000', '0', '615chaoge', '', '', '3@qq.com', '0', '0', '2017-08-07 09:56:18.718000', '615chaoge', null, 'female', '', null, 'images/default.png');
INSERT INTO `users_userprofile` VALUES ('5', 'pbkdf2_sha256$24000$u7S38gRRwEJF$QrJQMnPpEQU6RpqH6XqVs9ybbJVrfIFE3JkpJKXdMFs=', '2017-08-08 16:30:03.810000', '0', '615chaoye', '', '', '4@qq.com', '0', '0', '2017-08-07 09:56:37.701000', '615chaoye', null, 'female', '', null, 'images/default.png');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2017-08-07 09:53:30.965000', '127.0.0.1', '2', '', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2017-08-07 09:53:48.185000', '127.0.0.1', '3', '', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2017-08-07 09:55:04.294000', '127.0.0.1', null, '', 'delete', '批量删除 2 个 用户信息', null, '1');
INSERT INTO `xadmin_log` VALUES ('4', '2017-08-07 09:57:18.440000', '127.0.0.1', '1', 'chaoge分类1', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2017-08-07 09:57:33.308000', '127.0.0.1', '2', 'chaoye分类1', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2017-08-07 09:57:51.930000', '127.0.0.1', '1', 'chaoge标签1', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2017-08-07 09:58:07.239000', '127.0.0.1', '2', 'chaoye标签1', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2017-08-08 09:53:10.706000', '127.0.0.1', '1', '1', 'delete', '', '15', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2017-08-09 13:29:29.141000', '127.0.0.1', null, '', 'delete', '批量删除 1 个 标签', null, '1');
INSERT INTO `xadmin_log` VALUES ('10', '2017-08-09 16:59:16.082000', '127.0.0.1', null, '', 'delete', '批量删除 1 个 笔记', null, '1');
INSERT INTO `xadmin_log` VALUES ('11', '2017-08-09 16:59:35.625000', '127.0.0.1', null, '', 'delete', '批量删除 1 个 分类', null, '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
