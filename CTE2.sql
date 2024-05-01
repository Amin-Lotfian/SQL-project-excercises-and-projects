
WITH Company_job_count AS (-- CTE DEFINITION STARTS HERE
        SELECT
            company_id,
            COUNT (*) AS TOTAL_JOBS
        FROM
            job_postings_fact
        GROUP BY 
            company_id
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM
    company_dim
LEFT JOIN 
    company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY 
    total_jobs DESC




/* THE EASIER WAY: */

SELECT      company_dim.name,
			company_dim.company_id,
            COUNT (job_postings_fact.job_title) AS COUNT1
FROM company_dim

LEFT join job_postings_fact on company_dim.company_id = job_postings_fact.company_id

GROUP BY company_dim.name

ORDER by COUNT1 desc
