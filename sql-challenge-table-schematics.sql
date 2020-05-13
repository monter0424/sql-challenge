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
