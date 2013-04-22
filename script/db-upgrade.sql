create database apply character set utf8;

use apply;

drop table IF EXISTS dt_users;
drop table IF EXISTS dt_students;

create table dt_users(
	id int NOT NULL AUTO_INCREMENT,
	username varchar(32) unique not null,
	passwd varchar(32) not null,
	email varchar(120),
	role varchar(12),
	createTime timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);


CREATE TABLE dt_students (
   id int not null unique,
   username varchar(32) unique not null,
   name varchar(32),
   pid varchar(18),
   sex varchar(6),
   policy varchar(16),
   birthyear varchar(4),
   birthmonth varchar(2),
   birthday varchar(2),
   healthy varchar(16),
   city varchar(32),
   address varchar(120),
   addcode varchar(12),
   phone varchar(24),
   cell varchar(24),
   gradeschool varchar(80),
   gradesection varchar(32),
   number varchar(48),
   daddy varchar(8),
   daddyname varchar(16),
   daddyjob varchar(80),
   daddyphone varchar(32),
   mummy varchar(8),
   mummyname varchar(16),
   mummyjob varchar(80),
   mummyphone varchar(32),
   honors text,
   prices text,
   history text,
   applyreason text,
   yuwem1 varchar(4),
   yuwem2 varchar(4),
   shuxue1  varchar(4),
   shuxue2 varchar(4),
   yingyu1 varchar(4),
   yingyu2 varchar(4),
   wuli1 varchar(4),
   wuli2 varchar(4),
   huaxue1 varchar(4),
   huaxue2 varchar(4),
   zongfen1 varchar(4),
   zongfen2 varchar(4),
   paimin1 varchar(4),
   paimin2 varchar(4),
   sts varchar(8),
   role varchar(12),
   interview varchar(32),
   primary key(id)
);

