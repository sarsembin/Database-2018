CREATE TABLE salesman(
salesman_id INTEGER PRIMARY KEY,
name VARCHAR(60),
city VARCHAR(60),
comission NUMERIC
);	
DROP TABLE salesman;
CREATE TABLE customers(
customer_id INTEGER PRIMARY KEY,
cust_name VARCHAR(60),
city VARCHAR(60),
grade INTEGER,
salesman_id INTEGER REFERENCES salesman(salesman_id)
);	
DROP TABLE customers;
CREATE TABLE orders(
ord_no INTEGER PRIMARY KEY,
purch_amt NUMERIC,
ord_date DATE,
customer_id INTEGER REFERENCES customers(customer_id),
salesman_id INTEGER REFERENCES salesman(salesman_id)
);	

INSERT INTO salesman VALUES (1, 'james', 'astana', 0.1), (2, 'mike', 'almaty', 0.2), (3, 'han', 'rome', 1.2);
INSERT INTO customers VALUES (101, 'victorXD', 'new york', 10, 1), (102, 'maxXD', 'rome', 12, 2), (103, 'vladXD', 'astana', 18, 2);
INSERT INTO orders VALUES (1001, 500.5, '2012-10-05', 101, 3), (1002, 510.2, '2012-05-05', 103, 3), (1003, 525.5, '2012-08-17', 102, 1);
INSERT INTO customers VALUES (104, 'stasXD', 'new york', 11, 1);
INSERT INTO orders VALUES (1004, 501.5, '2012-02-05', 101, 3);


CREATE ROLE juniord_dev LOGIN PASSWORD 'xd';
CREATE VIEW view1 AS SELECT avg(xd) as xd, xd, name FROM (SELECT count(ord_no) as xd, name FROM (salesman s FULL OUTER JOIN customers c ON s.salesman_id = c.salesman_id) FULL OUTER JOIN orders o ON o.salesman_id = s.salesman_id GROUP BY name) x GROUP BY name, xd;
CREATE VIEW view2 AS SELECT count(ord_no), city FROM customers c INNER JOIN orders o ON c.customer_id = o.customer_id GROUP BY city;
ALTER ROLE juniord_dev SUPERUSER;
CREATE VIEW view3 AS SELECT cust_name FROM customers c INNER JOIN salesman s ON c.salesman_id = s.salesman_id WHERE grade in (SELECT grade FROM customers c INNER JOIN salesman s ON c.salesman_id = s.salesman_id ORDER BY grade ASC LIMIT 1);
grant select on view1 to juniord_dev;
CREATE VIEW view4 AS SELECT count(salesman_id), grade FROM customers GROUP BY grade;
CREATE VIEW view5 AS SELECT name, count(ord_no) FROM salesman s INNER JOIN orders o ON s.salesman_id = o.salesman_id GROUP BY name;
CREATE ROLE intern;
	