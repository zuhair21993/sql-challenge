-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Departments" (
    "Department_Number" VARCHAR   NOT NULL,
    "Department_Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Department_Number"
     )
);

CREATE TABLE "Department_Employees" (
    "Employee_Number" INTEGER   NOT NULL,
    "Department_Number" VARCHAR   NOT NULL,
    "Start_Date" TIMESTAMP   NOT NULL,
    "End_Date" TIMESTAMP   NOT NULL
);

CREATE TABLE "Department_Managers" (
    "Department_Number" VARCHAR   NOT NULL,
    "Employee_Number" INTEGER   NOT NULL,
    "Start_Date" TIMESTAMP   NOT NULL,
    "End_Date" TIMESTAMP   NOT NULL
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE "Employees" (
    "Employee_Number" INTEGER   NOT NULL,
    -- Field documentation comment 1
    -- Field documentation comment 2
    -- Field documentation comment 3
    "Birth_Date" TIMESTAMP   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Gender" VARCHAR   NOT NULL,
    "Hire_Date" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Employee_Number"
     )
);

CREATE TABLE "Salaries" (
    "Employee_Number" INTEGER   NOT NULL,
    "Salary" BIGINT   NOT NULL,
    "Start_Date" TIMESTAMP   NOT NULL,
    "End_Date" TIMESTAMP   NOT NULL
);

CREATE TABLE "Titles" (
    "Employee_Number" INTEGER   NOT NULL,
    "Title" VARCHAR   NOT NULL,
    "Start_Date" TIMESTAMP   NOT NULL,
    "End_Date" TIMESTAMP   NOT NULL
);

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_Employee_Number" FOREIGN KEY("Employee_Number")
REFERENCES "Employees" ("Employee_Number");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_Department_Number" FOREIGN KEY("Department_Number")
REFERENCES "Departments" ("Department_Number");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_Department_Number" FOREIGN KEY("Department_Number")
REFERENCES "Departments" ("Department_Number");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_Employee_Number" FOREIGN KEY("Employee_Number")
REFERENCES "Employees" ("Employee_Number");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Employee_Number" FOREIGN KEY("Employee_Number")
REFERENCES "Employees" ("Employee_Number");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_Employee_Number" FOREIGN KEY("Employee_Number")
REFERENCES "Employees" ("Employee_Number");

