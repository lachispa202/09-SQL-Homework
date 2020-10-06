
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
Order By "Frequency of Last Name" DESC;

