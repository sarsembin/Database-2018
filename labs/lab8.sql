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
department_id INTEGER REFERENCES departments
);
CREATE TABLE job_grades (
grade CHAR(1),
lowest_salary INTEGER,
highest_salary INTEGER
);
DROP TABLE employees;
SELECT * FROM departments;
SELECT * FROM employees;
INSERT INTO locations VALUES ('11', '12', '13', '14'),('21', '22', '23', '24'),('31', '32', '33', '34');
INSERT INTO departments (department_name, budget, location_id)VALUES ('dp1', 500, 11), ('dp2', 600, 21), ('dp3', 700, 31);
INSERT INTO job_grades VALUES ('A', 50, 1000), ('B', 1200, 100000);
INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id)VALUES ('max', 'maxs', 'lmao1', '1212', 900,4),('max1', 'maxs1', 'lmao12', '12122', 100, 5),('max2', 'maxs3', 'lmao123', '12123', 9000, 4); 
SELECT first_name, last_name, city, department_name, state_province FROM (employees INNER JOIN departments ON employees.department_id = departments.department_id) INNER JOIN locations ON departments.location_id = locations.location_id;
SELECT first_name, last_name, salary, grade FROM employees INNER JOIN job_grades ON (employees.salary > lowest_salary AND employees.salary < highest_salary);
SELECT first_name, last_name, salary FROM employees FULL OUTER JOIN employees ON (employee_id = 2);