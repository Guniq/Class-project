create table student(
	studentNo int primary key,
    studentName varchar(20) not null,
    studentId varchar(20) not null,
    studentPw varchar(20) not null,
    studentEmail varchar(50) not null,
    studentDate datetime default now(),
    
    foreign key(studentNo) references college(studentNo) 
);

drop table student;
select * from student;


create table college(
	studentNo int primary key,
    collegeMajor varchar(20) not null,
    collegeDate datetime default now()
);

insert into college(studentNo, collegeMajor) value(1111, '국어국문과');
insert into college(studentNo, collegeMajor) value(2222, '컴퓨터공학과');
insert into college(studentNo, collegeMajor) value(3333, '피아노과');
insert into college(studentNo, collegeMajor) value(4444, '지리학과');

drop table college;
select * from college;


create table class(
	classNo int auto_increment primary key,
    className varchar(20) not null,
    classTeacher varchar(20) not null,
    classCategory varchar(20) not null,
    classMajor varchar(100) not null,
    classPeople int default 0,
    classPrice int default 0,
    classDate datetime default now()
);

drop table class;
select * from class;


create table notice(
	noticeNo int auto_increment primary key,
    noticeTitle varchar(100) not null,
    noticeContents varchar(100) not null,
    noticeWriter varchar(20) not null,
    noticeDate datetime default now()
);

drop table notice;
select * from notice;


create table cart(
	className varchar(50) not null,
    classTeacher varchar(20) not null,
    classCategory varchar(20) not null,
    classMajor varchar(20) not null
);

drop table cart;
select * from cart;