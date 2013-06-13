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
	imgpath varchar(100),
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
   name varchar(32)  not null,
   pid varchar(18) not null,
   sex varchar(6) not null,
   policy varchar(16),
   birthyear varchar(4),
   birthmonth varchar(2),
   birthday varchar(2),
   healthy varchar(16),
   city varchar(32)  not null,
   address varchar(120) not null,
   addcode varchar(12) not null,
   phone varchar(24) not null,
   cell varchar(24) not null,
   gradeschool varchar(80) not null,
   gradesection varchar(32) not null,
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
   yuwem1 varchar(6),
   yuwem2 varchar(6),
   shuxue1  varchar(6),
   shuxue2 varchar(6),
   yingyu1 varchar(6),
   yingyu2 varchar(6),
   wuli1 varchar(6),
   wuli2 varchar(6),
   huaxue1 varchar(6),
   huaxue2 varchar(6),
   zongfen1 varchar(6),
   zongfen2 varchar(6),
   paimin1 varchar(6),
   paimin2 varchar(6),
   sts varchar(12) default 'sts_unprove',
   role varchar(12),
   interview varchar(32),
   feedback varchar(24),
   primary key(id)
);