-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE "Departments"
DROP TABLE "Dept_Emp"

CREATE TABLE "Departments" (
    "Dept_No" VARCHAR   NOT NULL,
    "Dept_Name" VARCHAR   NOT NULL
);

DROP TABLE "Dept_Emp"

CREATE TABLE "Dept_Emp" (
    "Emp_No" INT   NOT NULL,
    "Dept_No" VARCHAR   NOT NULL,
    "From_Date" DATE   NOT NULL,
    "To_Date" DATE   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "Dept_No" VARCHAR   NOT NULL,
    "Emp_No" INT   NOT NULL,
    "From_Date" VARCHAR   NOT NULL,
    "To_Date" VARCHAR   NOT NULL
);

CREATE TABLE "Employees" (
    "Emp_No" INT   NOT NULL,
    "Birth_Date" VARCHAR   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Gender" VARCHAR   NOT NULL,
    "Hire_Date" VARCHAR   NOT NULL
);

CREATE TABLE "Salaries" (
    "Emp_No" INT   NOT NULL,
    "Salary" INT   NOT NULL,
    "From_Date" VARCHAR   NOT NULL,
    "To_Date" VARCHAR   NOT NULL
);

CREATE TABLE "Titles" (
    "Emp_No" INT   NOT NULL,
    "Title" VARCHAR   NOT NULL,
    "From_Date" VARCHAR   NOT NULL,
    "To_Date" VARCHAR   NOT NULL
);

SELECT * FROM "Employees"
SELECT * FROM "Salaries"
SELECT * FROM "Dept_Emp"
SELECT * FROM "Dept_Manager"
SELECT * FROM "Departments"

--1.List the following details of each employee: 
-- **Employee number, last name, first name, gender, and salary.

SELECT emp."Emp_No", emp."Last_Name", emp."First_Name", emp."Gender", sal."Salary"
FROM "Employees" AS emp
JOIN "Salaries" AS sal ON
sal."Emp_No" = emp."Emp_No"

-- 2. List employees who were hired in 1986.

SELECT emp."Emp_No", emp."Last_Name", emp."First_Name", emp."Hire_Date"
FROM "Employees" AS emp
WHERE "Hire_Date" LIKE '%1986%'

--3. List the manager of each department with the following information: 
-- **Department number, department name, the manager's employee number, last name, first name, 
--   and start and end employment dates.

CREATE VIEW Dept_Manager_Data AS
SELECT dept."Dept_No", dept."Dept_Name", mgr."Emp_No"
FROM "Departments" AS dept
JOIN "Dept_Manager" AS mgr ON
mgr."Dept_No" = dept."Dept_No"

SELECT * FROM Dept_Manager_Data

--FINAL QUERY for Challenge #3--

SELECT dpmgr."Dept_No", dpmgr."Dept_Name", dpmgr."Emp_No", emp."Last_Name", emp."First_Name", dp."From_Date" as "Start Date", dp."To_Date" AS "End Date"
FROM Dept_Manager_Data AS dpmgr
JOIN "Employees" AS emp ON
emp."Emp_No" = dpmgr."Emp_No"
JOIN "Dept_Emp" AS dp ON
dpmgr."Emp_No" = dp."Emp_No"



-- 4. List the department of each employee with the following information: 
-- ** Employee number, last name, first name, and department name.
SELECT emp."Emp_No" AS "Employee Number", emp."Last_Name" AS "Last Name", emp."First_Name" AS "First Name",
dept."Dept_Name" AS "Department Name"
FROM "Employees" as emp
JOIN "Dept_Emp" AS deptemp ON
deptemp."Emp_No" = emp."Emp_No"
JOIN "Departments" as dept ON
dept."Dept_No" = deptemp."Dept_No"

-- 5.List all employees whose first name is "Hercules" and last names begin with "B."

SELECT "First_Name", "Last_Name"
FROM "Employees"
WHERE "First_Name" = 'Hercules' 
AND "Last_Name" LIKE 'B%'

SELECT * FROM "Employees"

-- 6. List all employees in the Sales department, including their 
-- ** Employee number, last name, first name, and department name.

SELECT emp."Emp_No" AS "Employee Number", emp."Last_Name" AS "Last Name", emp."First_Name" AS "First Name",
dept."Dept_Name" AS "Department Name"
FROM "Employees" as emp
JOIN "Dept_Emp" AS deptemp ON
deptemp."Emp_No" = emp."Emp_No"
JOIN "Departments" as dept ON
dept."Dept_No" = deptemp."Dept_No"
WHERE "Dept_Name" = 'Sales'

-- 7. List all employees in the Sales and Development departments, 
-- **Including their employee number, last name, first name, and department name.

SELECT emp."Emp_No" AS "Employee Number", emp."Last_Name" AS "Last Name", emp."First_Name" AS "First Name",
dept."Dept_Name" AS "Department Name"
FROM "Employees" as emp
JOIN "Dept_Emp" AS deptemp ON
deptemp."Emp_No" = emp."Emp_No"
JOIN "Departments" as dept ON
dept."Dept_No" = deptemp."Dept_No"
WHERE "Dept_Name" = 'Sales' OR
"Dept_Name" = 'Development'

-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT emp."Last_Name", COUNT("Last_Name") 
FROM "Employees" AS emp
GROUP BY "Last_Name"
HAVING COUNT("Last_Name") > 1
ORDER BY "count" DESC





