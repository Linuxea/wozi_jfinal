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

