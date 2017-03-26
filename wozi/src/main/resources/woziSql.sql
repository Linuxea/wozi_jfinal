drop table if exists WOZI_USER;

create table WOZI_USER(
	id int(11) primary key auto_increment,
	user_name varchar(50) not null,
	user_password varchar(120) not null,
	sex int(1) , # 0:boy  1:girl
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
)


drop table if exists WOZI_NOTE

create table WOZI_NOTE(
id int(11) primary key auto_increment,
name varchar(50) not null,
create_time datetime not null,
update_time datetime not null,
menu_id int(11) not null,
title varchar(50),
content text 

)

