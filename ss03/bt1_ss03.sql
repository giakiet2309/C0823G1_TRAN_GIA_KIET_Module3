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
borrow_date DATE,
return_date DATE,
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

insert into books(title,page_size,id_authors,id_category)
values ('Toán',45,1,1),
('Văn',34,2,2),
('Sử',56,3,2),
('Địa',76,4,2),
('Hóa',32,5,1);

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


-- Lấy ra toàn bộ sách có trong thư viện, cùng với tên thể loại và tác giả 
select books.* , authors.name_authors as 'tác giả' , category.name_category as 'thể loại'
 from books 
join authors 
on books.id_authors = authors.id_authors 
join category
on books.id_category = category.id_category;
--   Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp danh sách theo theo tên từ a->z
select * 
from students
 join borrows 
on students.id_students = borrows.id_students;

-- Lấy ra  2 quyển sách được mượn nhiều nhất
SELECT 
 title,count(borrows.id_books) AS so_luong
FROM books
JOIN borrows  ON books.id_books = borrows.id_books
GROUP BY borrows.id_books
ORDER BY so_luong DESC
LIMIT 2; 
