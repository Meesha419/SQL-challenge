--CREATING TABLES
CREATE TABLE titles(	
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR NOT NULL
);

CREATE TABLE departments(
dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

CREATE TABLE employees(
		emp_no INT PRIMARY KEY,
		emp_title_id VARCHAR NOT NULL,
		birth_date VARCHAR NOT NULL,
		first_name VARCHAR NOT NULL,
		last_name VARCHAR NOT NULL,
		gender VARCHAR NOT NULL,
		hire_date VARCHAR NOT NULL,
		FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
	);
	
-- dept_emp table : Many to Many - two primary keys 
	CREATE TABLE dept_emp(
		emp_no INT NOT NULL,
		dept_no VARCHAR NOT NULL,
		PRIMARY KEY (emp_no, dept_no),
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);
	

	CREATE TABLE salaries(
		emp_no INT PRIMARY KEY,
		salary INT NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);
	
	
-- dept_manager table : Many to Many - two primary keys are needed
	CREATE TABLE dept_manager(
		dept_no VARCHAR NOT NULL,
		emp_no INT NOT NULL,
		PRIMARY KEY (dept_no, emp_no),
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);


--1. Employees' personal details list
SELECT employees.emp_no, 
	employees.last_name,
	employees.first_name,
	employees.gender,
	Salaries.salary
	FROM employees
	LEFT JOIN Salaries
	ON employees.emp_no = Salaries.emp_no
	ORDER BY emp_no

--2. List of employees who were hired in 1986.
SELECT employees.last_name,
	employees.first_name,
	employees.hire_date
    FROM employees
	WHERE DATE_PART('year',hire_date) = 1986
	

--3. Manager list of each department 
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;


--4. Department list of each employee 
	SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	dept_emp.dept_no,
	departments.dept_name
	FROM employees 
	INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
	INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
	order by emp_no;
	

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
	SELECT * FROM employees
	WHERE first_name = 'Hercules' AND last_name like 'B%';
	

--6. Sales Department Employee list
	SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name,
	dept_emp.dept_no
	FROM employees 
	LEFT JOIN dept_emp 
	ON employees.emp_no=dept_emp.emp_no
	INNER JOIN departments 
	ON departments.dept_no=dept_emp.dept_no
	WHERE departments.dept_name='Sales';
	

-- 7. Sales and Development departments employees.

	SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name,
	dept_emp.dept_no
	FROM employees 
	LEFT JOIN dept_emp 
	ON employees.emp_no=dept_emp.emp_no
	INNER JOIN departments 
	ON departments.dept_no=dept_emp.dept_no
	WHERE departments.dept_name in ('Sales', 'Development')
	

--8.Fequency count of employees - decending order
	SELECT last_name, COUNT(*) AS freq_count
	FROM employees
	GROUP BY last_name
	ORDER BY freq_count DESC;
