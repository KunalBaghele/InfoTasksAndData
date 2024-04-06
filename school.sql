create database school;

use school;

create table class (
    id int auto_increment primary key,
    class_name varchar(255) not null
);
create table teachers (
    id int auto_increment primary key,
    full_name varchar(255) not null,
    contact varchar(20) not null,
    email varchar(255),
    class_id int,
    foreign key (class_id) references class(id)
);

create table students (
    id int auto_increment primary key,
    full_name varchar(255) not null,
    contact varchar(20) not null,
    email varchar(255),
    class_id int,
    foreign key (class_id) references class(id)
);

create table library (
    id int auto_increment primary key,
    book_name varchar(255) not null,
    quantity int,
    std_id int,
    foreign key (std_id) references students(id)
);

insert into class (class_name) values
('one'),('two'),('three'),('four'),('five'),('six'),('seven'),('eight'),('nine'),('ten');

insert into teachers (full_name, contact, email, class_id) values
('Raj Kumar', '9876543210', 'raj.kumar@email.com', 1),
('Priya Sharma', '8765432109', 'priya.sharma@email.com', 2),
('Amit Singh', '7654321098', 'amit.singh@email.com', 3),
('Deepa Patel', '6543210987', 'deepa.patel@email.com', 4),
('Rahul Verma', '5432109876', 'rahul.verma@email.com', 5),
('Raj Kumar', '9876543210', 'raj.kumar@email.com', 3),
('Priya Sharma', '8765432109', 'priya.sharma@email.com', 5),
('Amit Singh', '7654321098', 'amit.singh@email.com', 2),
('Deepa Patel', '6543210987', 'deepa.patel@email.com', 4),
('Rahul Verma', '5432109876', 'rahul.verma@email.com', 5);


insert into students (full_name, contact, email, class_id) values
('Student One', '1234567890', 'student.one@email.com', 1),
('Student Two', '2345678901', 'student.two@email.com', 1),
('Student Three', '3456789012', 'student.three@email.com', 1),
('Student Seven', '7890123456', 'student.seven@email.com', 2),
('Student Eight', '8901234567', 'student.eight@email.com', 2),
('Student Ten', '0123456789', 'student.ten@email.com', 2),
('Student Eleven', '1234567890', 'student.eleven@email.com', 2),
('Student Twelve', '2345678901', 'student.twelve@email.com', 3),
('Student Thirteen', '3456789012', 'student.thirteen@email.com', 3),
('Student Fourteen', '4567890123', 'student.fourteen@email.com', 3),
('Student Fifteen', '5678901234', 'student.fifteen@email.com', 4),
('Student Sixteen', '6789012345', 'student.sixteen@email.com', 4),
('Student Twenty-One', '1234567890', 'student.twentyone@email.com', 4),
('Student Twenty-Two', '2345678901', 'student.twentytwo@email.com', 4),
('Student Twenty-Three', '1234567890', 'student.twentythree@email.com', 5),
('Student Twenty-Four', '2345678901', 'student.twentyfour@email.com', 5),
('Student Twenty-Five', '3456789012', 'student.twentyfive@email.com', 6),
('Student Twenty-Six', '4567890123', 'student.twentysix@email.com', 6),
('Student Twenty-Seven', '5678901234', 'student.twentyseven@email.com', 6),
('Student Twenty-Eight', '6789012345', 'student.twentyeight@email.com', 7),
('Student Forty', '6789012345', 'student.forty@email.com', 7),
('Student Forty-One', '7890123456', 'student.fortyone@email.com', 7),
('Student Forty-Two', '8901234567', 'student.fortytwo@email.com', 8),
('Student Forty-Three', '9012345678', 'student.fortythree@email.com', 8),
('Student Forty-Four', '0123456789', 'student.fortyfour@email.com', 8),
('Student Thirty-Five', '1234567890', 'student.thirtyfive@email.com', 9),
('Student Thirty-Six', '2345678901', 'student.thirtysix@email.com', 9),
('Student Thirty-Seven', '3456789012', 'student.thirtyseven@email.com', 9),
('Student Thirty-Eight', '4567890123', 'student.thirtyeight@email.com', 10),
('Student Thirty-Nine', '5678901234', 'student.thirtynine@email.com', 10);

insert into library (book_name, quantity, std_id) values
('Indian History Book', 10, 1),
('Science ', 8, 2),
('English Grammar ', 15, 8),
('Physics ', 12, 4),
('Mathematics ', 20, 12);

select * from class;
select * from teachers;
select * from library;
select * from students;

-- List all students with their class names:
select s.full_name, c.class_name
from students s
join class c on s.class_id = c.id;

-- Find the total number of books in the library:
select sum(quantity) as total_books
from library;

-- List teachers along with the number of students they have:
select t.full_name, count(s.id) as num_students
from teachers t
left join students s on t.class_id = s.class_id
group by t.full_name;

-- Find the class with the highest number of students:
select c.class_name, count(s.id) as num_students
from class c
left join students s on c.id = s.class_id
group by c.class_name
order by num_students desc
limit 1;

-- Find the teacher who has the most students:
select t.full_name, count(s.id) as num_students
from teachers t
left join students s on t.class_id = s.class_id
group by t.full_name
order by num_students desc
limit 1;

-- List the books along with the students who borrowed them:
select l.book_name, s.full_name
from library l
join students s on l.std_id = s.id;

-- List students who have borrowed more than 2 books: // DNR
select s.full_name
from students s
join library l on s.id = l.std_id
group by s.full_name
having count(l.id) > 2;

-- Find the minimum and maximum quantity of books in the library:
select min(quantity) as min_books, max(quantity) as max_books
from library;

-- List the teachers and their contact numbers along with class names:
select t.full_name, t.contact, c.class_name
from teachers t
join class c on t.class_id = c.id;

-- Count the number of distinct books in the library:
select count(distinct book_name) as distinct_books
from library;

-- Find the total number of students in each class:
select c.class_name, count(s.id) as num_students
from class c
left join students s on c.id = s.class_id
group by c.class_name;


-- List classes with students less than or equal to 3:
select c.class_name, count(s.id) as num_students
from class c
left join students s on c.id = s.class_id
group by c.class_name
having num_students <= 3;

-- Calculate the average contact length for teachers:
select avg(length(contact)) as avg_contact_length
from teachers;

-- Crud Query

-- Class Table 
insert into class (class_name) values ('eleven');
select * from class;
update class set class_name = 'eleven_updated' where id = 11;
delete from class where id = 11;

-- Teachers Table
insert into teachers (full_name, contact, email, class_id) values ('john doe', '9876543211', 'john.doe@email.com', 1);
select * from teachers;
delete from teachers where id = 1;
update teachers set email = 'john.doe.updated@email.com' where id = 1;

-- Students Table
insert into students (full_name, contact, email, class_id) values ('student forty-five', '9876543210', 'student.fortyfive@email.com', 10);
select * from students;
update students set email = 'student.fortyfive.updated@email.com' where id = 45;
delete from students where id = 45;

-- Library Table
insert into library (book_name, quantity, std_id) values ('chemistry', 5, 15);
select * from library;
update library set quantity = 6 where id = 1;
delete from library where id = 1;