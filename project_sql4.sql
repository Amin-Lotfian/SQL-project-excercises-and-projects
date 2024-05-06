SELECT
    ROUND(AVG(salary_year_avg),0) as AVGGG,
    skills_dim.skill_name,
    skills_dim.skill_id
From 
    job_postings_fact
INNER JOIN job_postings_fact on job_posting_fact.job_id = skills_job_dim.job_id
INNER JOIN SKILL_DIM ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE 
        JOB_POSTINGS_FACT.job_work_from_home = TRUE AND
        JOB_POSTINGS_FACT.job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL

GROUP by skills_dim.skill_name

ORDER BY AVGGG DESC

LIMIT 25