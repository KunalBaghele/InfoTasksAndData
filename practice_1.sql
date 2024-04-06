drop database if exists info;
create database info;
use info;

create table emp (id int primary key, ename varchar(255), esalary decimal(10,2), edepartment varchar(50));

insert into emp (id, ename, esalary, edepartment) 
values (1, 'John', 50000.00, 'IT'), (2, 'Smith', 60000.00, 'HR'), (3, 'Bob', 55000.00, 'Finance');

select * from emp;

insert into emp (id, ename, esalary, edepartment)
values (4, 'Alice', 48000.00, 'Marketing');

select * from emp;

select * from emp where id = 2;

update emp set esalary = 62000.00 where id = 2;

select * from emp;

delete from emp where id = 3;
