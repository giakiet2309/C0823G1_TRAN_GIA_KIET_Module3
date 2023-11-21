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

create table borrows(
id_borrows int primary key auto_increment,
id_students int,
id_books int,
borrow_date date,
return_date date,
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
values ('Nguyễn thái Học'),
('Trần Mình Hoàng'),
('Dương Trung Quốc'),
('Lê Văn Hiến'),
('Hà Văn minh');

insert into students(class_name,name_students,birthday) 
values ('C0822G1','Nguyễn Văn A','1999-12-12'),
('C0822G1','Nguyễn văn B','1999-12-13'),
('C0822G1','Nguyễn Văn C','1999-12-14'),
('C0922g1','Nguyễn Văn D','1999-12-15'),
('C1022G1','Nguyễn Văn E','1999-12-16');

insert into books(title,page_size,id_authors,id_category)
values ('Toán',45,1,1),
('Văn',34,2,2),
('Sử',56,3,2),
('Địa',76,4,2),
('Hóa',32,5,1),
('sinh',69,3,2);

insert into borrows(id_students,id_books,borrow_date,return_date)
values (1,1,'2022-12-12','2022-12-13'),
(2,2,'2022-12-12','2022-12-15'),
(3,3,'2022-12-12','2022-12-15'),
(4,4,'2022-12-12','2022-12-12'),
(1,5,'2022-12-13','2022-12-15'),
(1,5,'2022-12-14','2022-12-14'),
(3,4,'2022-12-15','2022-12-29'),
(3,3,'2022-12-8','2022-12-14'),
(1,2,'2022-12-6','2022-12-30');

--  Thông kê các đầu sách được mượn nhiều nhất 
select 
 title,count(borrows.id_books) as so_luong
from books
join borrows on books.id_books = borrows.id_books
group by borrows.id_books
order by so_luong desc;

-- thông kê các đầu sách chưa được mượn

select id_books,title
from books
where id_books not in (select books.id_books
from books
join borrows b on books.id_books = b.id_books);

-- lấy ra danh sách các học viên đã từng mượn sách và sắp xếp  theo số lượng mượn sách từ lớn đến nhỏ 
select s.name_students,count(s.id_students) as so_luong 
from students s
join borrows b on s.id_students = b.id_students
group by s.id_students
order by so_luong desc;

-- - Lấy ra các học viên mượn sách nhiều nhất của thư viện 
select s.name_students,count(s.id_students) as so_luong 
from students s
join borrows b on s.id_students = b.id_students
group by s.id_students
having so_luong in (
select max(so_luong) 
from (select s.name_students,count(s.id_students) as so_luong 
from students s
join borrows b on s.id_students = b.id_students
group by s.id_students) bt
);