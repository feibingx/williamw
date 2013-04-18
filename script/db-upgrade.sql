use test;

drop table IF EXISTS DT_USERS;
drop table IF EXISTS DT_STUDENTS;

create table DT_USERS(
	id int NOT NULL AUTO_INCREMENT,
	username varchar(32) unique not null,
	passwd varchar(32) not null,
	email varchar(120),
	createTime timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);


CREATE TABLE DT_STUDENTS (
   id int not null unique,
   username varchar(32) unique not null,
   name varchar(32),
   sex varchar(6),
   policy varchar(16),
   birthyear varchar(8),
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
   prices text,
   selfintro text,
   applyreason text,
   yuwem1 tinyint,
   yuwem2 tinyint,
   shuxue1  tinyint,
   shuxue2 tinyint,
   yingyu1 tinyint,
   yingyu2 tinyint,
   wuli1 tinyint,
   wuli2 tinyint,
   huaxue1 tinyint,
   huaxue2 tinyint,
   zongfen1 tinyint,
   zongfen2 tinyint,
   paimin1 tinyint,
   paimin2 tinyint,
   primary key(id)
);


