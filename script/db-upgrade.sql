use test;

drop table IF EXISTS DT_USERS;
drop table IF EXISTS DT_STUDENTS;

create table DT_USERS(
	id int NOT NULL AUTO_INCREMENT,
	username varchar(32),
	passwd varchar(32),
	email varchar(120),
	createTime timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);


CREATE TABLE DT_STUDENTS (
   id int,
   name varchar(32),
   
   primary key(id)
);



