create database library;
use library;

create table authors(
id_authors int primary key auto_increment,
name_authors varchar(50)
);

create table category(
id_category int primary key auto_increment,
name_category varchar(50)
);

create table books(
id_books int primary key auto_increment,
title varchar(50),
page_size int,
id_authors int,
foreign key(id_authors) references authors(id_authors),
id_category int,
foreign key(id_category) references category(id_category)
);	

create table students(
id_students int primary key auto_increment,
class_name varchar(50),
name_students varchar(50),
birthday date
);

create table students_books(
id_students int,
id_books int,
borrow_date DATE,
return_date DATE,
primary key(id_books,id_students),
foreign key(id_books) references books(id_books),
foreign key(id_students) references students(id_students)
);

insert into category(name_category) 
values ('Tự nhiên'),
('Xã hội'),
('Truyện'),
('Tiểu Thuyết'),
('Khác');

insert into authors(name_authors) 
values ('Nguyễn Thái Học'),
('Trần Mình Hoàng'),
('Dương Trung Quốc'),
('Lê Văn Hiến'),
('Hà Văn Minh');

insert into students(class_name,name_students,birthday) 
values ('C0822G1','Nguyễn Văn A','1999-12-12'),
('C0822G1','Nguyễn Văn B','1999-12-13'),
('C0822G1','Nguyễn Văn C','1999-12-14'),
('C0922G1','Nguyễn Văn D','1999-12-15'),
('C1022G1','Nguyễn Văn E','1999-12-16');