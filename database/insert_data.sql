create database quanlysinhvien;
use quanlysinhvien;

create table faculty (
	id bigint NOT NULL PRIMARY KEY auto_increment,
	code varchar(255) unique, 
	facultyName varchar(255),
    createdby varchar(255), 
	createddate datetime, 
	modifiedby varchar(255), 
	modifieddate datetime
);

create table teacher (
	id bigint NOT NULL PRIMARY KEY auto_increment,
	createdby varchar(255),
	createddate datetime,
	modifiedby varchar(255), 
	modifieddate datetime, 
	classname varchar(255), 
	code varchar(255)unique, 
	dateofbirth varchar(255), 
	gender varchar(255), 
	name varchar(255), 
	faculty_id bigint
);
alter table teacher add constraint fk_teacher_faculty foreign key (faculty_id) references faculty(id);

create table classuit (
	id bigint NOT NULL PRIMARY KEY auto_increment,
	createdby varchar(255),
	createddate datetime,
	modifiedby varchar(255), 
	modifieddate datetime, 
	classname varchar(255), 
	code varchar(255)unique, 
	total varchar(255),
	teacher_code varchar(255)
);
alter table classuit add constraint fk_classuit_teacher foreign key (teacher_code) references teacher(code);

create table student (
	id bigint NOT NULL PRIMARY KEY auto_increment,
	createdby varchar(255),
	createddate datetime,
	modifiedby varchar(255), 
	modifieddate datetime, 
	classname varchar(255), 
	code varchar(255)unique, 
	dateofbirth varchar(255), 
	gender varchar(255), 
	name varchar(255), 
	classUIT_id bigint, 
	faculty_id bigint
);

alter table student add constraint fk_student_classuit foreign key (classUIT_id) references classuit(id);
alter table student add constraint fk_student_faculty foreign key (faculty_id) references faculty(id);


create table user (
        id bigint NOT NULL PRIMARY KEY auto_increment,
        username varchar(250) NOT NULL,
        password varchar(250) NOT NULL,
        fullname varchar(250) NOT NULL,
        status int NOT NULL,
        createddate timestamp NULL,
        modifieddate timestamp NULL,
        createdby varchar(250) NULL,
        modifiedby varchar(250) NULL
);

create table role (
		id bigint NOT NULL PRIMARY KEY auto_increment,
        name varchar(250) NOT NULL,
        code varchar(250) NOT NULL,
	
        createddate timestamp NULL,
        modifieddate timestamp NULL,
        createdby varchar(250) NULL,
        modifiedby varchar(250) NULL
);

create table user_role (
		id bigint NOT NULL PRIMARY KEY auto_increment,
        roleid bigint NOT NULL,
        userid bigint NOT NULL,
        
        createddate timestamp NULL,
        modifieddate timestamp NULL,
        createdby varchar(250) NULL,
        modifiedby varchar(250) NULL
);
alter table user_role add constraint fk_user_role_role foreign key (roleid) references role(id);
alter table user_role add constraint fk_user_role_user foreign key (userid) references user(id);

insert into faculty(code,facultyname) values('KHMT','Khoa học máy tính');
insert into faculty(code,facultyname) values('HTTT','Hệ thống thông tin');
insert into faculty(code,facultyname) values('CNPM','Công nghệ phần mềm');
insert into faculty(code,facultyname) values('MTT','Mạng và truyền thông');
insert into faculty(code,facultyname) values('KTMT','Kỹ thuật máy tính');

insert into teacher(gender,code,name,dateofbirth,faculty_id) values('Nam','GV01','Hồ Thanh Sơn','2/5/1950',1);
insert into teacher(gender,code,name,dateofbirth,faculty_id) values('Nam','GV02','Trần Tâm Thanh','17/12/1965',2);
insert into teacher(gender,code,name,dateofbirth,faculty_id) values('Nữ','GV03','Dỗ Nghiem Phụng','23/9/2004',3);
insert into teacher(gender,code,name,dateofbirth,faculty_id) values('Nam','GV04','Trần Nam Son','22/2/1961',4);
insert into teacher(gender,code,name,dateofbirth,faculty_id) values('Nam','GV05','Mai Thành Danh','12/3/1958',5);

insert into classuit(code,classname,total,teacher_code) values('K11','CN2.K2022.1',15,'GV01');
insert into classuit(code,classname,total,teacher_code) values('K12','CN2.K2022.2',15,'GV02');
insert into classuit(code,classname,total,teacher_code) values('K13','CN2.K2022.3',15,'GV03');

insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nam','K202201','Trần Quang Duyệt','6/1/1997',1,1);
insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nam','K202202','Phan Hồng	Hải','5/3/1997',2,2);
insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nữ','K202203','Nguyễn Thị Cẩm Hồng','17/12/1997',3,3);
insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nữ','K202204','Nguyễn Thị Lan Hương','26/4/1997',4,1);
insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nam','K202205','Phan Anh Huy','30/5/1997',5,2);
insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nam','K202206','Tạ Tiến Khải','14/10/1997',1,3);
insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nam','K202207','Phan Nguyễn Nhật Đăng','19/8/1997',2,1);
insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nứ','K202208','Nguyễn Thục Đoan','25/5/1997',3,1);
insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nu','K202209','Trần Mỹ Duyên','11/8/1997',4,2);
insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nam','K202210','Tăng Huỳnh Phú','20/1/1997',5,3);
insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nam','K202211','Phạm Minh Niên','19/8/1997',1,1);
insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nam','K202212','Trần Trung Nghi','14/12/1997',2,2);
insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nam','K202213','Nguyễn Xuân Quân','21/7/1997',3,3);
insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nam','K202214','Trần Trung Nghi','11/2/1997',4,1);
insert into student(gender,code,name,dateofbirth,faculty_id,classUIT_id) values('Nam','K202215','Nguyễn Hồng Nhung','2/11/1997',5,2);

insert into role(code,name) values('ADMIN','Quản trị');
insert into role(code,name) values('USER','Người dùng');

insert into user(username,password,fullname,status)
values('tanghuynhphu','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','Tăng Huỳnh Phú',1);
insert into user(username,password,fullname,status)
values('phamminhnien','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','Phạm Minh Niên',1);
insert into user(username,password,fullname,status)
values('trantrungnghi','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','Trần Trung Nghi',1);

INSERT INTO user_role(userid,roleid) VALUES (1,1);
INSERT INTO user_role(userid,roleid) VALUES (2,2);
INSERT INTO user_role(userid,roleid) VALUES (3,2);