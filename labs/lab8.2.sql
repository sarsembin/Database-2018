CREATE TABLE locations (
location_id SERIAL PRIMARY KEY,
street_address VARCHAR(25),
postal_code VARCHAR(12),
city VARCHAR(30),
state_province VARCHAR(12)
);

CREATE TABLE departments(
department_id SERIAL PRIMARY KEY,
department_name VARCHAR(50) UNIQUE,
budget INTEGER,
location_id INTEGER REFERENCES locations
);

CREATE TABLE employees (
employee_id SERIAL PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50),
phone_number VARCHAR(20),
salary INTEGER,
managed_id INTEGER REFERENCES employees,
department_id INTEGER REFERENCES departments
);

CREATE TABLE job_grades (
grade CHAR(1),
lowest_salary INTEGER,
highest_salary INTEGER
);
INSERT INTO locations VALUES (1, 'tolebi', '01000', 'astana', 'astanaprov'),(2, 'panfilova', '02000', 'almaty', 'almatyprov');
INSERT INTO departments VALUES (11, 'depar1', 100, 1),(12, 'depar2', 200, 2 );
INSERT INTO employees VALUES (111, 'maxim', 'hohlov', 'xd@1', 'phonen1', 10, 111, 11),(112, 'valrii', 'sokolov', 'xd@2', 'phonen2', 20, 111, 12);
INSERT INTO employees VALUES (113, 'stas', 'gluhov', 'xd@3', 'phonen3', 8, 112, 11),(114, 'sergei', 'zimulkin', 'xd@4', 'phonen4', 25, 113, 12);
INSERT INTO job_grades VALUES ('A', 0, 11), ('B', 12, 30);
--3
SELECT first_name, last_name, employees.department_id, city, state_province FROM (employees INNER JOIN departments ON employees.department_id = departments.department_id) INNER JOIN locations ON departments.location_id = locations.location_id  WHERE last_name LIKE '%hlov'
--4
SELECT department_name, city, state_province FROM departments INNER JOIN locations ON departments.location_id = locations.location_id;
--5
SELECT * FROM employees;
SELECT E.first_name AS "Employee Name",M.first_name AS "Manager" FROM employees E INNER JOIN employees M ON E.managed_id = M.employee_id;
SELECT E.first_name AS "Employee Name",M.first_name AS "Manager" FROM employees E LEFT OUTER JOIN employees M ON E.managed_id = M.employee_id;
--6
SELECT avg(salary), grade FROM employees INNER JOIN job_grades ON (employees.salary > lowest_salary AND employees.salary < highest_salary) GROUP BY grade; 
--7
SELECT first_name, last_name FROM( employees E INNER JOIN departments D ON E.department_id = D.department_id ) INNER JOIN locations L ON D.location_id = L.location_id WHERE city = 'astana'