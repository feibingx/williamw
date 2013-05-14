CREATE DATABASE apply
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Chinese (Simplified)_People''s Republic of China.936'
       LC_CTYPE = 'Chinese (Simplified)_People''s Republic of China.936'
       CONNECTION LIMIT = -1;

use apply;


drop table IF EXISTS dt_users;
drop table IF EXISTS dt_students;
drop table IF EXISTS sysconf;


create sequence id_seq increment 1 minvalue 1 maxvalue 9223372036854775807  cache 1;
create sequence nid_seq increment 1 minvalue 1 maxvalue 9223372036854775807  cache 1;

create table dt_users(
	id int not null primary key default nextval('id_seq'),
	username varchar(32) unique not null,
	passwd varchar(32) not null,
	email varchar(120),
	role varchar(12),
	createTime timestamp DEFAULT CURRENT_TIMESTAMP
);
create table sysconf(
	confname varchar(60) not null primary key,
	confvalue text
);

insert into sysconf values('sysphase','applying');
insert into sysconf values('logintext',null);

CREATE TABLE dt_students (
   id int not null unique,
   nid int not null default nextval('nid_seq'),
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
   imgpath varchar(80),
   sts varchar(12) default 'sts_unprove',
   role varchar(12),
   interview varchar(32),
   primary key(id)
);

alter table dt_students add column feedback varchar(24);

insert into dt_students(id,username,name,pid,sex,policy,birthyear,birthmonth,birthday,healthy,city,address,addcode,phone,cell,gradeschool,gradesection,number,daddy,daddyname,daddyjob,daddyphone,mummy,mummyname,mummyjob,mummyphone,honors,prices,history,reason,yuwem1,yuwem2,shuxue1,shuxue2,yingyu1,yingyu2,wuli1,wuli2,huaxue1,huaxue2,zongfen1,zongfen2,paimin1,paimin2,sts,role,interview) values(1,'1','姓名我','1','男','党员','1997','6','29','你再猜','你再猜','住址','200002','2222222','222','你猜','你猜','你猜猜猜','','','','','','','','','',NULL,'',NULL,'','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL)
