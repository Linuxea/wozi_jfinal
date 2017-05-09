
CREATE TABLE `wozi_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_side` int(11) NOT NULL,
  `added_side` int(11) NOT NULL,
  `added_pass` varchar(5) DEFAULT 'false',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8


CREATE TABLE `wozi_head_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `head_path` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8


CREATE TABLE `wozi_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户留言信息表',
  `title` varchar(150) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(2) DEFAULT '0' COMMENT '0表示没看过 1表示看过了',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8


CREATE TABLE `wozi_menu` (
  `tb_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(11) NOT NULL,
  `parent` varchar(11) DEFAULT NULL,
  `text` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`tb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT


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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8



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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8


CREATE TABLE `wozi_user_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `status` int(1) DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `comment` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8


CREATE TABLE `wozi_user_stop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8