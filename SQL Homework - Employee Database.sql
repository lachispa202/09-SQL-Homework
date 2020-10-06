-- SQL Homework, Employee Database: A Mystery in Two Parts

-- Part 1 - Data Modeling Section

-- Import the different CSV files

-- DROP TABLE Employees;

CREATE TABLE Employees (
    emp_no INTEGER  NOT NULL,
    emp_title_id VARCHAR(10)  NOT NULL,
    birth_date DATE  NOT NULL,
    first_name VARCHAR(30)  NOT NULL,
    last_name VARCHAR(30)  NOT NULL,
    sex VARCHAR(5)  NOT NULL,
    hire_date DATE  NOT NULL, 
	PRIMARY KEY (emp_no)
);

SELECT * FROM employees

-- DROP TABLE Departments;

CREATE TABLE Departments (
    dept_no VARCHAR(10)  NOT NULL,
    dept_name VARCHAR(30)  NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * FROM Departments

-- DROP TABLE Salaries;

CREATE TABLE Salaries (
    emp_no INTEGER  NOT NULL,
    salary INTEGER  NOT NULL 
);

SELECT * FROM Salaries

-- DROP TABLE Titles;

CREATE TABLE Titles (
    title_id VARCHAR(10)  NOT NULL,
    title VARCHAR(30)  NOT NULL 
);

SELECT * FROM Titles

-- DROP TABLE Dept_emp;

CREATE TABLE Dept_emp (
    emp_no INTEGER  NOT NULL,
    dept_no VARCHAR(10)  NOT NULL 
);

SELECT * FROM Dept_emp

-- DROP TABLE Dept_manager;

CREATE TABLE Dept_manager (
    dept_no VARCHAR(10)  NOT NULL,
    emp_no INTEGER  NOT NULL 
);

SELECT * FROM Dept_manager



-- Part 2 - Data Analysis

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

Select
e.emp_no,
e.last_name,
e.first_name,
e.sex, 
s.salary
From employees e
Join salaries s
On e.emp_no=s.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.

Select
emp_no,
first_name,
last_name,
hire_date
From employees
Where extract(year from hire_date) = '1986';


-- 3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.

Select
m.dept_no, 
dept_name,
m.emp_no,
first_name,
last_name,
hire_date
FROM dept_manager m
LEFT JOIN departments on m.dept_no = departments.dept_no
LEFT JOIN employees on m.emp_no = employees.emp_no;


-- 4. List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.

Select
e.emp_no,
first_name,
last_name,
dept_name
FROM employees e
Left Join dept_emp d
On e.emp_no = d.emp_no
Left Join departments
On d.dept_no = departments.dept_no;


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and 
-- last names begin with "B."

Select
first_name,
last_name,
sex
From employees
Where first_name LIKE 'Hercules'
And last_name LIKE 'B%';


-- 6. List all employees in the Sales department, including their employee number, last name, 
-- first name, and department name.

Select
e.emp_no,
first_name,
last_name,
dept_name
FROM employees e
Left Join dept_emp d
On e.emp_no = d.emp_no
Left Join departments
On d.dept_no = departments.dept_no
Where departments.dept_name LIKE 'Sales';


-- 7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

Select
e.emp_no,
first_name,
last_name,
dept_name
FROM employees e
Left Join dept_emp d
On e.emp_no = d.emp_no
Left Join departments
On d.dept_no = departments.dept_no
Where departments.dept_name LIKE 'Sales'
Or departments.dept_name LIKE 'Development';

 
-- 8. In descending order, list the frequency count of employee last names, i.e., how many 
-- employees share each last name.

Select last_name, 
Count(last_name) as "Frequency of Last Name"
From employees
Group By
last_name
Order By "last_name" DESC;

