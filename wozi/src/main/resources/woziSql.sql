drop table if exists WOZI_USER;

create table WOZI_USER(
	id int(11) primary key auto_increment,
	user_name varchar(50) not null,
	user_password varchar(120) not null,
	sex int(1) , # 0:boy  1:girl
	age int(3),
	email varchar(50) ,
	birth date,
	create_time datetime not null,
	update_time datetime not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


drop table if exists WOZI_MENU
create table WOZI_MENU (
id int(11) primary key auto_increment,
up_id int(11) ,
name varchar(50) not null,
create_time datetime not null,
update_time datetime not null,
user_id int(11) not null,
alter_id int(11) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


drop table if exists WOZI_NOTE

create table WOZI_NOTE(
id int(11) primary key auto_increment,
name varchar(50) not null,
create_time datetime not null,
update_time datetime not null,
menu_id int(11) not null,
title varchar(50),
content text 

)ENGINE=InnoDB DEFAULT CHARSET=utf8;


drop table if exists WOZI_USER_POINT

create table WOZI_USER_POINT(
id int(11) primary key auto_increment,
user_id int(11) not null,
point int(11) not null,
status int(1)  default 0,#是否当前为黑名单 0不是  1是
create_time datetime not null,
update_time datetime not null

)ENGINE=InnoDB DEFAULT CHARSET=utf8;


drop table if exists WOZI_FRIENDS

create table WOZI_FRIENDS(
	id int(11) primary key auto_increment,
	add_side int(11) not null,
	added_side int(11) not null,
	added_pass int(1) default null ,

create_time datetime not null,
update_time datetime not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



drop table if exists wozi_chat_one_to_one;
create table wozi_chat_one_to_one(

id int(11) primary key auto_increment,
starter varchar(50) not null comment '谈话发起人',
ender varchar(50) not null comment '谈话第二人',
create_time datetime not null,
content varchar(140) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
