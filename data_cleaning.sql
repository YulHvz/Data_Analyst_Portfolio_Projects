/*
Create a database and a table
*/

CREATE DATABASE restaurants;

CREATE TABLE inspections(
CAMIS INT,
DBA varchar(150),
BORO varchar(150),
BUILDING varchar(150),
STREET varchar(150),
ZIPCODE int,
PHONE int,
CUISINE_DESCRIPTION varchar(255),
INSPECTION_DATE date,
ACTION varchar(255),
VIOLATION_CODE varchar(150), 
VIOLATION_DESCRIPTION varchar(400),
CRITICAL_FLAG varchar(255),
SCORE varchar(50),
GRADE varchar(50),
GRADE_DATE varchar(10),
RECORD_DATE varchar(10),
INSPECTION_TYPE varchar(255)
);
 
 -- Update a table column:
 
ALTER TABLE inspections
MODIFY score varchar(30);

-- Load a csv file into the inspections table:
LOAD DATA INFILE '/Users/yulhvz/Downloads/archive/DOHMH_New_York_City_Restaurant_Inspection_Results.csv'
INTO TABLE inspections
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 rows;

-- Standardize Date Format
ALTER TABLE inspections
ADD COLUMN inspection_date1 DATE;
ALTER TABLE inspections
ADD COLUMN grade_date1 DATE;
ALTER TABLE inspections
ADD COLUMN record_date1 DATE;

UPDATE inspections
SET inspection_date = STR_TO_DATE(inspection_date1, '%m/%d/%Y');
UPDATE inspections
SET record_date = STR_TO_DATE(record_date1, '%m/%d/%Y');
