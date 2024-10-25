/*
 'could not open file "[your file path]\job_postings_fact.csv" for reading: Permission denied.'
 
 1. Open pgAdmin
 2. In Object Explorer (left-hand pane), navigate to `sql_course` database
 3. Right-click `sql_course` and select `PSQL Tool`
 - This opens a terminal window to write the following code
 4. Get the absolute file path of your csv files
 1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
 5. Paste the following into `PSQL Tool`, (with the CORRECT file path)
 */


COPY company_dim
FROM '[file path]'\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM '[file path]'\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM '[file path]'\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM '[file path]'\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');


SELECT *
FROM company_dim;
SELECT *
FROM job__postings_fact;
SELECT *
FROM skill_dim;
SELECT *
FROM skills_job_dim;
