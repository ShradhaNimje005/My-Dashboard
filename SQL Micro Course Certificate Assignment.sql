--30 Days SQL Micro Course Certificate Assignment

CREATE TABLE Data (
	Hospital_Name VARCHAR(50),
	Location VARCHAR(50),
	Department VARCHAR(50),
	Doctors_Count INT,
	Patients_Count INT,
	Admission_Date DATE,
	Discharge_Date DATE,
	Medical_Expenses NUMERIC(10,2)
);

DROP TABLE IF EXISTS Data;

SELECT * FROM Data;

SET DATESTYLE = 'ISO', 'DMY';

COPY Data (Hospital_Name,Location,Department,Doctors_Count,Patients_Count,Admission_Date,Discharge_Date,Medical_Expenses)
FROM 'D:\SQL Micro Course\Hospital_Data.csv'
DELIMITER ','
CSV HEADER;

--1. Total Number of Patients
-- *  Write an SQL query to find the total number of patients across all hospitals.

SELECT Hospital_Name, SUM (Patients_Count) AS Total_Number_of_Patients  
FROM Data
GROUP BY Hospital_Name;


--2. Average Number of Doctors per Hospital
-- * Retrieve the average count of doctors available in each hospital.

SELECT Hospital_Name, AVG (Doctors_Count) AS Avg_Count_of_Doctors 
FROM Data
GROUP BY Hospital_Name;


--3. Top 3 Departments with the Highest Number of Patients
-- * Find the top 3 hospital departments that have the highest number of patients.

SELECT Department, SUM (Patients_Count) AS Highest_Number_of_Patients  
FROM Data
GROUP BY Department
ORDER BY Highest_Number_of_Patients DESC LIMIT 3;


--4. Hospital with the Maximum Medical Expenses
-- * Identify the hospital that recorded the highest medical expenses.

SELECT Hospital_Name, SUM (Medical_Expenses) AS Total_Expense
FROM Data
GROUP BY Hospital_Name
ORDER BY Total_Expense DESC LIMIT 1;


--5. Daily Average Medical Expenses
-- * Calculate the average medical expenses per day for each hospital.

SELECT Hospital_Name, Admission_Date AS Expense_Date, AVG(Medical_Expenses) AS Avg_Expenses
FROM Data
GROUP BY Hospital_Name, Admission_Date
ORDER BY Hospital_Name, Admission_Date;


--6. Longest Hospital Stay
-- * Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date

SELECT Hospital_Name, Admission_Date, Discharge_Date, 
(Discharge_Date - Admission_Date) AS Patient_Stay
FROM Data
ORDER BY Patient_Stay DESC LIMIT 1;

--7. Total Patients Treated Per City
-- * Count the total number of patients treated in each city.

SELECT Location, SUM (Patients_Count) AS Total_Patients
FROM Data
GROUP BY Location;


--8. Average Length of Stay Per Department
-- * Calculate the average number of days patients spend in each department.

SELECT Department, AVG (Discharge_Date - Admission_Date) AS Days_Spent
FROM Data
GROUP BY Department
ORDER BY Days_Spent;


--9. Identify the Department with the Lowest Number of Patients
-- * Find the department with the least number of patients.

SELECT Department, SUM(Patients_Count) AS Total_Patients
FROM Data
GROUP BY Department
ORDER BY Total_Patients ASC LIMIT 1;


--10. Monthly Medical Expenses Report
-- * Group the data by month and calculate the total medical expenses for each month.

SELECT TO_CHAR(Admission_Date, 'Month-YYYY') AS Month, SUM(Medical_Expenses) AS Total_Medical_Expenses
FROM Data
GROUP BY TO_CHAR(Admission_Date, 'Month-YYYY')
ORDER BY Month;









