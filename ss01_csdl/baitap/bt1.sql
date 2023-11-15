create database book_management;
use book_management;
create table books(
id int primary key auto_increment,
name varchar(100) not null,
page_size int,
author varchar (100) not null
);
insert into books(name,page_size,author)
values ('Toán',45,'Nguyễn Thái Học'),
    ('Văn',34,'Trần minh Hoàng'),
    ('Sử',56,'dương Trung Quốc'),
    ('Địa',76,'Lê Văn Hiến'),
    ('Hóa',32,'Hà Văn Minh');

update books
set page_size = 50
where name='Sử';

deLete from books
where id=5;

drop table books;

drop database book_management;