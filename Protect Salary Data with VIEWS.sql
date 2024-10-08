CREATE DATABASE business;
USE business;
CREATE TABLE employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    salary DECIMAL(15, 2) NOT NULL
);
INSERT INTO employee(first_name, last_name, department, job_title, salary) 
VALUES ('Jean', 'Unger', 'Accounting', 'Bookkeeper', 81200);

INSERT INTO employee(first_name, last_name, department, job_title, salary) 
VALUES ('Brock', 'Warren', 'Accounting', 'CFO', 246000);

INSERT INTO employee(first_name, last_name, department, job_title, salary) 
VALUES ('Ruth', 'Zito', 'Marketing', 'Creative Director', 175000);

INSERT INTO employee(first_name, last_name, department, job_title, salary) 
VALUES ('Ann', 'Ellis', 'Technology', 'Programmer', 119500);

INSERT INTO employee(first_name, last_name, department, job_title, salary) 
VALUES ('Todd', 'Lynch', 'Legal', 'Compliance Manager', 157000);
SELECT * FROM employee;
CREATE VIEW v_employee AS
SELECT employee_id, first_name, last_name, department, job_title
FROM employee;
SELECT * FROM v_employee;
CREATE USER 'hr_user'@'localhost' IDENTIFIED BY 'password';

FLUSH PRIVILEGES;
CREATE USER 'hr_user'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'accounting_user'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'marketing_user'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'legal_user'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'technology_user'@'localhost' IDENTIFIED BY 'password';

GRANT SELECT ON business.v_employee TO hr_user@localhost;
GRANT SELECT ON business.v_employee TO accounting_user@localhost;
GRANT SELECT ON business.v_employee TO marketing_user@localhost;
GRANT SELECT ON business.v_employee TO legal_user@localhost;
GRANT SELECT ON business.v_employee TO technology_user@localhost;
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'legal_user'@'localhost';

CREATE VIEW v_employee_fn_dept AS
SELECT first_name, department
FROM employee;

GRANT SELECT(employee_id, first_name, last_name, department, job_title) 
ON employee TO technology_user@localhost;

SELECT employee_id, first_name, last_name 
FROM employee;

REVOKE ALL PRIVILEGES ON business.employee FROM 'technology_user'@'localhost';

GRANT SELECT (employee_id, first_name, last_name, department, job_title) ON business.employee TO 'technology_user'@'localhost';

SELECT salary 
FROM employee; 
#This will return an error for technology_user.


SHOW GRANTS FOR 'technology_user'@'localhost';






