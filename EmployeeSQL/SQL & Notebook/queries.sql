--Data Analysis
SELECT * FROM "Departments";
SELECT * FROM "Employees";
SELECT * FROM "Department_Employees";
SELECT * FROM "Department_Managers";
SELECT * FROM "Salaries";
SELECT * FROM "Titles";

--#1
select "Employees"."Employee_Number", "Employees"."Last_Name", "Employees"."First_Name",
"Employees"."Gender", "Salaries"."Salary"
from "Employees"
join "Salaries" ON
"Employees"."Employee_Number" = "Salaries"."Employee_Number";

--#2
select "First_Name", "Last_Name", "Hire_Date" from "Employees"
where "Hire_Date" BETWEEN '1986-01-01'
			  AND '1987-01-01';

--#3
select "Departments"."Department_Number", "Departments"."Department_Name", "Department_Managers"."Employee_Number",
"Employees"."Last_Name", "Employees"."First_Name", "Department_Managers"."Start_Date", "Department_Managers"."End_Date"
from "Department_Managers"
join "Departments" ON
"Department_Managers"."Department_Number" = "Departments"."Department_Number" 
join "Employees" ON
"Department_Managers"."Employee_Number" = "Employees"."Employee_Number";

--#4
select "Employees"."Employee_Number", "Employees"."Last_Name", "Employees"."First_Name",
"Departments"."Department_Name"
from "Employees"
join "Department_Employees" ON 
"Employees"."Employee_Number" = "Department_Employees"."Employee_Number"
join "Departments" ON
"Departments"."Department_Number" = "Department_Employees"."Department_Number"
order by "Employees"."Employee_Number";

--#5
select "First_Name", "Last_Name"
from "Employees"
where "First_Name" = 'Hercules'
AND "Last_Name" LIKE 'B%';

--#6
select "Employees"."Employee_Number", "Employees"."Last_Name", "Employees"."First_Name",
"Departments"."Department_Name"
from "Employees"
JOIN "Department_Employees" ON
"Employees"."Employee_Number" = "Department_Employees"."Employee_Number"
JOIN "Departments" ON 
"Departments"."Department_Number" = "Department_Employees"."Department_Number"
where "Departments"."Department_Name" = 'Sales';

--#7
select "Employees"."Employee_Number", "Employees"."Last_Name", "Employees"."First_Name",
"Departments"."Department_Name"
from "Employees"
JOIN "Department_Employees" ON
"Employees"."Employee_Number" = "Department_Employees"."Employee_Number"
JOIN "Departments" ON 
"Departments"."Department_Number" = "Department_Employees"."Department_Number"
where "Departments"."Department_Name" IN ('Development', 'Sales'); 

--#8
select "Last_Name", COUNT("Last_Name") as "Frequency_Count"
from "Employees"
group by "Last_Name"
order by "Frequency_Count" DESC
