create database employee;
use employee;
create table departments (
                    department_id int,
                    department_name char(100));
                    
create table location (location_id int, 
                       location varchar(30));
create table employees (
                         employee_id int,
						 employee_name varchar(50),
                         gender enum( 'M','F'),
                         age int,
                         hire_date date,
                         designation varchar(100),
                         department_id int,
                         location_id int,
                         salary decimal(10,2));
alter table employees
add column email varchar(50);                         
alter table employees
modify column designation varchar(200);
alter table employees
drop column age;
alter table employees
rename column hire_date to date_of_joining;
rename table departments to Departments_Info;
rename table location to locations;
truncate table employees;
drop table employees;
drop database employee;

CREATE DATABASE employee;
USE employee;
create table departments(
					department_id int primary KEY,
                    department_name char(100) not NULL unique);
create table location(
                      location_id int primary key auto_increment,
                      location varchar(30) not null unique);
create table employees(employee_id int primary key,
					   employee_name varchar(30) not null,
                       gender enum('M','F') not null,
                       age int check(age>=18),
                       hire_date date default (current_date) ,
                       designation varchar(100),
                       
                       department_id INT,
					   location_id INT,
                       FOREIGN KEY (department_id) 
                       REFERENCES departments(department_id),
                       FOREIGN KEY (location_id)
                       REFERENCES location(location_id),
					
                       salary decimal(10,2));
SELECT * FROM employees;
SELECT * FROM location;
SELECT * FROM departments;

use employee;
SELECT * FROM employees;
INSERT INTO departments
VALUES(1, 'HR'),(2, 'Finance'),(3, 'IT'),(4, 'Marketing');
SELECT * FROM departments;   
INSERT INTO location
(location)
VALUES('India'),('France'),('USA'),('UK'),('Germany');
SELECT * FROM location; 
INSERT INTO employees
(employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary)
VALUES
(1, 'Christy', 'F', 21, '2018-06-15', 'Data Analyst', 3, 1, 45000),
(2, 'alwin', 'M', 28, '2015-03-10', 'Data Scientist', 3, 2, 65000);
INSERT INTO employees
(employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary)
VALUES
(3, 'Aishy', 'F', 24, '2018-09-20', 'HR Analyst', 1, 3, 52000),
(4, 'kezii', 'M', 32, '2014-11-05', 'Senior Analyst', 2, 4, 72000),
(5, 'ardra', 'F', 26, '2018-02-12', NULL, 2, 1, 58000);

UPDATE employees
SET designation = NULL
WHERE employee_id = 5;

SELECT * FROM employees;

SELECT DISTINCT salary
FROM employees;

SELECT age AS Employee_Age,
       salary AS Employee_Salary
FROM employees;

SELECT employee_name, salary
FROM employees
WHERE salary > 50000
  AND hire_date < '2016-01-01';

UPDATE employees
SET designation = 'Data Scientist'
WHERE employee_id = 5;

SELECT employee_name, designation
FROM employees
WHERE employee_id = 5;


SELECT *
FROM employees
ORDER BY department_id ASC, salary DESC;

SELECT *
FROM employees
WHERE hire_date BETWEEN '2018-01-01' AND '2018-12-31'
LIMIT 5;

SELECT SUM(salary)
FROM employees
WHERE department_id = 2;

SELECT MIN(age)
FROM employees;

SELECT location_id, MAX(salary)
FROM employees
GROUP BY location_id;

SELECT designation, AVG(salary)
FROM employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) < 3;

SELECT location_id, AVG(age)
FROM employees
WHERE gender = 'F'
GROUP BY location_id
HAVING AVG(age) < 30;

SELECT employees.employee_name,
       employees.designation,
       departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id;

SELECT departments.department_id,
       departments.department_name,
       COUNT(employees.employee_id) AS employee_count
FROM departments
LEFT JOIN employees
ON departments.department_id = employees.department_id
GROUP BY departments.department_id, departments.department_name;

SELECT location.location,
       employees.employee_name
FROM employees
RIGHT JOIN location
ON employees.location_id = location.location_id;
