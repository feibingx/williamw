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
   reason text,
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
   sts varchar(12) default 'sts_unprove',
   role varchar(12),
   interview varchar(32),
   primary key(id)
);



insert into dt_students(id,username,name,pid,sex,policy,birthyear,birthmonth,birthday,healthy,city,address,addcode,phone,cell,gradeschool,gradesection,number,daddy,daddyname,daddyjob,daddyphone,mummy,mummyname,mummyjob,mummyphone,honors,prices,history,reason,yuwem1,yuwem2,shuxue1,shuxue2,yingyu1,yingyu2,wuli1,wuli2,huaxue1,huaxue2,zongfen1,zongfen2,paimin1,paimin2,sts,role,interview) values(1,'1','姓名我','1','男','党员','1997','6','29','你再猜','你再猜','住址','200002','2222222','222','你猜','你猜','你猜猜猜','','','','','','','','','',NULL,'',NULL,'','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL)
