/* Order of Write:
SELECT
FROM
JOIN
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT

ORDER OF EXECUTION:
FROM/JOIN
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
LIMIT/OFFSET
*/


QUERIES:
1.
SELECT job_postings_fact.job_title_short, 
  	   job_postings_fact.job_location
FROM job_postings_fact
LIMIT 7

2.
SELECT DISTINCT job_postings_fact.job_title_short 			
FROM job_postings_fact;
SELECT DISTINCT job_postings_fact.job_location
FROM job_postings_fact;

3.	
SELECT DISTINCT job_postings_fact.job_title_short, 
            		job_postings_fact.job_location
FROM job_postings_fact;

4.
SELECT			job_postings_fact.job_title_short,
            job_postings_fact.job_location,
            --job_postings_fact.job_via
				    job_postings_fact.salary_year_avg             
FROM job_postings_fact
WHERE job_postings_fact.salary_year_avg > 90000  -- THIS IS MY COMMENT
AND   job_postings_fact.job_title_short = 'Data Analyst' 
ORDER BY job_postings_fact.salary_year_avg  DESC 

5.	
SELECT 			      job_postings_fact.job_title_short,
                  job_postings_fact.job_title,	
                  job_postings_fact.job_location,
                  job_postings_fact.job_via,
				          job_postings_fact.salary_year_avg                
FROM job_postings_fact
WHERE   
job_postings_fact.job_title LIKE '%Business_Analyst%'


6.	SELECT 			  jpc.job_title_short AS title_short,
                  jpc.job_title as title,	
                  jpc.job_location as location,
                  jpc.job_via as via
                
FROM job_postings_fact as jpc       -- you can also remove as




7.	
SELECT			      job_postings_fact.job_title_short,
                  job_postings_fact.job_location,
                  job_postings_fact.job_title,
				          job_postings_fact.salary_year_avg                
FROM job_postings_fact
WHERE 
(job_title_short LIKE '%Data%' OR job_title_short LIKE '%Business%')
AND job_title_short LIKE '%Analyst%'
AND NOT job_title_short LIKE      '%Senior%'
AND job_postings_fact.salary_year_avg > 90000  
ORDER BY job_postings_fact.salary_year_avg  DESC ;



8.	SELECT *,
job_postings_fact.job_work_from_home + job_postings_fact.job_no_degree_mention AS FFF,
job_postings_fact.salary_hour_avg + 5 AS SALARY_HIKE,
job_postings_fact.salary_year_avg % 8 AS extra_salary
FROM job_postings_fact


9.	
SELECT	          job_postings_fact.job_title_short,
                  job_postings_fact.job_location,
                  job_postings_fact.job_title,
                  COUNT (salary_year_avg) AS COOO1,
                  COUNT (DISTINCT salary_year_avg) AS COOO2,
                  SUM(salary_year_avg) AS SOO,
	                AVG (salary_year_avg) AS VOO			                  
FROM job_postings_fact
ORDER BY job_postings_fact.salary_year_avg  DESC ;


10.	SELECT			  job_postings_fact.job_title_short,               
                  COUNT (salary_year_avg) AS COOO1,
                  COUNT (DISTINCT salary_year_avg) AS COOO2,
                  SUM(salary_year_avg) AS SOO,
	                AVG (salary_year_avg) AS VOO,
                  MIN (salary_year_avg) AS MOO,
                  MAX (salary_year_avg) AS XOO
                
FROM job_postings_fact
GROUP BY JOB_title_short
ORDER BY VOO  ;


11.	
SELECT			      job_title_short,               
                  COUNT (salary_year_avg) AS C1,
                  SUM(salary_year_avg) AS SOO,
	                AVG (salary_year_avg) AS VOO,
                  MIN (salary_year_avg) AS MOO,
                  MAX (salary_year_avg) AS XOO
FROM job_postings_fact
where job_work_from_home = 1 AND NOT
	    salary_year_avg = 'null'
Group by job_title_short
ORDER BY VOO  ;

12.	
SELECT	  job_title_short,
              SUM(salary_year_avg) AS SOO, 
              COUNT (salary_year_avg) AS C1   
FROM job_postings_fact
where job_work_from_home = 1 
AND salary_year_avg IS NOT NULL
Group by job_title_short

  
13.	
SELECT	    		  job_title_short,
                  COUNT (job_title_short) AS C1
FROM job_postings_fact
where job_health_insurance = 1 
Group by job_title_short

14.	
SELECT	    		  job_country,
                  COUNT (job_id) AS C1
FROM job_postings_fact
Group by job_country


15.	
SELECT 
      project_id,
      SUM (hours_spent * hours_rate) AS project_original_cost,
      SUM (hours_spent * (hours_rate + 5)) AS project_projected_cost  
FROM invoices_fact
Group by project_id



16.	
SELECT *
FROM job_postings_fact
where salary_year_avg is not null and salary_hour_avg is not null


17. HOW TO UNDERSTAND THE REPETATIVES IN A COLOUMN:

SELECT count (skills) as ccc,
       skills,
       skill_id
FROM skills_dim
GROUP by skills
order by ccc desc
SELECT DISTINCT skill_id 
FROM skills_dim
where skills= 'sas'


	
18.	
SELECT        job_postings_fact.job_id,
              job_postings_fact.job_title,
              skills_job_dim.skill_id,
              skills_dim.skills
FROM job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id



19.    SELECT job_postings_fact.job_id,
       job_postings_fact.job_title,
       job_postings_fact.company_id,
       company_dim.company_id,
       company_dim.name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_postings_fact.job_title LIKE '%Data Scientist%'



20.	      SELECT job_postings_fact.job_id,
              job_postings_fact.job_title,
              skills_job_dim.skill_id,
              skills_dim.skills
FROM job_postings_fact
LEFT join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
LEFT join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_location = 'New York' and job_postings_fact.job_health_insurance = 1



21.	
SELECT        company_dim.name,
	      company_dim.company_id,
              COUNT (job_postings_fact.job_title) AS COUNT1
FROM company_dim
LEFT join job_postings_fact on company_dim.company_id = job_postings_fact.company_id
GROUP BY company_dim.name
ORDER by COUNT1 desc


22.      
SELECT
	      skills_dim.skills,
              job_postings_fact.job_id,
              job_postings_fact.job_title,
              skills_job_dim.skill_id,
              AVG (job_postings_fact.salary_year_avg) AS AVG1,
              COUNT (job_postings_fact.job_id) AS COUNT1
FROM skills_dim
LEFT join skills_job_dim on skills_dim.skill_id = skills_job_dim.skill_id 
LEFT join job_postings_fact on skills_job_dim.job_id = job_postings_fact.job_id
GROUP BY skills_dim.skills
/* ORDER BY AVG1 DESC
