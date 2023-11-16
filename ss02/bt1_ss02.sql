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