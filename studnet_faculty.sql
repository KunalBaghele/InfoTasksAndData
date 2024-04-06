use info;
create table department (
    id int primary key,
    department_name varchar(255)
);

create table faculty (
    id int primary key,
    faculty_name varchar(255),
    department_id int,
    foreign key (department_id) references department(id)
);

create table subject (
    id int primary key,
    subject_name varchar(255),
    faculty_id int,
    student_id int,
    foreign key (student_id) references student(id),
    foreign key (faculty_id) references faculty(id)
);

create table student (
    id int primary key,
    student_name varchar(255),
    department_id int,
    foreign key (department_id) references department(id)
);

--  data for department table
insert into department (id, department_name) values
(1, 'computer science'),
(2, 'physics'),
(3, 'mathematics'),
(4, 'chemistry'),
(5, 'biology');

--  data for faculty table
insert into faculty (id, faculty_name, department_id) values
(101, 'dr. gupta', 1),
(102, 'prof. verma', 2),
(103, 'dr. sharma', 3),
(104, 'prof. patel', 4),
(105, 'dr. singh', 5);

--  data for student table
insert into student (id, student_name, department_id) values
(201, 'amit kumar', 1),
(202, 'priya sharma', 2),
(203, 'rahul singh', 3),
(204, 'neha verma', 4),
(205, 'suresh patel', 5);

--  data for subject table
insert into subject (id, subject_name, faculty_id, student_id) values
(301, 'database management', 101, 201),
(302, 'quantum mechanics', 102, 202),
(303, 'linear algebra', 103, 203),
(304, 'organic chemistry', 104, 204),
(305, 'genetics', 105, 205);

select
    student.id,
    student.student_name,
    department.department_name
from student
join department on student.department_id = department.id;

select
    subject.id,
    subject.subject_name,
    department.department_name
from subject
join faculty on subject.faculty_id = faculty.id
join department on faculty.department_id = department.id
where faculty.id = 103;

select
    faculty.id,
    faculty.faculty_name,
    count(subject.id) as subject_count
from faculty
left join subject on faculty.id = subject.faculty_id
group by faculty.id, faculty.faculty_name;

select
    faculty.id,
    faculty.faculty_name,
    department.id as department_id,
    department.department_name,
    group_concat(subject.subject_name) as subjects_taught
from faculty
join department on faculty.department_id = department.id
left join subject on faculty.id = subject.faculty_id
group by faculty.id, faculty.faculty_name, department.id, department.department_name;

select
    faculty.id as faculty_id,
    faculty.faculty_name,
    subject.id as subject_id,
    subject.subject_name,
    department.id as department_id,
    department.department_name,
    count(student.id) as student_count
from subject
join faculty on subject.faculty_id = faculty.id
join department on faculty.department_id = department.id
left join student on subject.student_id = student.id
group by faculty.id, faculty.faculty_name, subject.id, subject.subject_name, department.id, department.department_name;





