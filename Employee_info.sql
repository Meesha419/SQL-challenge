--Table Schema
  --Departments Table
  
DROP TABLE Departments

CREATE TABLE Departments(

  Dept_no VARCHAR(10),
  Dept_name VARCHAR(30) NOT NULL,
  PRIMARY KEY (Dept_no)
);

SELECT * FROM Departments

-- Create Employees Table

DROP TABLE Employees


CREATE TABLE Employees (
	Emp_no INT NOT NULL,
	Birth_Date DATE NOT NULL,
	First_Name VARCHAR(20) NOT NULL,
	Last_Name VARCHAR(20) NOT NULL,
	Gender VARCHAR(2) NOT NULL,
	Hire_Date DATE NOT NULL,
	PRIMARY KEY (Emp_no)
);
SELECT * FROM Employees

--Create Department_Employee Table

DROP TABLE Dept_Emp

CREATE TABLE Dept_Emp (
	Emp_No INT NOT NULL,
	Dept_No VARCHAR(10) NOT NULL,
	From_Date DATE NOT NULL,
	To_Date DATE NOT NULL,
    FOREIGN KEY (emp_No) REFERENCES Employees(emp_no),
    FOREIGN KEY (Dept_No) REFERENCES Departments(Dept_no)
);

SELECT * FROM Dept_Emp


-- Create Department_Managers table

DROP TABLE Dept_Mang

CREATE TABLE Dept_Mang (
 Emp_No INT NOT NULL,
 Dept_no VARCHAR,
 From_Date DATE NOT NULL,
 To_Date DATE NOT NULL,
 FOREIGN KEY (Dept_no) REFERENCES Departments(Dept_no),
 FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * FROM Dept_Mang

--Creating Salaries Table


DROP TABLE Salaries


CREATE TABLE Salaries (
	Emp_no BIGINT NOT NULL,
	Salary BIGINT NOT NULL,
	From_Date DATE NOT NULL,
	To_Date DATE NOT NULL,
	FOREIGN KEY(Emp_no) REFERENCES Employees(Emp_no)
);


SELECT * FROM Salaries


--Creating Titles table


DROP TABLE Titles


CREATE TABLE Titles (
	Empl_no INT NOT NULL,
	Title VARCHAR(20) NOT NULL,
	From_Date DATE NOT NULL,
	To_Date DATE NOT NULL,
	FOREIGN KEY(Empl_no) REFERENCES Employees(Empl_no)
);


SELECT * FROM Titles
