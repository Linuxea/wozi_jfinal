/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : wozi

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2017-05-11 22:02:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wozi_friends
-- ----------------------------
DROP TABLE IF EXISTS `wozi_friends`;
CREATE TABLE `wozi_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_side` int(11) NOT NULL,
  `added_side` int(11) NOT NULL,
  `added_pass` varchar(5) DEFAULT 'false',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wozi_head_pic
-- ----------------------------
DROP TABLE IF EXISTS `wozi_head_pic`;
CREATE TABLE `wozi_head_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `head_path` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wozi_leave
-- ----------------------------
DROP TABLE IF EXISTS `wozi_leave`;
CREATE TABLE `wozi_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户留言信息表',
  `title` varchar(150) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(2) DEFAULT '0' COMMENT '0表示没看过 1表示看过了',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wozi_menu
-- ----------------------------
DROP TABLE IF EXISTS `wozi_menu`;
CREATE TABLE `wozi_menu` (
  `tb_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(11) NOT NULL,
  `parent` varchar(11) DEFAULT NULL,
  `text` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`tb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for wozi_note
-- ----------------------------
DROP TABLE IF EXISTS `wozi_note`;
CREATE TABLE `wozi_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `menu_id` varchar(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wozi_user
-- ----------------------------
DROP TABLE IF EXISTS `wozi_user`;
CREATE TABLE `wozi_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(120) NOT NULL,
  `sex` varchar(15) DEFAULT 'girl',
  `age` int(5) DEFAULT NULL,
  `email` varchar(50) DEFAULT '',
  `birth` date DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `intro` varchar(500) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1为状态正常',
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wozi_user_point
-- ----------------------------
DROP TABLE IF EXISTS `wozi_user_point`;
CREATE TABLE `wozi_user_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `status` int(1) DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `comment` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Procedure structure for ddd
-- ----------------------------
DROP PROCEDURE IF EXISTS `ddd`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ddd`(out p2 varchar(23))
begin
select id from wozi_user into p2  ;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for hehe
-- ----------------------------
DROP PROCEDURE IF EXISTS `hehe`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hehe`()
begin
select * from wozi_user;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `test`;
DELIMITER ;;
CREATE TRIGGER `test` AFTER DELETE ON `wozi_user` FOR EACH ROW begin
declare ok_ varchar(20);
-- select OLD.id into ok_;
set @ok_ = OLD.id;
-- select @ok_;
end
;;
DELIMITER ;
