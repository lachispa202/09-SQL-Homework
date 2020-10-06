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

